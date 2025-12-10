package com.project.tracker.service.impl;

import com.project.tracker.model.TeamMember;
import com.project.tracker.repository.TeamMemberRepository;
import com.project.tracker.service.TeamMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TeamMemberServiceImpl implements TeamMemberService {

    private final TeamMemberRepository repo;

    @Override
    public TeamMember createMember(TeamMember member) {
        return repo.save(member);
    }

    @Override
    public List<TeamMember> getMembersByTeam(Long teamId) {
        return repo.findByTeam_Id(teamId);
    }
}
