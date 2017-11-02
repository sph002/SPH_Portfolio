<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="goal.dao.MongoCon"%>
<%@ page import="goal.service.*"%>
<%@ page import="com.sun.org.apache.xml.internal.security.utils.Base64"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!--  자동완성 시작  -->
<script type='text/javascript' src='list-jquery/jquery.js'></script>
<script type='text/javascript' src='list-jquery/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='list-jquery/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='list-jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css"
	href="list-jquery/jquery.autocomplete.css" />

<!--  자동완성  끝   -->
<%
	ServiceR service = new ServiceR();
	String[] tags = new String[1500];
	tags = service.getList("company_name");
%>
<!-- 자동완성시작  -->
<script>
	var availableTags = [
	              <%for (int i = 0; i < tags.length; i++) {
				if (i == tags.length - 1) {%>
	              	'<%=tags[i]%>'
	              		<%} else {%>
	              		'<%=tags[i]%>',	              		
	              <%}
			}%>						
						];
	</script>
<!-- 자동완성 끝  -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>GOAL IN</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

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
		String company_name = (String) request.getAttribute("company_name_output");
		if (company_name == null) {
			company_name = "삼성전자";
		}
		
		Double internAvg = service.getInternAvg(company_name);
		Double volAvg = service.getVolAvg(company_name);
		Double abrTrainAvg = service.getAbrTrainAvg(company_name);
		Double licenseAvg = service.getLicenseAvg(company_name);
	%>
	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"> <i
		class="fa fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<a id="menu-close" href="#"
			class="btn btn-light btn-lg pull-right toggle"> <i
			class="fa fa-times"></i>
		</a>
		<li class="sidebar-brand"><a class="js-scroll-trigger"
			href="MainIndex.jsp">GOAL IN!</a></li>
		<li><a class="js-scroll-trigger" href="MainIndex.jsp">홈</a></li>
		<li><a class="js-scroll-trigger" href="Spec.jsp">스펙 매칭</a></li>
		<li><a class="js-scroll-trigger" href="CompanyAnal.jsp">기업 분석</a>
		</li>
		<li><a class="js-scroll-trigger" href="Hire.jsp">채용 공고</a></li>
		<li><a class="js-scroll-trigger" href="#row">공지사항 혹은 게시판</a></li>
	</ul>
	</nav>

	<!-- Header -->
	<header class="miniheader" id="top">
	<div class="text-vertical-center">
		<h3>스펙 매칭 & 채용정보 제공 서비스 GOAL IN</h3>
		<h1>기업 분석</h1>
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
						<img style="width: 80px;" src="img/home.png">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<img style="width: 80px;" src="img/spec.png">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<img style="width: 80px;" src="img/company.png">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<img style="width: 80px;" src="img/job.png">
						<p>
						<p>
							<a href="MainIndex.jsp"><img style="width: 100px;"
								src="img/button1.png"></a>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<a href="Spec.jsp"><img style="width: 100px;"
								src="img/button2.png"></a>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<a href="CompanyAnal.jsp"><img style="width: 100px;"
								src="img/button3.png"></a>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<a href="Hire.jsp"><img style="width: 100px;"
								src="img/button4.png"></a>
					</div>
				</div>

				<!-- /.row (nested) -->
			</div>
			<!-- /.col-lg-10 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </section>

	<!-- Portfolio -->
	<section id="portfolio" class="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto text-center">
				<form method="post" action="company?action=company_search">
					<font color=#1C86EE style="font-weight: bold; font-size: 30px">기업
						검색</font> <br> <font color="#1C86EE" size="5px">기업명 : </font> <input
						type="text" size="30" name="company_name_input"
						id="company_name_input">
					<button type="submit" class="btn_search">
						<font color=#1C86EE style="font-weight: bold">검색</font>
					</button>
				</form>
			</div>
		</div>
		<!-- /.row (nested) -->
	</div>
	<!-- /.col-lg-10 -->
	</div>
	<!-- /.row -->
	</div>
	<!-- /.container --> </section>
	<!-- 학점 / 토익 / 학교 테이블 -->
	<table width="1500px" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td colspan="3" align="center"><font color=#1C86EE
				style="font-weight: bold; font-size: 30px"><%=company_name%></font><font
			 style="font-size: 30px"> 기업 분석</font></td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		<tr>

			<td width="500px" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr
						style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold">
						<td bgcolor=#1C86EE align="center" height="40"><font
							color=#FFFFFF style="font-size: 18px">Grade Analysis</font></td>
					</tr>
					<tr>
						<td height="200" align="center"
							style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">

							<img height="350" width="350"
							src="data:image/jpg;base64, <%=Base64.encode(service.returnRImg(company_name, "grade"))%> " />

						</td>
					</tr>
				</table>
			</td>

			<td width="500px" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr
						style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold">
						<td bgcolor=#1C86EE align="center" height="40"><font
							color=#FFFFFF style="font-size: 18px">Toeic Analysis</font></td>
					</tr>
					<tr>
						<td height="200" align="center"
							style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
							<img height="350" width="350"
							src="data:image/jpg;base64, <%=Base64.encode(service.returnRImg(company_name, "toeic"))%> " />
						</td>
					</tr>
				</table>
			</td>
			<!-- 워드 클라우드 칸 -->
			<td width="500px" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr
						style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold">
						<td bgcolor=#1C86EE align="center" height="40"><font
							color=#FFFFFF style="font-size: 18px">Keyword Analysis</font></td>
					</tr>
					<tr>
						<td height="200" align="center"
							style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center"><img height="350" width="550"
										src="data:image/jpg;base64, <%=Base64.encode(service.returnRImg3(company_name))%> " />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<!-- 오픽 / 토스 / 학과 테이블 -->
	<table width="1500px" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td width="500px" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr
						style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold">
						<td bgcolor=#1C86EE align="center" height="40"><font
							color=#FFFFFF style="font-size: 18px">Opic Analysis</font></td>
					</tr>
					<tr>
						<td height="200" align="center"
							style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
							<img height="350" width="350"
							src="data:image/jpg;base64, <%=Base64.encode(service.returnRImg(company_name, "opic"))%> " />
						</td>
					</tr>
				</table>
			</td>
			<td width="500px" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr
						style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold">
						<td bgcolor=#1C86EE align="center" height="40"><font
							color=#FFFFFF style="font-size: 18px">Toeic Speaking
								Analysis</font></td>
					</tr>
					<tr>
						<td height="200" align="center"
							style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
							<img height="350" width="350"
							src="data:image/jpg;base64, <%=Base64.encode(service.returnRImg(company_name, "tos"))%> " />
						</td>
					</tr>
				</table>
			</td>
			<td width="500px" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr
						style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold">
						<td bgcolor=#1C86EE align="center" height="40"><font
							color=#FFFFFF style="font-size: 18px">Major Analysis</font></td>
					</tr>
					<tr height="350px">
						<td height="200" align="center"
							style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="30" align="center"><img
										src="http://image.educe.co.kr/common/icon_blue_no01.gif"></td>
									<td align="left"><font color="#3C5D95"> <%
 	out.print(service.getMajor(company_name, 1));
 %>
									</font></td>
									<td width="50" align="center">
										<%
											out.print(service.getPercent(company_name, 1));
										%>%
									</td>
								</tr>
								<tr>
									<td width="30" align="center"><img
										src="http://image.educe.co.kr/common/icon_blue_no02.gif"></td>
									<td align="left"><font color="#3C5D95"> <%
 	out.print(service.getMajor(company_name, 2));
 %>
									</font></td>
									<td width="50" align="center">
										<%
											out.print(service.getPercent(company_name, 2));
										%>%
									</td>
								</tr>
								<tr>
									<td width="30" align="center"><img
										src="http://image.educe.co.kr/common/icon_blue_no03.gif"></td>
									<td align="left"><font color="#3C5D95"> <%
 	out.print(service.getMajor(company_name, 3));
 %>
									</font></td>
									<td width="50" align="center">
										<%
											out.print(service.getPercent(company_name, 3));
										%>%
									</td>
								</tr>
								<tr>
									<td width="30" align="center"><img
										src="http://image.educe.co.kr/common/icon_blue_no04.gif"></td>
									<td align="left"><font color="#3C5D95"> <%
 	out.print(service.getMajor(company_name, 4));
 %>
									</font></td>
									<td width="50" align="center">
										<%
											out.print(service.getPercent(company_name, 4));
										%>%
									</td>
								</tr>
								<tr>
									<td width="30" align="center"><img
										src="http://image.educe.co.kr/common/icon_blue_no05.gif"></td>
									<td align="left"><font color="#3C5D95"> <%
 	out.print(service.getMajor(company_name, 5));
 %>
									</font></td>
									<td width="50" align="center">
										<%
											out.print(service.getPercent(company_name, 5));
										%>%
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<br>
	<hr>
	<br>
	<div style="margin-bottom: 30px;">
		<table width="1500px" border="0" cellspacing="0" cellpadding="0"
			align="center">
			<tr>
				<td height="40" align="center"><font color=#1C86EE
					style="font-weight: bold; font-size: 30px"><%=company_name%></font><font
					style="font-size: 30px"> 합격자 평균 스펙 </font></td>
			</tr>
		</table>
		<br>
		<table width="1500px" border="0" cellspacing="0" cellpadding="0"
			align="center">

			<tr>
				<td width="300px"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold"
					bgcolor=#1C86EE align="center" height="40"><font color=#FFFFFF>&nbsp;</font>
				</td>
				<td width="300px"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold"
					bgcolor=#1C86EE align="center" height="40"><font color=#FFFFFF>자격증</font>
				</td>
				<td width="300px"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold"
					bgcolor=#1C86EE align="center" height="40"><font color=#FFFFFF>연수경험</font>
				</td>
				<td width="300px"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold"
					bgcolor=#1C86EE align="center" height="40"><font color=#FFFFFF>봉사활동</font>
				</td>
				<td width="300px"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE; font-weight: bold"
					bgcolor=#1C86EE align="center" height="40"><font color=#FFFFFF>인턴경험</font>
				</td>
			</tr>
			<tr>
				<td align="center" height="40"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE"
					bgcolor="#1C86EE"><font style="font-weight: bold"
					color=#FFFFFF>평균</font></td>
				<td align="center" height="40"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE;">
					<font style="font-weight: bold; font-size: 20px"> <%
 	out.print(licenseAvg);
 %>
				</font> <font style="font-weight: bold; font-size: 20px" color=#1C86EE>
						개</font>
				</td>
				<td align="center" height="40"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE;">
					<font style="font-weight: bold; font-size: 20px"> <%
 	out.print(abrTrainAvg);
 %>
				</font> <font style="font-weight: bold" color=#1C86EE> 회</font>
				</td>
				<td align="center" height="40"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE;">
					<font style="font-weight: bold; font-size: 20px"> <%
 	out.print(volAvg);
 %>
				</font> <font style="font-weight: bold" color=#1C86EE> 회</font>
				</td>
				<td align="center" height="40"
					style="border-bottom: 1px solid #CECECE; border-left: 1px solid #CECECE; border-right: 1px solid #CECECE;">
					<font style="font-weight: bold; font-size: 20px"> <%
 	out.print(internAvg);
 %>
				</font> <font style="font-weight: bold" color=#1C86EE> 회</font>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<!-- Call to Action -->
	<aside class="call-to-action bg-primary text-white">
	<div class="container text-center">
		<h4>
			<strong>스펙매칭 서비스 Goal IN!</strong>
		</h4>
		<p>
			부산광역시 금정구 부산대학교, 자연대 연구 실험동 301호 <br>김재혁 손평화 조현우 신승현
		</p>
		<ul class="list-unstyled">
			<li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
			<li><i class="fa fa-envelope-o fa-fw"></i> 4senal@gmail.com</li>
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
	<!-- 자동완성 시작  -->
	<script>
	$(document).ready(function() {
	    $("#company_name_input").autocomplete(availableTags,{ 
	        matchContains: true,
	        selectFirst: false
	    });
	});
	</script>
	<!-- 자동완성 끝   -->
</body>
</html>