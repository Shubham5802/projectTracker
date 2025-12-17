<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    /* Page Title */
    h3.mb-3 {
        margin: 0;
        font-weight: 700;
        font-size: 2.1rem;
        color: #2c3e50;
        background: linear-gradient(90deg, #1e3c72, #2a5298);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    /* Header Section */
    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
        padding-bottom: 0.8rem;
        border-bottom: 3px solid #2a5298;
    }

    /* Buttons */
    .btn {
        border-radius: 12px;
        padding: 0.75rem 1.8rem;
        font-weight: 600;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        transition: all 0.3s ease;
    }

    .btn-primary {
        background: linear-gradient(135deg, #28a745, #20c997);
        border: none;
    }

    .btn-primary:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(40, 167, 69, 0.35);
    }

    .btn-secondary {
        background: linear-gradient(135deg, #6c757d, #5a6268);
        border: none;
        margin-left: 0.75rem;
    }

    .btn-secondary:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(108, 117, 125, 0.3);
    }

    /* Table Styling */
    .members-table {
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
        border: none;
        background: #ffffff;
    }

    .members-table thead {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: white;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.95rem;
        letter-spacing: 0.5px;
    }

    .members-table th,
    .members-table td {
        padding: 1.2rem 1rem;
        vertical-align: middle;
    }

    .members-table tbody tr {
        transition: all 0.3s ease;
    }

    .members-table tbody tr:hover {
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

    .action-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(0, 0, 0, 0.2);
    }

    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 4rem 2rem;
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

        .btn-secondary {
            margin-left: 0;
        }
    }

    @media (max-width: 768px) {
        .members-table {
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
    <div class="page-header">
        <h3>Members of Team #${teamId}</h3>
        <div>
            <a href="/member/create/${teamId}" class="btn btn-primary">Add New Member</a>
            <a href="/team/list" class="btn btn-secondary">Back to Teams</a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover members-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Designation</th>
                    <th style="width: 180px;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="m" items="${members}">
                    <tr>
                        <td>${m.memberId}</td>
                        <td><strong>${m.memberName}</strong></td>
                        <td>${m.contact}</td>
                        <td>${m.email}</td>
                        <td>${m.designation}</td>
                        <td>
                            <a href="/member/edit/${m.memberId}" class="btn btn-sm btn-warning action-btn">Edit</a>
                            <a href="/member/delete/${m.memberId}/${teamId}"
                               class="btn btn-sm btn-danger action-btn"
                               onclick="return confirm('Delete this member?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Empty State -->
    <c:if test="${empty members}">
        <div class="empty-state">
            <p>No members in this team yet.</p>
            <p class="text-muted">Click "Add New Member" to get started!</p>
        </div>
    </c:if>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>