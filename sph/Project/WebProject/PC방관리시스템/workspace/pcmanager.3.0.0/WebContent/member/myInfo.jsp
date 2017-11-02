<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.Member" %>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내 정보 조회</title>
<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="Resources/css/bootstrap.css">

<style>

body {
		background-image: url('/pcm/img/pcbackground7.jpg'); background-size: cover;
		background-repeat : no-repeat;
	}
/* Full-width input fields */
h1, h3 {
	color: white
}
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

/* Extra styles for the cancel button */
.cancelbtn2 {
    padding: 14px 14px;
    background-color: #fcb259;
    font-size: 20px;
    float:right;
    width:30%;
}

.signupbtn {
	padding: 14px 14px;
    background-color: #3f7f95;
    font-size: 20px;
	float:left;
	width:50%;}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #17181d; /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 0px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #17181d;
    margin: 7% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
    height: 57%;
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 35px;
    top: 15px;
    color: #000;
    font-size: 40px;
    font-weight: bold;
}



.radio {
	font-color: #f2f2f2;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>

</head>
<body>

<!-- 메세지 출력  -->
<c:if test="${not empty requestScope.message}">
	<h3>Message : <%= request.getAttribute("message") %></h3>
</c:if>

<!-- 로그인 후 메뉴 -->
<div class="menu_area" style="text-align:right;">
	<c:choose>
	<c:when test="${not empty sessionScope.memberId and 
		not empty sessionScope.grade}">
		${sessionScope.memberId}님[${sessionScope.grade}]&nbsp;
		
		<!-- 관리자 메뉴 -->
		<c:if test="${sessionScope.grade == 'A'}">
			[관리자]
		</c:if>
	</c:when>
	
	<c:when test="${empty sessionScope.memberId or 
		empty sessionScope.grade}">
		<c:set var="message" value="로그인/회원가입 후 사용하시기 바랍니다." />
		<jsp:forward page="/pcm/error.jsp" />
	</c:when>
	</c:choose>
</div>
<hr>

<!-- content area -->
<h1>내정보</h1>
<table border="1">
	<tr>
		<th><h3>아이디</h3></th>
		<td><h3>${requestScope.dto.memberId}</h3></td>
	</tr>
	
	<tr>
		<th><h3>비밀번호</th>
		<td><h3>${requestScope.dto.memberPw}</h3></td>
	</tr>
	
	<tr>
		<th><h3>이름</th>
		<td><h3>${requestScope.dto.memberName}</h3></td>
	</tr>
	
	<tr>
		<th><h3>성별</th>
		<td><h3>${requestScope.dto.gender}</h3></td>
	</tr>
	
	<tr>
		<th><h3>생년월일</th>
		<td><h3>${requestScope.dto.birthDate}</h3></td>
	</tr>
	
	<tr>
		<th><h3>이메일</th>
		<td><h3>${requestScope.dto.email}</h3></td>
	</tr>
	
	<tr>
		<th><h3>연락처</th>
		<td><h3>${requestScope.dto.mobile}</h3></td>
	</tr>

	<tr>
		<th><h3>주소</th>
		<td><h3>${requestScope.dto.address}</h3></td>
	</tr>
	
	<tr>
		<th><h3>가입일</th>
		<td><h3>${requestScope.dto.entryDate}</h3></td>
	</tr>
	
	<tr>
		<th><h3>등급</th>
		<td><h3>${requestScope.dto.grade}</h3></td>
	</tr>
	
	<c:choose>
		<c:when test='${requestScope.dto.grade == "G"}'>
			<tr>
				<th><h3>마일리지</h3></th>
				<td><h3>${requestScope.dto.mileage}</h3></td>
			</tr>
		</c:when>
		
		<c:when test='${requestScope.dto.grade == "S"}'>
			<tr>
				<th><h3>담당자</h3></th>
				<td><h3>${requestScope.dto.manager}</h3></td>
			</tr>
		</c:when>
	</c:choose>
	
</table>

<button onclick="document.getElementById('id02').style.display='block'" class="btn btn-success btn-lg" style="width:auto;">정보 변경</button>

<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="controller?action=myInfoUpdateSave" method="post">
    <div class="container">
       <font color="#f2f2f2">
      <label><b>아이디</b></label>
      <input type="text" value=${dto.memberId} readonly>
	<font color="#f2f2f2">
      <label><b>비밀번호</b></label>
      <input type="text" value=${dto.memberPw} name="memberPw">
	<font color="#f2f2f2">
	 <label><b>이름</b></label>
      <input type="text" value=${dto.memberName} name="memberName">	
	<font color="#f2f2f2">
	 <label><b>이메일</b></label>
	  <input type="text" value=${dto.email} name="email"><br>
	<font color="#f2f2f2">
	<label><b>연락처</b></label>
	<input type="text" value=${dto.mobile} name="mobile"><br><br>
	
     
        <button type="submit" class="cancelbtn2"  method="post">submit</button><br><br><br><br><br>
        
        <center>&nbsp;&nbsp;<img src="img/banner.png" class="img-banner"></center>
     
    </div>
  </form>
</div>
<script>
var modal2 = document.getElementById('id02');

//When the user clicks anywhere outside of the modal2, close it
window.onclick = function(event) {
if (event.target == modal2) {
   modal2.style.display = "none";
	}
}

</script>


<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>