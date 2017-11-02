<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="work.model.dao.*"%>
<%@ page import="work.model.dto.*"%>
<%@ page import="work.controller.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%
	SeatDao dao = new SeatDao();
	String a=dao.selectOne(6).toString();
	%>
 <%=a %>
</body>

</html>