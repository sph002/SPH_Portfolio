<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PC</title>

<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="Resources/css/bootstrap.css">

<style>
	body {
		background-image: url('img/pcbackground2.jpg'); background-size: cover;
		background-repeat : no-repeat;
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
	
	/* Extra styles for the cancel button */
	.cancelbtn {
	    width: auto;
	    padding: 10px 18px;
	    font-size: 20px;
	    background-color: #e15b50;
	}
	
	.cancelbtn2 {
    padding: 14px 14px;
    background-color: #fcb259;
    font-size: 20px;
    float:left;
    width:50%;
	}
	
	.signbtn {
	    padding: 14px 14px;
	    background-color: #fcb259;
	    font-size: 20px;
	    float:left;
	    width:100%;
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
	
	img.avatar {
	    width: 40%;
	    border-radius: 40%;
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
	    padding-top: 60px;
	}
	
	/* Modal Content/Box */
	.modal-content {
	    background-color: #17181d;
	    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
	    border: 1px solid #888;
	    width: 80%; /* Could be more or less, depending on screen size */
	}
	
	.radio {
	font-color: #f2f2f2;
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
<script type="text/javascript">
</script>


<script type="text/javascript">
	function winfind() {
		var winName="아이디/비밀번호 찾기";

		flag = "left=200, "; //창뜨는위치
		flag += "top=200, "; //창뜨는위치
		flag += "width=800, "; //창크기
		flag += "height=515"; //창크기

		
		window.open("/pcm/member/memberIdAndPw.jsp", winName, flag)
	}
</script>

</head>
<body onload="document.getElementById('id01').style.display='block'">

<table width="2000px">
<tr> 
<td width="1160px" height="760px">
</td>
<td>
	<button type="button" class="btn btn-danger btn-lg" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button><br><br>
</td>
</tr>

</table>

c

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/pcm/controller?action=login" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="./img/loginlogo.jpg" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <font color="#f2f2f2">
      <label><b>UserName</b></label>     
      <input type="text" placeholder="Enter Username" name="memberId" required>
      <font color="#f2f2f2">
      <label><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="memberPw" required>
        
      <button class="btn btn-warning btn-lg" type="submit"><b>로그인</b></button>
      <input type="checkbox" checked="checked"> Remember me
    </div>

    <div class="container" style="background-color:#17181d">
      <button type="button" class="btn-danger btn-lg caclebtn" onclick="document.getElementById('id01').style.display='none'" style="width:auto;">Cancel</button>
      <button type="button" class="btn-primary btn-lg" onclick="document.getElementById('id02').style.display='block', document.getElementById('id01').style.display='none'" style="width:auto;">회원가입</button>
      <div align="right"><button type="button" class="btn btn-success btn-lg" onclick="winfind(), document.getElementById('id01').style.display='none'" style="width:auto;">아이디/비밀번호 찾기</button>
      </div>      
    </div>
  </form>
</div>

<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="/pcm/controller?action=joinSave" method="post">
    <div class="container">
    <font color="#f2f2f2">
      <label><b>아이디</b></label>
      <input type="text" placeholder="아이디 4~20자리 이내" name="memberId" required title="아이디 입력">
	<font color="#f2f2f2">
      <label><b>비밀번호</b></label>
      <input type="password" placeholder="비밀번호 6~20자리 이내" name="memberPw" required="비밀번호 입력">
	<font color="#f2f2f2">
      <label><b>비밀번호 확인</b></label>
      <input type="password" placeholder="비밀번호 확인" name="memberPw" required><br><br>
    <font color="#f2f2f2">
      <label><b>이름</b></label>
      <input type="text" placeholder="이름" name="memberName" required title="이름 입력">
    <font color="#f2f2f2">
      <label><b>성별</b></label>
      <input class="radio" type="radio" name="gender" value="남" checked>남 &nbsp;
	  <input class="radio" type="radio" name="gender" value="여" checked>여<br><br>
      <font color="#f2f2f2">
     <label><b>생년월일</b></label>
      <input type="text" name="birthDate" maxlength="12" placeholder="년(4자)/월(2자)/일(2자)"><br>
	<font color="#f2f2f2">
	 <label><b>연락처</b></label>
      <input type="text" name ="mobile" required
			placeholder="연락처 필수항목" title="휴대폰 입력">	
	<font color="#f2f2f2">
	 <label><b>이메일</b></label>
	  <input type="text" name ="email" required 
			placeholder="이메일 필수항목" title="이메일 입력"><br>
	<font color="#f2f2f2">
	<label><b>주소</b></label>
	<input type="text" size="50" name="address"/><br><br>
	
      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="btn-danger btn-lg caclebtn">Cancel</button>
        <button type="submit" class="btn-success btn-lg signupbtn" >가입</button>
      </div>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

var modal2 = document.getElementById('id02');

//When the user clicks anywhere outside of the modal2, close it
window.onclick = function(event) {
 if (event.target == modal2) {
     modal2.style.display = "none";
	}
}

</script>



<!-- footer area -->
<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

</body>
</html>











