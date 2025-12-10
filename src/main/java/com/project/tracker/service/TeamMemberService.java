package com.project.tracker.service;

import com.project.tracker.model.TeamMember;

import java.util.List;

public interface TeamMemberService {
    TeamMember createMember(TeamMember member);
    List<TeamMember> getMembersByTeam(Long teamId);
}
