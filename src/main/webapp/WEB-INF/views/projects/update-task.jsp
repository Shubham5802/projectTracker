<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Task</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-8">

<div class="max-w-xl mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-2xl font-bold mb-6 text-center">
        Update Task Progress
    </h2>

    <!-- TASK INFO -->
    <div class="mb-4 text-sm text-gray-700">
        <p><b>Task:</b> ${task.title}</p>
        <p><b>Current Status:</b> ${task.status}</p>
    </div>

    <!-- UPDATE FORM -->
    <form method="post" action="/tasks/update">

        <!-- Hidden Task ID -->
        <input type="hidden" name="taskId" value="${task.id}" />

        <!-- PROGRESS SLIDER -->
        <div class="mb-6">
            <label class="block text-sm font-medium mb-1">
                Progress (%)
            </label>

            <input
                type="range"
                id="progress"
                name="progress"
                min="0"
                max="100"
                value="${task.progress}"
                oninput="updateProgressValue(this.value)"
                class="w-full"
            />

            <div class="text-right text-sm mt-1">
                <span id="progressValue">${task.progress}</span>%
            </div>
        </div>

        <!-- STATUS DROPDOWN -->
        <div class="mb-6">
            <label class="block text-sm font-medium mb-1">
                Status
            </label>

            <select name="status" class="w-full border rounded p-2">
                <option value="OPEN"
                        ${task.status == 'OPEN' ? 'selected' : ''}>
                    OPEN
                </option>

                <option value="IN_PROGRESS"
                        ${task.status == 'IN_PROGRESS' ? 'selected' : ''}>
                    IN_PROGRESS
                </option>

                <option value="BLOCKED"
                        ${task.status == 'BLOCKED' ? 'selected' : ''}>
                    BLOCKED
                </option>

                <option value="DONE"
                        ${task.status == 'DONE' ? 'selected' : ''}>
                    DONE
                </option>
            </select>
        </div>

        <!-- SUBMIT -->
        <div class="flex justify-between">
            <a href="/projects/view?id=${task.project.id}"
               class="bg-gray-500 text-white px-4 py-2 rounded">
                Back
            </a>

            <button type="submit"
                    class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">
                Update
            </button>
        </div>

    </form>

</div>

<script>
    function updateProgressValue(val) {
        document.getElementById("progressValue").innerText = val;
    }
</script>

</body>
</html>
