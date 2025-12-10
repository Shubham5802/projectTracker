package com.project.tracker.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Table(name = "xxirctc_tracker_task")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nu_task_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nu_project_id", nullable = false)
    private Project project;

    @Column(name = "vc_title", nullable = false)
    private String title;

    @Lob
    @Column(name = "cl_description")
    private String description;

    @Column(name = "vc_priority")
    private String priority;

    @Column(name = "vc_status")
    private String status;

    @Column(name = "nu_progress")
    private Integer progress;

    @Temporal(TemporalType.DATE)
    @Column(name = "dt_due_date")
    private Date dueDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "dt_created")
    private Date createdOn;

    // 🔴 NOT persisted – used only for UI (JSP ${task.ai...})
    @Transient
    private com.project.tracker.service.ai.dto.TaskAiSuggestion ai;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nu_member_id")
    private TeamMember assignedTo;

}
