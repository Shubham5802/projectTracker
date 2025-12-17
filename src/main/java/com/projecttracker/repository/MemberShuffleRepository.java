package com.projecttracker.repository;

import com.projecttracker.model.MemberShuffle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberShuffleRepository extends JpaRepository<MemberShuffle, Long> {

    List<MemberShuffle> findByProjectProjectId(Long projectId);

    List<MemberShuffle> findByMemberMemberId(Long memberId);
}
