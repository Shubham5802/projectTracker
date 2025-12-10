package com.project.tracker.service;

import java.util.Date;
import java.util.List;

import com.project.tracker.dto.TaskAIDto;
import com.project.tracker.model.Task;

public interface TaskService {
    Task createTask(Long projectId, Task task);

	List<Task> getTasksByProject(Long projectId);
	
	  void updateTaskProgressAndStatus(
	            Long taskId,
	            Integer progress,
	            String status
	    );

	Task getTaskById(Long taskId);

	Long getProjectIdByTask(Long taskId);
	
	TaskAIDto analyzeTaskRisk(Task task);

}


