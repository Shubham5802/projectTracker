package com.project.tracker.service;

import com.project.tracker.model.Team;
import java.util.List;

public interface TeamService {

    Team createTeam(Team team);
    Team updateTeam(Long id, Team updated);
    void deleteTeam(Long id);

    Team getTeam(Long id);
    List<Team> getAllTeams();
}
