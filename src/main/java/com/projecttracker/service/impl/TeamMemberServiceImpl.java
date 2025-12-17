package com.projecttracker.service.impl;

import com.projecttracker.model.Team;
import com.projecttracker.model.TeamMember;
import com.projecttracker.repository.TeamMemberRepository;
import com.projecttracker.repository.TeamRepository;
import com.projecttracker.service.TeamMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamMemberServiceImpl implements TeamMemberService {

    @Autowired
    private TeamMemberRepository memberRepo;

    @Autowired
    private TeamRepository teamRepo;

    @Override
    public TeamMember addMember(TeamMember member) {

        // validate team exists
        Long teamId = member.getTeam().getTeamId();
        Team team = teamRepo.findById(teamId)
                .orElseThrow(() -> new RuntimeException("Team not found"));

        member.setTeam(team);
        return memberRepo.save(member);
    }

    @Override
    public TeamMember updateMember(Long memberId, TeamMember updated) {
        TeamMember member = memberRepo.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member not found"));

        member.setMemberName(updated.getMemberName());
        member.setContact(updated.getContact());
        member.setDesignation(updated.getDesignation());
        member.setEmail(updated.getEmail());

        return memberRepo.save(member);
    }

    @Override
    public void deleteMember(Long memberId) {
        memberRepo.deleteById(memberId);
    }

    @Override
    public List<TeamMember> getMembersByTeam(Long teamId) {
        return memberRepo.findByTeamTeamId(teamId);
    }

    @Override
    public TeamMember getMemberById(Long memberId) {
        return memberRepo.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member not found"));
    }
}
