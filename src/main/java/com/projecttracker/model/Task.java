package com.projecttracker.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "xxirctc_task")
@Data
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "task_seq")
    @SequenceGenerator(name = "task_seq", sequenceName = "xxirctc_task_seq", allocationSize = 1)
    @Column(name = "nu_task_id")
    private Long taskId;

    @ManyToOne
    @JoinColumn(name = "nu_project_id")
    private Project project;

    @ManyToOne
    @JoinColumn(name = "nu_assigned_member")
    private TeamMember assignedMember;

    @Column(name = "vc_task_title")
    private String taskTitle;

    @Column(name = "vc_task_desc")
    private String taskDesc;

    @Column(name = "dt_start_date")
    @Temporal(TemporalType.DATE)
    private LocalDate startDate;

    @Column(name = "dt_end_date")
    @Temporal(TemporalType.DATE)
    private LocalDate endDate;

    @Column(name = "vc_status")
    private String status;
}
