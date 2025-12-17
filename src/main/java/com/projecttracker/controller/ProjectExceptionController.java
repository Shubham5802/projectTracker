package com.projecttracker.controller;

import com.projecttracker.model.ProjectException;
import com.projecttracker.service.ProjectExceptionService;
import com.projecttracker.service.ProjectService;
import com.projecttracker.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/exception")
public class ProjectExceptionController {

    @Autowired
    private ProjectExceptionService exceptionService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TaskService taskService;

    @GetMapping("/list/{projectId}")
    public String listByProject(@PathVariable Long projectId, Model model) {

        model.addAttribute("project", projectService.getProjectById(projectId));
        model.addAttribute("exceptions", exceptionService.getExceptionsByProject(projectId));

        return "exception/exception-list";
    }

    @GetMapping("/create/{projectId}")
    public String createForm(@PathVariable Long projectId, Model model) {

        ProjectException pe = new ProjectException();
        pe.setProject(projectService.getProjectById(projectId));

        model.addAttribute("exception", pe);
        model.addAttribute("tasks", taskService.getTasksByProject(projectId));

        return "exception/exception-create";
    }

    @PostMapping("/save/{projectId}")
    public String save(@PathVariable Long projectId,
                       @ModelAttribute ProjectException exception) {

        exceptionService.addException(exception);
        return "redirect:/exception/list/" + projectId;
    }

    @GetMapping("/delete/{id}/{projectId}")
    public String delete(@PathVariable Long id, @PathVariable Long projectId) {

        exceptionService.deleteException(id);
        return "redirect:/exception/list/" + projectId;
    }
}
