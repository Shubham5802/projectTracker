package com.project.tracker.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.tracker.dto.ProjectCreateRequest;
import com.project.tracker.dto.TaskAIDto;
import com.project.tracker.model.Project;
import com.project.tracker.model.Task;
import com.project.tracker.service.ProjectService;
import com.project.tracker.service.TaskService;
import com.project.tracker.service.TeamService;
import com.project.tracker.service.ai.ProjectAiService;
import com.project.tracker.service.ai.TaskAiService;
import com.project.tracker.service.ai.dto.ProjectAiHealth;
import com.project.tracker.service.ai.dto.TaskAiSuggestion;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

public class PageController {

	 private final ProjectService projectService;
	 private final TaskService taskService;
	 private final TeamService teamService;
	 private final ProjectAiService projectAiService;

	
	 @Autowired
	 private TaskAiService taskAiService;
	 
	 @PostMapping("/projects/create")
	 public String createProjectFromJsp(@ModelAttribute ProjectCreateRequest request,
	                                    RedirectAttributes redirectAttributes) {

	     projectService.createProject(request);

	     redirectAttributes.addFlashAttribute("successMessage", "Project created successfully!");

	     return "redirect:/projects";  // Redirect to list page
	 }

	 @GetMapping("/projects/view")
	    public String viewProject(@RequestParam Long id, Model model) {

	        Project project = projectService.getProjectById(id);
	        List<Task> tasks = taskService.getTasksByProject(id);

	        ProjectAiHealth projectAi = projectAiService.analyzeProject(project);

	        model.addAttribute("project", project);
	        model.addAttribute("tasks", tasks);
	        model.addAttribute("projectAi", projectAi);

	        return "projects/view-project";
	    }

	 @GetMapping("/projects/create")
	 public String showCreateProjectForm(Model model) {
	     model.addAttribute("teams", teamService.getAllTeams());
	     return "projects/create-project";
	 }


        
        @GetMapping("/projects")
        public String listProjects(Model model) {
            model.addAttribute("projects", projectService.getAllProjects());
            return "projects/list-projects";
        }
        
        
        
        
}
