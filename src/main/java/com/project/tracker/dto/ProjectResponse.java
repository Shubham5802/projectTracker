package com.project.tracker.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class ProjectResponse {
    private Long projectId;
    private String name;
    private String status;
    private LocalDate  startDate;
    private LocalDate  endDate;
    private Date createdOn;
}
