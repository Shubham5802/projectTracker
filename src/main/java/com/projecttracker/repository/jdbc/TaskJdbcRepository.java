package com.projecttracker.repository.jdbc;

import com.projecttracker.model.Project;
import com.projecttracker.model.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TaskJdbcRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int getTotalTasks() {
        String sql = "SELECT COUNT(*) FROM xxirctc_task";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public List<Task> getRecentTasks(int limit) {

        String sql =
            "SELECT * FROM ( " +
            "   SELECT t.*, p.VC_PROJECT_NAME " +
            "   FROM xxirctc_task t " +
            "   JOIN xxirctc_projects p ON t.nu_project_id = p.nu_project_id " +
            "   ORDER BY t.dt_start_date DESC " +
            ") WHERE ROWNUM <= ?";

        return jdbcTemplate.query(sql, new Object[]{limit}, (rs, rowNum) -> mapTask(rs));
    }

    private Task mapTask(ResultSet rs) throws SQLException {

        Task task = new Task();
        task.setTaskId(rs.getLong("nu_task_id"));
        task.setTaskTitle(rs.getString("vc_task_title"));
        task.setTaskDesc(rs.getString("vc_task_desc"));
        task.setStatus(rs.getString("vc_status"));

        if (rs.getDate("dt_start_date") != null) {
            task.setStartDate(rs.getDate("dt_start_date").toLocalDate());
        }
        if (rs.getDate("dt_end_date") != null) {
            task.setEndDate(rs.getDate("dt_end_date").toLocalDate());
        }

        // Using standard setters instead of Builder
        Project project = new Project();
        project.setProjectId(rs.getLong("nu_project_id"));
        project.setProjectName(rs.getString("vc_project_name"));

        task.setProject(project);

        return task;
    }
}
