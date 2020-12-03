<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
	<title>공지사항, 찜, 알림</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
<script>
	function noticelist(){
		location.href="noticelist";
	}
	

	function echogo(){
		location.href="echogo";
	}

		
	function cookiecheck(){
		alert(document.cookie);
	}
</script>
<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="images/favicon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/maincss/style.css">
<style>
	@import url("maincss/font-awesome.css") screen;
	@import url("bootstrap.css") screen;
	@import url("owl.carousel.css") screen;
	@import url("webapp/resources/dist/maincss/pe-icon-7-stroke.css") screen;
</style>
        <!--[if lt IE 9]>
            <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script>window.html5 || document.write('<script src="js/vendor/html5shiv.js"><\/script>')</script>
        <![endif]-->
</head>
<body>
  <!-- Insert these scripts at the bottom of the HTML, but before you use any Firebase services -->

  <!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
  <script src="/__/firebase/7.23.0/firebase-app.js"></script>

  <!-- If you enabled Analytics in your project, add the Firebase SDK for Analytics -->
  <script src="/__/firebase/7.23.0/firebase-analytics.js"></script>

  <!-- Add Firebase products that you want to use -->
  <script src="/__/firebase/7.23.0/firebase-auth.js"></script>
  <script src="/__/firebase/7.23.0/firebase-firestore.js"></script>


	<div id="cookieid"></div>
	<button onclick="echogo()">실시간 채팅가기</button>
	<button onclick="cookiecheck()">쿠키 확인</button>
	
	<script>
	 var cookieidvalue = getCookie("userinfo");
	 document.getElementById("cookieid").innerHTML = cookieidvalue;
	 
	 //쿠키 가져오기 함수
	 function getCookie(cName) {
		 cName = cName + '=';
		 // userinfo= /9   0~8
			 
		 var cookieData = document.cookie;
		 // 모든 쿠키 호출
		 
		 var start = cookieData.indexOf(cName);
		 // userinfo의 인덱스 위치 찾음 /0
		 
		 var cValue = ''; // 값 선언
		 
		 if(start != -1) // 탐색하려는 문자열이 존재한다면 
		 	{start += cName.length; //0+9 =9
		 	
		 	 var end = cookieData.indexOf(';', start);
		 							//	 ;를          0부터	 9미만 까지 찾겠다
		 	 //
		 	 if(end == -1) // 탐색하려는 문자열이 없다면 
			 	end = cookieData.length; //36
		 
			 cValue = cookieData.substring(start, end); 
			 	//							9		36
			 //string.substring(from,to)
			 /*
				from과 to 모두 index 0부터 시작하는 위치 값을 가진다.
				from이 to 보다 작으면 from부터 to사이의 문자열을 리턴한다.
				from이 to 보다 크면 to부터 from 사이의 문자열을 리턴한다.
				from과 to가 같으면 빈문자열을 리턴한다.		 
			 */
		 	}
		 return unescape(cValue);
	 }
	
	 /* 
	 
	  indexOf : 문자열에서 특정한 문자열의  인덱스 값을 반환한다
	     탐색하려는 문자열이 존재하지 않으면 -1 반환
	     
	  stringValue.indexOf(searchValue[,fromIndex])
	  
	  searchValue - String, 필수, 탐색하고 싶은 문자열
	  fromIndex - Integer(0<fromIndex<stringValue.length-1), 옵션
	  
	  var stringValue = '생활코딩 - 자바스크립트 레퍼런스';
	  alert(stringValue.indexOf('생활')); // 0
	     처음 발견된 위치에 있는 index값 리턴
	  
	  alert(stringValue.indexOf('코딩')); // 2
	  
	  
	  */
	  function basketgo(){
			basketinsertgo.submit();
	  }
	</script>
    <jsp:include page="homeInclude.jsp" flush="false" />
    
<!--     <button onclick="location.href='kakaomap'">티맵</button> -->
    
        <section class="search-section">
            <div class="container">
                <div class="row subscribe-from">
                    <div class="col-md-12">
                        <form class="form-inline col-md-12 wow fadeInDown animated">
                            <div class="form-group">
                                <input type="email" class="form-control subscribe" id="email" placeholder="Search...">
                                <button class="suscribe-btn" ><i class="pe-7s-search"></i></button>
                            </div>
                        </form><!-- end /. form -->
                    </div>
                </div><!-- end of/. row -->
            </div><!-- end of /.container -->
        </section><!-- end of /.news letter section -->

        <div style="background-color:#e9f0fd;">
        <section class="slider-section">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators slider-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/resources/img/잉보크.gif" width="1648" height="500" alt="">
                        <div class="carousel-caption">
                        <br><br><br>
                        <h2>광고주님을 모십니다.</h2>
                     <!--        <h2>DRESSES <b>&</b> JEANS</h2>
                            <h3>FROM OURFAMOUS BRANDS <Span>SALE</Span></h3> -->
                            <a href="#">Buy Now</a>
                        </div>
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/resources/img/아잉대마왕.gif" width="1648" height="500" alt="">
                        <div class="carousel-caption">
                            <h2>DRESSES <b>&</b> JEANS</h2>
                            <h3>FROM OURFAMOUS BRANDS <Span>SALE</Span></h3>
                            <a href="#">Buy Now</a>
                        </div>
                    </div>
                    <div class="item ">
                        <img src="images/slider.jpg" width="1648" height="600" alt="">
                        <div class="carousel-caption">
                            <h2>DRESSES <b>&</b> JEANS</h2>
                            <h3>FROM OURFAMOUS BRANDS <Span>SALE</Span></h3>
                            <a href="#">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	</div>
     <section class="service-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 wow fadeInRight animated" data-wow-delay="0.1s">
                        <div class="service-item">
                        	<a href = "officelist?company=CU"><img src="${pageContext.request.contextPath}/resources/imglogo/cu.png" style = "width : 100px; hegith : 100px"></a>
                            <h3>CU</h3>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 wow fadeInRight animated" data-wow-delay="0.2s">
                        <div class="service-item">
                            <a href = "officelist?company=GS"><img src="${pageContext.request.contextPath}/resources/imglogo/gs.jpg" style = "width : 100px; hegith : 100px"></a>
                            <h3>GS25</h3>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 wow fadeInRight animated" data-wow-delay="0.3s">
                        <div class="service-item">
                            <a href = "officelist?company=7-ELEVEN"><img src="${pageContext.request.contextPath}/resources/imglogo/7.png" style = "width : 100px; hegith : 100px"></a>
                            <h3>7-ELEVEN</h3>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 wow fadeInRight animated" data-wow-delay="0.4s">
                        <div class="service-item">
                            <a href = "officelist?company=E-MART"><img src="${pageContext.request.contextPath}/resources/imglogo/emart.png" style = "width : 100px; hegith : 100px"></a>
                            <h3>E-MART</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="new-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titie-section wow fadeInDown animated ">
                            <h1>NEW PRODUCT</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
               <c:forEach items="${plist}" var="plist">

                    <div class="col-md-3 col-sm-6 wow fadeInLeft animated" data-wow-delay="0.2s">
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/resources/uploadfile/${plist.pimage}" class="img-responsive" style="width:262.5px; height:200px;">
                            <div class="product-hover">
                                <div class="product-meta">
                                    <a href="productview?pnumber=${plist.pnumber}&pcategory=1"><i class="pe-7s-cart"></i>상세보기</a>
                                </div>
                            </div>
                            <div class="product-title">
                                <h3 style="font-family: 'Jua', sans-serif;">${plist.pname}</h3>
                                <span>${plist.pprice}원</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
        </section>


        <section class="best-seller-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titie-section wow fadeInDown animated ">
                            <h1>BEST PRODUCT</h1>
                        </div>
                    </div>
                </div>
 				<div class="row">
               <c:forEach items="${bestplist}" var="bestplist" varStatus="status" begin="0" end="3">
                    <div class="col-md-3 col-sm-6 wow fadeInLeft animated" data-wow-delay="0.2s">
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/resources/uploadfile/${bestplist.pimage}" class="img-responsive" style="width:262.5px; height:200px;">
                            <div class="product-hover">
                                <div class="product-meta">
                                    <a href="productview?pnumber=${bestplist.pnumber}&pcategory=1"><i class="pe-7s-cart"></i>상세보기</a>
                                </div>
                            </div>
                            <div class="product-title">
                                    <h3 style="font-family: 'Jua', sans-serif;">${bestplist.pname}</h3>
                                    <span>${bestplist.pprice}원</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
        </section>
        
        <c:if test="${not empty sessionScope.loginId}">
        <section class="news-section">
             <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titie-section wow fadeInDown animated ">
                            <h1>CUSTOM PRODUCT</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
               <c:forEach items="${bestplist}" var="bestplist" varStatus="status" begin="0" end="3">
                    <div class="col-md-3 col-sm-6 wow fadeInLeft animated" data-wow-delay="0.2s">
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/resources/uploadfile/${bestplist.pimage}" class="img-responsive" style="width:262.5px; height:200px;">
                            <div class="product-hover">
                                <div class="product-meta">
                                    <a href="productview?pnumber=${bestplist.pnumber}&pcategory=1"><i class="pe-7s-cart"></i>상세보기</a>
                                </div>
                            </div>
                            <div class="product-title">
                                    <h3 style="font-family: 'Jua', sans-serif;">${bestplist.pname}</h3>
                                    <span>${bestplist.pprice}원</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
        </section>
		</c:if>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p class="center">Made with <i class="fa fa-heart"></i> by <a href="https://revolthemes.net/" target="_blank">Revolthemes</a>. All Rights Reserved</p>
                        
                    </div>
                </div>
            </div>
        </footer>

        <!-- JQUERY -->
        <script src="js/vendor/jquery-1.11.2.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/custom.js"></script>
</body>
</html>
