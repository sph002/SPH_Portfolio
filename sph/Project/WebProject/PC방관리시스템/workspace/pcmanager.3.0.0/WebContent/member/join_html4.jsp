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
	/* 회원아이디 포커스 초기화 */
	function init() {
		document.getElementById("memberId").focus();
	}
	
	/* 윈도우 로드시 이벤트 처리 */
	window.onload = function() {	
		init();
	}
	
	/* 회원가입 데이터 검증 */
	function joinCheck() {
		//alert('joinCheck() call');
		
		var memberId = document.joinForm.memberId.value;
		//alert(memberId);
		
		var memberPw = document.getElementById("memberPw").value;
		//alert(memberPw);
		
		var memberPwConfirm = document.getElementById("memberPwConfirm").value;
		//alert(memberPwConfirm);
		
		var memberName = document.getElementById("memberName").value;
		//alert(memberName);
		
		var mobile1 = document.getElementById("mobile1").value;
		//alert(mobile1);
		
		var mobile2 = document.getElementById("mobile2").value;
		//alert(mobile2);
		
		var mobile3 = document.getElementById("mobile3").value;
		//alert(mobile3);
		
		var email1 = document.getElementById("email1").value;
		//alert(email1);
		
		var email2 = document.getElementById("email2").value;
		//alert(email2);
		
		if (memberId.length < 4 || memberId.length > 20) {
			alert("아이디는 4자리 ~ 20자리 이내로 입력하세요");
			document.getElementById("memberId").focus();
			return false;
		}
		
		if (memberPw != memberPwConfirm) {
			alert("비밀번호와 비밀번호확인을 동일하게 입력하세요");
			document.getElementById("memberPw").focus();
			return false;
		}
		
		if (memberPw.length < 6 || memberPw.length > 20) {
			alert("비밀번호는 6자리 ~ 20자리 이내로 입력하세요");
			document.getElementById("memberPw").focus();
			return false;
		}

		if (memberName.length == 0) {
			alert("이름은 필수 입력항목입니다. 이름을 입력하세요");
			document.getElementById("memberName").focus();
			return false;
		}
		
		if (mobile2.length < 3  || 
				mobile2.length > 4 || 
				isNaN(mobile2)) {
			alert("전화번호2은 숫자3자리~4자리를 입력하세요");
			document.getElementById("mobile2").focus();
			return false;
		}
		
		if (mobile3.length < 4  || 
				isNaN(mobile3)) {
			alert("전화번호3은 숫자4자리를 입력하세요");
			document.getElementById("mobile3").focus();
			return false;
		}
		
		var mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		
		if (email1.length == 0 ) {
			alert("이메일은 필수 입력항목입니다. 이메일을 입력하세요");
			document.getElementById("email1").focus();
			return false;
		}

		if (email2 == "none" || email2 == "userInput" ) {
			alert("이메일2는 필수 입력항목입니다. 이메일2를 선택 입력하세요");
			document.getElementById("email2").focus();
			return false;
		}
		
		var email = email1 + email2;
		
		var joinInfo = "회원입력 가입정보 확인\n";
		joinInfo += (memberId + "\n");
		joinInfo += (memberPw + "\n");
		joinInfo += (memberName + "\n");
		joinInfo += (mobile + "\n");
		joinInfo += (email + "\n\n");
		joinInfo += "회원가입을 하시겠습니까?";
		var result = confirm(joinInfo);
		if (result) {
			document.joinForm.action = "/pcm/controller?action=joinSave";
			// 데이터 검증완료 로그인 요청
			document.joinForm.submit();
		}
	}
	
	
	/* 이메일 주소 자동 가져오기 */
	function setEmail2(takeData) {
		//alert('setEmail2() call' + takeData);
		var email1 = document.getElementById("email1").value;
		if (email1.length == 0) {
			alert("이메일 아이디를 먼저 입력하시기 바랍니다");
			document.getElementById("email1").focus();
			//alert(document.joinForm.emailSelected.options.length);
			document.joinForm.emailSelected.options[0].selected = true;
			return;
		}
		
		if (takeData == 'none') {
			alert("이메일을 선택하시기 바랍니다.");
			document.getElementById("email2").value = "";
		} else if (takeData == 'userInput') {
			document.getElementById("email2").readOnly = false;
			document.getElementById("email2").style="background-color:#ffffff;";
			document.getElementById("email2").focus();
		} else {
			document.getElementById("email2").value = takeData;
			document.getElementById("email2").style="background-color:#F0F8FF;";
		}
	}
</script>

</head>
<body>

<!-- header area -->
<!-- logo link -->
<a href="/pcm/index.jsp">
<img src="/pcm/img/logo.gif" title="홈페이지 이동">
</a>
<hr>

<!-- 로그인 전 메뉴 -->
<div class="menu_area" style="text-align:right;">
<a class="normal" href="login.jsp">로그인</a>
<a class="normal" href="join_html4.jsp">회원가입(html4)</a>
<a class="normal" href="join.jsp">회원가입(html5)</a>
<a class="normal" href="memberIdAndPw.jsp">아이디/비밀번호 찾기</a>
</div>
<hr>


<!-- content area -->
<h3>회원가입(html4)</h3>
<form id="joinForm"  name="joinForm" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td>
		<input type="text" name="memberId" id="memberId"
			value="4~8자리이내">
		</td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td>
		<input type="password" name="memberPw" id="memberPw"
			value="6~8자리이내">
		</td>
	</tr>
	
	<tr>
		<td>비밀번호확인</td>
		<td>
		<input type="password" name="memberPwConfirm" id="memberPwConfirm"
			value="6~8자리이내">
		</td>
	</tr>

	<tr>
		<td>이름</td>
		<td>
		<input type="text" name="memberName" id="memberName"
			value="이름">
		</td>
	</tr>
	
	<tr>
		<td>연락처</td>
		<td>
		<select name="mobile1" id="mobile1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="019">019</option>
		</select>-
		<input type="text" name="mobile2" id="mobile2" maxlength="4">-
		<input type="text" name="mobile3" id="mobile3" maxlength="4">
		</td>
	</tr>
	
	<tr>
		<td>이메일</td>
		<td>
		<input type="text" name="email1" id="email1" >
		<input type="text" name="email2" id="email2" readonly
			class="readonly">
		<select name="emailSelected" 
			onchange ="setEmail2(this.value)">
			<option value="none">선택</option>
			<option value="@naver.com">네이버</option>
			<option value="@gmail.com">구글</option>
			<option value="@dreamwiz.com">드림위즈</option>
			<option value="userInput">직접입력</option>
		</select>-
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td colspan="2">
		<input type="submit" value="회원가입"
			onclick="return joinCheck()"
			class="btn_normal">
		<input type="reset" value="취소"
			class="btn_normal">
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