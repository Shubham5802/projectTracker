<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>Project Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-8">

<div class="max-w-6xl mx-auto bg-white p-6 rounded shadow">

    <!-- ================= PROJECT DETAILS ================= -->
    <h2 class="text-2xl font-bold mb-4">Project Details</h2>

    <div class="grid grid-cols-2 gap-4 mb-6">
        <p><b>ID:</b> ${project.id}</p>
        <p><b>Name:</b> ${project.name}</p>
        <p><b>Status:</b> ${project.status}</p>
        <p>
            <b>Start Date:</b>
            <fmt:formatDate value="${project.startDate}" pattern="dd-MMM-yyyy"/>
        </p>
        <p>
            <b>End Date:</b>
            <fmt:formatDate value="${project.endDate}" pattern="dd-MMM-yyyy"/>
        </p>
        <p><b>Description:</b> ${project.description}</p>
    </div>
    
    <!-- AI Project Health -->
<div class="mb-6 p-4 rounded
    ${projectAi.riskLevel == 'HIGH' ? 'bg-red-100 text-red-800' :
      projectAi.riskLevel == 'MEDIUM' ? 'bg-yellow-100 text-yellow-800' :
      'bg-green-100 text-green-800'}">

    <h3 class="text-lg font-bold mb-1">
        Project Health: ${projectAi.riskLevel}
    </h3>

    <p class="mb-2">${projectAi.summary}</p>

    <div class="w-full bg-gray-300 rounded h-3">
        <div class="h-3 rounded bg-blue-600"
             style="width:${projectAi.healthScore}%"></div>
    </div>

    <p class="text-sm mt-1">Health Score: ${projectAi.healthScore}%</p>
</div>
    

    <!-- ================= TASK LIST ================= -->
    <h3 class="text-xl font-semibold mb-3">Tasks</h3>

    <table class="w-full border text-sm">
        <thead class="bg-gray-200">
        <tr>
            <th class="border p-2">Task</th>
            <th class="border p-2">Status</th>
            <th class="border p-2">Progress</th>
            <th class="border p-2">Due Date</th>
            <th class="border p-2">Priority</th>
            <th class="border p-2">AI Suggestion</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="task" items="${tasks}">

            <c:set var="ai" value="${aiMap[task.id]}"/>

            <!-- 🔴 Overdue Highlight -->
            <c:set var="rowColor" value=""/>
            <c:if test="${task.progress lt 100 && task.dueDate lt now}">
                <c:set var="rowColor" value="bg-red-50"/>
            </c:if>

            <tr class="${rowColor}">
                <td class="border p-2 font-medium">
                    ${task.title}
                </td>

                <!-- ===== STATUS DROPDOWN ===== -->
                <td class="border p-2">
                    <form action="/tasks/update" method="post" class="flex gap-2">
                        <input type="hidden" name="taskId" value="${task.id}"/>

                        <select name="status" class="border rounded p-1">
                            <option ${task.status == 'OPEN' ? 'selected' : ''}>OPEN</option>
                            <option ${task.status == 'IN_PROGRESS' ? 'selected' : ''}>IN_PROGRESS</option>
                            <option ${task.status == 'BLOCKED' ? 'selected' : ''}>BLOCKED</option>
                            <option ${task.status == 'DONE' ? 'selected' : ''}>DONE</option>
                        </select>
                </td>

                <!-- ===== PROGRESS SLIDER ===== -->
                <td class="border p-2">
                        <input type="range"
                               name="progress"
                               min="0"
                               max="100"
                               value="${task.progress}"
                               class="w-full"/>
                        <div class="text-xs text-center">${task.progress}%</div>
                </td>

                <!-- ===== DUE DATE ===== -->
                <td class="border p-2">
                    <fmt:formatDate value="${task.dueDate}" pattern="dd-MMM-yyyy"/>
                </td>

                <!-- ===== AI RISK ===== -->
                <td class="border p-2 font-semibold
                ${ai.riskLevel == 'HIGH' ? 'text-red-600' :
                  ai.riskLevel == 'MEDIUM' ? 'text-orange-500' :
                  'text-green-600'}">
                    ${ai.riskLevel}
                </td>

                <!-- ===== AI SUGGESTION ===== -->
                <td class="border p-2 italic text-gray-700">
                    ${ai.suggestion}
                    <button type="submit"
                            class="ml-2 text-xs bg-blue-600 text-white px-2 py-1 rounded">
                        Save
                    </button>
                </td>

                    </form>
            </tr>

        </c:forEach>
        </tbody>
    </table>

    <!-- ================= ACTIONS ================= -->
    <div class="mt-6 flex gap-4">
        <a href="/projects"
           class="bg-gray-600 text-white px-4 py-2 rounded">
            Back to Projects
        </a>

        <a href="/tasks/create?projectId=${project.id}"
           class="bg-green-600 text-white px-4 py-2 rounded">
            + Add Task
        </a>
    </div>

</div>

</body>
</html>
