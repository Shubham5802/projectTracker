package com.projecttracker.service.impl;

import com.projecttracker.model.MemberShuffle;
import com.projecttracker.model.Project;
import com.projecttracker.model.TeamMember;
import com.projecttracker.repository.MemberShuffleRepository;
import com.projecttracker.repository.ProjectRepository;
import com.projecttracker.repository.TeamMemberRepository;
import com.projecttracker.service.MemberShuffleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MemberShuffleServiceImpl implements MemberShuffleService {

    @Autowired
    private MemberShuffleRepository shuffleRepo;

    @Autowired
    private ProjectRepository projectRepo;

    @Autowired
    private TeamMemberRepository memberRepo;

    @Override
    public MemberShuffle logShuffle(MemberShuffle shuffle) {

        Long projectId = shuffle.getProject().getProjectId();
        Long memberId = shuffle.getMember().getMemberId();

        Project project = projectRepo.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project not found"));

        TeamMember member = memberRepo.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member not found"));

        shuffle.setProject(project);
        shuffle.setMember(member);

        if (shuffle.getActionDate() == null) {
            shuffle.setActionDate(new Date());
        }

        return shuffleRepo.save(shuffle);
    }

    @Override
    public List<MemberShuffle> getShuffleHistoryByProject(Long projectId) {
        return shuffleRepo.findByProjectProjectId(projectId);
    }

    @Override
    public List<MemberShuffle> getShuffleHistoryByMember(Long memberId) {
        return shuffleRepo.findByMemberMemberId(memberId);
    }
}
