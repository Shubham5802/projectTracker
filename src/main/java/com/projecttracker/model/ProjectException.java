package com.projecttracker.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "xxirctc_project_exception")
@Data
public class ProjectException {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "exc_seq")
    @SequenceGenerator(name = "exc_seq", sequenceName = "xxirctc_exc_seq", allocationSize = 1)
    @Column(name = "nu_exception_id")
    private Long exceptionId;

    @ManyToOne
    @JoinColumn(name = "nu_project_id")
    private Project project;

    @ManyToOne
    @JoinColumn(name = "nu_task_id")
    private Task task;

    @Column(name = "vc_exception_type")
    private String type;

    @Column(name = "vc_description")
    private String description;

    @Column(name = "dt_logged_on")
    @Temporal(TemporalType.DATE)
    private Date loggedOn;
}
