package com.projecttracker.repository;

import com.projecttracker.model.ProjectException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectExceptionRepository extends JpaRepository<ProjectException, Long> {

    List<ProjectException> findByProjectProjectId(Long projectId);

    List<ProjectException> findByTaskTaskId(Long taskId);
    
    // ⭐ Dashboard additions:

    // 1. Count total exceptions
    long count();

    // 2. Recent exceptions (LIMIT 5)
    List<ProjectException> findByOrderByLoggedOnDesc(
            org.springframework.data.domain.Pageable pageable);

    // 3. All exceptions sorted by most recent
    List<ProjectException> findAllByOrderByLoggedOnDesc();
}
