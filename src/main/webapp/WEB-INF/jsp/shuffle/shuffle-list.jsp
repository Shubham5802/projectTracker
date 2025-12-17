<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<h3 class="mb-3">Shuffle History for Project: ${project.projectName}</h3>

<div class="mb-3">
    <a href="/shuffle/log/${project.projectId}" class="btn btn-primary">Log Shuffle</a>
    <a href="/project/list" class="btn btn-secondary">Back to Projects</a>
</div>

<table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
        <th>Member</th>
        <th>Action</th>
        <th>Date</th>
        <th>Remark</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="s" items="${shuffles}">
        <tr>
            <td>${s.member.memberName}</td>
            <td>${s.action}</td>
            <td>${s.actionDate}</td>
            <td>${s.remark}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
