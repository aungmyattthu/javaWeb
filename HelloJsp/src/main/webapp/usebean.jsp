<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style.css" />
</head>
<body>
	<jsp:include page="resources/nav-bar.jsp">
		<jsp:param value="actions" name="page"/>
		</jsp:include>
		<main>
		<h1>use bean action</h1>
		<jsp:useBean id="user" scope="page" class="com.jdc.hello.User"></jsp:useBean>
		<jsp:setProperty property="*"  name="user"/>
		<table>
			<tr>
				<td>Name</td>
				<td>
					<jsp:getProperty property="name" name="user"/>
				</td>
				
			</tr>
			<tr>
				<td>Phone</td>
				<td><jsp:getProperty property="phone" name="user"/></td>
				
			</tr>
			<tr>
				<td>Email</td>
				<td><jsp:getProperty property="email" name="user"/></td>
				
			</tr>
		</table>
		
		</main>
</body>
</html>