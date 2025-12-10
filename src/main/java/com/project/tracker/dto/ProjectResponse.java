package com.project.tracker.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ProjectResponse {
    private Long projectId;
    private String name;
    private String status;
    private Date startDate;
    private Date endDate;
    private Date createdOn;
}
