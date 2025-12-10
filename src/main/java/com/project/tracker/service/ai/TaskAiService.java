package com.project.tracker.service.ai;

import com.project.tracker.model.Task;
import com.project.tracker.service.ai.dto.TaskAiSuggestion;

public interface TaskAiService {
    TaskAiSuggestion analyzeTask(Task task);
}
