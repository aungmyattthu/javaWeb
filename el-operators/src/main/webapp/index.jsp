<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Expressions</title>
</head>
<body>
	<%
		session.setAttribute("data1", 100);
	session.setAttribute("data2", 200);
		// application.setAttribute("data1", 20);
		
		request.setAttribute("list", List.of("java", "javascript","kotlin","typescript"));
		request.setAttribute("map",Map.of("key1","Servlet","key2","JSP"));
	%>
	<h3>Arithmetic operations</h3>
	<c:set var="data1" scope="page" value="1000"></c:set>
	<table>
		<tr>
			<td>[A+B]</td>
			<td>${data1}+${data2}=${data1+data2}
			</td>
		</tr>
		<tr>
			<td>[A-B]</td>
			<td>${data1}-${data2}=${data1-data2}
			</td>
		</tr>
		<tr>
			<td>[A*B]</td>
			<td>${data1}*${data2}=${data1*data2}
			</td>
		</tr>
		<tr>
			<td>[A/B]</td>
			<td>${data1}/${data2}=${data1/data2}
			</td>
		</tr>
		<tr>
			<td>[A%B]</td>
			<td>${data1}%${data2}=${data1%data2}
			</td>
		</tr>
	</table>
	
	<table>
		
		<tr>
		<td>Equal</td>
		<td>${(data1+100) eq data2 ? "Data 1 is equal to data2" : "Data 1 is not equal to data2" }</td>
		</tr>
		
		<tr>
		<td>Not Equal</td>
		<td>${data1  ne data2 ? "Data 1 is not equal to data2" : "Data 1 is equal to data2" }</td>
		</tr>
		
		<tr>
		<td>List</td>
		<td>
			<ul>
			
				<c:forEach var="data" items="${list}" >
					<li><c:out value="${data}"></c:out></li>
				</c:forEach>
				
			</ul>
			</td>
		</tr>
		
		
<tr>
		<td>Map["key1"]</td>
		<td>${ map["key1"]} </td>
		</tr>
		<tr>
		<td>Map["key2"]</td>
		<td>${ map["key2"]} </td>
		</tr>
	</table>
	<h3>Request Parameter</h3>
	<form >
	 	<div style="display:flex; flex-direction: column;align-items: flex-start;">
			<label for="">Name</label>
			<input type="text" name="name"/>
		</div>
		<div style="display:flex; flex-direction: column;margin-top:10px">
			<label for="">Course</label>
			<div>
				<input id="java" value="java" type="checkbox" name="course" />
				<label for="java" style="margin-right:8px;">Java</label>
				
				<input id="javascript" value="javascript" type="checkbox" name="course" />
				<label for="javascript" style="margin-right:8px;">javascript</label>
				
				<input id="kotlin" value="kotlin" type="checkbox" name="course" />
				<label for="kotlin" style="margin-right:8px;">kotlin</label>
				
				<input id="TypeScript" value="TypeScript" type="checkbox" name="course" />
				<label for="TypeScript" style="margin-right:8px;">TypeScript</label>
			</div>
		</div>
		<input type="submit" value="SEND" />
	</form>
	<div>
		${param.name} 
	</div>
	<div>
		${paramValues.course[0] }
	</div>
	<div>
		${paramValues.course[1] }
	</div>
</body>
</html>