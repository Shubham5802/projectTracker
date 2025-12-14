package com.project.tracker.service.ai;

import com.project.tracker.dto.AiLoadBalanceResponse;

public interface TaskLoadBalancerService {
    AiLoadBalanceResponse analyzeLoad(Long projectId);
}
