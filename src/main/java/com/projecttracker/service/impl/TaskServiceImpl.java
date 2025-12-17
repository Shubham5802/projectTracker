package com.projecttracker.service.impl;

import com.projecttracker.model.*;
import com.projecttracker.repository.*;
import com.projecttracker.repository.jdbc.TaskJdbcRepository;
import com.projecttracker.service.ProjectService;
import com.projecttracker.service.TaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepo;

    @Autowired
    private ProjectRepository projectRepo;

    @Autowired
    private TeamMemberRepository memberRepo;

    @Autowired
    private ProjectService projectService;

    // ⭐ Added for dashboard
    @Autowired
    private TaskJdbcRepository taskJdbcRepo;

    @Override
    public Task createTask(Task task) {

        Long projectId = task.getProject().getProjectId();
        Long memberId = task.getAssignedMember().getMemberId();

        Project project = projectRepo.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project not found"));

        validateTaskDates(task);

        TeamMember member = memberRepo.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Assigned Member Not Found"));

        if (!projectService.isMemberPartOfProject(projectId, memberId)) {
            throw new RuntimeException("Assigned member is not part of the project");
        }

        task.setProject(project);
        task.setAssignedMember(member);

        if (task.getStatus() == null) {
            task.setStatus("PENDING");
        }

        return taskRepo.save(task);
    }

    @Override
    public Task updateTask(Long taskId, Task updatedTask) {

        Task existing = taskRepo.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task Not Found"));

        validateTaskDates(updatedTask);

        existing.setTaskTitle(updatedTask.getTaskTitle());
        existing.setTaskDesc(updatedTask.getTaskDesc());
        existing.setStartDate(updatedTask.getStartDate());
        existing.setEndDate(updatedTask.getEndDate());
        existing.setStatus(updatedTask.getStatus());

        if (updatedTask.getAssignedMember() != null) {

            Long newMemberId = updatedTask.getAssignedMember().getMemberId();
            Long projectId = existing.getProject().getProjectId();

            if (!projectService.isMemberPartOfProject(projectId, newMemberId)) {
                throw new RuntimeException("New assigned member is not part of project team");
            }

            TeamMember newMember = memberRepo.findById(newMemberId)
                    .orElseThrow(() -> new RuntimeException("Member not found"));

            existing.setAssignedMember(newMember);
        }

        return taskRepo.save(existing);
    }

    @Override
    public void deleteTask(Long taskId) {
        taskRepo.deleteById(taskId);
    }

    @Override
    public Task getTaskById(Long taskId) {
        return taskRepo.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task Not Found"));
    }

    @Override
    public List<Task> getTasksByProject(Long projectId) {
        return taskRepo.findByProjectProjectId(projectId);
    }

    @Override
    public List<Task> getTasksByMember(Long memberId) {
        return taskRepo.findByAssignedMemberMemberId(memberId);
    }

    @Override
    public Task updateTaskStatus(Long taskId, String status) {
        Task task = taskRepo.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task Not Found"));

        task.setStatus(status);
        return taskRepo.save(task);
    }

    // -------------------------
    // ⭐ Dashboard Methods Added
    // -------------------------

    @Override
    public int getAllTasksCount() {
        return taskJdbcRepo.getTotalTasks();
    }

    @Override
    public List<Task> getRecentTasks(int limit) {
        return taskJdbcRepo.getRecentTasks(limit);
    }

    // -------------------------
    // VALIDATION
    // -------------------------

    private void validateTaskDates(Task task) {
        LocalDate start = task.getStartDate();
        LocalDate end = task.getEndDate();

        if (start != null && end != null && start.isAfter(end)) {
            throw new RuntimeException("Start date cannot be after end date");
        }
    }
}
