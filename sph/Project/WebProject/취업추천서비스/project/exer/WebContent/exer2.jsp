<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      </div>
    </header>
    
        <!-- Services -->
    <section id="services" class="services bg-primary text-white">
      <div class="container">
        <div class="row text-center">
          <div class="col-lg-10 mx-auto">
            <hr class="small">
            <div class="row">
              <div class="col-md-3 col-sm-6">
                <div class="service-item">
                  <img style=width:80px; src="img/spec.png">               
                  <p>
                  <p>
                  <a href="#about"><img style=width:100px; src="img/button1.png"></a>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
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
            </div>
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
           <form action="/exer/company?action=search" method="post">
           	<input type="text" name="company_name" id="company_name">
           	<p>
           <button type="submit">검색</button>
           </form>
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
            <h2>채용공고</h2>
				<iframe src ="html.php" width="1000px" height="1024px"></iframe>
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