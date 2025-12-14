<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Team Members</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-8">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="max-w-5xl mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-2xl font-bold mb-4">Team Members</h2>

    <a href="/members/create"
       class="bg-blue-600 text-white px-4 py-2 rounded mb-4 inline-block">
        + Add Member
    </a>

    <table class="w-full border text-sm">
        <thead class="bg-gray-200">
            <tr>
                <th class="border p-2">Name</th>
                <th class="border p-2">Email</th>
                <th class="border p-2">Role</th>
                <th class="border p-2">Team</th>
                <th class="border p-2">Actions</th>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="m" items="${members}">
            <tr>
                <td class="border p-2">${m.name}</td>
                <td class="border p-2">${m.email}</td>
                <td class="border p-2">${m.role}</td>
                <td class="border p-2">${m.team.name}</td>

                <td class="border p-2">
                    <a href="/members/edit?id=${m.id}"
                       class="text-blue-600">Edit</a> |
                    <a href="/members/delete?id=${m.id}"
                       class="text-red-600"
                       onclick="return confirm('Delete member?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>
