package com.projecttracker.service;

import com.projecttracker.model.Team;
import java.util.List;

public interface TeamService {

    Team createTeam(Team team);

    Team updateTeam(Long teamId, Team updatedTeam);

    void deleteTeam(Long teamId);

    List<Team> getAllTeams();

    Team getTeamById(Long teamId);
}
