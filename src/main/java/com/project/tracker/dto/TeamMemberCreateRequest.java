package com.project.tracker.dto;

import lombok.Data;

@Data
public class TeamMemberCreateRequest {
    private String name;
    private String designation;
    private Long contact;
    private Long teamId;
}
