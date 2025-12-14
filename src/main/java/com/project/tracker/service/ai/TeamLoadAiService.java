package com.project.tracker.service.ai;

import com.project.tracker.model.TeamMember;
import com.project.tracker.service.ai.dto.TeamMemberLoadInfo;
import com.project.tracker.model.Task;

import java.util.List;

public interface TeamLoadAiService {

    TeamMember suggestBestAssignee(Long teamId);
    List<TeamMemberLoadInfo> getTeamLoad(Long teamId);

}
