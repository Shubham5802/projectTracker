<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Team Members</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-6">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="max-w-4xl mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-2xl font-bold mb-4">
        Team: ${team.name}
    </h2>

    <div class="mb-4">
        <a href="/members/create?teamId=${team.id}"
           class="bg-blue-600 text-white px-4 py-2 rounded">
            + Add Member
        </a>
    </div>

    <table class="w-full border text-sm">
        <thead class="bg-gray-200">
        <tr>
            <th class="border p-2">Name</th>
            <th class="border p-2">Designation</th>
            <th class="border p-2">Contact</th>
            <th class="border p-2">Actions</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="m" items="${members}">
            <tr>
                <td class="border p-2">${m.name}</td>
                <td class="border p-2">${m.designation}</td>
                <td class="border p-2">${m.contact}</td>
                <td class="border p-2">
                    <a href="/members/edit?id=${m.memberId}"
                       class="text-blue-600 underline">
                        Edit
                    </a>
                    |
                    <a href="/members/delete?id=${m.memberId}&teamId=${team.id}"
                       onclick="return confirm('Delete this member?')"
                       class="text-red-600 underline">
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
