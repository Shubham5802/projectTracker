package com.projecttracker.repository.jdbc;

import com.projecttracker.model.Project;
import com.projecttracker.model.ProjectException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ExceptionJdbcRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int getTotalExceptions() {
        return jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM XXIRCTC_PROJECT_EXCEPTION",
                Integer.class
        );
    }

    public List<ProjectException> getRecentExceptions(int limit) {

        String sql =
            "SELECT * FROM ( " +
            "   SELECT e.*, p.VC_PROJECT_NAME " +
            "   FROM XXIRCTC_PROJECT_EXCEPTION e " +
            "   JOIN XXIRCTC_PROJECTS p ON e.NU_PROJECT_ID = p.NU_PROJECT_ID " +
            "   ORDER BY e.DT_LOGGED_ON DESC " +
            ") WHERE ROWNUM <= ?";

        return jdbcTemplate.query(sql, new Object[]{limit}, (rs, rowNum) -> mapException(rs));
    }

    private ProjectException mapException(ResultSet rs) throws SQLException {

        ProjectException exception = new ProjectException();

        exception.setExceptionId(rs.getLong("NU_EXCEPTION_ID"));

        exception.setType(rs.getString("VC_EXCEPTION_TYPE"));   // ✔ Correct
        exception.setDescription(rs.getString("VC_DESCRIPTION")); // ✔ Correct

        if (rs.getDate("DT_LOGGED_ON") != null) {
            exception.setLoggedOn(rs.getDate("DT_LOGGED_ON"));  // ✔ Date → java.util.Date OK
        }

        Project p = new Project();
        p.setProjectId(rs.getLong("NU_PROJECT_ID"));
        p.setProjectName(rs.getString("VC_PROJECT_NAME"));

        exception.setProject(p);

        return exception;
    }
}
