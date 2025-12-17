package com.projecttracker.controller;

import com.projecttracker.model.Project;
import com.projecttracker.service.ProjectService;
import com.projecttracker.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TeamService teamService;

    @GetMapping("/list")
    public String listProjects(Model model) {
        model.addAttribute("projects", projectService.getAllProjects());
        return "project/project-list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("project", new Project());
        model.addAttribute("teams", teamService.getAllTeams());
        return "project/project-create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Project project) {
        projectService.createProject(project);
        return "redirect:/project/list";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("project", projectService.getProjectById(id));
        model.addAttribute("teams", teamService.getAllTeams());
        return "project/project-edit";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute Project project) {
        projectService.updateProject(id, project);
        return "redirect:/project/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        projectService.deleteProject(id);
        return "redirect:/project/list";
    }
}
