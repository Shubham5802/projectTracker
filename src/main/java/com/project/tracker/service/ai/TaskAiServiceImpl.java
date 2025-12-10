package com.project.tracker.service.ai;

import com.project.tracker.model.Task;
import com.project.tracker.service.ai.dto.TaskAiSuggestion;
import org.springframework.stereotype.Service;

import java.time.*;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@Service
public class TaskAiServiceImpl implements TaskAiService {

    @Override
    public TaskAiSuggestion analyzeTask(Task task) {
        TaskAiSuggestion ai = new TaskAiSuggestion();

        Date due = task.getDueDate();
        Integer progress = task.getProgress() == null ? 0 : task.getProgress();

        if (due == null) {
            ai.setRiskLevel("LOW");
            ai.setSuggestion("No due date defined.");
            ai.setDelayScore(0);
            return ai;
        }

        // ✅ Safe conversion for java.sql.Date / java.util.Date
        Instant instant = Instant.ofEpochMilli(due.getTime());
        LocalDate dueDate = instant.atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate today = LocalDate.now();

        long delayDays = ChronoUnit.DAYS.between(dueDate, today);

        if (delayDays > 5 && progress < 80) {
            ai.setRiskLevel("HIGH");
            ai.setSuggestion("Task significantly delayed. Immediate action required.");
            ai.setDelayScore(90);
        } else if (delayDays > 0) {
            ai.setRiskLevel("MEDIUM");
            ai.setSuggestion("Task is delayed. Consider prioritizing.");
            ai.setDelayScore(60);
        } else {
            ai.setRiskLevel("LOW");
            ai.setSuggestion("Task is on track.");
            ai.setDelayScore(20);
        }

        return ai;
    }
}
