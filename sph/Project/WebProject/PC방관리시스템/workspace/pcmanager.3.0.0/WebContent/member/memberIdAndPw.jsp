<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디/비밀번호 찾기</title>

<!-- external css : css/common.css -->
<link rel="stylesheet" href="/pcm/Resources/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/common.css">

<style>
	body {
		background-image: url('/pcm/img/pcbackground4.jpg'); background-size: cover;
		background-repeat : no-repeat;
	}

	h3 {
		color:white;
	}
	input[type=text], input[type=tel], input[type=password] {
	color: black;
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

	/* Set a style for all buttons */
	button {
	    background-color: #fcb259;
	    color: white;
	    padding: 14px 20px;
	    margin: 8px 0;
	    border: none;
	    cursor: pointer;
	    width: 100%;
	}
	
	button:hover {
	    opacity: 0.8;
	}
	
	
	/* Center the image and position the close button */
	.imgcontainer {
	    text-align: center;
	    margin: 24px 0 12px 0;
	    position: relative;
	}
	
	.container {
    padding: 16px;
}
	
	span.psw {
	    float: right;
	    padding-top: 16px;
	    font-size: 20px;
	    font-color: #f2f2f2;
	}
	
	/* Clear floats */
	.clearfix::after {
	    content: "";
	    clear: both;
	    display: table;
	}
	
	/* Add Zoom Animation */
	.animate {
	    -webkit-animation: animatezoom 0.6s;
	    animation: animatezoom 0.6s
	}
	
	@-webkit-keyframes animatezoom {
	    from {-webkit-transform: scale(0)} 
	    to {-webkit-transform: scale(1)}
	}
	    
	@keyframes animatezoom {
	    from {transform: scale(0)} 
	    to {transform: scale(1)}
	}
	
	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
	    span.psw {
	       display: block;
	       float: none;
	    }
	    .cancelbtn, .signupbtn{
	       width: 50%;
	    }
	}
	
</style>


<!-- internal js -->

</head>
<body>




<h3>&nbsp;&nbsp;&nbsp;아이디 찾기</h3>
<table class="tab_form">
<form action="/pcm/controller?action=findMemberId" method="post">
	<tr>
		<th class="th_title">이름</th>
		<td>
		<input type="text" name ="memberName"
			placeholder="이름 필수항목" required title="이름 입력">		
		</td>
	</tr>
	
	<tr>
		<th class="th_title">연락처</th>
		<td>
		<input type="tel" name ="mobile" required
			pattern="(010|011|016|017|019)-\d{3,4}-\d{4}" 
			title="휴대폰 번호 예시 : 010-1234-1234"
			placeholder="연락처 필수항목" title="휴대폰 입력">		
		</td>
	</tr>
	
	<tr>
		<td class="input_button" colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-success btn-lg" type="submit" value="아이디 찾기">
		</td>
	</tr>
</form>
</table>

<h3>&nbsp;&nbsp;&nbsp;비밀번호 찾기</h3>
<table class="tab_form">
<form action="/pcm/controller?action=findMemberPw" method="post">
	<tr>
		<th class="th_title">아이디</th>
		<td>
		<input type="text" name="memberId" 
		minlength="4" maxlength="20" placeholder="아이디 4~20자리이내"
		autofocus required title="아이디 입력">		
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
		<th class="th_title">연락처</th>
		<td>
		<input type="tel" name ="mobile" required
			pattern="(010|011|016|017|019)-\d{3,4}-\d{4}" 
			title="휴대폰 번호 예시 : 010-1234-1234"
			placeholder="연락처 필수항목" title="휴대폰 입력">		
		</td>
	</tr>
	
	<tr>
		<td class="input_button" colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-success btn-lg" type="submit" value="비밀번호 찾기">
		</td>
	</tr>
</form>
</table>

<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

</body>
</html>











