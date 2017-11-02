<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>에러페이지</title>

<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">

<!-- internal js -->
<style>
	body {
		background-image: url('img/pcbackground8.jpg'); background-size: cover;
		background-repeat : no-repeat;
	}
	
	h1 {
		color: white
	}
</style>
</head>
<body>


<!-- content area -->
<h1>ERROR</h1>
<div class="txt_error">
<h1>Message : <p>${requestScope.message}</h1>


</body>
</html>







