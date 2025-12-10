package com.project.tracker.service.impl;

import com.project.tracker.dto.TaskAIDto;
import com.project.tracker.model.Project;
import com.project.tracker.model.Task;
import com.project.tracker.repository.ProjectRepository;
import com.project.tracker.repository.TaskRepository;
import com.project.tracker.service.TaskService;
import com.project.tracker.service.ai.TaskAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TaskServiceImpl implements TaskService {

    private final TaskRepository taskRepository;
    private final ProjectRepository projectRepository;
    private final TaskAiService taskAiService;

    @Override
    public Task createTask(Long projectId, Task task) {
        Project project = projectRepository.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project not found"));

        task.setProject(project);
        task.setStatus("OPEN");
        task.setProgress(0);
        task.setCreatedOn(new Date());

        return taskRepository.save(task);
    }

    @Override
    public List<Task> getTasksByProject(Long projectId) {
        List<Task> tasks = taskRepository.findByProject_Id(projectId);

        // 🔮 Attach AI suggestion per task (for JSP ${task.ai...})
        for (Task t : tasks) {
            t.setAi(taskAiService.analyzeTask(t));
        }
        return tasks;
    }

    @Override
    public Task getTaskById(Long taskId) {
        return taskRepository.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task not found"));
    }

    @Override
    public Long getProjectIdByTask(Long taskId) {
        Task task = taskRepository.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task not found"));
        return task.getProject().getId();
    }

    @Override
    public void updateTaskProgressAndStatus(Long taskId, Integer progress, String status) {
        Task task = taskRepository.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task not found"));

        if (progress != null) {
            task.setProgress(progress);

            // simple auto-status rules
            if (progress == 100) {
                status = "DONE";
            } else if (progress > 0 && (status == null || !"BLOCKED".equals(status))) {
                status = "IN_PROGRESS";
            } else if (progress == 0 && status == null) {
                status = "OPEN";
            }
        }

        if (status != null) {
            task.setStatus(status);
        }

        taskRepository.save(task);
    }
    




@Override
public TaskAIDto analyzeTaskRisk(Task task) {

    TaskAIDto ai = new TaskAIDto();
    ai.setTaskId(task.getId());

    if (task.getDueDate() == null) {
        ai.setRiskLevel("LOW");
        ai.setDelayScore(10);
        return ai;
    }

    Date today = new Date();
    long diffDays =
            (task.getDueDate().getTime() - today.getTime()) / (1000 * 60 * 60 * 24);

    int progress = task.getProgress() == null ? 0 : task.getProgress();

    // 🔴 Overdue
    if (diffDays < 0 && progress < 100) {
        ai.setRiskLevel("HIGH");
        ai.setDelayScore(90);
    }
    // 🟠 Near deadline
    else if (diffDays <= 2 && progress < 80) {
        ai.setRiskLevel("MEDIUM");
        ai.setDelayScore(60);
    }
    // 🟢 On Track
    else {
        ai.setRiskLevel("LOW");
        ai.setDelayScore(20);
    }

    return ai;
}

}
