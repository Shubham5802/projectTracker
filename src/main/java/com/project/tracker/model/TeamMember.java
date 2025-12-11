package com.project.tracker.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "xxirctc_tracker_team_member")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TeamMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nu_member_id")
    private Long id;

    @Column(name = "vc_name", nullable = false)
    private String name;

    @Column(name = "vc_designation")
    private String designation;

    @Column(name = "nu_contact")
    private Long contact;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nu_team_id")
    private Team team;
}
