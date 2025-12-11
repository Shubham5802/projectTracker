package com.project.tracker.controller;

import com.project.tracker.dto.ProjectCreateRequest;
import com.project.tracker.dto.ProjectResponse;
import com.project.tracker.model.Project;
import com.project.tracker.service.ProjectService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/projects")
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectService projectService;

    @PostMapping("/create")
    public String createProjectFromJsp(@ModelAttribute ProjectCreateRequest request) {

        projectService.createProject(request);

        return "redirect:/projects/list-projects"; 
    }

    
    @GetMapping("/api/projects/{id}")
    public Project getProject(@PathVariable Long id) {
        return projectService.getProjectById(id);
    }
    
    @GetMapping("/api/projects")
    @ResponseBody
    public List<Project> getAllProjectsApi() {
        return projectService.getAllProjects();
    }

    
}
