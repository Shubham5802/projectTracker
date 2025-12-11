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

	    LocalDate dueDate = task.getDueDate();
	    Integer progress = (task.getProgress() == null) ? 0 : task.getProgress();

	    // -----------------------------
	    // 1️⃣ No Due Date Case
	    // -----------------------------
	    if (dueDate == null) {
	        ai.setRiskLevel("LOW");
	        ai.setSuggestion("No due date defined.");
	        ai.setDelayScore(0);
	        return ai;
	    }

	    // -----------------------------
	    // 2️⃣ Calculate delay
	    // -----------------------------
	    LocalDate today = LocalDate.now();
	    long delayDays = ChronoUnit.DAYS.between(dueDate, today);
	    // delayDays:
	    //    >0  means delayed
	    //    <0  means still time left

	    // -----------------------------
	    // 3️⃣ AI Rule Engine
	    // -----------------------------
	    if (delayDays > 5 && progress < 80) {
	        ai.setRiskLevel("HIGH");
	        ai.setSuggestion("Task significantly delayed. Immediate action required.");
	        ai.setDelayScore(90);
	    }
	    else if (delayDays > 0) {
	        ai.setRiskLevel("MEDIUM");
	        ai.setSuggestion("Task is delayed. Consider prioritizing.");
	        ai.setDelayScore(60);
	    }
	    else {
	        ai.setRiskLevel("LOW");
	        ai.setSuggestion("Task is on track.");
	        ai.setDelayScore(20);
	    }

	    return ai;
	}

}
