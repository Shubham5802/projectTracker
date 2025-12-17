<form method="post" action="${pageContext.request.contextPath}/dologin">

   <%--  <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}" /> --%>

    <input type="text" name="username" placeholder="Username" />
    <input type="password" name="password" placeholder="Password" />

    <button type="submit">Login</button>
</form>
