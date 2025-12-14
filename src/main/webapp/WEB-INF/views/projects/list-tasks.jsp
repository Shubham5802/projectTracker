<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Task List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="max-w-6xl mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-2xl font-bold mb-2">
        Tasks for Project: ${project.name}
    </h2>

    <div class="mb-4">
        <a href="/tasks/create?projectId=${project.id}"
           class="bg-blue-600 text-white px-4 py-2 rounded">
            + Add Task
        </a>
    </div>

    <table class="w-full border">
        <thead class="bg-gray-200">
        <tr>
            <th class="p-2 border">Title</th>
            <th class="p-2 border">Priority</th>
            <th class="p-2 border">Status</th>
            <th class="p-2 border">Progress</th>
            <th class="p-2 border">Due Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${tasks}" var="task">
            <tr class="text-center">
                <td class="p-2 border">${task.title}</td>
                <td class="p-2 border">${task.priority}</td>
                <td class="p-2 border">${task.status}</td>
                <td class="p-2 border">${task.progress}%</td>
                <td class="p-2 border">${task.dueDate}</td>
            </tr>
        </c:forEach>

        <c:if test="${empty tasks}">
            <tr>
                <td colspan="5" class="p-4 text-center text-gray-500">
                    No tasks created yet
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>

</div>

</body>
</html>
