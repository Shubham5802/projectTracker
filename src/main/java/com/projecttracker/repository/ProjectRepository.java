package com.projecttracker.repository;

import com.projecttracker.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {

    List<Project> findByTeamTeamId(Long teamId);
    
 // ⭐ Dashboard additions:

    // 1. Total projects -> JPA already provides count()

    // 2. Recent projects (LIMIT X)
    List<Project> findByOrderByStartDateDesc(org.springframework.data.domain.Pageable pageable);

    // 3. All projects sorted by start date
    List<Project> findAllByOrderByStartDateDesc();

    // 4. Filter by status
    List<Project> findByStatusOrderByStartDateDesc(String status);
}
