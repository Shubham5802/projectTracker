package com.projecttracker.repository.jdbc;

import com.projecttracker.model.MeetingLog;
import com.projecttracker.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class MeetingJdbcRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int getTotalMeetings() {
        return jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM XXIRCTC_MEETING_LOG",
                Integer.class
        );
    }

    public List<MeetingLog> getRecentMeetings(int limit) {

        String sql =
            "SELECT * FROM ( " +
            "   SELECT m.*, p.VC_PROJECT_NAME " +
            "   FROM XXIRCTC_MEETING_LOG m " +
            "   JOIN XXIRCTC_PROJECTS p ON m.NU_PROJECT_ID = p.NU_PROJECT_ID " +
            "   ORDER BY m.DT_MEETING_DATE DESC " +
            ") WHERE ROWNUM <= ?";

        return jdbcTemplate.query(sql, new Object[]{limit}, (rs, rowNum) -> mapMeeting(rs));
    }

    private MeetingLog mapMeeting(ResultSet rs) throws SQLException {

        MeetingLog meeting = new MeetingLog();

        meeting.setMeetingId(rs.getLong("NU_MEETING_ID"));
        meeting.setTitle(rs.getString("VC_TITLE"));
        meeting.setNotes(rs.getString("VC_MEETING_NOTES"));

        if (rs.getDate("DT_MEETING_DATE") != null) {
            meeting.setMeetingDate(
                    rs.getDate("DT_MEETING_DATE").toLocalDate()   // ✔ FIXED
            );
        }

        // Attach Project (lightweight)
        Project p = new Project();
        p.setProjectId(rs.getLong("NU_PROJECT_ID"));
        p.setProjectName(rs.getString("VC_PROJECT_NAME"));

        meeting.setProject(p);

        return meeting;
    }

}
