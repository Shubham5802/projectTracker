package com.project.tracker.service;

import com.project.tracker.model.Team;
import java.util.List;

public interface TeamService {
    Team createTeam(Team t);
    List<Team> getAllTeams();
}
