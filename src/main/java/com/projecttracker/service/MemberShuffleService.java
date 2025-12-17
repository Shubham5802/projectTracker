package com.projecttracker.service;

import com.projecttracker.model.MemberShuffle;

import java.util.List;

public interface MemberShuffleService {

    MemberShuffle logShuffle(MemberShuffle shuffle);

    List<MemberShuffle> getShuffleHistoryByProject(Long projectId);

    List<MemberShuffle> getShuffleHistoryByMember(Long memberId);
}
