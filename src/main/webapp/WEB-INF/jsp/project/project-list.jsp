<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    /* Page Title + Button Row */
    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
        padding-bottom: 0.8rem;
        border-bottom: 3px solid #2a5298;
    }

    .page-header h3 {
        margin: 0;
        font-weight: 700;
        font-size: 2.1rem;
        color: #2c3e50;
        background: linear-gradient(90deg, #1e3c72, #2a5298);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    /* Create Button */
    .btn-primary {
        border-radius: 12px;
        padding: 0.75rem 1.8rem;
        font-weight: 600;
        background: lightgrey;
        border: none;
        box-shadow: 0 6px 15px rgba(42, 82, 152, 0.25);
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(42, 82, 152, 0.35);
    }

    /* Table Styling */
    .projects-table {
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
        border: none;
        background: #ffffff;
    }

    .projects-table thead {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: white;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.95rem;
        letter-spacing: 0.5px;
    }

    .projects-table th,
    .projects-table td {
        padding: 1.2rem 1rem;
        vertical-align: middle;
    }

    .projects-table tbody tr {
        transition: all 0.3s ease;
    }

    .projects-table tbody tr:hover {
        background-color: #f1f5ff;
        transform: scale(1.01);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    }

    /* Status Badge (optional enhancement) */
    .status-badge {
        padding: 0.4em 0.8em;
        border-radius: 50px;
        font-size: 0.85rem;
        font-weight: 600;
        text-transform: uppercase;
    }

    /* Action Buttons */
    .action-btn {
        border-radius: 10px;
        padding: 0.45rem 0.9rem;
        font-weight: 500;
        margin: 0.2rem;
        font-size: 0.9rem;
        transition: all 0.3s ease;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
    }

    .action-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(0, 0, 0, 0.2);
    }

    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 5rem 2rem;
        color: #6c757d;
    }

    .empty-state p {
        font-size: 1.2rem;
    }

    /* Responsive */
    @media (max-width: 992px) {
        .page-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 1rem;
        }

        .action-btn {
            display: block;
            width: 100%;
            margin: 0.3rem 0;
        }
    }

    @media (max-width: 768px) {
        .projects-table {
            font-size: 0.95rem;
        }
    }
</style>

<div class="container mt-4">
    <div class="page-header">
        <h3>Projects</h3>
        <a href="/project/create" class="btn btn-primary">Create New Project</a>
    </div>

    <div class="table-responsive">
        <table class="table table-hover projects-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Project Name</th>
                    <th>Team</th>
                    <th>Status</th>
                    <th>Start</th>
                    <th>End</th>
                    <th style="width: 300px;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${projects}">
                    <tr>
                        <td>${p.projectId}</td>
                        <td><strong>${p.projectName}</strong></td>
                        <td>${p.team.teamName}</td>
                        <td>
                            <span class="status-badge ${
                                p.status == 'Completed' ? 'bg-success text-white' :
                                p.status == 'In Progress' ? 'bg-warning text-dark' :
                                p.status == 'Pending' ? 'bg-info text-white' :
                                'bg-secondary text-white'
                            }">${p.status}</span>
                        </td>
                        <td>${p.startDate}</td>
                        <td>${p.endDate}</td>
                        <td>
                            <a href="/project/edit/${p.projectId}" class="btn btn-sm btn-warning action-btn">Edit</a>
                            <a href="/project/delete/${p.projectId}" class="btn btn-sm btn-danger action-btn"
                               onclick="return confirm('Delete this project?')">Delete</a>
                            <a href="/project/member/assign/${p.projectId}" class="btn btn-sm btn-info action-btn">Assign Members</a><br><br><br>
                            <a href="/task/list/${p.projectId}" class="btn btn-sm btn-secondary action-btn">Tasks</a>
                            <a href="/exception/list/${p.projectId}" class="btn btn-sm btn-dark action-btn">Exceptions</a>
                            <a href="/meeting/list/${p.projectId}" class="btn btn-sm btn-dark action-btn">Meetings</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Empty State -->
    <c:if test="${empty projects}">
        <div class="empty-state">
            <p>No projects yet.</p>
            <p class="text-muted">Click "Create New Project" to add your first project!</p>
        </div>
    </c:if>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>