package com.projecttracker.repository;

import com.projecttracker.model.ProjectMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectMemberRepository extends JpaRepository<ProjectMember, Long> {

    List<ProjectMember> findByProjectProjectId(Long projectId);

    List<ProjectMember> findByMemberMemberId(Long memberId);
}
