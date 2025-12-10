package com.project.tracker.service.ai.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProjectAiHealth {

    private int healthScore;     // 0 – 100
    private String riskLevel;    // LOW | MEDIUM | HIGH
    private String summary;      // Human-readable insight
}
