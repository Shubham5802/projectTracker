package com.project.tracker.model;

import jakarta.persistence.*;
import lombok.*;

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

    @Temporal(TemporalType.DATE)
    @Column(name = "dt_start")
    private Date startDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "dt_end")
    private Date endDate;

    @Column(name = "vc_status")
    private String status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "dt_created")
    private Date createdOn;
    
    @ManyToOne
    @JoinColumn(name = "nu_team_id", nullable = false)
    private Team team;

}
