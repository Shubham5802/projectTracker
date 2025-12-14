<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Add Member</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-8">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="max-w-xl mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-xl font-bold mb-4">Add Team Member</h2>

    <form method="post" action="/members/create" class="space-y-4">

        <div>
            <label>Name</label>
            <input type="text" name="name"
                   class="border p-2 w-full" required/>
        </div>

        <div>
            <label>Email</label>
            <input type="text" name="email" class="border p-2 w-full"/>
        </div>

        <div>
            <label>Role</label>
            <input type="text" name="role" class="border p-2 w-full"/>
        </div>

        <div>
            <label>Team</label>
            <select name="teamId" class="border p-2 w-full">
                <c:forEach var="t" items="${teams}">
                    <option value="${t.id}">
                        ${t.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button class="bg-green-600 text-white px-4 py-2 rounded">
            Save
        </button>
    </form>

</div>

</body>
</html>
