package com.project.tracker.controller;

import com.project.tracker.dto.TaskView;
import com.project.tracker.model.Task;
import com.project.tracker.service.ProjectService;
import com.project.tracker.service.TaskService;
import com.project.tracker.service.ai.TaskAiService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/tasks")
@RequiredArgsConstructor
public class TaskPageController {

    private final ProjectService projectService;
    private final TaskService taskService;
    private final TaskAiService taskAiService;  // ADD THIS

    @GetMapping("/create")
    public String createTaskForm(@RequestParam Long projectId, Model model) {
        model.addAttribute("projectId", projectId);
        return "projects/create-task";
    }

    // ✅ FIXED LIST METHOD
    @GetMapping("/list")
    public String listTasks(@RequestParam Long projectId, Model model) {

        model.addAttribute("project",
                projectService.getProjectById(projectId));

        List<Task> tasks = taskService.getTasksByProject(projectId);

        List<TaskView> taskViews = tasks.stream()
                .map(task -> new TaskView(
                        task,
                        taskAiService.analyzeTask(task)
                ))
                .toList();

        model.addAttribute("taskViews", taskViews); 
        model.addAttribute("projectId", projectId);

        return "projects/list-tasks";
    }

    @PostMapping("/tasks/update")
    public String updateTask(
            @RequestParam Long taskId,
            @RequestParam Integer progress,
            @RequestParam String status,
            @RequestParam Long projectId
    ) {
        taskService.updateTaskProgressAndStatus(taskId, progress, status);
        return "redirect:/tasks/list?projectId=" + projectId;
    }

    @GetMapping("/update")
    public String showUpdateTask(@RequestParam Long taskId, Model model) {
        Task task = taskService.getTaskById(taskId);
        model.addAttribute("task", task);
        return "projects/update-task";
    }

    @PostMapping("/update")
    public String updateTask(
            @RequestParam Long taskId,
            @RequestParam Integer progress,
            @RequestParam(required = false) String status
    ) {
        taskService.updateTaskProgressAndStatus(taskId, progress, status);
        return "redirect:/projects/view?id=" +
                taskService.getProjectIdByTask(taskId);
    }
}
