<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="work.model.dto.OrderSummary" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
주문결과<br>
	<%= request.getAttribute("memberId") %>님이 주문하신<br>
	<%	ArrayList<OrderSummary> list = (ArrayList<OrderSummary>)request.getAttribute("orderSummary");
		OrderSummary dto = null;
		int sum = 0;
		for (int index = 0 ; index < list.size() ; index++) {
			dto=list.get(index);
	%>
	
		<%= dto.getProductName() %> <%= dto.getProductCount() %> <%= dto.getPrice() %><br>
		
	<%	
		sum += dto.getPrice();
		}
	%>
	합계금액 : <%= sum %>
	
</body>
</html>