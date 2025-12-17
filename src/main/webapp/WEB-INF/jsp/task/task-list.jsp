<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .task-list-wrapper {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
       
    }

    .page-header {
        background: var(--primary-gradient);
        color: white;
        padding: 2rem 0;
        margin-bottom: 2.5rem;
        border-radius: 1rem;
        box-shadow: var(--card-shadow);
    }

    .page-header h3 {
        font-weight: 700;
        font-size: 1.8rem;
        margin: 0;
    }

    .btn-create {
        background: var(--success-gradient);
        border: none;
        border-radius: 0.75rem;
        padding: 0.75rem 1.5rem;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-create:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(79, 172, 254, 0.4);
    }

    .btn-back {
        border-radius: 0.75rem;
        padding: 0.75rem 1.5rem;
        font-weight: 600;
    }

    .task-card {
        border-radius: 1rem;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .task-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    }

    .table thead {
        background: var(--primary-gradient);
        color: white;
    }

    .table th {
        border: none;
        font-weight: 600;
        letter-spacing: 0.5px;
    }

    .table td {
        vertical-align: middle;
        padding: 1rem 0.75rem;
    }

    .badge {
        font-size: 0.85rem;
        padding: 0.5em 0.9em;
        border-radius: 0.5rem;
    }

    .empty-state i {
        opacity: 0.3;
        font-size: 5rem;
    }

    .empty-state p {
        font-size: 1.2rem;
        color: #6c757d;
    }

    @media (max-width: 768px) {
        .page-header .btn-group {
            flex-direction: column;
            width: 100%;
        }
        .page-header .btn {
            width: 100%;
            margin-bottom: 0.5rem;
        }
    }
</style>

<div class="task-list-wrapper">
    <div class="container">
        <!-- Page Header -->
        <div class="page-header text-white">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h3><i class="bi bi-list-task me-3"></i>Tasks for Project #${projectId}</h3>
                </div>
                
            </div>
        </div>
        <div class="col-md-4 text-md-end">
                    <div class="btn-group">
                        <a href="/task/create/${projectId}" class="btn btn-light btn-create text-white">
                            <i class="bi bi-plus-lg me-2"></i>Create New Task
                        </a>
                        <a href="/project/list" class="btn btn-outline-light btn-back">
                            <i class="bi bi-arrow-left me-2"></i>Back to Projects
                        </a>
                    </div>
                </div>
                <br><br>

        <!-- Task Table Card -->
        <div class="card task-card border-0">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th class="ps-4">Task Title</th>
                                <th>Assigned To</th>
                                <th>Status</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="t" items="${tasks}">
                                <tr>
                                    <td class="ps-4 fw-semibold">${t.taskTitle}</td>
                                    <td class="fw-medium">${t.assignedMember.memberName}</td>
                                    <td>
                                        <span class="badge
                                            <c:choose>
                                                <c:when test="${t.status == 'COMPLETED'}">bg-success</c:when>
                                                <c:when test="${t.status == 'IN-PROGRESS'}">bg-warning text-dark</c:when>
                                                <c:otherwise>bg-secondary</c:otherwise>
                                            </c:choose>">
                                            ${t.status}
                                        </span>
                                    </td>
                                    <td>${t.startDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty t.endDate}">${t.endDate}</c:when>
                                            <c:otherwise><span class="text-muted">—</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <div class="btn-group" role="group">
                                            <a href="/task/edit/${t.taskId}" class="btn btn-sm btn-outline-primary" title="Edit">
                                                <i class="bi bi-pencil-fill"></i>
                                            </a>
                                            <a href="/task/delete/${t.taskId}"
                                               onclick="return confirm('Are you sure you want to delete this task?')"
                                               class="btn btn-sm btn-outline-danger" title="Delete">
                                                <i class="bi bi-trash-fill"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <!-- Empty State -->
                            <c:if test="${empty tasks}">
                                <tr>
                                    <td colspan="6" class="text-center py-5">
                                        <div class="empty-state">
                                            <i class="bi bi-inbox display-4 d-block mb-4"></i>
                                            <p class="lead">No tasks yet.</p>
                                            <p class="text-muted">Create your first task to get started!</p>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>