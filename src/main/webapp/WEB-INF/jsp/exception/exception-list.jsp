<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .exception-list-wrapper {
        min-height: 100vh;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        
    }

    .page-header {
        background: var(--primary-gradient);
        color: white;
        padding: 1rem 0;
        margin-bottom: 2.5rem;
        border-radius: 1rem;
        box-shadow: var(--card-shadow);
    }

    .page-header h3 {
        font-weight: 700;
        font-size: 1.8rem;
        margin: 0;
    }

    .btn-add {
        background: var(--danger-gradient);
        border: none;
        border-radius: 0.75rem;
        padding: 0.75rem 1.5rem;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-add:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(255, 107, 107, 0.4);
    }

    .btn-back {
        border-radius: 0.75rem;
        padding: 0.75rem 1.5rem;
        font-weight: 600;
    }

    .exception-card {
        border-radius: 1rem;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .exception-card:hover {
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

    .type-badge {
        font-weight: 600;
        padding: 0.4em 0.8em;
        border-radius: 0.5rem;
        font-size: 0.85rem;
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
<div class="col-md-4 text-md-end">
                    <div class="btn-group">
                        <a href="/exception/create/${project.projectId}" class="btn btn-light btn-add text-white">
                            <i class="bi bi-plus-lg me-2"></i>Add Exception
                        </a>
                        <a href="/project/list" class="btn btn-outline-light btn-back">
                            <i class="bi bi-arrow-left me-2"></i>Back to Projects
                        </a>
                    </div>
                </div><br>
<div class="exception-list-wrapper">
    <div class="container">
        <!-- Page Header -->
        <div class="page-header text-white">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h3><i class="bi bi-bug-fill me-3"></i>Exception Logs for Project: ${project.projectName}</h3>
                </div>
                
            </div>
        </div>

        <!-- Exception Table Card -->
        <div class="card exception-card border-0">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th class="ps-4">Type</th>
                                <th>Description</th>
                                <th>Task</th>
                                <th>Date</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="e" items="${exceptions}">
                                <tr>
                                    <td class="ps-4">
                                        <span class="type-badge bg-danger text-white">${e.type}</span>
                                    </td>
                                    <td class="fw-medium">${e.description}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${e.task != null}">
                                                <span class="text-primary fw-medium">${e.task.taskTitle}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">N/A</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${e.loggedOn}</td>
                                    <td class="text-center">
                                        <a href="/exception/delete/${e.exceptionId}/${project.projectId}"
                                           class="btn btn-sm btn-outline-danger"
                                           title="Delete"
                                           onclick="return confirm('Delete this exception?')">
                                            <i class="bi bi-trash-fill"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>

                            <!-- Empty State -->
                            <c:if test="${empty exceptions}">
                                <tr>
                                    <td colspan="5" class="text-center py-5">
                                        <div class="empty-state">
                                            <i class="bi bi-shield-check display-4 d-block mb-4"></i>
                                            <p class="lead">No exceptions logged yet.</p>
                                            <p class="text-muted">Great job! Keep it up.</p>
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