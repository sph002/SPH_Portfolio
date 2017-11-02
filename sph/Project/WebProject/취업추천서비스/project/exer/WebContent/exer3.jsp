<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="goal.dao.MongoCon" %>
<%@ page import="goal.service.*" %>
 <%@ page import="com.sun.org.apache.xml.internal.security.utils.Base64" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%
specService tmp = new specService();
Double internAvg=tmp.getInternAvg("현대자동차");
Double volAvg=tmp.getVolAvg("현대자동차");
Double abrTrainAvg=tmp.getAbrTrainAvg("현대자동차");
Double licenseAvg=tmp.getLicenseAvg("현대자동차");
specMajor tmp2 = new specMajor();
specWordCloud tmp3 = new specWordCloud();
Rserve_C rc = new Rserve_C();

%>
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
          <a class="js-scroll-trigger" href="#top">GOAL IN!</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#top">홈</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#services">퀵 메뉴</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#about">스펙 매칭</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#analysis">자소서 분석</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#portfolio">채용공고</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#row" onclick=$( "#menu-close").click();>Contact</a>
        </li>
      </ul>
    </nav>
 
    <!-- Header -->
    <header class="header" id="top">
      <div class="text-vertical-center">
        <img style=width:120px; src="img/logo.png">  
        <h1>스펙 매칭 & 채용정보 제공 서비스 <p> GOAL IN</h1>
        <hr />
        <h3>취업까지 한번에 GOAL IN! 저희 GOAL IN은 사용자의 스펙을 입력 받아 빅데이터 분석을 통하여 그와 유사한 스펙을 가진 자들의 기업 합격 현황과 <p><p> 추천 기업을 소개해주고 기존 채용 합격자들의 자기소개서 분석을 통하여 해당 기업의 핵심 키워드를 제공해주는 종합 채용 도움 서비스입니다.</h3>

        <a href="./jsp/specInput.jsp" class="btn btn-dark btn-lg js-scroll-trigger">이용</a>
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
                  <img style=width:80px; src="img/spec.png">
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <img style=width:80px; src="img/anal.png"> 
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <img style=width:80px; src="img/job.png"> 
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <img style=width:80px; src="img/arsenal.png">          
                  <p>
                  <p>
                  <a href="#about"><img style=width:100px; src="img/button1.png"></a>
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <a href="#analysis"><img style=width:100px; src="img/button2.png"></a>
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <a href="#portfolio"><img style=width:100px; src="img/button3.png"></a>
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  <a href="#"><img style=width:100px; src="img/button4.png"></a>
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
    
        <!-- About -->
    <section id="about" class="about">
      <div class="container text-center">
      
               <!-- 스펙 매칭 입력 창 주석 시작
               
        <h2>스펙 매칭 입력 창
        <h4>자기 정보 입력</h4>
        <div id="selfInfo">
           <table border="1">
              <tr>
                 <td>
                    <span style = " font-size:0.7em;  color: black;">학교명</span> 
                    &nbsp;
                  <select name="university">
                      <option value="">학교선택</option>
                      <option value="부산대학교">부산대학교</option>
                      <option value="부경대학교">부경대학교</option>
                      <option value="동아대학교">동아대학교</option>
                  </select>
                    &nbsp;&nbsp;
                  <span style = " font-size:0.7em;  color: black;">학과명</span> 
                    &nbsp;
                  <select name="major">
                      <option value="">학과선택</option>
                      <option value="컴퓨터공학과">컴퓨터공학과</option>
                      <option value="산업공학과">산업공학과</option>
                      <option value="경영정보학과">경영정보학과</option>
                  </select>
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
      </div>
      
              스펙 매칭 입력 창 주석 끝-->
              
              <!-- 스펙 그래프 시작 -->
              
     <div style="width:695px; margin-bottom:25px; clear:both; align:center">
 			  <!-- 기업이름 + 합격자 기본스펙 구분  -->
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="20" valign="top" align="center"><strong><font color="#E06729">기업이름</font> 합격자 기본스펙</strong></td>
        </td>
      </tr>
    </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="spec_tab">
      <tr>
        <td></td>
      </tr>
    </table>
       
			<!-- 학점 / 토익 / 학교 테이블 -->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" >
            <tr>
            <th height="29" bgcolor="#FFCECE" style="font-size:14px;
								border-bottom: 1px solid #CECECE;
								border-left: 1px solid #CECECE;
								border-right: 1px solid #CECECE;"><strong>학점</strong></th>
            </tr>
            <tr>
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
              
             <img height="350" width="350" src="data:image/jpg;base64, <%=Base64.encode(rc.returnRImg("삼성전자", "grade"))%> "/>
              
              </td>
            </tr>
          </table>
        </td>
        <td width="25%" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" >
            <tr>
             <th height="29" bgcolor="#FFCECE" style="font-size:14px;
								border-bottom: 1px solid #CECECE;
								border-left: 1px solid #CECECE;
								border-right: 1px solid #CECECE;"><strong>토익</strong></th>
            </tr>
            <tr> 
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;"> 
    <img height="350" width="350" src="data:image/jpg;base64, <%=Base64.encode(rc.returnRImg("삼성전자", "toeic"))%> "/>
              </td>
            </tr>
          </table>
        </td>

        <!-- 출신학교 칸 주석 시작
        <td width="50%" valign="top">
          <table width="100%" border="1" cellpadding="0" cellspacing="0">
            <tr>
              <th height="29" bgcolor="#FFCECE" style="font-size:14px;
										border-bottom: 1px solid #AFBADD;
										border-left: 1px solid #AFBADD;
										border-right: 1px solid #AFBADD;"><strong>출신학교</strong></th>
            </tr>
            <tr>
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no01.gif"></td>
                    <td align="left"><font color="#3C5D95">경북대학교</font></td>
                    <td width="50" align="center" >5.7%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no02.gif"></td>
                    <td align="left"><font color="#3C5D95">인하대학교</font></td>
                    <td width="50" align="center" >4.6%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no03.gif"></td>
                    <td align="left"><font color="#3C5D95">성균관대(자과캠)</font></td>
                    <td width="50" align="center" >4.5%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no04.gif"></td>
                    <td align="left"><font color="#3C5D95">영남대학교</font></td>
                    <td width="50" align="center" >3.3%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no05.gif"></td>
                    <td align="left"><font color="#3C5D95">아주대학교</font></td>
                    <td width="50" align="center" >3.3%</td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
         출신 학교 칸 주석 끝-->
         
        <!-- 워드 클라우드 칸 -->
        <td width="50%" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <th height="29" bgcolor="#FFCECE" style="font-size:14px;
									border-bottom: 1px solid #CECECE;
									border-left: 1px solid #CECECE;
									border-right: 1px solid #CECECE;"><strong>WordCloud</strong></th>
            </tr>
            <tr>
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                 <tr> 
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;"> 
    								 <img height="350" width="350" src="data:image/jpg;base64, <%=Base64.encode(tmp3.returnRImg3("삼성전자"))%> "/>
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
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" >
            <tr>
            <th height="29" bgcolor="#FFCECE" style="font-size:14px;
								border-bottom: 1px solid #CECECE;
								border-left: 1px solid #CECECE;
								border-right: 1px solid #CECECE;"><strong>오픽</strong></th>
            </tr>
            <tr>
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
               <img height="350" width="350" src="data:image/jpg;base64, <%=Base64.encode(rc.returnRImg("삼성전자", "opic"))%> "/>
              </td>
            </tr>
          </table>
        </td>
        <td width="25%" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" >
            <tr>
              <th height="29" bgcolor="#FFCECE" style="font-size:14px;
									border-bottom: 1px solid #CECECE;
									border-left: 1px solid #CECECE;
									border-right: 1px solid #CECECE;"><strong>토스</strong></th>
            </tr>
            <tr>
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;">
              <img height="350" width="350" src="data:image/jpg;base64, <%=Base64.encode(rc.returnRImg("삼성전자", "tos"))%> "/>
               </td>
            </tr>
          </table>
        </td>
        <td width="50%" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <th height="29" bgcolor="#FFCECE" style="font-size:14px;
									border-bottom: 1px solid #CECECE;
									border-left: 1px solid #CECECE;
									border-right: 1px solid #CECECE;"><strong>출신학과</strong></th>
            </tr>
            <tr>
              <td height="200" align="center" style="border-bottom: 1px solid #d1d1d1; border-left: 1px solid #d1d1d1; border-right: 1px solid #d1d1d1;"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no01.gif"></td>
                    <td align="left"><font color="#3C5D95"><%out.print(tmp2.getMajor("현대자동차",1));%></font></td>
                    <td width="50" align="center" ><%out.print(tmp2.getPercent("현대자동차",1));%>%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no02.gif"></td>
                    <td align="left"><font color="#3C5D95"><%out.print(tmp2.getMajor("현대자동차",2));%></font></td>
                    <td width="50" align="center" ><%out.print(tmp2.getPercent("현대자동차",2));%>%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no03.gif"></td>
                    <td align="left"><font color="#3C5D95"><%out.print(tmp2.getMajor("현대자동차",3));%></font></td>
                    <td width="50" align="center" ><%out.print(tmp2.getPercent("현대자동차",3));%>%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no04.gif"></td>
                    <td align="left"><font color="#3C5D95"><%out.print(tmp2.getMajor("현대자동차",4));%></font></td>
                    <td width="50" align="center" ><%out.print(tmp2.getPercent("현대자동차",4));%>%</td>
                  </tr>
                  <tr>
                    <td width="30" align="center"><img src="http://image.educe.co.kr/common/icon_blue_no05.gif"></td>
                    <td align="left"><font color="#3C5D95"><%out.print(tmp2.getMajor("현대자동차",5));%></font></td>
                    <td width="50" align="center" ><%out.print(tmp2.getPercent("현대자동차",5));%>%</td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
        <p>
    
  <div style="margin-bottom:30px; width:695px">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="20" valign="top" align="center"><strong><font color="#E06729">기업이름</font> 합격자 기타스펙</strong></td>
        </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" font-size="8px" class="spec_board02" >
      <tr>
        <th width="130" bgcolor="#FFCECE" 
        style="border-bottom: 1px solid #CECECE;
  								 border-left: 1px solid #CECECE;
  								 border-right: 1px solid #CECECE;">&nbsp;</th>
        <th width="130" bgcolor="#FFCECE" 
        style="border-bottom: 1px solid #CECECE;
							    border-left: 1px solid #CECECE;
								  border-right: 1px solid #CECECE;">자격증</th>
        <th width="130" bgcolor="#FFCECE" 
        style="border-bottom: 1px solid #CECECE;
								  border-left: 1px solid #CECECE;
								  border-right: 1px solid #CECECE;">연수경험</th>
        <th width="130" bgcolor="#FFCECE" 
        style="border-bottom: 1px solid #CECECE;
								  border-left: 1px solid #CECECE;
								  border-right: 1px solid #CECECE;">봉사활동</th>
        <th width="130" bgcolor="#FFCECE" 
        style="border-bottom: 1px solid #CECECE;
								  border-left: 1px solid #CECECE;
								  border-right: 1px solid #CECECE;">인턴경험</th>
      </tr>
      <tr>
        <th class="thblue" style="border-bottom: 1px solid #CECECE;
																				  border-left: 1px solid #CECECE;
																				  border-right: 1px solid #CECECE" bgcolor="#ECECEC">평균</th>
        <td align="center" style="border-bottom: 1px solid #CECECE;
																				  border-left: 1px solid #CECECE;
																				  border-right: 1px solid #CECECE;" ><%out.print(licenseAvg);%>개</td>
        <td align="center" style="border-bottom: 1px solid #CECECE;
																				  border-left: 1px solid #CECECE;
																				  border-right: 1px solid #CECECE;" ><%out.print(abrTrainAvg);%>회</td>
        <td align="center" style="border-bottom: 1px solid #CECECE;
																				  border-left: 1px solid #CECECE;
																				  border-right: 1px solid #CECECE;" ><%out.print(volAvg);%>회</td>
        <td align="center" style="border-bottom: 1px solid #CECECE;
																				  border-left: 1px solid #CECECE;
																				  border-right: 1px solid #CECECE;" ><%out.print(internAvg);%>회</td>
      </tr>
    </table>
  </div>
</div>       
      <!-- /.container -->
    </section>


    <!-- About -->
    <section id="analysis" class="analysis">
      <div class="container text-center">
       <h1> 자소서 분석 </h1>
       </div>
      <!-- /.container -->
    </section>     
      
    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 mx-auto text-center">
            <h2>공채달력</h2>
										<!-- iframe -->
										<iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/month" frameborder="0"
										width="1000px" height="1250px" scrolling="auto"></iframe> 
										<!-- 주 단위 <iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" frameborder="0"
										width="790px" height="400px" scrolling="auto"></iframe> --> 
										<p>
										<p>
 							 <h2>채용 검색</h2>
 							 			<p>
										<!-- <iframe id="Search" name="Search" src="http://192.168.152.3/web.php" width="600px" height="300px"></iframe> -->
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

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary text-white">
      <div class="container text-center">
        <h3>후원 부탁드립니다</h3>
        <a href="#" class="btn btn-lg btn-light">계좌에서 돈을 뽑아 가주지!</a>
        <a href="#" class="btn btn-lg btn-dark">도와달라!</a>
      </div>
    </aside>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-10 mx-auto text-center">
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
                <a href="mailto:name@example.com">4senal@example.com</a>
              </li>
            </ul>
            <br>
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook fa-fw fa-3x"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter fa-fw fa-3x"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-dribbble fa-fw fa-3x"></i>
                </a>
              </li>
            </ul>
            <hr class="small">
            <p class="text-muted">Copyright &copy; Your Website 2017</p>
          </div>
        </div>
      </div>
      <a id="to-top" href="#top" class="btn btn-dark btn-lg js-scroll-trigger">
        <i class="fa fa-chevron-up fa-fw fa-1x"></i>
      </a>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/stylish-portfolio.js"></script>

  </body>
</html>