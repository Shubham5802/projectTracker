package com.project.tracker.service.ai;

import com.project.tracker.model.Task;
import com.project.tracker.model.TeamMember;
import com.project.tracker.repository.TeamMemberRepository;
import com.project.tracker.service.TaskService;
import com.project.tracker.service.ai.dto.TeamMemberLoadInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TeamLoadAiServiceImpl implements TeamLoadAiService {

    private final TeamMemberRepository memberRepo;
    private final TaskService taskService;

    @Override
    public TeamMember suggestBestAssignee(Long teamId) {

        List<TeamMemberLoadInfo> loads = getTeamLoad(teamId);

        // Pick the member with the LOWEST load score
        return loads.stream()
                .min(Comparator.comparingInt(TeamMemberLoadInfo::getLoadScore))
                .map(load -> memberRepo.findById(load.getMemberId()).get())
                .orElse(null);
    }

    @Override
    public List<TeamMemberLoadInfo> getTeamLoad(Long teamId) {

        List<TeamMember> members = memberRepo.findByTeam_Id(teamId);

        return members.stream().map(m -> {

            List<Task> tasks = taskService.getTasksByMember(m.getId());

            int total = tasks.size();
            int pending = (int) tasks.stream().filter(t -> t.getProgress() < 100).count();
            int overdue = (int) tasks.stream()
                    .filter(t -> t.getDueDate() != null && t.getDueDate().isBefore(LocalDate.now()))
                    .count();

            int loadScore = (pending * 5) + (overdue * 10) + total;

            TeamMemberLoadInfo info = new TeamMemberLoadInfo();
            info.setMemberId(m.getId());
            info.setName(m.getName());
            info.setTotalTasks(total);
            info.setPendingTasks(pending);
            info.setOverdueTasks(overdue);
            info.setLoadScore(loadScore);

            return info;

        }).toList();
    }
}
