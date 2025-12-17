package com.projecttracker.model;


import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;
@Entity
@Table(name = "xxirctc_meeting_log")
@Data
public class MeetingLog {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meet_seq")
    @SequenceGenerator(name = "meet_seq", sequenceName = "xxirctc_meet_seq", allocationSize = 1)
    @Column(name = "nu_meeting_id")
    private Long meetingId;

    @ManyToOne
    @JoinColumn(name = "nu_project_id")
    private Project project;

    @Column(name = "vc_title")
    private String title;

    @Column(name = "vc_meeting_notes")
    private String notes;

    @Column(name = "dt_meeting_date")
    @Temporal(TemporalType.DATE)
    private LocalDate meetingDate;
}
