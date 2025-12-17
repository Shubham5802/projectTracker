package com.projecttracker.service.impl;

import com.projecttracker.model.Team;
import com.projecttracker.repository.TeamRepository;
import com.projecttracker.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    private TeamRepository teamRepository;

    @Override
    public Team createTeam(Team team) {
        return teamRepository.save(team);
    }

    @Override
    public Team updateTeam(Long teamId, Team updatedTeam) {
        Team existing = teamRepository.findById(teamId)
                .orElseThrow(() -> new RuntimeException("Team not found"));

        existing.setTeamName(updatedTeam.getTeamName());
        return teamRepository.save(existing);
    }

    @Override
    public void deleteTeam(Long teamId) {
        teamRepository.deleteById(teamId);
    }

    @Override
    public List<Team> getAllTeams() {
        return teamRepository.findAll();
    }

    @Override
    public Team getTeamById(Long teamId) {
        return teamRepository.findById(teamId)
                .orElseThrow(() -> new RuntimeException("Team not found"));
    }
}
