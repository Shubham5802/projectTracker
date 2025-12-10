package com.project.tracker.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "xxirctc_tracker_team")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nu_team_id")
    private Long id;

    @Column(name = "vc_name", nullable = false)
    private String name;

    @Column(name = "vc_description")
    private String description;
}
