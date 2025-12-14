package com.project.tracker.controller;

import com.project.tracker.dto.AiLoadBalanceResponse;
import com.project.tracker.service.ai.TaskLoadBalancerService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ai/load")
@RequiredArgsConstructor
public class TaskAiController {

    private final TaskLoadBalancerService loadService;

    @GetMapping("/{projectId}")
    public AiLoadBalanceResponse analyze(@PathVariable Long projectId) {
        return loadService.analyzeLoad(projectId);
    }
}
