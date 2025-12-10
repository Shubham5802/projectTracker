package com.project.tracker.mapper;

import com.project.tracker.dto.ProjectCreateRequest;
import com.project.tracker.dto.ProjectResponse;
import com.project.tracker.model.Project;

import java.util.Date;

public class ProjectMapper {

    public static Project toEntity(ProjectCreateRequest req) {
        return Project.builder()
                .name(req.getName())
                .description(req.getDescription())
                .startDate(req.getStartDate())
                .endDate(req.getEndDate())
                .status("NOT_STARTED")
                .createdOn(new Date())
                .build();
    }

    public static ProjectResponse toResponse(Project p) {
        if (p == null) return null;
        ProjectResponse r = new ProjectResponse();
        r.setProjectId(p.getId());
        r.setName(p.getName());
        r.setStatus(p.getStatus());
        r.setStartDate(p.getStartDate());
        r.setEndDate(p.getEndDate());
        r.setCreatedOn(p.getCreatedOn());
        return r;
    }
}
