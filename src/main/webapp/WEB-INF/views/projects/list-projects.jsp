<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Projects</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<c:if test="${not empty successMessage}">
    <script>
        alert("${successMessage}");
    </script>
</c:if>

<body class="bg-gray-100 p-8">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>


<div class="max-w-6xl mx-auto bg-white shadow rounded-lg p-6">
    <div class="flex justify-between mb-4">
        <h2 class="text-2xl font-bold">Projects</h2>
        <a href="/projects/create" class="bg-blue-600 text-white px-4 py-2 rounded">
            + Create Project
        </a>
    </div>

    <table class="min-w-full border">
        <thead class="bg-gray-200">
        <tr>
            <th class="border px-4 py-2">ID</th>
            <th class="border px-4 py-2">Name</th>
            <th class="border px-4 py-2">Status</th>
            <th class="border px-4 py-2">Start</th>
            <th class="border px-4 py-2">End</th>
            <th class="border px-4 py-2">Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="p" items="${projects}">
            <tr class="text-center">
                <td class="border px-4 py-2">${p.id}</td>
                <td class="border px-4 py-2">${p.name}</td>
                <td class="border px-4 py-2">${p.status}</td>
                <td class="border px-4 py-2">${p.startDate}</td>
                <td class="border px-4 py-2">${p.endDate}</td>
                <td class="border px-4 py-2">
                    <a href="/projects/view?id=${p.id}"
                       class="text-blue-600 underline">
                        View
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
