<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.*" %>
<%@ page import="work.model.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원전용 서비스 메인</title>
<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="Resources/css/bootstrap.css">
<link rel="stylesheet" href="/pcm/css/style.css">
<style>
	body {
		background-image: url('img/pcbackground3.jpg'); background-size: cover;
		background-repeat : no-repeat;
	}
	
	/* Full-width input fields */
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

<style>
/* Full-width input fields */
input[type=text], input[type=password] {
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

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    font-size: 20px;
    background-color: #e15b50;
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

/* The modal4 (background) */
.modal4 {
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

/* modal4 Content/Box */
.modal4-content {
    background-color: #17181d;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
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

</style>

<style>



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

/* The modal4 (background) */
.modal4 {
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

/* modal4 Content/Box */
.modal4-content {
    background-color: #a0a0a0;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
    height: auto;
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



</style>
<style>
/* Full-width input fields */
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

<script type="text/javascript">
	function winsinglechat() {
		var winName="1:1 관리자 채팅";

		flag = "left=200, "; //창뜨는위치
		flag += "top=200, "; //창뜨는위치
		flag += "width=800, "; //창크기
		flag += "height=380"; //창크기

		
		window.open("/pcm/controller?action=singleChatting", winName, flag)
	}
	
	function winopenchat() {
		var winName="1:1 관리자 채팅";

		flag = "left=200, "; //창뜨는위치
		flag += "top=200, "; //창뜨는위치
		flag += "width=800, "; //창크기
		flag += "height=380"; //창크기

		
		window.open("/pcm/chatting/chatting.jsp", winName, flag)
	}
</script>


</head>
<body>

<!-- 로그인 후 메뉴 -->
<div class="menu_area" style="text-align:right;">
	<c:choose>
	<c:when test="${not empty sessionScope.memberId and 
		not empty sessionScope.grade}">
		<h1>${sessionScope.memberId}님[${sessionScope.grade}]&nbsp;</h1>
		<button type="button" class="btn btn-success btn-lg" onclick="location.href='/pcm/controller?action=logout'" style="width:auto;">로그아웃</button>
		<button type="button" class="btn btn-warning btn-lg" onclick="location.href='/pcm/controller?action=myInfo'" style="width:auto;">내 정보 조회(변경)</button>
		<button type="button" class="btn btn-danger btn-lg" onclick="location.href='/pcm/member/changePassword.jsp'" style="width:auto;">암호변경</button>
		<button type="button" class="btn btn-primary btn-lg" onclick="document.getElementById('id04').style.display='block'" style="width:auto;">상품주문</button>
		<button type="button" class="btn btn-primary btn-lg" onclick="winopenchat()" style="width:auto;">오픈채팅</button>
		<button type="button" class="btn btn-danger btn-lg" onclick="winsinglechat()" style="width:auto;">관리자 1:1 채팅</button>
		<!-- 관리자 메뉴 -->
		<c:if test="${sessionScope.grade == 'A'}">
			<br><br>
			<h1>[관리자]</h1>
			<button type="button" class="btn btn-warining btn-lg" onclick="location.href='/pcm/controller?action=getMemberAll'" style="width:auto;">전체 회원조회</button>
			<button type="button" class="btn btn-danger btn-lg" onclick="location.href='/pcm/seat/seatStart.jsp'" style="width:auto;">시스템</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/pcm/pcontroller?action=getProductAll'" style="width:auto;">상품 관리</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/pcm/pcontroller?action=getOrderAll'" style="width:auto;">주문 관리</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/pcm/pcontroller?action=getSale'" style="width:auto;">매출 관리</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='/pcm/seatcontroller?action=checkCondition'" style="width:auto;">좌석 관리</button>
				</c:if>
			<c:if test="${sessionScope.grade == 'G'}">
		<%
			SeatDao dao = new SeatDao();
			Seat tmp =  dao.selectOne((String) session.getAttribute("memberId"));
			int seatNo =tmp.getSeatNo();
			String startTime=dao.selectStartTime(seatNo);
			String finishTime=dao.selectFinishTime(seatNo);
		%>
			<table width="400px" class="table-bordered table-striped nanum" height="400" border="1" align="right" border="2" >
				<tr class="info h3">
					<td  width="100px" >
					<h2>좌석번호</h2> 
					</td>
					<td width="300px">
						<h2><%=tmp.getSeatNo()%></h2>
					</td>
				</tr>
				<tr class="success h3">
					<td  width="100px">
					<h2>id</h2>
					</td>
					<td width="300px" class="success">
					<%=tmp.getMemberId()+"["+(String)session.getAttribute("grade")+"]"%>
					</td>
				</tr>
				<tr class="info h3">
					<td  width="100px">
					시작시간
					</td>
					<td width="300px">
						<%=startTime%>
					</td>
				</tr>
				<tr class="success h3">
					<td  width="100px">
					종료시간
					</td>
					<td width="300px">
						<%=finishTime%>
					</td>
				</tr>
			
			</table>
		</c:if>
	</c:when>
	
	<c:when test="${empty sessionScope.memberId or 
		empty sessionScope.grade}">
		<c:set var="message" value="로그인/회원가입 후 사용하시기 바랍니다." />
		<jsp:forward page="/error.jsp" />
	</c:when>
	</c:choose>
</div>

<table width="500px">
<tr> 
<td width="100px" height="600px">
</td>
<td>
	
</td>
</tr>

</table>

<div id="id04" class="modal4">
  
  <form class="modal4-content animate" action="pcontroller?action=order" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id04').style.display='none'" class="close" title="Close modal4">&times;</span>
    </div>

  <div class="plans">
    <div class="plan">
    <h2 class="plan-title">라면</h2>
      <img src="/pcm/img/ramen.jpg">
      <ul class="plan-features">
      <li><strong>라면</strong> 종류/수량</li><br>
        <select name="noodle1">
				<option selected disabled>라면 선택</option>
				<% 
					ProductDao dao = new ProductDao();
					ArrayList<Product> list = dao.selectList("라면");
					Product dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				 %>
						<option value=<%=name %>> <%= name %> </option>
				<%
					}
				%>		
			</select>
			<input type="number" name="noodlecount1" value="0" step="1" min="0" max="100">
			
			<select name="noodle2">
				<option disabled selected>라면 선택</option>
				<% 
					dao = new ProductDao();
					list = dao.selectList("라면");
					dto = null;
				
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				<%
					}
				%>
			</select>
			<input type="number" name="noodlecount2" value="0" step="1" min="0" max="100">
			
			<select name="noodle3">
				<option disabled selected>라면 선택</option>
				<% 
					dao = new ProductDao();
					list = dao.selectList("라면");
					dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				<%
					}
				%>
			</select>
			<input type="number" name="noodlecount3" value="0" step="1" min="0" max="100">
      </ul>
      <input type="reset" class="plan-button" value="취소">
    </div>
    
    <div class="plan plan-tall">
      <h2 class="plan-title">음료</h2>
      <img src="/pcm/img/drink.jpg">
      <ul class="plan-features">
        <li><strong>음료</strong> 종류/수량</li><br>
    		
    		<select name="drink1">
				<option disabled selected>음료 선택</option>
				<% 
					dao = new ProductDao();
					list = dao.selectList("음료");
					dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				<%
					}
				%>
			</select>
			<input type="number" name="drinkcount1" value="0" step="1" min="0" max="100">
			
			<select name="drink2">
				<option disabled selected>음료 선택</option>
				<% 
					dao = new ProductDao();
					list = dao.selectList("음료");
					dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				<%
					}
				%>
			</select>
			<input type="number" name="drinkcount2" value="0" step="1" min="0" max="100">
			
			<select name="drink3">
				<option disabled selected>음료 선택</option>			
				<% 
					dao = new ProductDao();
					list = dao.selectList("음료");
					dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				<%
					}
				%>
			</select>
			<input type="number" name="drinkcount3" value="0" step="1" min="0" max="100">
  
      </ul>
      <input class="plan-button" type="submit" value="주문하기" >
      <!-- <a href="index.html" class="plan-button">Start Now</a> -->
    </div>
    
    
    
    <div class="plan">
      <h2 class="plan-title">빵</h2>
      <img src="/pcm/img/bread.jpg">
      <ul class="plan-features">
      <li><strong>빵</strong> 종류/수량</li><br>
       		<select name="bread1">
				<option disabled selected>빵 선택</option>
				<% 
					dao = new ProductDao();
					list = dao.selectList("빵류");
					dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				
				<%
					}
				%>
			</select>
			<input type="number" name="breadcount1" value="0" step="1" min="0" max="100">
			
			<select name="bread2">
				<option disabled selected>빵 선택</option>
				<% 
					dao = new ProductDao();
					list = dao.selectList("빵류");
					dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				
				<%
					}
				%>
			</select>
			<input type="number" name="breadcount2" value="0" step="1" min="0" max="100">
			
			<select name="bread3">
				<option disabled selected>빵 선택</option>
				<% 
					dao = new ProductDao();
					list = dao.selectList("빵류");
					dto = null;
					
					for (int index = 0 ; index < list.size() ; index++) {
						dto = list.get(index);
						String name = dto.getProductName();
				%>
						<option value=<%=name %>> <%= name %> </option>
				
				<%
					}
				%>
			</select>
			<input type="number" name="breadcount3" value="0" step="1" min="0" max="100">
      </ul>
      
      <input type="button" class="plan-button" value="돌아가기" onclick="location.href='/pcm/result.jsp'">
      </form>
      </div>
    </div>
  </div>

</script>


<script src="http://ajax.googleapis.com/ajax/libs/jqery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>