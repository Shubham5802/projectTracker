package com.project.tracker.service.impl;

import com.project.tracker.dto.TeamMemberCreateRequest;
import com.project.tracker.dto.TeamMemberResponse;
import com.project.tracker.model.Team;
import com.project.tracker.model.TeamMember;
import com.project.tracker.repository.TeamMemberRepository;
import com.project.tracker.repository.TeamRepository;
import com.project.tracker.service.TeamMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TeamMemberServiceImpl implements TeamMemberService {

    private final TeamMemberRepository memberRepo;
    private final TeamRepository teamRepo;

    @Override
    public TeamMemberResponse createMember(TeamMemberCreateRequest req) {

        Team team = teamRepo.findById(req.getTeamId())
                .orElseThrow(() -> new RuntimeException("Team not found"));

        TeamMember member = TeamMember.builder()
                .name(req.getName())
                .designation(req.getDesignation())
                .contact(req.getContact())
                .team(team)
                .build();

        memberRepo.save(member);

        return map(member);
    }

    @Override
    public List<TeamMemberResponse> getMembersByTeam(Long teamId) {
        return memberRepo.findByTeam_Id(teamId)
                .stream().map(this::map).toList();
    }

    @Override
    public TeamMemberResponse getMember(Long memberId) {
        return memberRepo.findById(memberId)
                .map(this::map)
                .orElseThrow(() -> new RuntimeException("Member not found"));
    }

    @Override
    public TeamMemberResponse updateMember(Long memberId, TeamMemberCreateRequest req) {

        TeamMember m = memberRepo.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member not found"));

        m.setName(req.getName());
        m.setDesignation(req.getDesignation());
        m.setContact(req.getContact());

        if (req.getTeamId() != null) {
            Team team = teamRepo.findById(req.getTeamId())
                    .orElseThrow(() -> new RuntimeException("Team not found"));
            m.setTeam(team);
        }

        memberRepo.save(m);

        return map(m);
    }

    @Override
    public void deleteMember(Long memberId) {
        memberRepo.deleteById(memberId);
    }

    private TeamMemberResponse map(TeamMember m) {
        TeamMemberResponse r = new TeamMemberResponse();
        r.setMemberId(m.getId());
        r.setName(m.getName());
        r.setDesignation(m.getDesignation());
        r.setContact(m.getContact());
        r.setTeamId(m.getTeam().getId());
        return r;
    }
}
