<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        --input-focus: #667eea;
    }

    .create-task-wrapper {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        display: flex;
        align-items: center;
    }

    .create-task-card {
        border-radius: 1rem;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .create-task-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    }

    .card-header-custom {
        background: var(--primary-gradient);
        padding: 1rem;
        text-align: center;
        border-bottom: none;
    }

    .card-header-custom h3 {
        font-weight: 700;
        letter-spacing: 0.5px;
        margin: 0;
    }

    .form-control, .form-select {
        border-radius: 0.75rem;
        border: 1px solid #ced4da;
        transition: all 0.3s ease;
    }

    .form-control:focus, .form-select:focus {
        border-color: var(--input-focus);
        box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.25);
    }

    .form-label {
        font-weight: 600;
        color: #333;
        margin-bottom: 0.5rem;
    }

    .btn-save {
        background: var(--success-gradient);
        border: none;
        border-radius: 0.75rem;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
    }

    .btn-save:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(79, 172, 254, 0.4);
    }

    .btn-cancel {
        border-radius: 0.75rem;
        padding: 0.75rem 2.5rem;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-cancel:hover {
        background: #e9ecef;
        transform: translateY(-3px);
    }

    .required-asterisk {
        color: #e74c3c;
        font-weight: bold;
    }

    /* Force proper horizontal layout and alignment */
    .multi-field-row {
        display: flex;
        flex-wrap: wrap;
        gap: 1.5rem;
        align-items: end; /* Aligns all inputs to the bottom */
        margin-bottom: 1.5rem;
    }

    .multi-field-row > div {
        flex: 1;
        min-width: 280px; /* Prevents too narrow on small screens */
    }

    .multi-field-row .form-label {
        margin-bottom: 0.5rem;
    }

    @media (max-width: 768px) {
        .multi-field-row {
            flex-direction: column;
            gap: 1rem;
        }
        .multi-field-row > div {
            min-width: auto;
        }
        .btn-save, .btn-cancel {
            width: 100%;
            margin-bottom: 1rem;
        }
    }
</style>

<div class="create-task-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-9">
                <div class="card create-task-card border-0">
                    <div class="card-header-custom text-white">
                        <h3><i class="bi bi-plus-circle-fill me-2"></i>Create New Task</h3>
                    </div>
                    <div class="card-body p-5">
                        <form action="/task/save/${task.project.projectId}" method="post">
                            <!-- CSRF TOKEN -->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="project.projectId" value="${task.project.projectId}" />

                            <!-- Row 1: Task Title + Assign Member -->
                            <div class="multi-field-row">
                                <div>
                                    <label for="taskTitle" class="form-label">Task Title <span class="required-asterisk">*</span></label>
                                    <input type="text" id="taskTitle" name="taskTitle" class="form-control form-control-lg" style="width:50%;"
                                           placeholder="e.g., Implement user authentication" required />
                                </div>
                                <div>
                                    <label for="assignedMember" class="form-label">Assign Member <span class="required-asterisk">*</span></label>
                                    <select id="assignedMember" name="assignedMember.memberId" class="form-select" style="width:50%;" required>
                                        <option value="">-- Choose member --</option>
                                        <c:forEach var="pm" items="${projectMembers}">
                                            <option value="${pm.member.memberId}">${pm.member.memberName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <!-- Row 2: Task Description (full width) -->
                            <div class="mb-4">
                                <label for="taskDesc" class="form-label">Task Description</label>
                                <textarea id="taskDesc"
          name="taskDesc"
          class="form-control"
          rows="2"
          style="width:80%;"
          placeholder="Describe what needs to be done, expected outcomes, and any relevant details..."></textarea>
                            </div>
                            <br>

                            <!-- Row 3: Start Date + End Date + Status -->
                            <div class="multi-field-row">
                                <div>
                                    <label for="startDate" class="form-label">Start Date <span class="required-asterisk">*</span></label>
                                    <input type="date" id="startDate" name="startDate" class="form-control" required />
                                </div>
                                <div>
                                    <label for="endDate" class="form-label">End Date</label>
                                    <input type="date" id="endDate" name="endDate" class="form-control" />
                                </div>
                                <div>
                                    <label for="status" class="form-label">Status</label>
                                    <select id="status" class="form-select" name="status">
                                        <option value="PENDING" selected>PENDING</option>
                                        <option value="IN-PROGRESS">IN-PROGRESS</option>
                                        <option value="COMPLETED">COMPLETED</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="d-grid d-md-flex gap-3 justify-content-end mt-4">
                                <a href="/task/list/${task.project.projectId}" class="btn btn-outline-secondary btn-cancel order-md-last">Cancel</a>
                                <button type="submit" class="btn btn-primary btn-save text-white">Save Task</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>