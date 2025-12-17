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

    .btn-primary {
        background: linear-gradient(135deg, #2a5298, #1e3c72);
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
            <h3 class="mb-4 text-center">Edit Team</h3>

            <div class="form-card">
                <form action="/team/update/${team.teamId}" method="post">

                    <!-- CSRF TOKEN -->
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}" />

                    <div class="mb-4">
                        <label class="form-label">Team Name</label>
                        <input type="text" name="teamName"
                               value="${team.teamName}"
                               class="form-control" 
                               placeholder="Enter team name" 
                               required />
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <a href="/team/list" class="btn btn-secondary">Cancel</a>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>