package com.project.tracker.service.ai;

import com.project.tracker.dto.AiLoadBalanceResponse;
import com.project.tracker.dto.TaskLoadAnalysis;
import com.project.tracker.model.Task;
import com.project.tracker.model.TeamMember;
import com.project.tracker.model.Project;
import com.project.tracker.repository.TaskRepository;
import com.project.tracker.repository.TeamMemberRepository;
import com.project.tracker.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TaskLoadBalancerServiceImpl implements TaskLoadBalancerService {

    private final ProjectService projectService;
    private final TaskRepository taskRepo;
    private final TeamMemberRepository memberRepo;

    @Override
    public AiLoadBalanceResponse analyzeLoad(Long projectId) {

        Project project = projectService.getProjectById(projectId);
        Long teamId    = project.getTeam().getId();

        List<TeamMember> members = memberRepo.findByTeam_Id(teamId);
        List<Task> tasks = taskRepo.findByProject_Id(projectId);

        List<TaskLoadAnalysis> stats = new ArrayList<>();

        for (TeamMember m : members) {

            long assigned = tasks.stream()
                    .filter(t -> t.getAssignedTo() != null &&
                                 t.getAssignedTo().getId().equals(m.getId()))
                    .count();

            long open = tasks.stream()
                    .filter(t -> t.getAssignedTo() != null &&
                                 t.getAssignedTo().getId().equals(m.getId()) &&
                                 !"DONE".equals(t.getStatus()))
                    .count();

            long done = tasks.stream()
                    .filter(t -> t.getAssignedTo() != null &&
                                 t.getAssignedTo().getId().equals(m.getId()) &&
                                 "DONE".equals(t.getStatus()))
                    .count();

            int workloadScore = (int) Math.min(100, open * 20); // example rule

            String level = workloadScore >= 60
                    ? "HIGH"
                    : workloadScore >= 30
                        ? "MEDIUM"
                        : "LOW";

            TaskLoadAnalysis a = new TaskLoadAnalysis();
            a.setMemberId(m.getId());
            a.setMemberName(m.getName());
            a.setTotalTasks((int) assigned);
            a.setOpenTasks((int) open);
            a.setCompletedTasks((int) done);
            a.setWorkloadScore(workloadScore);
            a.setLoadLevel(level);

            stats.add(a);
        }

        // 🧠 PICK MEMBER WITH LOWEST LOAD SCORE
        TaskLoadAnalysis best = stats.stream()
                .sorted(Comparator.comparing(TaskLoadAnalysis::getWorkloadScore))
                .findFirst()
                .orElse(null);

        AiLoadBalanceResponse resp = new AiLoadBalanceResponse();
        resp.setMemberStats(stats);

        if (best != null) {
            resp.setRecommendedMemberId(best.getMemberId());
            resp.setRecommendedMemberName(best.getMemberName());
            resp.setReason("Lowest workload among all members (" + best.getLoadLevel() + ")");
        }

        return resp;
    }
}
