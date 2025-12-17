package com.projecttracker.controller;

import com.projecttracker.service.ProjectService;
import com.projecttracker.service.TeamMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/project/member")
public class ProjectMemberController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TeamMemberService memberService;

    @GetMapping("/assign/{projectId}")
    public String assignForm(@PathVariable Long projectId, Model model) {

        var project = projectService.getProjectById(projectId);
        var teamId = project.getTeam().getTeamId();

        model.addAttribute("project", project);
        model.addAttribute("members", memberService.getMembersByTeam(teamId));
        model.addAttribute("assignedMembers", projectService.getProjectMembers(projectId));

        return "project/project-assign-members";
    }

    @PostMapping("/add")
    public String addMember(@RequestParam Long projectId,
                            @RequestParam Long memberId) {
    		System.out.println("projectId"+projectId+"\n memberId"+memberId);
        projectService.assignMemberToProject(projectId, memberId);
        return "redirect:/project/member/assign/" + projectId;
    }

    @GetMapping("/remove/{projectId}/{memberId}")
    public String removeMember(@PathVariable Long projectId,
                               @PathVariable Long memberId) {

        projectService.removeMemberFromProject(projectId, memberId);
        return "redirect:/project/member/assign/" + projectId;
    }
}
