<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<h3 class="mb-3">Create Project</h3>

<form action="/project/save" method="post" class="col-md-8">
 <!-- CSRF TOKEN -->
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}" />
    <div class="mb-3">
        <label class="form-label">Project Name</label>
        <input type="text" name="projectName" class="form-control" required />
    </div>

    <div class="mb-3">
        <label class="form-label">Project Description</label>
        <textarea name="projectDesc" class="form-control" rows="3"></textarea>
    </div>

    <div class="mb-3">
        <label class="form-label">Team</label>
        <select name="team.teamId" class="form-control" required>
            <option value="">-- Select Team --</option>
            <c:forEach var="t" items="${teams}">
                <option value="${t.teamId}">${t.teamName}</option>
            </c:forEach>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Start Date</label>
       <input type="text" id="startDate" name="startDate"
       class="form-control" required readonly />
    </div>

    <div class="mb-3">
        <label class="form-label">End Date</label>
        <input type="text" id="endDate" name="endDate"
       class="form-control" readonly />
    </div>

    <button type="submit" class="btn btn-success">Save</button>
    <a href="/project/list" class="btn btn-secondary">Cancel</a>

</form>

<script>
    $(function () {

        $("#startDate").datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true,
            onSelect: function (selectedDate) {
                $("#endDate").datepicker("option", "minDate", selectedDate);
            }
        });

        $("#endDate").datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true
        });

    });
</script>


<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
