package com.project.tracker.service.ai;

import com.project.tracker.model.Project;
import com.project.tracker.model.Task;
import com.project.tracker.service.TaskService;
import com.project.tracker.service.ai.dto.ProjectAiHealth;
import com.project.tracker.service.ai.dto.TaskAiSuggestion;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectAiServiceImpl implements ProjectAiService {

    private final TaskService taskService;
    private final TaskAiService taskAiService;

    @Override
    public ProjectAiHealth analyzeProject(Project project) {

        List<Task> tasks = taskService.getTasksByProject(project.getId());

        if (tasks.isEmpty()) {
            return ProjectAiHealth.builder()
                    .healthScore(100)
                    .riskLevel("LOW")
                    .summary("No tasks yet. Project is in healthy initial state.")
                    .build();
        }

        int totalScore = 0;
        int highRiskCount = 0;

        for (Task task : tasks) {
            TaskAiSuggestion ai = taskAiService.analyzeTask(task);
            totalScore += ai.getDelayScore();

            if ("HIGH".equals(ai.getRiskLevel())) {
                highRiskCount++;
            }
        }

        int avgScore = totalScore / tasks.size();

        String risk;
        String summary;

        if (avgScore >= 70 || highRiskCount >= 2) {
            risk = "HIGH";
            summary = "Project is at high risk due to delayed or low-progress tasks.";
        } else if (avgScore >= 40) {
            risk = "MEDIUM";
            summary = "Project shows early signs of delay. Monitoring required.";
        } else {
            risk = "LOW";
            summary = "Project is progressing as expected.";
        }

        return ProjectAiHealth.builder()
                .healthScore(100 - avgScore)
                .riskLevel(risk)
                .summary(summary)
                .build();
    }
}
