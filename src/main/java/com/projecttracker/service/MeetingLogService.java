package com.projecttracker.service;

import com.projecttracker.model.MeetingLog;

import java.util.List;

public interface MeetingLogService {

    MeetingLog addMeeting(MeetingLog meeting);

    List<MeetingLog> getMeetingsByProject(Long projectId);

    MeetingLog getMeetingById(Long meetingId);

    void deleteMeeting(Long meetingId);
    
    // ⭐ Dashboard additions
    List<MeetingLog> getRecentMeetings(int limit);

    int getAllMeetingsCount();
}
