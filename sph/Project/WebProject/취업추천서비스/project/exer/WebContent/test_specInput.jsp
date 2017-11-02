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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
div { border:1px solid; padding:10px; }
</style>


<script language="javascript">
   function setValues(){
      var sh = document.getElementById("company");
      var tt1 = document.getElementById("list1");
      var tt2 = document.getElementById("list2");
      var tt3 = document.getElementById("list3");
      
      if(tt1.value == 0)
         tt1.value = sh.options[sh.selectedIndex].text;
      else if(tt2.value == 0)
         tt2.value = sh.options[sh.selectedIndex].text;
      else
         tt3.value = sh.options[sh.selectedIndex].text;
   }
</script>
<%
	fieldList field = new fieldList();
	String[] univ_tags = new String[1500];
	String[] major_tags = new String[1500];
	univ_tags = field.getList("univ_name");
	major_tags = field.getList("major");
%>
<script>
	var univTags = [
	              <%for(int i=0; i<univ_tags.length; i++){	              
	              	if(i==univ_tags.length-1){%>
	              	'<%=univ_tags[i]%>'
	              		<%}else {%>
	              		'<%=univ_tags[i]%>',	              		
	              <%}}%>
	                     
							
						];
	</script>
	<script>
	var majorTags = [
	              <%for(int i=0; i<major_tags.length; i++){	              
	              	if(i==major_tags.length-1){%>
	              	'<%=major_tags[i]%>'
	              		<%}else {%>
	              		'<%=major_tags[i]%>',	              		
	              <%}}%>
	                     
							
						];
	</script>

<title>main</title>
</head>
 <body>
  
    <center>
        <h2>자기 정보 입력</h2>
        <div id="selfInfo">
           <table border="1">
              <tr>
                 <td>
                    <span style = " font-size:0.7em;  color: black;">학교명</span> 
                    &nbsp;
                  <input type="text" name="univ_name" id="univ_name" size="10">
                    &nbsp;&nbsp;
                  <span style = " font-size:0.7em;  color: black;">학과명</span> 
                    &nbsp;
                  <input type="text" name="major" id="major" size="10">
                  <span style = " font-size:0.7em;  color: black;">학점</span> 
                    &nbsp;
                  <input type="text" name="grade" size="10">
                    &nbsp;&nbsp;
                  <span style = " font-size:0.7em;  color: black;">토익점수</span> 
                    &nbsp;
                  <input type="text" name="toeic" size="10">
                  <span style = " font-size:0.7em;  color: black;">오픽</span> 
                    &nbsp;
                  <select name="opic">
                      <option value="AL" selected="selected">AL</option>
                      <option value="IH">IH</option>
                      <option value="IL">IL</option>
                      <option value="NH">NH</option>
                      <option value="NM">NM</option>
                      <option value="NL">NL</option>
                      
                  </select>
                    &nbsp;&nbsp;
                  <span style = " font-size:0.7em;  color: black;">토스</span> 
                    &nbsp;
                  <select name="toss">
                      <option value="1" selected="selected">Level1</option>
                      <option value="2">Level2</option>
                      <option value="3">Level3</option>
                      <option value="4">Level4</option>
                      <option value="5">Level5</option>
                      <option value="6">Level6</option>
                      <option value="7">Level7</option>
                      <option value="8">Level8</option>
                  </select>
                  &nbsp;&nbsp;
                  <span style = " font-size:0.7em;  color: black;">자격증</span> 
                    &nbsp;
                  <select name="toss">
                      <option value="1" selected="selected">1개</option>
                      <option value="2">2개</option>
                      <option value="3">3개</option>
                      <option value="4">4개</option>
                      <option value="5">5개</option>
                      <option value="6">6개</option>
                      <option value="7">7개</option>
                      <option value="8">8개</option>
                      
                  </select>
                  &nbsp;&nbsp;
                  <span style = " font-size:0.7em;  color: black;">봉사활동</span> 
                    &nbsp;
                  <select name="valunteer">
                      <option value="1" selected="selected">1개</option>
                      <option value="2">2개</option>
                      <option value="3">3개</option>
                      <option value="4">4개</option>
                      <option value="5">5개</option>
                      <option value="6">6개</option>
                      <option value="7">7개</option>
                      <option value="8">8개</option>
                      
                  </select>
                  &nbsp;&nbsp;
                  <span style = " font-size:0.7em;  color: black;">해외연수</span> 
                    &nbsp;
                  <select name="toss">
                      <option value="1" selected="selected">1개</option>
                      <option value="2">2개</option>
                      <option value="3">3개</option>
                      <option value="4">4개</option>
                      <option value="5">5개</option>
                      <option value="6">6개</option>
                      <option value="7">7개</option>
                      <option value="8">8개</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td>
                  <div style="text-align:center">
                     <span style = " font-size:1.7em;  color: black;">자기소개서 입력</span><p><p>
                     <input type="text" style="text-align:center; width:100px; height:20px;" name="toeic" size="100">
                     <input type="submit" value="올리기" style="text-align:center; width:50px; height:30px;"/>
                  </div>
               </td>
            </tr>          
           </table>
      </div>
      <div id="wishCommpany" style="text-align:left">
         <table border="1">
            <tr>
               <td><p><p>
                  &nbsp;&nbsp;<span style ="font-size:1.5em;  color: black;">희망 기업 리스트</span> &nbsp;&nbsp;
                  
                  <select id="company", name="company" onChange="setValues();">
                      <option value="삼성전자" selected="selected">삼성전자</option>
                      <option value="LG">LG</option>
                      <option value="SK">SK</option>
                      <option value="Doosan">Doosan</option>
                  </select><p>
                  <input type="text" name="list1" id="list1">
                  <input type="text" name="list2" id="list2">
                  <input type="text" name="list3" id="list3">
                  <h4><a href="samsung_spec.jsp">스펙 확인</a></h4>
               </td>
            </tr>
         </table>
      </div>
          
    </center>
      <!--   <form name='my_form'>
        <input type='button' id='my_button' value='개수 세기' />
        <hr>
        <input type='text' name='tag' />
        <input type='text' name='tag' />
        <input type='text' name='tag' />
        <input type='text' name='tag' />
        <input type='text' name='tag' />
      </form>
      <script src="//code.jquery.com/jquery.min.js"></script>
      <script>
        $("#my_button").click(function() {
          alert($("input[name=tag]").length);
        });
      </script>
   -->
	<script>
	$(document).ready(function() {
	    $("#univ_name").autocomplete(univTags,{ 
	        matchContains: true,
	        selectFirst: false
	    });
	});
	</script>
	<script>
	$(document).ready(function() {
	    $("#major").autocomplete(majorTags,{ 
	        matchContains: true,
	        selectFirst: false
	    });
	});
	</script>
</body>
</html>