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
String univ_name = request.getParameter("univ_name");
String major = request.getParameter("major");
double grade = Double.parseDouble(request.getParameter("grade"));
int toeic = Integer.parseInt(request.getParameter("toeic"));
String opic = request.getParameter("opic");
int tos = Integer.parseInt(request.getParameter("tos"));
int license = Integer.parseInt(request.getParameter("license"));
int vol = Integer.parseInt(request.getParameter("vol"));
int abr_train = Integer.parseInt(request.getParameter("abr_train"));
int intern = Integer.parseInt(request.getParameter("intern"));
ServiceR service = new ServiceR();
String[][] list=service.getReclist(major, univ_name, grade, toeic, opic, tos, license, abr_train, vol, intern);
%>


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
     
    <br>

	<table width="1800px" align="center">
		<tr>
			<td colspan="9" align="center"><font color=#1C86EE
				style="font-weight: bold; font-size: 30px; align: center">스펙
					분석</font>
				<hr></td>
		</tr>
		<tr>
			<td>스펙 분석 결과 자리 - 밑에 내용 지우고 하기</td>
		</tr>
		<tr>
			<table width="100%" border="1" align="center" cellspacing="0" cellpadding="0">
				<tr>
					<td> 순위 	</td>
					<td> 기업	 </td>
					<td> 부서명</td>
					<td> 전공 	</td>
					<td> 학점	</td>
					<td> 토익  	</td>
					<td> 오픽  	</td>
					<td> 토스  	</td>
					<td> 자격증</td>
					<td> 대외활동 </td>
					<td> 봉사활동 </td>
					<td> 인턴</td>
				</tr>
				<tr>
					<td width="30" align="center"><img
						src="http://image.educe.co.kr/common/icon_blue_no01.gif"></td>
				 
							<%for(int col=1;col<13;col++){
								if (col ==4){
									continue;
									}%>
							
							<td align="left"><font color="#3C5D95"> <%out.print(list[1][col]); %></font></td>
							<% }
							%>
				</tr>
				<tr>
					<td width="30" align="center"><img
						src="http://image.educe.co.kr/common/icon_blue_no02.gif"></td>
				 					
					<%for(int col=1;col<13;col++){
								if (col ==4){
									continue;
									}%>
							
							<td align="left"><font color="#3C5D95"> <%out.print(list[2][col]); %></font></td>
							<% }
							%>
				</tr>

				<tr>
					<td width="30" align="center"><img
						src="http://image.educe.co.kr/common/icon_blue_no03.gif"></td>
				 
							<%for(int col=1;col<13;col++){
								if (col ==4){
									continue;
									}%>
							<td align="left"><font color="#3C5D95"> <%out.print(list[3][col]); %></font></td>
					<% }
							%>
					
				</tr>

	</table>




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