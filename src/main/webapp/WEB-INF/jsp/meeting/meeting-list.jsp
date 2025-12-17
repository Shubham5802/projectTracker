<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .meeting-list-wrapper {
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

    .btn-add {
        background: var(--success-gradient);
        border: none;
        border-radius: 0.75rem;
        padding: 0.75rem 1.5rem;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-add:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(79, 172, 254, 0.4);
    }

    .btn-back {
        border-radius: 0.75rem;
        padding: 0.75rem 1.5rem;
        font-weight: 600;
    }

    .meeting-card {
        border-radius: 1rem;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .meeting-card:hover {
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

    .notes-cell {
        max-width: 400px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .notes-cell:hover {
        white-space: normal;
        overflow: visible;
        text-overflow: clip;
        word-break: break-word;
        background: #f8f9fa;
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
        .notes-cell {
            max-width: none;
            white-space: normal;
        }
    }
</style>
<div class="col-md-4 text-md-end">
                    <div class="btn-group">
                        <a href="/meeting/create/${project.projectId}" class="btn btn-light btn-add text-white">
                            <i class="bi bi-plus-lg me-2"></i>Add Meeting
                        </a>
                        <a href="/project/list" class="btn btn-outline-light btn-back">
                            <i class="bi bi-arrow-left me-2"></i>Back to Projects
                        </a>
                    </div>
                </div><br>
<div class="meeting-list-wrapper">
    <div class="container">
        <!-- Page Header -->
        <div class="page-header text-white">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h3><i class="bi bi-calendar-event-fill me-3"></i>Meetings for Project: ${project.projectName}</h3>
                </div>
                
            </div>
        </div>

        <!-- Meeting Table Card -->
        <div class="card meeting-card border-0">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th class="ps-4">Title</th>
                                <th>Notes</th>
                                <th>Meeting Date</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="m" items="${meetings}">
                                <tr>
                                    <td class="ps-4 fw-semibold">${m.title}</td>
                                    <td class="notes-cell">${m.notes}</td>
                                    <td>${m.meetingDate}</td>
                                    <td class="text-center">
                                        <a href="/meeting/delete/${m.meetingId}/${project.projectId}"
                                           class="btn btn-sm btn-outline-danger"
                                           title="Delete"
                                           onclick="return confirm('Delete this meeting?')">
                                            <i class="bi bi-trash-fill"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>

                            <!-- Empty State -->
                            <c:if test="${empty meetings}">
                                <tr>
                                    <td colspan="4" class="text-center py-5">
                                        <div class="empty-state">
                                            <i class="bi bi-calendar-x display-4 d-block mb-4"></i>
                                            <p class="lead">No meetings scheduled yet.</p>
                                            <p class="text-muted">Add your first meeting to keep track of discussions!</p>
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