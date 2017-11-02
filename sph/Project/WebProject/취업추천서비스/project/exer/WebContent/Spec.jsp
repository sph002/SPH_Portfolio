<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="goal.dao.MongoCon" %>
<%@ page import="goal.service.*" %>
 <%@ page import="com.sun.org.apache.xml.internal.security.utils.Base64" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GOAL IN</title>
<script type='text/javascript' src='list-jquery/jquery.js'></script>
<script type='text/javascript' src='list-jquery/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='list-jquery/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='list-jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="list-jquery/jquery.autocomplete.css" />
    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">
		<style>
		.spec_tab {
		border-bottom-width: 2px;
		border-bottom-style: solid;
		border-bottom-color: #3B4F72;
		}
		.spec_board02 th {
		font-size: 14px;
		}
		</style>
  </head>

  <body>

<%
	ServiceR service = new ServiceR();
	String[] univ_tags = new String[1500];
	String[] major_tags = new String[1500];
	univ_tags = service.getList("univ_name");
	major_tags = service.getList("major");
	
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
    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle">
      <i class="fa fa-bars"></i>
    </a>
    <nav id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle">
          <i class="fa fa-times"></i>
        </a>
        <li class="sidebar-brand">
          <a class="js-scroll-trigger" href="MainIndex.jsp">GOAL IN!</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="MainIndex.jsp">홈</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="Spec.jsp">스펙 매칭</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="CompanyAnal.jsp">기업 분석</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="Hire.jsp">채용 공고</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#row">공지사항 혹은 게시판</a>
        </li>
      </ul>
    </nav>
 
    <!-- Header -->
    <header class="miniheader" id="top">
      <div class="text-vertical-center">
        <h3>스펙 매칭 & 채용정보 제공 서비스 GOAL IN</h3>
        <h1>스펙 매칭</h1>
        <p>
        		
      </div>
    </header>
    
     <!-- Services -->
    <section id="services" class="services bg-primary text-white">
      <div class="container">
        <div class="row text-center">
          <div class="col-lg-10 mx-auto">
            <hr class="small">
            <div class="row">
              <!-- <div class="col-md-3 col-sm-6"> -->
                <div class="service-item">
                  <img style=width:80px; src="img/home.png">
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <img style=width:80px; src="img/spec.png"> 
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <img style=width:80px; src="img/company.png"> 
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <img style=width:80px; src="img/job.png">          
                  <p>
                  <p>
                  <a href="MainIndex.jsp"><img style=width:100px; src="img/button1.png"></a>
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <a href="Spec.jsp"><img style=width:100px; src="img/button2.png"></a>
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <a href="CompanyAnal.jsp"><img style=width:100px; src="img/button3.png"></a>
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <a href="Hire.jsp"><img style=width:100px; src="img/button4.png"></a>
                </div>
              </div> 
             <!--  <div class="col-md-3 col-sm-6">
                <div class="service-item">
                  <img style=width:80px; src="img/anal.png">    
                  <p>
                  <p>
                  <a href="#analysis"><img style=width:100px; src="img/button2.png"></a>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="service-item">
                  <img style=width:80px; src="img/job.png">   
                  <p>
                  <p>
                  <a href="#portfolio"><img style=width:100px; src="img/button3.png"></a>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="service-item">
                  <img style=width:80px; src="img/arsenal.png">   
                  <p>
                  <p>
                  <a href="#"><img style=width:100px; src="img/button4.png"></a>
                </div>
              </div>
            </div> -->
            <!-- /.row (nested) -->
          </div>
          <!-- /.col-lg-10 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container -->
    </section>
        
    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
     
<center>
            <font color=#1C86EE style="font-weight:bold; font-size:30px; align:center">본인 스펙 입력</font>
        </center>
    <br>
      <form method="post" action="company?action=spec_search">
           <table width="1800px" align="center">
          
              <tr >
                 <td align="center">
                    <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">대학교명 : </font> 
                    &nbsp;
                  <input type="text" name="univ_name" id="univ_name" size="10">
              
                    </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">학과명 : </font> 
                    &nbsp;
                  <input type="text" name="major" id="major" size="10">
                  </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">평균학점 : </font> 
                    &nbsp;
                  <input type="text" name="grade" id="grade" size="10">
        
                  </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">토익점수 : </font> 
                    &nbsp;
                  <input type="text" name="toeic" id="toeic" size="10">
                  </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">오픽등급 : </font> 
                    &nbsp;
                  <select name="opic" id="opic">
                      <option value="0" selected="selected">없음</option>
                      <option value="AL">AL</option>
                      <option value="IH">IH</option>
                      <option value="IM">IM</option>
                      <option value="IL">IL</option>
                      <option value="NH">NH</option>
                      
                  </select>
         
                  </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">토스등급 : </font> 
                    &nbsp;
                  <select name="tos" id="tos">
                      <option value="0" selected="selected">없음</option>
                      <option value="1">Level1</option>
                      <option value="2">Level2</option>
                      <option value="3">Level3</option>
                      <option value="4">Level4</option>
                      <option value="5">Level5</option>
                      <option value="6">Level6</option>
                      <option value="7">Level7</option>
                      <option value="8">Level8</option>
                  </select>
       
                  </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">자격증 수 : </font>  
                    &nbsp;
                  <select name="license" id="license">
                      <option value="0" selected="selected">0개</option>
                      <option value="1">1개</option>
                      <option value="2">2개</option>
                      <option value="3">3개</option>
                      <option value="4">4개</option>
                      <option value="5">5개</option>
                      <option value="6">6개</option>
                      <option value="7">7개</option>
                      <option value="8">8개</option>
                      
                  </select>
            
                  </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">봉사활동 수 : </font> 
                    &nbsp;
                  <select name="vol" id="vol">
                      <option value="0" selected="selected">0회</option>
                      <option value="1">1회</option>
                      <option value="2">2회</option>
                      <option value="3">3회</option>
                      <option value="4">4회</option>
                      <option value="5">5회</option>
                      <option value="6">6회</option>
                      <option value="7">7회</option>
                      <option value="8">8회</option>
                      
                  </select>
            
                  </td>
                  <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">해외연수 : </font> 
                    &nbsp;
                  <select name="abr_train" id="abr_train">
                      <option value="0" selected="selected">0회</option>
                      <option value="1">1회</option>
                      <option value="2">2회</option>
                      <option value="3">3회</option>
                      <option value="4">4회</option>
                      <option value="5">5회</option>
                      <option value="6">6회</option>
                      <option value="7">7회</option>
                      <option value="8">8회</option>
                  </select>
               </td>
               <td align="center">
                  <font color=#1C86EE style="font-weight:bold; font-size:20px; align:center">인턴횟수 : </font> 
                    &nbsp;
                  <select name="intern" id="intern">
                      <option value="0" selected="selected">0회</option>
                      <option value="1">1회</option>
                      <option value="2">2회</option>
                      <option value="3">3회</option>
                      <option value="4">4회</option>
                      <option value="5">5회</option>
                      <option value="6">6회</option>
                      <option value="7">7회</option>
                      <option value="8">8회</option>
                  </select>
               </td>
            </tr>
            
            <tr>
            <td colspan="10" align="center">
            <br>
            <button type="submit" class="btn_search" style="width:250px; height:50px">
            		<font color=#1C86EE style="font-weight:bold">스펙 분석</font>
            	</button>
            	</td>
            </tr>
            <tr style="border-bottom: 1px solid #CECECE">
            <td colspan="10">&nbsp;</td></tr>
           <tr><td colspan="10">&nbsp;</td></tr>
           </table>
           </form>
                       
    </section>
<br>

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary text-white">
      <div class="container text-center">
        <h4>
            <strong>스펙매칭 서비스 Goal IN!</strong>
            </h4>
            <p>부산광역시 금정구 부산대학교, 자연대 연구 실험동 301호
              <br>김재혁 손평화 조현우 신승현</p>
            <ul class="list-unstyled">
              <li>
                <i class="fa fa-phone fa-fw"></i>
                (123) 456-7890</li>
              <li>
                <i class="fa fa-envelope-o fa-fw"></i>
                4senal@gmail.com</li>
            </ul>
            <hr class="small">
            <h3>Copyright &copy; 4senal Website 2017</h3>
      </div>
    </aside>

    <!-- Bootstrap core JavaScript -->
<!-- 
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
 -->
    <!-- Plugin JavaScript -->
<!--     <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 -->
    <!-- Custom scripts for this template -->
<!--     <script src="js/stylish-portfolio.js"></script>
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