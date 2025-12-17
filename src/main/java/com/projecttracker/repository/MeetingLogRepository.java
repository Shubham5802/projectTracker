package com.projecttracker.repository;

import com.projecttracker.model.MeetingLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MeetingLogRepository extends JpaRepository<MeetingLog, Long> {

    List<MeetingLog> findByProjectProjectId(Long projectId);
    
    // ⭐ Dashboard additions:

    // 1. Count total meetings
    long count();

    // 2. Recent meetings (LIMIT 5)
    List<MeetingLog> findByOrderByMeetingDateDesc(org.springframework.data.domain.Pageable pageable);

    // 3. All meetings ordered by latest first
    List<MeetingLog> findAllByOrderByMeetingDateDesc();
}
