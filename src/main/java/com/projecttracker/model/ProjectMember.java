package com.projecttracker.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "xxirctc_project_member")
@Data
public class ProjectMember {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "prj_mem_seq")
    @SequenceGenerator(name = "prj_mem_seq", sequenceName = "xxirctc_prj_mem_seq", allocationSize = 1)
    @Column(name = "nu_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "nu_project_id")
    private Project project;

    @ManyToOne
    @JoinColumn(name = "nu_member_id")
    private TeamMember member;
}
