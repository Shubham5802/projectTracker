package com.projecttracker.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "xxirctc_member_shuffle")
@Data
public class MemberShuffle {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "shuffle_seq")
    @SequenceGenerator(name = "shuffle_seq", sequenceName = "xxirctc_shuffle_seq", allocationSize = 1)
    @Column(name = "nu_shuffle_id")
    private Long shuffleId;

    @ManyToOne
    @JoinColumn(name = "nu_project_id")
    private Project project;

    @ManyToOne
    @JoinColumn(name = "nu_member_id")
    private TeamMember member;

    @Column(name = "vc_action")
    private String action;

    @Column(name = "dt_action_date")
    @Temporal(TemporalType.DATE)
    private Date actionDate;

    @Column(name = "vc_remark")
    private String remark;
}
