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

    /* Form Labels */
    .form-label {
        font-weight: 600;
        color: #34495e;
        font-size: 1.05rem;
    }

    /* Form Inputs */
    .form-control {
        border-radius: 10px;
        border: 1.5px solid #ced4da;
        padding: 0.75rem 1rem;
        font-size: 1rem;
        transition: all 0.3s ease;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }

    .form-control:focus {
        border-color: #2a5298;
        box-shadow: 0 0 0 0.25rem rgba(42, 82, 152, 0.2);
        transform: translateY(-1px);
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

    .btn-success {
        background: linear-gradient(135deg, #28a745, #20c997);
        border: none;
    }

    .btn-success:hover {
        background: linear-gradient(135deg, #218838, #1ba885);
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(40, 167, 69, 0.3);
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
    @media (max-width: 768px) {
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
        <div class="col-lg-7 col-md-8">
            <h3 class="mb-4 text-center">Add Member to Team #${teamId}</h3>

            <div class="form-card">
                <form action="/member/save/${teamId}" method="post">

                    <!-- CSRF TOKEN -->
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <input type="hidden" name="team.teamId" value="${teamId}" />

                    <div class="mb-4">
                        <label class="form-label">Name <span class="text-danger">*</span></label>
                        <input type="text" name="memberName" class="form-control" 
                               placeholder="Enter full name" required />
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Contact</label>
                        <input type="text" name="contact" class="form-control" 
                               placeholder="Phone number" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" 
                               placeholder="example@company.com" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Designation</label>
                        <input type="text" name="designation" class="form-control" 
                               placeholder="e.g., Developer, Designer" />
                    </div>

                    <div class="text-center mt-5">
                        <button type="submit" class="btn btn-success">Save</button>
                        <a href="/member/list/${teamId}" class="btn btn-secondary">Cancel</a>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>