package com.project.tracker.controller;

import com.project.tracker.model.Team;
import com.project.tracker.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/teams")
@RequiredArgsConstructor
public class TeamPageController {

    private final TeamService teamService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("teams", teamService.getAllTeams());
        return "teams/list-teams";
    }

    @GetMapping("/create")
    public String createForm() {
        return "teams/create-team";
    }

    @PostMapping("/create")
    public String create(Team t) {
        teamService.createTeam(t);
        return "redirect:/teams";
    }
}
