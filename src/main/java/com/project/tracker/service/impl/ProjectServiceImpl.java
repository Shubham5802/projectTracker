package com.project.tracker.service.impl;

import com.project.tracker.dto.ProjectCreateRequest;
import com.project.tracker.dto.ProjectResponse;
import com.project.tracker.mapper.ProjectMapper;
import com.project.tracker.model.Project;
import com.project.tracker.model.Team;
import com.project.tracker.repository.ProjectRepository;
import com.project.tracker.repository.TeamRepository;
import com.project.tracker.service.ProjectService;
import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final ProjectRepository projectRepository;
    private final TeamRepository teamRepository; 

    @Override
    public ProjectResponse createProject(ProjectCreateRequest request) {

        // Convert DTO to Project entity
        Project entity = ProjectMapper.toEntity(request);

        // 🔥 Fetch the Team using teamId
        Team team = teamRepository.findById(request.getTeamId())
                .orElseThrow(() -> new RuntimeException("Team not found"));

        // 🔥 Set the team in Project entity
        entity.setTeam(team);

        // Save project
        Project saved = projectRepository.save(entity);

        return ProjectMapper.toResponse(saved);
    }

    
    @Override
    public Project getProjectById(Long id) {
        return projectRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Project not found with ID: " + id)
                );
    }
    
    @Override
    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }
    
    
    
}
