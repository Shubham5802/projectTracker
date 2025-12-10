package com.project.tracker.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.Date;

@Data
public class ProjectCreateRequest {

    @NotBlank
    private String name;

    private String description;

    @NotNull
    private Date startDate;

    @NotNull
    private Date endDate;
    
    private Long teamId;

}
