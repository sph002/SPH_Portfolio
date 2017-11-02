<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.*" %>
<%@ page import="work.model.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>상품 주문</title>
    
  <link rel="stylesheet" href="/pcm/css/style.css">

</head>
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




<body>

<h2>modal4 Login Form</h2>

<button onclick="document.getElementById('id04').style.display='block'" style="width:auto;">Login</button>

<div id="id04" class="modal4">
  
  <form class="modal4-content animate" action="controller?action=login" method="post">
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
  
  <script>
// Get the modal4
var modal4 = document.getElementById('id04');

// When the user clicks anywhere outside of the modal4, close it
window.onclick = function(event) {
    if (event.target == modal4) {
        modal4.style.display = "none";
    }
}

</script>
</body>
</html>