package com.projecttracker.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "xxirctc_projects")
@Data
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "project_seq")
    @SequenceGenerator(name = "project_seq", sequenceName = "xxirctc_project_seq", allocationSize = 1)
    @Column(name = "nu_project_id")
    private Long projectId;

    @Column(name = "vc_project_name")
    private String projectName;

    @Column(name = "vc_project_desc")
    private String projectDesc;

    @ManyToOne
    @JoinColumn(name = "nu_team_id")
    private Team team;

    @Column(name = "dt_start_date")
    @Temporal(TemporalType.DATE)
    private LocalDate startDate;

    @Column(name = "dt_end_date")
    @Temporal(TemporalType.DATE)
    private LocalDate endDate;

    @Column(name = "vc_status")
    private String status;
}
