package com.projecttracker.service;

import com.projecttracker.model.ProjectException;

import java.util.List;

public interface ProjectExceptionService {

    ProjectException addException(ProjectException exception);

    List<ProjectException> getExceptionsByProject(Long projectId);

    List<ProjectException> getExceptionsByTask(Long taskId);

    ProjectException getExceptionById(Long id);

    void deleteException(Long id);
    
    // ⭐ Dashboard additions
    List<ProjectException> getRecentExceptions(int limit);

    int getAllExceptionsCount();
}
