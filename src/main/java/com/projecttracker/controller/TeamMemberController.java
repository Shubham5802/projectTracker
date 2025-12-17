package com.projecttracker.controller;

import com.projecttracker.model.TeamMember;
import com.projecttracker.service.TeamMemberService;
import com.projecttracker.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/member")
public class TeamMemberController {

    @Autowired
    private TeamMemberService memberService;

    @Autowired
    private TeamService teamService;

    @GetMapping("/list/{teamId}")
    public String listMembers(@PathVariable Long teamId, Model model) {
        model.addAttribute("members", memberService.getMembersByTeam(teamId));
        model.addAttribute("teamId", teamId);
        return "member/member-list";
    }

    @GetMapping("/create/{teamId}")
    public String createForm(@PathVariable Long teamId, Model model) {
        TeamMember m = new TeamMember();
        m.setTeam(teamService.getTeamById(teamId));

        model.addAttribute("member", m);
        model.addAttribute("teamId", teamId);
        return "member/member-create";
    }

    @PostMapping("/save/{teamId}")
    public String save(@PathVariable Long teamId, @ModelAttribute TeamMember member) {
        memberService.addMember(member);
        return "redirect:/member/list/" + teamId;
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("member", memberService.getMemberById(id));
        return "member/member-edit";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute TeamMember updated) {
        memberService.updateMember(id, updated);
        return "redirect:/team/list";
    }

    @GetMapping("/delete/{id}/{teamId}")
    public String delete(@PathVariable Long id, @PathVariable Long teamId) {
        memberService.deleteMember(id);
        return "redirect:/member/list/" + teamId;
    }
}
