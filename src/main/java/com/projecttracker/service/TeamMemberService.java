package com.projecttracker.service;

import com.projecttracker.model.TeamMember;

import java.util.List;

public interface TeamMemberService {

    TeamMember addMember(TeamMember member);

    TeamMember updateMember(Long memberId, TeamMember updated);

    void deleteMember(Long memberId);

    List<TeamMember> getMembersByTeam(Long teamId);

    TeamMember getMemberById(Long memberId);
}
