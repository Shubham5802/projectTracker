package com.project.tracker.service.ai.dto;

import lombok.Data;

@Data
public class TeamMemberLoadInfo {

    private Long memberId;
    private String name;

    private int totalTasks;
    private int pendingTasks;
    private int overdueTasks;

    private int loadScore; // 0–100 (lower = better candidate)
}
