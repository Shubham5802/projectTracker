<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    /* Page Title */
    h3.mb-4 {
        color: #2c3e50;
        font-weight: 700;
        font-size: 2.1rem;
        background: linear-gradient(90deg, #1e3c72, #2a5298);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    /* Stronger Section Headings */
    h5 {
        font-weight: 700 !important;
        color: #1a202c !important;
        margin-bottom: 1.4rem !important;
        padding-bottom: 0.6rem !important;
        border-bottom: 3px solid #cbd5e0 !important;
        font-size: 1.35rem !important;
        letter-spacing: 0.5px;
        text-transform: uppercase;
    }

    /* Card Containers - Equal Height & Side-by-Side */
    .assign-card {
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
        padding: 2rem;
        height: 100%;
        border: 1px solid rgba(0, 0, 0, 0.05);
        display: flex;
        flex-direction: column;
    }

    .assign-card .table-responsive {
        flex: 1;
        overflow-y: auto;
        max-height: 400px; /* Ensures scrolling if too many members */
    }

    /* Table Styling */
    .assign-table {
        margin-bottom: 0;
    }

    .assign-table thead th {
        font-weight: 600;
        font-size: 0.95rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border-bottom: 2px solid #dee2e6;
    }

    .assign-table tbody td {
        vertical-align: middle;
        padding: 1rem;
    }

    .assign-table tbody tr {
        transition: background-color 0.3s ease;
    }

    .assign-table tbody tr:hover {
        background-color: #f8fafc;
    }

    /* Available Members Table */
    .available-table thead {
        background-color: #e6f0ff;
        color: #1e40af;
    }

    /* Assigned Members Table */
    .assigned-table thead {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: white;
    }

    /* Buttons */
    .btn {
        border-radius: 10px;
        padding: 0.55rem 1.2rem;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .btn-success {
        background: linear-gradient(135deg, #28a745, #20c997);
        border: none;
    }

    .btn-success:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(40, 167, 69, 0.3);
    }

    .btn-danger {
        background: linear-gradient(135deg, #dc3545, #e4606d);
        border: none;
    }

    .btn-danger:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(220, 53, 69, 0.3);
    }

    .btn-secondary {
        background: linear-gradient(135deg, #6c757d, #5a6268);
        border: none;
        color: white;
        padding: 0.75rem 1.8rem;
        font-size: 1.05rem;
    }

    .btn-secondary:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(108, 117, 125, 0.3);
    }

    /* Empty State */
    .empty-message {
        text-align: center;
        padding: 3rem 1rem;
        color: #718096;
        font-size: 1.1rem;
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Responsive - Force side-by-side on medium+ screens */
    @media (min-width: 768px) {
        .row.g-4 > .col-md-6 {
            display: flex;
        }
    }

    @media (max-width: 768px) {
        .assign-card {
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
    }
</style>

<div class="container mt-4">
<div class="text-center mt-4">
        <a href="/project/list" class="btn btn-secondary">Back to Projects</a>
    </div>
    <h3 class="mb-4 text-center">Assign Members to Project: <strong>${project.projectName}</strong></h3>

    <div class="row g-4">
        <!-- Available Members -->
        <div class="col-md-6">
            <div class="assign-card">
                <h5>Available Team Members</h5>

                <c:choose>
                    <c:when test="${empty members}">
                        <p class="empty-message">No available members in the team.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-hover assign-table available-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th style="width: 120px;">Assign</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="m" items="${members}">
                                        <tr>
                                            <td><strong>${m.memberName}</strong></td>
                                            <td>
                                                <form action="/project/member/add" method="post" style="display:inline;">
                                                    <!-- CSRF TOKEN -->
                                                    <input type="hidden"
                                                           name="${_csrf.parameterName}"
                                                           value="${_csrf.token}" />
                                                    <input type="hidden" name="projectId" value="${project.projectId}" />
                                                    <input type="hidden" name="memberId" value="${m.memberId}" />
                                                    <button type="submit" class="btn btn-sm btn-success">Assign</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="assign-card">
                <h5>Assigned Members</h5>

                <c:choose>
                    <c:when test="${empty assignedMembers}">
                        <p class="empty-message">No members assigned yet.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-hover assign-table assigned-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th style="width: 120px;">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="am" items="${assignedMembers}">
                                        <tr>
                                            <td><strong>${am.member.memberName}</strong></td>
                                            <td>
                                                <a href="/project/member/remove/${project.projectId}/${am.member.memberId}"
                                                   class="btn btn-sm btn-danger"
                                                   onclick="return confirm('Remove this member from the project?')">Remove</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Assigned Members -->
      <%--   <div class="col-md-6">
            <div class="assign-card">
                <h5>Assigned Members</h5>

                <c:choose>
                    <c:when test="${empty assignedMembers}">
                        <p class="empty-message">No members assigned yet.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-hover assign-table assigned-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th style="width: 120px;">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="am" items="${assignedMembers}">
                                        <tr>
                                            <td><strong>${am.member.memberName}</strong></td>
                                            <td>
                                                <a href="/project/member/remove/${project.projectId}/${am.member.memberId}"
                                                   class="btn btn-sm btn-danger"
                                                   onclick="return confirm('Remove this member from the project?')">Remove</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div> --%>
    </div>
<br><br>
    
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>