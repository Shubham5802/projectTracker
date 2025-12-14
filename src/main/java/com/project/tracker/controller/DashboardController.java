package com.project.tracker.controller;

import com.project.tracker.model.Project;
import com.project.tracker.service.ProjectService;
import com.project.tracker.service.ai.ProjectAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
@RequiredArgsConstructor
public class DashboardController {

    private final ProjectService projectService;
    private final ProjectAiService projectAiService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        List<Project> projects = projectService.getAllProjects();

        int total = projects.size();
        long completed = projects.stream().filter(p -> "COMPLETED".equalsIgnoreCase(p.getStatus())).count();
        long inProgress = projects.stream().filter(p -> "IN_PROGRESS".equalsIgnoreCase(p.getStatus())).count();
        long onHold = projects.stream().filter(p -> "ON_HOLD".equalsIgnoreCase(p.getStatus())).count();

        // AI health summary for each project
        Map<Long, Object> aiMap = new HashMap<>();
        for (Project p : projects) {
            aiMap.put(p.getId(), projectAiService.analyzeProject(p));
        }

        model.addAttribute("total", total);
        model.addAttribute("completed", completed);
        model.addAttribute("inProgress", inProgress);
        model.addAttribute("onHold", onHold);

        model.addAttribute("projects", projects);
        model.addAttribute("aiMap", aiMap);

        return "dashboard/dashboard";
    }
}
