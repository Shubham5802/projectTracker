package com.project.tracker.controller;

import com.project.tracker.model.TeamMember;
import com.project.tracker.service.TeamMemberService;
import com.project.tracker.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/team-members")
@RequiredArgsConstructor
public class TeamMemberPageController {

    private final TeamMemberService memberService;
    private final TeamService teamService;

    @GetMapping
    public String list(Model model, @RequestParam(required = false) Long teamId) {
        model.addAttribute("teams", teamService.getAllTeams());

        if (teamId != null) {
            model.addAttribute("members", memberService.getMembersByTeam(teamId));
        }

        return "teams/list-members";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("teams", teamService.getAllTeams());
        return "teams/create-member";
    }

    @PostMapping("/create")
    public String create(TeamMember m) {
        memberService.createMember(m);
        return "redirect:/team-members";
    }
}
