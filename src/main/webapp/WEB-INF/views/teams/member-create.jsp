<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Member</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-6">
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="max-w-md mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-xl font-bold mb-4">Add Team Member</h2>

    <form action="/members/create" method="post" class="space-y-4">

        <input type="hidden" name="teamId" value="${teamId}"/>

        <div>
            <label class="block font-medium">Name</label>
            <input type="text" name="name"
                   class="w-full border p-2 rounded" required />
        </div>

        <div>
            <label class="block font-medium">Designation</label>
            <input type="text" name="designation"
                   class="w-full border p-2 rounded" />
        </div>

        <div>
            <label class="block font-medium">Contact</label>
            <input type="text" name="contact"
                   class="w-full border p-2 rounded" />
        </div>

        <button class="bg-green-600 text-white px-4 py-2 rounded">
            Save Member
        </button>

        <a href="/members?teamId=${teamId}"
           class="bg-gray-600 text-white px-4 py-2 rounded">
            Cancel
        </a>
    </form>

</div>

</body>
</html>
