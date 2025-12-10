<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Project</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<div class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow">

    <h2 class="text-2xl font-bold mb-6">Create New Project</h2>

    <form action="/projects/create" method="post">

        <!-- ===================== Project Name ===================== -->
        <div class="mb-4">
            <label class="font-semibold">Project Name</label>
            <input type="text" name="name" required
                   class="w-full border p-2 rounded mt-1"
                   placeholder="Enter project name">
        </div>

        <!-- ===================== Description ===================== -->
        <div class="mb-4">
            <label class="font-semibold">Description</label>
            <textarea name="description"
                      class="w-full border p-2 rounded mt-1"
                      placeholder="Project description..."></textarea>
        </div>

        <!-- ===================== Team Selection ===================== -->
        <div class="mb-4">
            <label class="font-semibold">Select Team</label>
            <select name="teamId" required
                    class="w-full border p-2 rounded mt-1">

                <option value="">-- Select Team --</option>

                <c:forEach var="team" items="${teams}">
                    <option value="${team.id}">
                        ${team.name}
                    </option>
                </c:forEach>

            </select>
        </div>

        <!-- ===================== Start + End Dates ===================== -->
        <div class="grid grid-cols-2 gap-4">

            <div>
                <label class="font-semibold">Start Date</label>
                <input type="date" name="startDate" required
                       class="w-full border p-2 rounded mt-1">
            </div>

            <div>
                <label class="font-semibold">End Date</label>
                <input type="date" name="endDate" required
                       class="w-full border p-2 rounded mt-1">
            </div>
        </div>

        <!-- ===================== Submit Button ===================== -->
        <div class="mt-6">
            <button class="bg-blue-600 text-white px-5 py-2 rounded hover:bg-blue-700">
                Create Project
            </button>

            <a href="/projects" 
               class="ml-4 text-gray-600 hover:underline">
                Cancel
            </a>
        </div>

    </form>
</div>

</body>
</html>
