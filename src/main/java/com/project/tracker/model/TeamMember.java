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

    @Column(name = "vc_member_name", nullable = false)
    private String memberName;

    @Column(name = "vc_email")
    private String email;

    @ManyToOne
    @JoinColumn(name = "nu_team_id", nullable = false)
    private Team team;
}
