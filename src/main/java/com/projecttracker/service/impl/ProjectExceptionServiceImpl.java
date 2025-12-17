package com.projecttracker.service.impl;

import com.projecttracker.model.Project;
import com.projecttracker.model.ProjectException;
import com.projecttracker.model.Task;
import com.projecttracker.repository.*;
import com.projecttracker.repository.jdbc.ExceptionJdbcRepository;
import com.projecttracker.service.ProjectExceptionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProjectExceptionServiceImpl implements ProjectExceptionService {

    @Autowired
    private ProjectExceptionRepository exceptionRepo;

    @Autowired
    private ProjectRepository projectRepo;

    @Autowired
    private TaskRepository taskRepo;

    // ⭐ Added for Dashboard
    @Autowired
    private ExceptionJdbcRepository exceptionJdbcRepository;

    @Override
    public ProjectException addException(ProjectException exception) {

        Long projectId = exception.getProject().getProjectId();

        Project project = projectRepo.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project not found"));

        exception.setProject(project);

        // Optional task-level issue
        if (exception.getTask() != null) {
            Long taskId = exception.getTask().getTaskId();
            Task task = taskRepo.findById(taskId)
                    .orElseThrow(() -> new RuntimeException("Task not found"));
            exception.setTask(task);
        }

        if (exception.getLoggedOn() == null) {
            exception.setLoggedOn(new Date());
        }

        return exceptionRepo.save(exception);
    }

    @Override
    public List<ProjectException> getExceptionsByProject(Long projectId) {
        return exceptionRepo.findByProjectProjectId(projectId);
    }

    @Override
    public List<ProjectException> getExceptionsByTask(Long taskId) {
        return exceptionRepo.findByTaskTaskId(taskId);
    }

    @Override
    public ProjectException getExceptionById(Long id) {
        return exceptionRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Exception not found"));
    }

    @Override
    public void deleteException(Long id) {
        exceptionRepo.deleteById(id);
    }

    // ------------------------------
    // ⭐ Dashboard Methods Added
    // ------------------------------

    @Override
    public List<ProjectException> getRecentExceptions(int limit) {
        return exceptionJdbcRepository.getRecentExceptions(limit);
    }

    @Override
    public int getAllExceptionsCount() {
        return exceptionJdbcRepository.getTotalExceptions();
    }
}
