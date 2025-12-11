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
    public String listTeams(Model model) {
        model.addAttribute("teams", teamService.getAllTeams());
        return "teams/list-teams";
    }

    @GetMapping("/create")
    public String createForm() {
        return "teams/create-team";
    }

    @PostMapping("/create")
    public String createTeam(Team team) {
        teamService.createTeam(team);
        return "redirect:/teams";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam Long id, Model model) {
        model.addAttribute("team", teamService.getTeam(id));
        return "teams/edit-team";
    }

    @PostMapping("/edit")
    public String updateTeam(Team team) {
        teamService.updateTeam(team.getId(), team);
        return "redirect:/teams";
    }

    @GetMapping("/delete")
    public String deleteTeam(@RequestParam Long id) {
        teamService.deleteTeam(id);
        return "redirect:/teams";
    }
}
