<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<h3 class="mb-3">Log Shuffle for Project: ${shuffle.project.projectName}</h3>

<form action="/shuffle/save/${shuffle.project.projectId}" method="post" class="col-md-8">
 <!-- CSRF TOKEN -->
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}" />
    <input type="hidden" name="project.projectId" value="${shuffle.project.projectId}" />

    <div class="mb-3">
        <label class="form-label">Select Member</label>
        <select name="member.memberId" class="form-control" required>
            <option value="">-- Select Member --</option>
            <c:forEach var="pm" items="${projectMembers}">
                <option value="${pm.member.memberId}">
                    ${pm.member.memberName}
                </option>
            </c:forEach>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Action</label>
        <select name="action" class="form-control" required>
            <option value="">-- Select Action --</option>
            <option>ADDED</option>
            <option>REMOVED</option>
            <option>REPLACED</option>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Remark</label>
        <textarea name="remark" class="form-control" rows="3"></textarea>
    </div>

    <button type="submit" class="btn btn-success">Save</button>
    <a href="/shuffle/project/${shuffle.project.projectId}" class="btn btn-secondary">Cancel</a>

</form>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
