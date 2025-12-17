package com.projecttracker.controller;

import com.projecttracker.model.Task;
import com.projecttracker.service.ProjectService;
import com.projecttracker.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/task")
public class TaskController {

    @Autowired
    private TaskService taskService;

    @Autowired
    private ProjectService projectService;

    @GetMapping("/list/{projectId}")
    public String listTasks(@PathVariable Long projectId, Model model) {

        model.addAttribute("projectId", projectId);
        model.addAttribute("tasks", taskService.getTasksByProject(projectId));

        return "task/task-list";
    }

    @GetMapping("/create/{projectId}")
    public String createForm(@PathVariable Long projectId, Model model) {

        Task t = new Task();
        t.setProject(projectService.getProjectById(projectId));

        model.addAttribute("task", t);
        model.addAttribute("projectMembers", projectService.getProjectMembers(projectId));

        return "task/task-create";
    }

    @PostMapping("/save/{projectId}")
    public String save(@PathVariable Long projectId, @ModelAttribute Task task) {

        taskService.createTask(task);
        return "redirect:/task/list/" + projectId;
    }

    @GetMapping("/edit/{taskId}")
    public String editForm(@PathVariable Long taskId, Model model) {

        Task t = taskService.getTaskById(taskId);
        Long projectId = t.getProject().getProjectId();

        model.addAttribute("task", t);
        model.addAttribute("projectMembers", projectService.getProjectMembers(projectId));

        return "task/task-edit";
    }

    @PostMapping("/update/{taskId}")
    public String update(@PathVariable Long taskId, @ModelAttribute Task updated) {

        Task existing = taskService.getTaskById(taskId);
        Long projectId = existing.getProject().getProjectId();

        taskService.updateTask(taskId, updated);

        return "redirect:/task/list/" + projectId;
    }

    @GetMapping("/delete/{taskId}")
    public String delete(@PathVariable Long taskId) {

        Task t = taskService.getTaskById(taskId);
        Long projectId = t.getProject().getProjectId();

        taskService.deleteTask(taskId);
        return "redirect:/task/list/" + projectId;
    }
}
