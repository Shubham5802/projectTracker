<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<style>
    /* Page Title */
    h3.mb-3 {
        color: #2c3e50;
        font-weight: 700;
        font-size: 2rem;
        background: linear-gradient(90deg, #1e3c72, #2a5298);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    /* Form Container Card */
    .form-card {
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
        padding: 2.5rem;
        border: 1px solid rgba(0, 0, 0, 0.05);
        margin-top: 2rem;
    }

    /* Horizontal Row for Multiple Fields */
    .form-row {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 1.5rem;
        margin-bottom: 1.5rem;
        align-items: end; /* Aligns all inputs to the bottom */
    }

    .form-row .form-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 0;
    }

    .form-group {
        display: grid;
        grid-template-columns: 1fr 3fr;
        align-items: start;
        gap: 1rem;
        margin-bottom: 1.5rem;
    }

    .form-label {
        font-weight: 600;
        color: #34495e;
        font-size: 1.05rem;
        padding-top: 0.5rem;
        white-space: nowrap;
        min-height: 2.2rem;
        display: flex;
        align-items: flex-end;
    }

    /* Form Controls */
    .form-control, select.form-control, textarea.form-control {
        border-radius: 10px;
        border: 1.5px solid #ced4da;
        padding: 0.75rem 1rem;
        font-size: 1rem;
        transition: all 0.3s ease;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        width: 100%;
    }

    .form-control:focus, select.form-control:focus, textarea.form-control:focus {
        border-color: #2a5298;
        box-shadow: 0 0 0 0.25rem rgba(42, 82, 152, 0.2);
        transform: translateY(-1px);
    }

    textarea.form-control {
        resize: vertical;
        min-height: 120px;
    }

    /* Buttons */
    .btn {
        border-radius: 10px;
        padding: 0.75rem 1.8rem;
        font-weight: 600;
        font-size: 1.05rem;
        transition: all 0.3s ease;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .btn-primary {
        background: linear-gradient(135deg, #2a5298, #1e3c72);
        color: white;
        border: none;
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #1e3c72, #1a4480);
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(42, 82, 152, 0.35);
    }

    .btn-secondary {
        background: linear-gradient(135deg, #6c757d, #5a6268);
        border: none;
        margin-left: 0.75rem;
    }

    .btn-secondary:hover {
        background: linear-gradient(135deg, #5a6268, #495057);
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(108, 117, 125, 0.3);
    }

    /* Responsive Adjustments */
    @media (max-width: 992px) {
        .form-row {
            grid-template-columns: 1fr 1fr;
        }
    }

    @media (max-width: 768px) {
        .form-row {
            grid-template-columns: 1fr;
        }

        .form-group {
            grid-template-columns: 1fr;
            gap: 0.5rem;
        }

        .form-label {
            padding-top: 0;
            min-height: auto;
        }

        .form-card {
            padding: 2rem;
            margin-top: 1.5rem;
        }

        .btn {
            width: 100%;
            margin-bottom: 0.75rem;
        }

        .btn-secondary {
            margin-left: 0;
        }
    }
</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10 col-md-11">
            <h3 class="mb-4 text-center">Edit Project</h3>

            <div class="form-card">
                <form action="/project/update/${project.projectId}" method="post">

                    <!-- CSRF TOKEN -->
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}" />

                    <!-- Row 1: Project Name (full width) -->
                    <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Project Name <span class="text-danger">*</span></label>
                        <input type="text" name="projectName"
                               value="${project.projectName}"
                               class="form-control" required />
                      </div>         
                      <div class="form-group"> 
                                <label class="form-label">Status</label>
                        <select name="status" class="form-control">
                            <option value="IN-PROGRESS" ${project.status == 'IN-PROGRESS' ? 'selected' : ''}>IN-PROGRESS</option>
                            <option value="COMPLETED" ${project.status == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                            <option value="ON-HOLD" ${project.status == 'ON-HOLD' ? 'selected' : ''}>ON-HOLD</option>
                        </select>
                    </div>
					</div>
                    <!-- Row 2: Project Description (full width) -->
                    <div class="form-group">
                        <label class="form-label">Project Description</label>
                        <textarea name="projectDesc" class="form-control" rows="4">${project.projectDesc}</textarea>
                    </div>

                    <!-- Row 3: Team + Start Date + End Date (three in one row) -->
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Team</label>
                            <select name="team.teamId" class="form-control">
                                <c:forEach var="t" items="${teams}">
                                    <option value="${t.teamId}"
                                            <c:if test="${t.teamId == project.team.teamId}">selected</c:if>>
                                        ${t.teamName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Start Date <span class="text-danger">*</span></label>
                            <input type="date" name="startDate"
                                   value="${project.startDate}"
                                   class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label class="form-label">End Date</label>
                            <input type="date" name="endDate"
                                   value="${project.endDate}"
                                   class="form-control" />
                        </div>
                    </div>

                   

                    <div class="d-flex justify-content-center mt-5">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <a href="/project/list" class="btn btn-secondary">Cancel</a>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>