<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>

<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="/pcm/css/common.css">

<!-- internal js -->
<script type="text/javascript">
</script>

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
<a class="normal" href="/pcm/product/order.jsp">상품주문</a>
</div>
<hr>


<!-- content area -->
<h3>회원가입(html5)</h3>
<form action="/pcm/controller?action=joinSave" method="post">
<table class="tab_form">
	<tr>
		<th class="th_title">아이디</th>
		<td>
		<input type="text" name="memberId" 
		minlength="4" maxlength="20" placeholder="아이디 4~20자리이내"
		autofocus required title="아이디 입력">		
		</td>
	</tr>
	
	<tr>
		<th class="th_title">비밀번호</th>
		<td>
		<input type="password" name ="memberPw"
			minlength="6" maxlength="20" placeholder="비밀번호 6~20자리이내"
			required title="비밀번호 입력">		
		</td>
	</tr>
	
	<tr>
		<th class="th_title">이름</th>
		<td>
		<input type="text" name ="memberName"
			placeholder="이름 필수항목" required title="이름 입력">		
		</td>
	</tr>
	
	<tr>
		<th class="th_title">성별</th>
		<td>
			<input type="radio" name="gender" value="남" checked>남
			<input type="radio" name="gender" value="여" checked>여	
		</td>
	</tr>
	
	<tr>
		<th class="th_title">생년월일</th>
		<td>
		<input type="text" name="birthDate" maxlength="12" placeholder="년(4자)/월(2자)/일(2자)">
		</td>
	</tr>
	
	<tr>
		<th class="th_title">연락처</th>
		<td>
		<input type="tel" name ="mobile" required
			pattern="(010|011|016|017|019)-\d{3,4}-\d{4}" 
			title="휴대폰 번호 예시 : 010-1234-1234"
			placeholder="예) 010-1234-1234 필수항목" title="휴대폰 입력">		
		</td>
	</tr>

	<tr>
		<th class="th_title">이메일</th>
		<td>
		<input type="email" name ="email" required 
			placeholder="이메일 필수항목" title="이메일 입력">
		</td>
	</tr>
	
	<tr>
		<th class="th_title">주소</th>
		<td>
		<input type="text" size="50" name="address"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	
	<tr>
		<td colspan="2" class="input_button">
			<input class="input_button" type="submit" value="회원가입">
			<input class="input_button" type="reset" value="취소">
		</td>
	</tr>
</table>
</form>


<!-- footer area -->
<hr>
<div class="footer_area" style="text-align:center;">
COPYRIGHT 2017 WORK. ALL RIGHTS RESERVED
</div>

</body>
</html>