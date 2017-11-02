<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.*" %>
<%@ page import="work.model.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- model(dao) 테스트 페이지 -->
<h3>단위테스트(UnitTest)</h3>
<%
	OrderDao dao = new OrderDao();
	//Product dto = dao.selectOne("auser01");
	
	// 서버 콘솔 결과 응답
	//System.out.println("\n### dto : " + dto);
	//System.out.println("\n### dto : " + dao.loginCheck("auser01", "password01"));
	
	// 브라우저 결과 응답 


	System.out.println("null" + 0);
%>


</body>
</html>