package com.project.tracker.service;

import com.project.tracker.dto.TeamMemberCreateRequest;
import com.project.tracker.dto.TeamMemberResponse;

import java.util.List;

public interface TeamMemberService {

    TeamMemberResponse createMember(TeamMemberCreateRequest request);

    List<TeamMemberResponse> getMembersByTeam(Long teamId);

    TeamMemberResponse getMember(Long memberId);

    TeamMemberResponse updateMember(Long memberId, TeamMemberCreateRequest request);

    void deleteMember(Long memberId);
}
