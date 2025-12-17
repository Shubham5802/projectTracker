package com.projecttracker.repository;

import com.projecttracker.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> findByProjectProjectId(Long projectId);

    List<Task> findByAssignedMemberMemberId(Long memberId);
    
    // 1. Count total tasks
    long count();

    // 2. Recent tasks (LIMIT 5)
    List<Task> findByOrderByStartDateDesc(org.springframework.data.domain.Pageable pageable);

    // 3. Order tasks by status/date
    List<Task> findAllByOrderByStartDateDesc();
}
