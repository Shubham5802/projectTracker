package com.projecttracker.controller;

import com.projecttracker.model.MeetingLog;
import com.projecttracker.service.MeetingLogService;
import com.projecttracker.service.ProjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/meeting")
public class MeetingLogController {

    @Autowired
    private MeetingLogService meetingService;

    @Autowired
    private ProjectService projectService;

    @GetMapping("/list/{projectId}")
    public String listMeetings(@PathVariable Long projectId, Model model) {

        model.addAttribute("project", projectService.getProjectById(projectId));
        model.addAttribute("meetings", meetingService.getMeetingsByProject(projectId));

        return "meeting/meeting-list";
    }

    @GetMapping("/create/{projectId}")
    public String createForm(@PathVariable Long projectId, Model model) {

        MeetingLog log = new MeetingLog();
        log.setProject(projectService.getProjectById(projectId));

        model.addAttribute("meeting", log);
        return "meeting/meeting-create";
    }

    @PostMapping("/save/{projectId}")
    public String save(@PathVariable Long projectId,
                       @ModelAttribute MeetingLog meeting) {

        meetingService.addMeeting(meeting);
        return "redirect:/meeting/list/" + projectId;
    }

    @GetMapping("/delete/{id}/{projectId}")
    public String delete(@PathVariable Long id, @PathVariable Long projectId) {

        meetingService.deleteMeeting(id);
        return "redirect:/meeting/list/" + projectId;
    }
}
