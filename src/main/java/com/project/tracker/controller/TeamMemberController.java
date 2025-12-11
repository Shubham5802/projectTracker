package com.project.tracker.controller;

import com.project.tracker.dto.TeamMemberCreateRequest;
import com.project.tracker.dto.TeamMemberResponse;
import com.project.tracker.service.TeamMemberService;
import com.project.tracker.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/members")
@RequiredArgsConstructor
public class TeamMemberController {

    private final TeamMemberService memberService;
    private final TeamService teamService;

    // ======= JSP PAGE - LIST MEMBERS =======
    @GetMapping
    public String listMembers(@RequestParam Long teamId, Model model) {
        model.addAttribute("team", teamService.getTeam(teamId));
        model.addAttribute("members", memberService.getMembersByTeam(teamId));
        return "teams/members-list";
    }

    // ======= JSP PAGE - ADD FORM ========
    @GetMapping("/create")
    public String createForm(@RequestParam Long teamId, Model model) {
        model.addAttribute("teamId", teamId);
        return "teams/member-create";
    }

    @PostMapping("/create")
    public String createMember(
            @ModelAttribute TeamMemberCreateRequest req
    ) {
        memberService.createMember(req);
        return "redirect:/members?teamId=" + req.getTeamId();
    }

    // ======= UPDATE MEMBER (JSP) ========
    @GetMapping("/edit")
    public String editForm(@RequestParam Long id, Model model) {
        TeamMemberResponse m = memberService.getMember(id);
        model.addAttribute("member", m);
        return "teams/member-edit";
    }

    @PostMapping("/edit")
    public String updateMember(
            @RequestParam Long memberId,
            @ModelAttribute TeamMemberCreateRequest req
    ) {
        memberService.updateMember(memberId, req);
        return "redirect:/members?teamId=" + req.getTeamId();
    }

    // DELETE
    @GetMapping("/delete")
    public String deleteMember(
            @RequestParam Long id,
            @RequestParam Long teamId
    ) {
        memberService.deleteMember(id);
        return "redirect:/members?teamId=" + teamId;
    }
}
