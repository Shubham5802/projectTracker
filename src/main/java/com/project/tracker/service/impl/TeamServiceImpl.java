package com.project.tracker.service.impl;

import com.project.tracker.model.Team;
import com.project.tracker.repository.TeamRepository;
import com.project.tracker.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TeamServiceImpl implements TeamService {

    private final TeamRepository repo;

    @Override
    public Team createTeam(Team t) {
        return repo.save(t);
    }

    @Override
    public List<Team> getAllTeams() {
        return repo.findAll();
    }
}
