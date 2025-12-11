<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Edit Team</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="p-8 bg-gray-100">

<div class="max-w-lg mx-auto bg-white p-6 rounded shadow">

    <h2 class="text-xl font-bold mb-4">Edit Team</h2>

    <form method="post" action="/teams/edit" class="space-y-4">

        <input type="hidden" name="id" value="${team.id}" />

        <label class="block">
            <span>Name</span>
            <input type="text" name="name" value="${team.name}" class="border p-2 w-full rounded" />
        </label>

        <label class="block">
            <span>Description</span>
            <textarea name="description" class="border p-2 w-full rounded">${team.description}</textarea>
        </label>

        <button class="bg-blue-600 text-white px-4 py-2 rounded">Update</button>
        <a href="/teams" class="ml-3 text-blue-600">Cancel</a>

    </form>

</div>

</body>
</html>
