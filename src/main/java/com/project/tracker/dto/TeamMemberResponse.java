package com.project.tracker.dto;

import lombok.Data;

@Data
public class TeamMemberResponse {
    private Long memberId;
    private String name;
    private String designation;
    private Long contact;
    private Long teamId;
}
