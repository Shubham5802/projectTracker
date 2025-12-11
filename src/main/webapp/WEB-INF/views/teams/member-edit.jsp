<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Member</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-6">

<div class="max-w-md mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-xl font-bold mb-4">Edit Member</h2>

    <form action="/members/edit" method="post" class="space-y-4">

        <input type="hidden" name="memberId" value="${member.memberId}" />
        <input type="hidden" name="teamId" value="${member.teamId}" />

        <div>
            <label class="block font-medium">Name</label>
            <input type="text" name="name"
                   value="${member.name}"
                   class="w-full border p-2 rounded" required />
        </div>

        <div>
            <label class="block font-medium">Designation</label>
            <input type="text" name="designation"
                   value="${member.designation}"
                   class="w-full border p-2 rounded" />
        </div>

        <div>
            <label class="block font-medium">Contact</label>
            <input type="text" name="contact"
                   value="${member.contact}"
                   class="w-full border p-2 rounded" />
        </div>

        <button class="bg-blue-600 text-white px-4 py-2 rounded">
            Update
        </button>

        <a href="/members?teamId=${member.teamId}"
           class="bg-gray-600 text-white px-4 py-2 rounded">
            Cancel
        </a>
    </form>

</div>

</body>
</html>
