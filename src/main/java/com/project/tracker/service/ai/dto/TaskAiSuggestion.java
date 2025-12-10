package com.project.tracker.service.ai.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskAiSuggestion {

    private String riskLevel;     // LOW | MEDIUM | HIGH
    private int delayScore;       // numeric score (AI-ready)
    private String suggestion;    // human-readable message
}
