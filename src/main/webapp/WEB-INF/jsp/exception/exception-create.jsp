<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
        --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        --input-focus: #667eea;
    }

    .exception-form-wrapper {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        display: flex;
        align-items: center;
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

    .card-header-custom {
        background: var(--danger-gradient);
        padding: 1.5rem;
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
        padding: 0.75rem 1rem;
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
        background: var(--danger-gradient);
        border: none;
        border-radius: 0.75rem;
        padding: 0.75rem 2.5rem;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
    }

    .btn-save:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(255, 107, 107, 0.4);
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

    /* Horizontal single-line layout with perfect alignment */
    .horizontal-form-row {
        display: flex;
        align-items: flex-end;
        gap: 2rem;
        margin-bottom: 2rem;
        flex-wrap: wrap; /* Allows wrapping if screen is too small */
    }

    .horizontal-form-row > div {
        flex: 1;
        min-width: 280px;
        display: flex;
        flex-direction: column;
    }

    .horizontal-form-row .form-label {
        min-height: 2.2rem;
        display: flex;
        align-items: flex-end;
        white-space: nowrap;
    }

    @media (max-width: 992px) {
        .horizontal-form-row {
            gap: 1.5rem;
        }
    }

    @media (max-width: 768px) {
        .horizontal-form-row {
            flex-direction: column;
            gap: 1rem;
        }
        .horizontal-form-row .form-label {
            min-height: auto;
        }
        .btn-save, .btn-cancel {
            width: 100%;
            margin-bottom: 1rem;
        }
    }
</style>

<div class="exception-form-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-11">
                <div class="card exception-card border-0">
                    <div class="card-header-custom text-white">
                        <h3><i class="bi bi-bug-fill me-2"></i>Add Exception for Project: ${exception.project.projectName}</h3>
                    </div>
                    <div class="card-body p-5">
                        <form action="/exception/save/${exception.project.projectId}" method="post">
                            <!-- CSRF TOKEN -->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="project.projectId" value="${exception.project.projectId}" />

                            <!-- All three fields in one horizontal line -->
                            <div class="horizontal-form-row">
                                <div>
                                    <label for="type" class="form-label">Exception Type <span class="required-asterisk">*</span></label>
                                    <select id="type" name="type" class="form-select" required>
                                        <option value="">-- Select Type --</option>
                                        <option value="DELAY">DELAY</option>
                                        <option value="PROGRESS UPDATE">PROGRESS UPDATE</option>
                                        <option value="ISSUE">ISSUE</option>
                                        <option value="MEETING COMMENT">MEETING COMMENT</option>
                                        <option value="GENERAL">GENERAL</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="taskId" class="form-label">Related Task (Optional)</label>
                                    <select id="taskId" name="task.taskId" class="form-select">
                                        <option value="">-- No Task --</option>
                                        <c:forEach var="t" items="${tasks}">
                                            <option value="${t.taskId}">${t.taskTitle}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div style="flex: 2;">
                                    <label for="description" class="form-label">Description <span class="required-asterisk">*</span></label>
                                    <textarea id="description" name="description" class="form-control" rows="3" 
                                              placeholder="Provide detailed information about the exception..." required></textarea>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="d-grid d-md-flex gap-3 justify-content-end">
                                <a href="/exception/list/${exception.project.projectId}" class="btn btn-outline-secondary btn-cancel order-md-last">Cancel</a>
                                <button type="submit" class="btn btn-primary btn-save text-white">Save Exception</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>