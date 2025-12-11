package com.project.tracker.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "xxirctc_tracker_project")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nu_project_id")
    private Long id;

    @Column(name = "vc_name", nullable = false)
    private String name;

    @Lob
    @Column(name = "cl_description")
    private String description;

    @Column(name = "dt_start")
    private LocalDate startDate;

    @Column(name = "dt_end")
    private LocalDate endDate;


    @Column(name = "vc_status")
    private String status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "dt_created")
    private Date createdOn;
    
    @ManyToOne
    @JoinColumn(name = "nu_team_id", nullable = false)
    private Team team;

}
