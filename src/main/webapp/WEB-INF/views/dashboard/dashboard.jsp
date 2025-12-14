<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/common/navbar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - AI Summary</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-8">

<div class="max-w-7xl mx-auto space-y-8">

    <!-- ====== HEADER ====== -->
    <h1 class="text-3xl font-bold mb-4">Dashboard Overview</h1>

    <!-- ====== SUMMARY CARDS ====== -->
    <div class="grid grid-cols-4 gap-6">

        <div class="bg-white p-6 rounded shadow text-center">
            <p class="text-4xl font-bold">${total}</p>
            <p class="text-gray-500">Total Projects</p>
        </div>

        <div class="bg-green-100 p-6 rounded shadow text-center">
            <p class="text-4xl font-bold text-green-700">${completed}</p>
            <p class="text-gray-700">Completed</p>
        </div>

        <div class="bg-blue-100 p-6 rounded shadow text-center">
            <p class="text-4xl font-bold text-blue-700">${inProgress}</p>
            <p class="text-gray-700">In Progress</p>
        </div>

        <div class="bg-yellow-100 p-6 rounded shadow text-center">
            <p class="text-4xl font-bold text-yellow-700">${onHold}</p>
            <p class="text-gray-700">On Hold</p>
        </div>

    </div>

    <!-- ====== AI INSIGHTS PER PROJECT ====== -->
    <h2 class="text-2xl font-semibold mt-10">AI Project Insights</h2>

    <div class="space-y-4">

        <c:forEach var="p" items="${projects}">
            <c:set var="ai" value="${aiMap[p.id]}" />

            <div class="p-4 rounded shadow bg-white">

                <div class="flex justify-between">
                    <h3 class="text-xl font-bold text-gray-800">${p.name}</h3>

                    <span class="px-3 py-1 rounded text-sm font-semibold
                        ${ai.riskLevel == 'HIGH' ? 'bg-red-200 text-red-800' :
                          ai.riskLevel == 'MEDIUM' ? 'bg-yellow-200 text-yellow-800' :
                          'bg-green-200 text-green-800'}">
                        ${ai.riskLevel}
                    </span>
                </div>

                <p class="mt-2 text-gray-700">${ai.summary}</p>

                <!-- Health Score Bar -->
                <div class="w-full bg-gray-300 rounded h-3 mt-3">
                    <div class="h-3 rounded bg-blue-600"
                         style="width:${ai.healthScore}%"></div>
                </div>

                <p class="text-sm mt-1 text-gray-600">
                    Health Score: <b>${ai.healthScore}%</b>
                </p>

                <!-- View Project -->
                <a href="/projects/view?id=${p.id}"
                   class="mt-3 inline-block bg-gray-800 text-white px-4 py-1 rounded">
                    View Project
                </a>
            </div>
        </c:forEach>

    </div>

</div>

</body>
</html>
