<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Teams</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="p-8 bg-gray-100">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="max-w-4xl mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-xl font-bold mb-4">Teams</h2>

    <a href="/teams/create" class="bg-green-600 text-white px-4 py-2 rounded mb-4 inline-block">
        + Create Team
    </a>

    <table class="w-full border mt-3">
        <thead class="bg-gray-200">
        <tr>
            <th class="border p-2">Name</th>
            <th class="border p-2">Description</th>
            <th class="border p-2">Actions</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="team" items="${teams}">
            <tr>
                <td class="border p-2">${team.name}</td>
                <td class="border p-2">${team.description}</td>

                <td class="border p-2">
                    <a href="/teams/edit?id=${team.id}" class="text-blue-600">Edit</a> |
                    <a href="/teams/delete?id=${team.id}" class="text-red-600"
                       onclick="return confirm('Delete this team?');">
                        Delete
                    </a>|
                    <a href="/members?teamId=${team.id}" class="text-blue-600">View</a> 
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>
