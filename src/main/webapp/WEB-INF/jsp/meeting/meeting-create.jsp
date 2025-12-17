<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        --input-focus: #667eea;
    }

    .meeting-form-wrapper {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        display: flex;
        align-items: center;
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

    .card-header-custom {
        background: var(--success-gradient);
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
        background: var(--success-gradient);
        border: none;
        border-radius: 0.75rem;
        padding: 0.75rem 2.5rem;
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

    /* Horizontal alignment for paired fields */
    .form-row {
        display: flex;
        align-items: flex-end;
        gap: 2rem;
        margin-bottom: 2rem;
        flex-wrap: wrap;
    }

    .form-row > div {
        flex: 1;
        min-width: 280px;
        display: flex;
        flex-direction: column;
    }

    .form-row .form-label {
        min-height: 2.2rem;
        display: flex;
        align-items: flex-end;
        white-space: nowrap;
    }

    @media (max-width: 768px) {
        .form-row {
            flex-direction: column;
            gap: 1rem;
        }
        .form-row .form-label {
            min-height: auto;
        }
        .btn-save, .btn-cancel {
            width: 100%;
            margin-bottom: 1rem;
        }
    }
</style>

<div class="meeting-form-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-9">
                <div class="card meeting-card border-0">
                    <div class="card-header-custom text-white">
                        <h3><i class="bi bi-calendar-plus-fill me-2"></i>Add Meeting for Project: ${meeting.project.projectName}</h3>
                    </div>
                    <div class="card-body p-5">
                        <form action="/meeting/save/${meeting.project.projectId}" method="post">
                            <!-- CSRF TOKEN -->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="project.projectId" value="${meeting.project.projectId}" />

                            <!-- Row 1: Meeting Title + Meeting Date (side by side) -->
                            <div class="form-row">
                                <div style="flex: 2;">
                                    <label for="title" class="form-label">Meeting Title <span class="required-asterisk">*</span></label>
                                    <input type="text" id="title" name="title" class="form-control form-control-lg" 
                                           placeholder="e.g., Sprint Planning Meeting" required />
                                </div>
                                <div>
                                    <label for="meetingDate" class="form-label">Meeting Date <span class="required-asterisk">*</span></label>
                                    <input type="date" id="meetingDate" name="meetingDate" class="form-control" required />
                                </div>
                            </div>

                            <!-- Row 2: Meeting Notes (full width) -->
                            <div class="mb-5">
                                <label for="notes" class="form-label">Meeting Notes</label>
                                <textarea id="notes" name="notes" class="form-control" rows="4"  style="width:50%"
                                          placeholder="Key discussion points, decisions made, action items..."></textarea>
                            </div>

                            <!-- Action Buttons -->
                            <div class="d-grid d-md-flex gap-3 justify-content-end">
                                <a href="/meeting/list/${meeting.project.projectId}" class="btn btn-outline-secondary btn-cancel order-md-last">Cancel</a>
                                <button type="submit" class="btn btn-primary btn-save text-white">Save Meeting</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>