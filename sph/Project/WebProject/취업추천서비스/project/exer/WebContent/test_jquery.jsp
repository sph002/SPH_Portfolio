<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="goal.service.fieldList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='list-jquery/jquery.js'></script>
<script type='text/javascript' src='list-jquery/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='list-jquery/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='list-jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="list-jquery/jquery.autocomplete.css" />
</head>
<body>
<%
	fieldList field = new fieldList();
	String[] tags = new String[1500];
	tags = field.getList("company_name");
%>
	<script>
	var availableTags = [
	              <%for(int i=0; i<tags.length; i++){	              
	              	if(i==tags.length-1){%>
	              	'<%=tags[i]%>'
	              		<%}else {%>
	              		'<%=tags[i]%>',	              		
	              <%}}%>
	                     
							
						];
	</script>

	<form name="form1" method="post" action="result.php">
	  <input type="text" id="searchbox">
	  <input type="submit" id="sumit" value="검색">
	</form>

	<script>
	$(document).ready(function() {
	    $("#searchbox").autocomplete(availableTags,{ 
	        matchContains: true,
	        selectFirst: false
	    });
	});
	</script>

</body>
</html>