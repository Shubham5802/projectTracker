package com.projecttracker.service;

import com.projecttracker.model.Task;

import java.util.List;

public interface TaskService {

    Task createTask(Task task);

    Task updateTask(Long taskId, Task updatedTask);

    void deleteTask(Long taskId);

    Task getTaskById(Long taskId);

    List<Task> getTasksByProject(Long projectId);

    List<Task> getTasksByMember(Long memberId);

    Task updateTaskStatus(Long taskId, String status);
    
    // ⭐ Added for Dashboard
    int getAllTasksCount();

    List<Task> getRecentTasks(int limit);
}
