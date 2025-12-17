package com.projecttracker.service.impl;

import com.projecttracker.model.Project;
import com.projecttracker.model.ProjectMember;
import com.projecttracker.model.Team;
import com.projecttracker.model.TeamMember;
import com.projecttracker.repository.*;
import com.projecttracker.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectRepository projectRepo;

    @Autowired
    private ProjectMemberRepository prjMemberRepo;

    @Autowired
    private TeamRepository teamRepo;

    @Autowired
    private TeamMemberRepository teamMemberRepo;

    @Override
    public Project createProject(Project project) {

        // Validate assigned team exists
        Long teamId = project.getTeam().getTeamId();

        Team team = teamRepo.findById(teamId)
                .orElseThrow(() -> new RuntimeException("Invalid Team Assigned"));

        project.setTeam(team);
        project.setStatus("IN-PROGRESS");

        return projectRepo.save(project);
    }

    @Override
    public Project updateProject(Long projectId, Project updated) {

        Project project = projectRepo.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project Not Found"));

        project.setProjectName(updated.getProjectName());
        project.setProjectDesc(updated.getProjectDesc());
        project.setStartDate(updated.getStartDate());
        project.setEndDate(updated.getEndDate());
        project.setStatus(updated.getStatus());

        // Changing team requires business validation (optional)
        if (updated.getTeam() != null) {
            Long teamId = updated.getTeam().getTeamId();
            Team team = teamRepo.findById(teamId)
                    .orElseThrow(() -> new RuntimeException("Team Not Found"));
            project.setTeam(team);
        }

        return projectRepo.save(project);
    }

    @Override
    public void deleteProject(Long projectId) {
        projectRepo.deleteById(projectId);
    }

    @Override
    public Project getProjectById(Long projectId) {
        return projectRepo.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project Not Found"));
    }

    @Override
    public List<Project> getAllProjects() {
        return projectRepo.findAll();
    }

    @Override
    public List<ProjectMember> getProjectMembers(Long projectId) {
        return prjMemberRepo.findByProjectProjectId(projectId);
    }

    @Override
    public ProjectMember assignMemberToProject(Long projectId, Long memberId) {

        // Check project exists
        Project project = projectRepo.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project Not Found"));

        // Check member exists
        TeamMember member = teamMemberRepo.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member Not Found"));

        // Validate: member belongs to the same team of the project
        if (!member.getTeam().getTeamId().equals(project.getTeam().getTeamId())) {
            throw new RuntimeException("Member does not belong to Project's Team");
        }

        // Prevent duplicate assignment
        List<ProjectMember> existing = prjMemberRepo.findByProjectProjectId(projectId);
        boolean alreadyAssigned = existing.stream()
                .anyMatch(pm -> pm.getMember().getMemberId().equals(memberId));

        if (alreadyAssigned) {
            throw new RuntimeException("Member already assigned to this project");
        }

        ProjectMember pm = new ProjectMember();
        pm.setProject(project);
        pm.setMember(member);

        return prjMemberRepo.save(pm);
    }

    @Override
    public void removeMemberFromProject(Long projectId, Long memberId) {

        List<ProjectMember> mappings = prjMemberRepo.findByProjectProjectId(projectId);

        mappings.stream()
                .filter(m -> m.getMember().getMemberId().equals(memberId))
                .findFirst()
                .ifPresent(prjMemberRepo::delete);
    }

    @Override
    public boolean isMemberPartOfProject(Long projectId, Long memberId) {
        return prjMemberRepo.findByProjectProjectId(projectId)
                .stream()
                .anyMatch(pm -> pm.getMember().getMemberId().equals(memberId));
    }
}
