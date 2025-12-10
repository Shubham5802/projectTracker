package com.project.tracker.dto;

import lombok.Data;

@Data
public class TaskAIDto {
    private Long taskId;
    private String riskLevel;   // LOW, MEDIUM, HIGH
    private int delayScore;     // 0–100
}
