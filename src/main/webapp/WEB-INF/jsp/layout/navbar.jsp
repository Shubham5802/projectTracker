<nav class="navbar navbar-dark shadow-lg" style="background: linear-gradient(135deg, #1e3c72, #2a5298);">
    <div class="container-fluid d-flex align-items-center justify-content-between px-4 py-2">

        <!-- Brand -->
       

        <!-- Navigation Links (Horizontal) -->
        <div class="d-flex align-items-center gap-4">

            <!-- Dashboard -->
            <a class="nav-link d-flex align-items-center gap-2 text-white text-decoration-none fw-medium px-3 py-2 rounded-3 transition" href="/">
                <i class="bi bi-speedometer2 fs-5"></i>
                <span>Dashboard          </span>
            </a>
			
            <!-- Teams -->
            <a class="nav-link d-flex align-items-center gap-2 text-white text-decoration-none fw-medium px-3 py-2 rounded-3 transition" href="/team/list">
                <i class="bi bi-people fs-5"></i>
                <span>        Teams</span>
            </a>

            <!-- Projects -->
            <a class="nav-link d-flex align-items-center gap-2 text-white text-decoration-none fw-medium px-3 py-2 rounded-3 transition" href="/project/list">
                <i class="bi bi-folder-fill fs-5"></i>
                <span>Projects</span>
            </a>

            <!-- Logout (right side, danger style) -->
            <a href="/logout" class="nav-link d-flex align-items-center gap-2 text-danger fw-medium px-3 py-2 rounded-3 transition hover-bg-danger">
                <i class="bi bi-box-arrow-right fs-5"></i>
                <span>Logout</span>
            </a>

        </div>
    </div>
</nav>

<!-- Required: Bootstrap Icons CSS (add once in your <head>) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<!-- Enhanced CSS -->
<style>
    .transition {
        transition: all 0.3s ease;
    }

    .nav-link {
        position: relative;
        color: rgba(255, 255, 255, 0.85) !important;
        white-space: nowrap;
    }

    .nav-link:hover,
    .nav-link.active {
        color: #ffffff !important;
        background-color: rgba(255, 255, 255, 0.15);
        transform: translateY(-2px);
    }

    .nav-link.active::after {
        content: '';
        position: absolute;
        bottom: 4px;
        left: 50%;
        transform: translateX(-50%);
        width: 40%;
        height: 3px;
        background-color: #fff;
        border-radius: 2px;
    }

    .hover-bg-danger:hover {
        background-color: rgba(220, 53, 69, 0.2) !important;
    }

    /* On small screens: horizontal scroll if needed */
    @media (max-width: 768px) {
        .d-flex.gap-4 {
            overflow-x: auto;
            padding-bottom: 8px;
            -webkit-overflow-scrolling: touch;
        }

        .d-flex.gap-4::-webkit-scrollbar {
            height: 4px;
        }

        .d-flex.gap-4::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 4px;
        }
    }
</style>