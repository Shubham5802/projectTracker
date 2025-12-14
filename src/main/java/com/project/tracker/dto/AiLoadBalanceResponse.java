package com.project.tracker.dto;

import lombok.Data;

@Data
public class AiLoadBalanceResponse {

    private Long recommendedMemberId;
    private String recommendedMemberName;

    private String reason;

    private java.util.List<TaskLoadAnalysis> memberStats;   // load details of each member
}
