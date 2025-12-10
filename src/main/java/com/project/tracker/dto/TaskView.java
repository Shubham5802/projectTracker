package com.project.tracker.dto;

import com.project.tracker.model.Task;
import com.project.tracker.service.ai.dto.TaskAiSuggestion;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskView {
    private Task task;
    private TaskAiSuggestion ai;
}
