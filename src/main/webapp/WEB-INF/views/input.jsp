<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form:form action="${pageContext.request.contextPath }/emp" method="post" modelAttribute="employee">
			<!-- 此处有问题，一旦加了c:if, LastName就显示不出来了 -->
			<c:if test="${employee.id }==null">
			LastName:<form:input path="lastName"/>
			 </c:if>
			<input type="hidden" name="id" value="${employee.id }">
			<input type="hidden" name="_method" value="put">

		<br><br>
		Email:<form:input path="email"/>
		<br><br>
		<%
			Map<String, String> genders = new HashMap<String, String>();
			genders.put("1", "Male");
			genders.put("0", "Female");
			request.setAttribute("genders", genders);
		%>
		Gender:<form:radiobuttons path="gender" items="${genders }"/>
		<br><br>
		Department: <form:select path="department.id" items="${departments }"
			itemLabel="departmentName" itemValue="id"></form:select>
		<br><br>
		<input type="submit" value="submit"/>
	</form:form>
</body>
</html>