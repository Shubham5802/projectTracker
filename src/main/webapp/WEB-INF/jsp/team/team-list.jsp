<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    /* Page Title + Button Row */
    .page-header {
        display: flex;
        justify-content: between;
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
        padding: 10px;
        font-weight: 600;
         align-items: right;
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
    .teams-table {
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
        border: none;
        background: #ffffff;
    }

    .teams-table thead {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: white;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.95rem;
        letter-spacing: 0.5px;
    }

    .teams-table th,
    .teams-table td {
        padding: 1.2rem 1rem;
        vertical-align: middle;
    }

    .teams-table tbody tr {
        transition: all 0.3s ease;
    }

    .teams-table tbody tr:hover {
        background-color: #f1f5ff;
        transform: scale(1.01);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    }

    /* Action Buttons */
    .action-btn {
        border-radius: 10px;
        padding: 0.5rem 1rem;
        font-weight: 500;
        margin: 0 0.3rem;
        transition: all 0.3s ease;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
    }

    .btn-warning.action-btn {
        background: #ffc107;
        color: #212529;
    }

    .btn-danger.action-btn {
        background: #dc3545;
    }

    .btn-info.action-btn {
        background: #17a2b8;
    }

    .action-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(0, 0, 0, 0.2);
    }

    /* Responsive */
    @media (max-width: 768px) {
        .page-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 1rem;
        }

        .teams-table {
            font-size: 0.95rem;
        }

        .action-btn {
            display: block;
            width: 100%;
            margin: 0.4rem 0;
        }
    }
</style>

<div class="container mt-4">
    <div class="page-header d-flex justify-content-between align-items-center">
        <h3>Teams</h3>
        <a href="/team/create" class="btn btn-primary">Create New Team</a>
    </div>

    <div class="table-responsive">
        <table class="table table-hover teams-table">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Team Name</th>
                    <th style="width: 280px;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="t" items="${teams}">
                    <tr>
                        <td>${t.teamId}</td>
                        <td><strong>${t.teamName}</strong></td>
                        <td>
                            <a href="/team/edit/${t.teamId}" class="btn btn-sm btn-warning action-btn">Edit</a>
                            <a href="/team/delete/${t.teamId}" class="btn btn-sm btn-danger action-btn"
                               onclick="return confirm('Delete this team?')">Delete</a>
                            <a href="/member/list/${t.teamId}" class="btn btn-sm btn-info action-btn">Members</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Empty State (optional nice touch if no teams) -->
    <c:if test="${empty teams}">
        <div class="text-center py-5">
            <p class="text-muted fs-5">No teams yet. Create your first team to get started!</p>
        </div>
    </c:if>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>