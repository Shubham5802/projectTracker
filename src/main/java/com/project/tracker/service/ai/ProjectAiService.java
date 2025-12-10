package com.project.tracker.service.ai;

import com.project.tracker.model.Project;
import com.project.tracker.service.ai.dto.ProjectAiHealth;

public interface ProjectAiService {
    ProjectAiHealth analyzeProject(Project project);
}
