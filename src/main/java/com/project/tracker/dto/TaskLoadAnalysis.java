package com.project.tracker.dto;

import lombok.Data;

@Data
public class TaskLoadAnalysis {

    private Long memberId;
    private String memberName;

    private int totalTasks;
    private int openTasks;
    private int inProgressTasks;
    private int completedTasks;

    private int workloadScore; // AI Score (0–100)
    private String loadLevel;  // LOW / MEDIUM / HIGH
}
