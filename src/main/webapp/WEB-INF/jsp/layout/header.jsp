<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Tracker</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">

    <!-- Custom CSS for a more modern and presentable look -->
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
        }

        .container {
            flex: 1;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 2rem;
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        .navbar {
            background-color: #343a40 !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 0 0 12px 12px;
        }

        .navbar-brand, .nav-link {
            color: #ffffff !important;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #a0d8ff !important;
        }

        footer {
            background-color: #343a40;
            color: #bbbbbb;
            padding: 1.5rem 0;
            margin-top: auto;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 -4px 12px rgba(0, 0, 0, 0.1);
        }

        footer p {
            margin: 0;
            font-size: 0.95rem;
        }

        h1, h2, h3, h4, h5, h6 {
            color: #2c3e50;
            font-weight: 600;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            padding: 0.6rem 1.2rem;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>

    <!-- jQuery (only one version needed) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- jQuery UI (if you need datepickers or other UI components) -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <!-- Bootstrap Bundle JS (includes Popper) -->
    <script src="/static/js/bootstrap.bundle.min.js"></script>

    <!-- Global AJAX error handler -->
    <script>
        $(document).ajaxError(function (event, jqxhr) {
            alert("An error occurred: " + jqxhr.responseText);
        });
    </script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

<div class="container mt-4">
    <!-- Your main content goes here -->
    <!-- Example placeholder to show the new styling -->
  
