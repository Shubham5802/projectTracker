package com.projecttracker.controller;

import com.projecttracker.model.Team;
import com.projecttracker.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/team")
public class TeamController {

    @Autowired
    private TeamService teamService;

    @GetMapping("/list")
    public String listTeams(Model model) {
        model.addAttribute("teams", teamService.getAllTeams());
        return "team/team-list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("team", new Team());
        return "team/team-create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Team team) {
    	System.out.println("hdhhsd");
        teamService.createTeam(team);
        return "redirect:/team/list";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("team", teamService.getTeamById(id));
        return "team/team-edit";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute Team updated) {
        teamService.updateTeam(id, updated);
        return "redirect:/team/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        teamService.deleteTeam(id);
        return "redirect:/team/list";
    }
}
