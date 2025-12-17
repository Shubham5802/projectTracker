package com.projecttracker.model;

import java.util.Date;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "xxirctc_team_member")
@Data
public class TeamMember {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_seq")
    @SequenceGenerator(name = "member_seq", sequenceName = "xxirctc_member_seq", allocationSize = 1)
    @Column(name = "nu_member_id")
    private Long memberId;

    @ManyToOne
    @JoinColumn(name = "nu_team_id")
    private Team team;

    @Column(name = "vc_member_name")
    private String memberName;

    @Column(name = "vc_contact")
    private String contact;

    @Column(name = "vc_email")
    private String email;

    @Column(name = "vc_designation")
    private String designation;

    @Column(name = "dt_joined_on")
    @Temporal(TemporalType.DATE)
    private Date joinedOn;
}
