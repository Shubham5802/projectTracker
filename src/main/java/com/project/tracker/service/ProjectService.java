package com.project.tracker.service;

import java.util.List;

import com.project.tracker.dto.ProjectCreateRequest;
import com.project.tracker.dto.ProjectResponse;
import com.project.tracker.model.Project;

public interface ProjectService {
    
	ProjectResponse createProject(ProjectCreateRequest request);

	Project getProjectById(Long id);
	
    List<Project> getAllProjects();

}
