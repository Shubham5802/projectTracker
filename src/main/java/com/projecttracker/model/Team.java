package com.projecttracker.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "xxirctc_team")
@Data
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "team_seq")
    @SequenceGenerator(name = "team_seq", sequenceName = "xxirctc_team_seq", allocationSize = 1)
    @Column(name = "nu_team_id")
    private Long teamId;

    @Column(name = "vc_team_name")
    private String teamName;

    @Column(name = "dt_created_on")
    @Temporal(TemporalType.DATE)
    private Date createdOn;

    @OneToMany(mappedBy = "team")
    private List<TeamMember> members;
}
