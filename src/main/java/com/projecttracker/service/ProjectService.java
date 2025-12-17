package com.projecttracker.service;

import com.projecttracker.model.Project;
import com.projecttracker.model.ProjectMember;

import java.util.List;

public interface ProjectService {

    Project createProject(Project project);

    Project updateProject(Long projectId, Project updated);

    void deleteProject(Long projectId);

    Project getProjectById(Long projectId);

    List<Project> getAllProjects();

    List<ProjectMember> getProjectMembers(Long projectId);

    ProjectMember assignMemberToProject(Long projectId, Long memberId);

    void removeMemberFromProject(Long projectId, Long memberId);

    boolean isMemberPartOfProject(Long projectId, Long memberId);
}
