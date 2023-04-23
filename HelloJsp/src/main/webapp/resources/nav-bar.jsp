<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<span class="brand">Hello Jsp</span>
	<nav>
		<%
	String pageId = request.getParameter("page");
	if ("hello".equals(pageId)) {
	%>
		<a class="active" href="index.jsp">Hello JSP</a> <a href="actions.jsp">JSP Actions</a> <a
			href="directives.jsp">Directives</a>
		<%
	} else if ("actions".equals(pageId)) {
	%>
		<a href="index.jsp">Hello JSP</a> <a class="active" href="actions.jsp">JSP Actions</a> <a
			href="directives.jsp">Directives</a>
		<%
	} else if ("directives".equals(pageId)) {
	%>
		<a href="index.jsp">Hello JSP</a> <a href="actions.jsp">JSP Actions</a> <a
			class="active" href="directives.jsp">Directives</a>
		<%
	}
	%>


	</nav>
</header>