<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        --warning-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .dashboard-wrapper {
        min-height: 100vh;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        padding: 3rem 0;
    }

    .page-header {
        background: var(--primary-gradient);
        color: white;
        padding: 2.5rem 0;
        margin-bottom: 3rem;
        border-radius: 1rem;
        box-shadow: var(--card-shadow);
        text-align: center;
    }

    .page-header h1 {
        font-weight: 700;
        font-size: 2.5rem;
        margin: 0;
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 1.5rem;
        margin-bottom: 3rem;
    }

    .stat-card {
        background: white;
        border-radius: 1rem;
        padding: 1.8rem;
        box-shadow: var(--card-shadow);
        transition: all 0.3s ease;
        text-align: center;
    }

    .stat-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    }

    .stat-icon {
        font-size: 3rem;
        margin-bottom: 1rem;
        background: var(--primary-gradient);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .stat-number {
        font-size: 2.5rem;
        font-weight: 700;
        margin: 0.5rem 0;
    }

    .stat-label {
        font-size: 1.1rem;
        color: #6c757d;
    }

    .recent-section {
        margin-bottom: 3rem;
    }

    .section-title {
        font-size: 1.6rem;
        font-weight: 600;
        margin-bottom: 1.5rem;
        color: #2c3e50;
    }

    .list-card {
        background: white;
        border-radius: 1rem;
        padding: 1.5rem;
        box-shadow: var(--card-shadow);
        transition: all 0.3s ease;
    }

    .recent-item {
        display: flex;
        justify-content: space-between;
        padding: 1rem 0;
        border-bottom: 1px solid #eee;
    }

    .recent-item:last-child {
        border-bottom: none;
    }

    .item-title {
        font-weight: 600;
        color: #2c3e50;
    }

    .item-date {
        font-size: 0.85rem;
        color: #6c757d;
    }
</style>

<div class="dashboard-wrapper">
    <div class="container">

        <!-- PAGE HEADER -->
        <div class="page-header">
            <h1><i class="bi bi-speedometer2 me-3"></i>Project Management Dashboard</h1>
            <p class="mt-2 opacity-90">Monitor all projects, tasks, meetings, and exceptions at a glance</p>
        </div>

        <!-- STATS GRID -->
        <div class="stats-grid">
            <div class="stat-card">
                <i class="bi bi-folder-fill stat-icon"></i>
                <div class="stat-number">${totalProjects}</div>
                <div class="stat-label">Total Projects</div>
            </div>

            <div class="stat-card">
                <i class="bi bi-list-task stat-icon"></i>
                <div class="stat-number">${totalTasks}</div>
                <div class="stat-label">Total Tasks</div>
            </div>

            <div class="stat-card">
                <i class="bi bi-calendar-event-fill stat-icon"></i>
                <div class="stat-number">${totalMeetings}</div>
                <div class="stat-label">Total Meetings</div>
            </div>

            <div class="stat-card">
                <i class="bi bi-bug-fill stat-icon"></i>
                <div class="stat-number">${totalExceptions}</div>
                <div class="stat-label">Logged Exceptions</div>
            </div>
        </div>

        <div class="row">

            <!-- RECENT TASKS -->
            <div class="col-lg-6 recent-section">
                <h3 class="section-title"><i class="bi bi-list-check me-2"></i>Recent Tasks</h3>

                <div class="list-card">
                    <c:forEach var="task" items="${recentTasks}">
                        <div class="recent-item">
                            <div>
                                <div class="item-title">${task.taskTitle}</div>
                                <small class="text-muted">Project: ${task.project.projectName}</small>
                            </div>

                            <div class="text-end">
                                <span class="badge
                                    <c:choose>
                                        <c:when test="${task.status == 'COMPLETED'}">bg-success</c:when>
                                        <c:when test="${task.status == 'IN-PROGRESS'}">bg-warning text-dark</c:when>
                                        <c:otherwise>bg-secondary</c:otherwise>
                                    </c:choose>">
                                    ${task.status}
                                </span>

                                <div class="item-date">${task.startDate}</div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty recentTasks}">
                        <p class="text-center text-muted py-4">No recent tasks</p>
                    </c:if>
                </div>
            </div>

            <!-- MEETINGS & EXCEPTIONS -->
            <div class="col-lg-6">

                <!-- RECENT MEETINGS -->
                <div class="recent-section">
                    <h3 class="section-title"><i class="bi bi-calendar3 me-2"></i>Recent Meetings</h3>

                    <div class="list-card">
                        <c:forEach var="m" items="${recentMeetings}">
                            <div class="recent-item">
                                <div>
                                    <div class="item-title">${m.title}</div>
                                    <small class="text-muted">Project: ${m.project.projectName}</small>
                                </div>

                                <div class="item-date">${m.meetingDate}</div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty recentMeetings}">
                            <p class="text-center text-muted py-4">No recent meetings</p>
                        </c:if>
                    </div>
                </div>

                <!-- EXCEPTIONS -->
                <div class="recent-section">
                    <h3 class="section-title"><i class="bi bi-exclamation-triangle-fill me-2"></i>Recent Exceptions</h3>

                    <div class="list-card">
                        <c:forEach var="ex" items="${recentExceptions}">
                            <div class="recent-item">
                                <div>
                                    <div class="item-title">${ex.type}: ${ex.description}</div>
                                    <small class="text-muted">Project: ${ex.project.projectName}</small>
                                </div>

                                <div class="item-date">${ex.loggedOn}</div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty recentExceptions}">
                            <p class="text-center text-muted py-4">No recent exceptions — Great job!</p>
                        </c:if>
                    </div>
                </div>

            </div>
        </div>

        <!-- QUICK LINKS -->
        <div class="text-center mt-5">
            <a href="/project/list" class="btn btn-primary btn-lg px-5 mx-2">Manage Projects</a>
            <a href="/task/list/all" class="btn btn-success btn-lg px-5 mx-2">View All Tasks</a>
            <a href="/meeting/list/all" class="btn btn-info btn-lg px-5 mx-2 text-white">View All Meetings</a>
        </div>

    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
