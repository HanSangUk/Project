<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/maincss/style.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<!-- CSS , JS -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="resources/dist/js/hangul.js"></script>
<script>
   $(function() {
      $.ajax({
         type : 'get',
         url : "jsons",
         dataType : "json",
         success : function(data) {
            let source = $.map(data,
                  function(item) {
                     chosung = "";

                     full = Hangul.disassemble(item).join("").replace(
                           / /gi, "");
                     Hangul.d(item, true).forEach(
                           function(strItem, index) {
                              if (strItem[0] != " ") {
                                 chosung += strItem[0];

                              }
                           });
                     return {
                        label : chosung + "|"
                              + (item).replace(/ /gi, "") + "|"
                              + full,
                        value : item,
                        chosung : chosung,
                        full : full
                     }
                  });
            $("#searchInput").autocomplete({
               source : source,
               select : function(event, ui) {
                  console.log(ui.item.label + " 선택 완료");
               },
               focus : function(event, ui) {
                  return false;
               },

            }).autocomplete("instance")._renderItem = function(ul, item) {

               return $("<li>").append("<div>" + item.value + "</div>")
                     .appendTo(ul);
            };
         },

      });

      $("#searchInput").on(
            "keyup",
            function() {
               input = $("#searchInput").val();
               $("#searchInput").autocomplete(
                     "search",
                     Hangul.disassemble(input).join("").replace(/ /gi,
                           ""));
            })
   });
</script>


<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: 'Jua', sans-serif;
}
</style>
<script>
	window.kakaoAsyncInit = function() {
		Kakao.Channel.createChatButton({
			container : '#kakao-talk-channel-chat-button',
		});
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = 'https://developers.kakao.com/sdk/js/kakao.plusfriend.min.js';
		fjs.parentNode.insertBefore(js, fjs);
	})(document, 'script', 'kakao-js-sdk');
	
	
	function totalsearchs(){
		totalsearchform.submit();
	}
</script>
<style>
.icon-bar {
  position: fixed;
  top: 27%;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}
.Recently{
  padding:10px;
}

</style>
</head>
<body>
	<header class="header-section">
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<img
						src="${pageContext.request.contextPath}/resources/img/튀잉.gif"
						style="width: 56px; hegith: 56px; margin: 0px 15px; padding-top: 5px;">
				</div>
				<div class="navbar-header">
					<a class="navbar-brand" href="home"><b>싸</b>다잉</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<form action="totalsearch" method="post" name="totalsearchform">
             			<input type="text" id="searchInput" name="searchInput" style="height:45px; width:400px; margin-top:10px; padding-top:5px;">
             			<a href="javascript:void(0);" onclick="totalsearchs()" style="padding: 2px 10px 0px 10px; height:50px; width:50px;"><i class="fas fa-search fa-2x"></i></a>
                	</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</header>


	<section class="header-top-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="header-top-content">
						<ul class="nav nav-pills navbar-left">
							<li></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6">
					<div class="header-top-menu">
						<ul class="nav nav-pills navbar-right">
							<li><a href="#"></a></li>
							<c:if test="${not empty sessionScope.loginId}">
							<li><a href="basketlist"><i class="fas fa-shopping-basket"></i> 장바구니</a></li>
							</c:if>
							<li><a href="noticelist"><i
									class="fas fa-clipboard-list"></i> 공지사항</a></li>
							<li><c:if test="${empty sessionScope.loginId}">
									<li><a href="memberinsertpick"><i
											class="fas fa-file-signature"></i> 회원가입</a></li>
									<li><a href="loginpick"><i class="fas fa-sign-in-alt"></i>
											로그인</a></li>
								</c:if> <c:if test="${not empty sessionScope.loginId}">
																	${alarmCount}
								<%
									String amid = (String)session.getAttribute("loginId");
								%>
								<script>
										playAlert = setInterval(function idOverlap() {
											var inputId = "<%=amid%>";
											console.log(inputId);
											// ajax(Asynchronous javascript and XML)
											// JSON(JavaScript Object Notation)
												$.ajax({
													type : "post",
													url : "alarmCount",
													data : {
														"amid" : inputId
													},
													dataType : "text",
													success : function(result) {
															eqMsg.innerHTML = result;
										
													},
													error : function() {
														alert("ajax 실패");
													}
												})}, 1000);
								</script>
								<a href="alarmlist?amid=${sessionScope.loginId}" class="notification">
								  <span>알림</span>
								  <span class="badge" id="eqMsg">${alarmCount}</span>
								</a>
									<li style="height: 40px;"><a
										style="padding: 10px 15px 0px 15px">${sessionScope.loginId}
											님</a><br></li>
									<li><a href="memberlogout"><i
											class="fas fa-sign-out-alt"></i> 로그아웃</a></li>
									<li><a href="mypage?mid=${sessionScope.loginId}"><i
											class="fas fa-house-user"></i> 마이페이지</a></li>
								</c:if></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="icon-bar">
	<div id="kakao-talk-channel-chat-button"
		data-channel-public-id="_MGjxfK" data-title="consult"
		data-size="small" data-color="yellow" data-shape="pc"
		data-support-multiple-densities="true" class="kakao"></div>
		<br>
		<div class="Recently">
		<p><i class="fas fa-binoculars"></i> 최근 본 상품</p>
	    <div id="latelyViewItemListdiv" style="position:absolute;">
	    
	    </div>
	    </div>
	</div>	
    <script>
   //로컬스토리지에서 latelyViewItemList 로 저장된 정보가 있는지 확인후
   if((localStorage.getItem('latelyViewItemList')) == null){
       //없을경우 공간 생성
       
       //상품을 표시할 ul에 없을경우 화면 표시
      document.getElementById('latelyViewItemListdiv').append('<li>찾아본<br>상품이<br>없습니다.</li>');
      }else{
      
          //기존 정보가 있을 경우 저장된 정보를 가져오고
         var latelyViewItemListNew = JSON.parse(localStorage.getItem('latelyViewItemList'));
           
         }
         var tag = "";
            
        for(var i = 0;i < 3; i++){
           if(latelyViewItemListNew.latelyViewItemInList.pnumber || null || undefined || 0 || NaN){
              tag += "<li>찾아본<br>상품이<br>없습니다</li>"
            }
            else{
               tag += "<p style='font-size:10px;'>상품명 : "+latelyViewItemListNew.latelyViewItemInList[i].pname+"</p>";
               tag += "<a href='productview?pnumber="+latelyViewItemListNew.latelyViewItemInList[i].pnumber+"&pcategory=1'><img style='width:50px; height:50px; display:block; margin:auto;' src =${pageContext.request.contextPath}/resources/uploadfile/"+latelyViewItemListNew.latelyViewItemInList[i].pimg+"></a><br>"
               tag += "<p style='font-size:10px;'>가격 : "+latelyViewItemListNew.latelyViewItemInList[i].pprice+"원</p>";
               tag += "<p>--------------</p>";
            }
           document.getElementById('latelyViewItemListdiv').innerHTML=tag;
       }
     //가져온 최근본상품리스트에서 노출해야할 인덱스을 구해서 노출
	</script>
</body>
</html>