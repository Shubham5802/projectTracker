<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Task</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="max-w-xl mx-auto bg-white p-6 rounded shadow">
    <h2 class="text-xl font-bold mb-4">Create Task</h2>

    <form id="taskForm">
        <input type="hidden" id="projectId" value="${projectId}"/>

        <label class="block mb-2">Title</label>
        <input class="w-full border p-2 mb-3" id="title" required />

        <label class="block mb-2">Description</label>
        <textarea class="w-full border p-2 mb-3" id="description"></textarea>

        <label class="block mb-2">Priority</label>
        <select class="w-full border p-2 mb-3" id="priority">
            <option>LOW</option>
            <option>MEDIUM</option>
            <option>HIGH</option>
            <option>CRITICAL</option>
        </select>

        <label class="block mb-2">Due Date</label>
        <input type="date" class="w-full border p-2 mb-4" id="dueDate"/>

        <button type="button"
                onclick="submitTask()"
                class="bg-blue-600 text-white px-4 py-2 rounded">
            Create Task
        </button>
    </form>
</div>

<script>
function submitTask() {
    const projectId = document.getElementById("projectId").value;

    fetch("/api/tasks/project/" + projectId, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            title: title.value,
            description: description.value,
            priority: priority.value,
            dueDate: dueDate.value
        })
    }).then(res => {
        if (res.ok) {
            alert("Task created successfully");
        } else {
            alert("Error creating task");
        }
    });
}
</script>

</body>
</html>
