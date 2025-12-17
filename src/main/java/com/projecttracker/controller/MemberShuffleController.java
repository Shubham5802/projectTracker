package com.projecttracker.controller;

import com.projecttracker.model.MemberShuffle;
import com.projecttracker.service.MemberShuffleService;
import com.projecttracker.service.ProjectService;
import com.projecttracker.service.TeamMemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/shuffle")
public class MemberShuffleController {

    @Autowired
    private MemberShuffleService shuffleService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TeamMemberService memberService;

    @GetMapping("/project/{projectId}")
    public String historyByProject(@PathVariable Long projectId, Model model) {

        model.addAttribute("project", projectService.getProjectById(projectId));
        model.addAttribute("shuffles", shuffleService.getShuffleHistoryByProject(projectId));

        return "shuffle/shuffle-list";
    }

    @GetMapping("/member/{memberId}")
    public String historyByMember(@PathVariable Long memberId, Model model) {

        model.addAttribute("member", memberService.getMemberById(memberId));
        model.addAttribute("shuffles", shuffleService.getShuffleHistoryByMember(memberId));

        return "shuffle/shuffle-member-list";
    }

    @GetMapping("/log/{projectId}")
    public String logForm(@PathVariable Long projectId, Model model) {

        MemberShuffle shuffle = new MemberShuffle();
        shuffle.setProject(projectService.getProjectById(projectId));

        model.addAttribute("shuffle", shuffle);
        model.addAttribute("projectMembers", projectService.getProjectMembers(projectId));

        return "shuffle/shuffle-create";
    }

    @PostMapping("/save/{projectId}")
    public String save(@PathVariable Long projectId,
                       @ModelAttribute MemberShuffle shuffle) {

        shuffleService.logShuffle(shuffle);
        return "redirect:/shuffle/project/" + projectId;
    }
}
