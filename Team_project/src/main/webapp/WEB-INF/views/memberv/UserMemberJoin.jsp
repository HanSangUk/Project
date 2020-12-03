<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress").focus();
						
					    var gap = address.value; // 주소검색어
			            if (gap=="") {
			             alert("주소 검색어를 입력해 주십시오.");
			             address.focus();
			             return;
			            }
			            
			            // 주소-좌표 변환 객체를 생성
			            var geocoder = new daum.maps.services.Geocoder();



			            // 주소로 좌표를 검색
			            geocoder.addressSearch(gap, function(result, status) {
			             
			             // 정상적으로 검색이 완료됐으면,
			             if (status == daum.maps.services.Status.OK) {
			              
			              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

			              y = result[0].x;
			              x = result[0].y;



			              // 결과값으로 받은 위치를 마커로 표시합니다.
			              var marker = new daum.maps.Marker({
			               map: map,
			               position: coords
			              });



			              // 인포윈도우로 장소에 대한 설명표시
			              var infowindow = new daum.maps.InfoWindow({
			               content: '<div style="width:150px;text-align:center;padding:5px 0;">좌표위치</div>'
			              });

			              infowindow.open(map,marker);
			              
			              // 지도 중심을 이동
			              map.setCenter(coords);

			              coordXY.innerHTML = "<br>X좌표 : " + x + "<br><br>Y좌표 : " + y;
			              
			              document.getElementById("mxaddress").value= x;
			              document.getElementById("myaddress").value= y;
			              
			             }
			            });
						
					}
				}).open();
	}
	
	

	geocoder.addressSearch('sample6_postcode', callback);
	
	
	function memberjoin(){
		var inputId = document.getElementById("mid").value;
		var pwd = document.getElementById("mpassword").value;
		var name = document.getElementById("mname").value;
		var pwdch = document.getElementById("mpasswordch").value;
		var address = document.getElementById("sample6_address").value;
		var phone = document.getElementById("mphone").value;
		var email = document.getElementById("memail").value;
		var gender = document.getElementById("mgender").value;
		var birth = document.getElementById("mbirth").value;
		if(inputId.length < 5){
			Swal.fire({
				  icon: 'error',
				  title: '아이디를 5글자 이상 입력해주세요.',
				})
	    	 document.getElementById("mid").focus();
	        return false;
	     }else if(pwd.length < 8){
	    	 Swal.fire({
			 	icon: 'error',
			 	title: '비밀번호를 입력해주세요. ex) ASas!@12',
			 })
	    	 document.getElementById("mpassword").focus();
	        return false;
	     }else if(pwdch.length < 8){
	    	 Swal.fire({
				 	icon: 'error',
				 	title: '비밀번호체크를  입력해주세요.',
				 })
	    	 document.getElementById("mpasswordch").focus();
	        return false;
	     }else if(name.length == 0){
	    	 Swal.fire({
				 	icon: 'error',
				 	title: '이름을 입력해주세요.',
				 })
	    	 document.getElementById("mname").focus();
	        return false;
	     }else if(address.length == 0){
	    	 Swal.fire({
				 	icon: 'error',
				 	title: '주소를 입력해주세요.',
				 })
	    	 document.getElementById("sample6_postcode").focus();
	        return false;
	     }else if(phone.length < 12){
	    	 Swal.fire({
				 	icon: 'error',
				 	title: '전화번호를 입력해주세요.',
				 })
	    	 document.getElementById("mphone").focus();
	        return false;
	     }else if(email.length == 0){
	    	 Swal.fire({
				 	icon: 'error',
				 	title: '이메일을 입력해주세요.',
				 })
	    	 document.getElementById("memail").focus();
	        return false;  
	     }  var chk_radio = document.getElementsByName('mgender');

			var sel_type = null;

			for(var i=0;i<chk_radio.length;i++){

				if(chk_radio[i].checked == true){ 

					sel_type = chk_radio[i].value;

				}

			}



			if(sel_type == null){
				Swal.fire({
				 	icon: 'error',
				 	title: '성별을 선택해주세요.',
				 })
				return false;

			

			}else if(birth.length < 9){
				Swal.fire({
				 	icon: 'error',
				 	title: '생년월일을 선택해주세요.',
				 })
	    	 document.getElementById("mbirth").focus();
      		return false;
    	 }  else {
    		 memberinsertform.submit();
    	 }
	}
	function idOverlap() {
		var inputId = document.getElementById("mid").value;
		// ajax(Asynchronous javascript and XML)
		// JSON(JavaScript Object Notation)
		if (inputId.length > 4) {
			$.ajax({
				type : "post",
				url : "idoverlap",
				data : {
					"mid" : inputId
				},
				dataType : "text",
				success : function(result) {
					if (result == "OK") {
						eqMsg.style.color = "green";
						eqMsg.innerHTML = "멋진 아이디군요.";
						return true;
					} else {
						eqMsg.style.color = "red";
						eqMsg.innerHTML = "이미 사용된 ID 입니다.";
						return false;
					}
				},
				error : function() {
					alert("ajax 실패");
				}
			});
		}else{
			eqMsg.style.color = "red";
			eqMsg.innerHTML = "아이디는 5글자 이상 입력해주세요.";
		}
	}
	function disappear() {
		document.getElementById("eqMsg").innerHTML = "";
	}
	function pwdCh(){
        var exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
        var pwd = document.getElementById("mpassword").value;
        if(pwd.match(exp)){
        	eqMsg2.style.color = "green";
        	eqMsg2.innerHTML = "멋있는 비밀번호네요.";
            return true;
        }else{
        	eqMsg2.style.color = "red";
        	eqMsg2.innerHTML = "비밀번호형식이 맞지않습니다.";
            return false;
        }
    }
	function disappear2() {
		document.getElementById("eqMsg2").innerHTML = "";
	}
	function pwdMatch() {
		var pwd = document.getElementById("mpassword").value;
		var pwdch = document.getElementById("mpasswordch").value;
		if(pwd == pwdch){
			eqMsg3.style.color = "green";
        	eqMsg3.innerHTML = "비밀번호가 일치합니다.";
        	return true;
		}else{
			eqMsg3.style.color = "red";
        	eqMsg3.innerHTML = "비밀번호가 다릅니다.";
        	return false;
		}
	}
	function disappear3() {
		document.getElementById("eqMsg3").innerHTML = "";
	}
	function phoneCh(){
		var exp = /^\d{3}-\d{4}-\d{4}$/;
        var phone = document.getElementById("mphone").value;
        if(phone.match(exp)){
        	eqMsg4.style.color = "green";
        	eqMsg4.innerHTML = "전화번호 형식이 일치합니다.";
           return true;
        }else{
        	eqMsg4.style.color = "red";
        	eqMsg4.innerHTML = "전화번호 형식이 맞지 않습니다.";
            return false;
        }
	}
	function disappear4() {
		document.getElementById("eqMsg4").innerHTML = "";
	}
	function birthCh(){
		var birth = document.getElementBy("mbirth").value;
		if(birth.length == 0){
			return false;
		}else{
			return true;
		}
	}
/* 	function emailSend(){
		let clientEmail = document.getElementById(elementId: 'memail').value;
		let emailYN = isEmail(clientEmail);
		
		console.log('입력 이메일' + clientEmail);
		
		if(emailYN == true){
			alert('이메일 형식입니다.');
			
			$.ajax({
				type:"POST",
				url:"email",
				data:{userEmail:clientEmail},
				success : function(data){
				},error : function(e){
					alert('오류입니다. 잠시 후 다시 시도해주세요.');
				}
			});
		} else {
			alert('이메일 형식을 알맞게 입력해주세요 xxx@xxx.com');
		}
	}
function isEmail(asValue){
	var regExp= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue);
} */

</script>
<style>
		* {
            margin: 0px;
            padding: 0px;
            font-family: 'Jua', sans-serif;
        }
	     .usermemberjoin {
            margin: auto;
            padding: 30px 60px;
            border: 2px solid black;
            border-radius: 20px;
            width: 600px;
            height: auto;
            font-size: 20px;
        }
        .button {
            padding: 15px 25px;
            font-size: 24px;
            text-align: center;
            /* cursor: pointer; */
            outline: none;
            color: #fff;
            background-color: rgb(34, 34, 36);
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
            margin: 20px auto;
            display: block;
        }
        .button:hover {
            background-color: #1dc5d1
        }

        .button:active {
            background-color: #1dc5d1;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        
        .input {
            color: black;
            background-color: transparent;
            border: 2px solid transparent;
            border-bottom: 2px solid black;
            padding: 10px;
            margin: 5px 5px 15px 20px;
            font-size: 20px;
        }
        .p{
        	text-align: center;
        	font-size:35px;
        	margin:20px;
        	margin-top:40px;
        }
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
<p class="p"><i class="far fa-user"></i> 일반회원가입 <i class="far fa-user"></i></p>
	<fieldset class="usermemberjoin">
		<form action="memberinsert" method="post" name="memberinsertform">
			<label for="mid"><i class="far fa-id-badge"></i> 아이디</label><br> 
			<input class="input" type="text" id="mid" name="mid" onkeyup="idOverlap()" onblur="disappear()"><span id="eqMsg"></span><br> <br>
			<label for="mpassword"><i class="fas fa-unlock-alt"></i> 비밀번호</label><br>
			<input class="input" type="password" id="mpassword" name="mpassword" onkeyup="pwdCh()" onblur="disappear2()"><span id="eqMsg2"></span><br><br>
			<label for="mpasswordch"><i class="fas fa-unlock"></i> 비밀번호체크</label><br> 
			<input class="input" type="password" id="mpasswordch" name="mpasswordch" onkeyup="pwdMatch()" onblur="disappear3()"><span id="eqMsg3"></span><br><br>
			<label for="mname"><i class="fas fa-file-signature"></i> 이름</label><br> 
			<input class="input" type="text" id="mname" name="mname" onkeyup="nameCh()"><br><br>
			<label for="maddress"><i class="fas fa-map-marker-alt"></i> 주소</label><br> 
			<input class="input" type="text" id="sample6_postcode" name="maddress1" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input class="input" type="text" id="sample6_address" name="maddress2" placeholder="주소" ><br> 
			<input class="input" type="text" id="sample6_detailAddress" name="maddress3" placeholder="상세주소"><br> 
			<input class="input" type="text" id="sample6_extraAddress" name="maddress4" placeholder="참고항목"><br><br>
			
<div id="map" style="width:100%;height:450px;"></div>
<br>
<div id="coordXY"></div>
<br>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2ae2da091765540d6419c005c1a3c6c&libraries=services"></script>
		<script>
			var address      = document.getElementById("sample6_address");
			var mapContainer = document.getElementById("map");
			var coordXY   = document.getElementById("coordXY");
			var mapOption;
			var map;
			var x,y          = "";
			
			if (address.value=="") {
			
			 mapOption = {
			  center: new daum.maps.LatLng(33.450701, 126.570667), // 임의의 지도 중심좌표 , 제주도 다음본사로 잡아봤다.
			        level: 4            // 지도의 확대 레벨
			
			 };
			}
			
			// 지도 생성
				map = new daum.maps.Map(mapContainer, mapOption);
		</script>
			<input type="hidden" id="mxaddress" name="mxaddress">
			<input type="hidden" id="myaddress" name="myaddress">
			<label for="mphone"><i class="fas fa-mobile-alt"></i> 전화번호</label><br>
			<input class="input" type="text" id="mphone" name="mphone" onkeyup="phoneCh()" onblur="disappear4()"><span id="eqMsg4"></span><br><br>
			<label for="memail"><i class="fas fa-envelope-open-text"></i> 이메일</label><br> 
			<input class="input" type="email" id="memail" name="memail"><br><br>
			<label id="mgender1"><i class="fas fa-venus-mars"></i> 성별</label><br> 
			<input type="radio" id="mgender" name="mgender" id="male" value="남자"> 남자 
			<input type="radio" id="mgender" name="mgender" id="femele" value="여자"> 여자<br>
			<br><label for="mbirth"><i class="fas fa-birthday-cake"></i> 생년월일</label><br> 
			<input type="date" id="mbirth" name="mbirth" onkeyup="birthCh()"><br>
		</form>
		<br>
		<button class="button" onclick="memberjoin()">회원가입</button>
	</fieldset>
</body>
</html>