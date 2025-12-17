package com.projecttracker.service.impl;

import com.projecttracker.model.MeetingLog;
import com.projecttracker.model.Project;
import com.projecttracker.repository.MeetingLogRepository;
import com.projecttracker.repository.ProjectRepository;
import com.projecttracker.repository.jdbc.MeetingJdbcRepository;
import com.projecttracker.service.MeetingLogService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MeetingLogServiceImpl implements MeetingLogService {

    @Autowired
    private MeetingLogRepository meetingRepo;

    @Autowired
    private ProjectRepository projectRepo;

    // ⭐ Added for Dashboard (JDBC optimized)
    @Autowired
    private MeetingJdbcRepository meetingJdbcRepository;

    @Override
    public MeetingLog addMeeting(MeetingLog meeting) {

        Long projectId = meeting.getProject().getProjectId();

        Project project = projectRepo.findById(projectId)
                .orElseThrow(() -> new RuntimeException("Project not found"));

        meeting.setProject(project);

        return meetingRepo.save(meeting);
    }

    @Override
    public List<MeetingLog> getMeetingsByProject(Long projectId) {
        return meetingRepo.findByProjectProjectId(projectId);
    }

    @Override
    public MeetingLog getMeetingById(Long meetingId) {
        return meetingRepo.findById(meetingId)
                .orElseThrow(() -> new RuntimeException("Meeting not found"));
    }

    @Override
    public void deleteMeeting(Long meetingId) {
        meetingRepo.deleteById(meetingId);
    }

    // ------------------------------
    // ⭐ Dashboard Methods Added
    // ------------------------------

    @Override
    public List<MeetingLog> getRecentMeetings(int limit) {
        return meetingJdbcRepository.getRecentMeetings(limit);
    }

    @Override
    public int getAllMeetingsCount() {
        return meetingJdbcRepository.getTotalMeetings();
    }
}
