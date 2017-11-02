<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>서비스 예정</title>

<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">

<!-- internal js -->

</head>
<body>

<!-- header area -->
<!-- logo link -->
<a href="/pcm/index.jsp">
<img src="img/logo.gif" title="홈페이지 이동">
</a>
<hr>

<!-- 로그인 전 메뉴 -->
<div class="menu_area" style="text-align:right;">
<a class="normal" href="login.jsp">로그인</a>
<a class="normal" href="join.jsp">회원가입</a>
<a class="normal" href="memberIdAndPw.jsp">아이디/비밀번호 찾기</a>
</div>
<hr>


<!-- content area -->
<div class="txt_error">
Message : 아직 지원되지 않는 서비스입니다.
</div>

<div class="img">
	<img src="img/img_construction.jpg" title="준비중 이미지">
</div>

<!-- footer area -->
<hr>
<div class="footer_area" style="text-align:center;">
COPYRIGHT 2017 WORK. ALL RIGHTS RESERVED
</div>

</body>
</html>







