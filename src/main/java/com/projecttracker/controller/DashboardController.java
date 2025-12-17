package com.projecttracker.controller;

import com.projecttracker.model.ProjectException;
import com.projecttracker.model.MeetingLog;
import com.projecttracker.model.Task;
import com.projecttracker.service.ProjectExceptionService;
import com.projecttracker.service.MeetingLogService;
import com.projecttracker.service.ProjectService;
import com.projecttracker.service.TaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private MeetingLogService meetingService;

    @Autowired
    private ProjectExceptionService exceptionService;

    @GetMapping("/")
    public String dashboard(Model model) {

        // SUMMARY COUNTS
        model.addAttribute("totalProjects", projectService.getAllProjects().size());
        model.addAttribute("totalTasks", taskService.getAllTasksCount());
        model.addAttribute("totalMeetings", meetingService.getAllMeetingsCount());
        model.addAttribute("totalExceptions", exceptionService.getAllExceptionsCount());

        // RECENT 5 TASKS
        List<Task> recentTasks = taskService.getRecentTasks(5);
        model.addAttribute("recentTasks", recentTasks);

        // RECENT 5 MEETINGS
        List<MeetingLog> recentMeetings = meetingService.getRecentMeetings(5);
        model.addAttribute("recentMeetings", recentMeetings);

        // RECENT 5 EXCEPTIONS
        List<ProjectException> recentExceptions = exceptionService.getRecentExceptions(5);
        model.addAttribute("recentExceptions", recentExceptions);

        return "dashboard";
    }

}
