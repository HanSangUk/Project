<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
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
              
              document.getElementById("cxaddress").value= x;
              document.getElementById("cyaddress").value= y;
              
             }
            });
            
            
        }
    }).open();
}



function pwdeqFn(){
	   var pwd = document.getElementById("compassword").value;
	   var pwdch = document.getElementById("compasswordch").value;
	   var eqMsg = document.getElementById("pwdEq");
	   if (pwd == pwdch){
		   eqMsg.style.color = "green";
		   eqMsg.innerHTML = "맞음";
	   } else {
		   eqMsg.style.color = "red";
		   eqMsg.innerHTML = "틀렸습니다.";
		   }
	   }

function pwdCheck(){
	   var pch = /^[a-zA-z0-9]{4,12}$/;
	   var pwd = document.getElementById("compassword").value;
	   var pwdch = document.getElementById("pwdch");
	   if(pwd.match(pch)){
		   pwdch.style.color = "green";
		   pwdch.innerHTML = "OK"
	   } else {
		   pwdch.style.color = "red";
		   pwdch.innerHTML = "형식이 틀렸습니다"
	   }
}

function phCheck(){
	   	var phonech = /^\d{3}-\d{3,4}-\d{4}$/;
	   	var mph = document.getElementById("comphone").value;
	   	var mphch = document.getElementById("phch");
	   	if(mph.match(regEphonechxp)){
	   		mphch.style.color = "green";
	   		mphch.innerHTML = "OK"
	   	} else {
	   		mphch.style.color = "red";
	   		mphch.innerHTML = "형식이 틀렸습니다"
	   	}
}

function comnumberCh(){
	var comExp = /^\d{3}-\d{2}-\d{5}$/;
	var comnum = document.getElementById("comnumber").value;
	var comch = document.getElementById("comch");
	if(comnum.match(comExp)){
		comch.style.color = "green";
		comch.innerHTML = "OK"
   	} else {
   		comch.style.color = "red";
   		comch.innerHTML = "형식이 틀렸습니다 "
   	}
}

function commemberjoin(){
	var rephonech = /^\d{3}-\d{3,4}-\d{4}$/;
	var repch = /^[a-zA-z0-9]{4,12}$/;
	
	var recomExp = /^\d{3}-\d{2}-\d{5}$/;
	
	var cnumbercheck = document.getElementById("comnumber");
	var passwordcheck = document.getElementById("compassword");
	var password2check = document.getElementById("compasswordch");
	var phonecheck = document.getElementById("comphone");
	var officecheck = document.getElementById("comoffice");
	var chk_radio = document.getElementsByName('company');

	 
	if(cnumbercheck.value.length == ""){
		Swal.fire({
			  icon: 'error',
			  title: '사업자번호를 입력하지 않았습니다.',
			})
		cnumbercheck.focus();
		return false;
	}
	
	if(!check(recomExp, cnumbercheck, "사업자 번호는 3 - 2 - 5자리로 써주세요")){
		return false;
	} 
	
	
	if((passwordcheck.value.length) == ""){
		Swal.fire({
			  icon: 'error',
			  title: '비밀번호를 입력하지 않았습니다.',
			})
		passwordcheck.focus();
		return false;
	}
	
	if(!check(repch,passwordcheck,"비밀번호는 4~12자의 영문과 숫자로만 입력 가능합니다.")){
		return false;
	} 
	
 	if((password2check.value.length) == ""){
 		Swal.fire({
			  icon: 'error',
			  title: '비밀번호 체크를 입력해주세요.',
			})
		password2check.focus();
		return false;
	}
 	
	if(!check(repch,password2check,"비밀번호는 4~12자의 영문과 숫자로만 입력 가능합니다.")){
		return false;
	} 
	
	
	if((phonecheck.value.length)==""){
		Swal.fire({
			  icon: 'error',
			  title: '전화번호를 입력하지 않았습니다.',
			})
		   phonecheck.focus();
		   return false;
	}
	
	if(!check(rephonech,phonecheck,"010 - 3~4 - 4자리를 입력해주세요")){
		return false;
	} 
	
	var sel_type = null;

	for(var i=0;i<chk_radio.length;i++){
		if(chk_radio[i].checked == true){ 
			sel_type = chk_radio[i].value;
		}
	}

	if(sel_type == null){
		Swal.fire({
			  icon: 'error',
			  title: '기업을 선택해주세요.',
			})
		return false;
	}
	
	if((officecheck.value.length)==""){
		Swal.fire({
			  icon: 'error',
			  title: '지점을 입력하지 않았습니다.',
			})
		   phonecheck.focus();
		   return false;
	}
	
	joinform.submit();
}

	function check(re, what, message){//정규화데이터,아이템 id,메세지
 	   if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
  	  //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
  	      return true;
 	   }
	
 	  Swal.fire({
		  icon: 'error',
		  title: message,
		})
 	   what.value = "";
 	   what.focus();
 	   return false;
	}
</script>
<style>
		* {
            margin: 0px;
            padding: 0px;
            font-family: 'Jua', sans-serif;
        }
	     .commemberjoin {
            margin: auto;
            padding: 30px 60px;
            border: 2px solid black;
            border-radius: 20px;
            width: 600px;
            height: auto;
            font-size: 20px;
        }
         .footer {
            margin: 20px 0px;
            padding: 10px;
            border-top: 2px solid black;
            border-bottom: 2px solid black;
        }

        .footer2 {
            margin: 10px;

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
        h1{
        	text-align: center;
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
<p class="p"><i class="fas fa-users-cog"></i> 기업회원가입 <i class="fas fa-users-cog"></i></p>
<div class="commemberjoin">
<form action="commemberinsertform" method="post" name="joinform">
	<br><i class="far fa-id-badge"></i> 사업번호 <br><input class="input" type="text" id="comnumber" name="comnumber" onkeyup="comnumberCh()" placeholder="사업자번호를 입력하세요.">
	<span id="comch"></span><br>
	<br>ex) 111-11-11111 / 3-2-5<br>
	<br><i class="fas fa-unlock-alt"></i> 비밀번호<br><input class="input" type="password" id="compassword" name="compassword" onkeyup="pwdCheck()" placeholder="비밀번호를 입력하세요.">
	<span id="pwdch"></span><br>
	<br><i class="fas fa-unlock"></i> 비밀번호체크<br><input class="input" type="password" id="compasswordch" name="compasswordch" onkeyup="pwdeqFn()" placeholder="비밀번호를 입력하세요.">
	<span id="pwdEq"></span><br>
	<br><i class="fas fa-mobile-alt"></i> 전화번호 <br><input class="input" type="text" id="comphone" name="comphone" onkeyup="phCheck()" placeholder="전화번호를 입력하세요.">
	<span id="phch"></span><br>
	<br>ex) - 포함<br>
	<br><i class="fas fa-building"></i> 기업<br><br>
		<input type="radio" id="company" name="company" value="CU"> CU
		<input type="radio" id="company" name="company" value="7-ELEVEN"> 7-ELEVEN
		<input type="radio" id="company" name="company" value="GS"> GS
		<input type="radio" id="company" name="company" value="E-MART"> E-MART<br>
	<br><i class="fas fa-laptop-house"></i> 지점 <br><input class="input" type="text" id="comoffice" name="comoffice"><br>
	<br><i class="fas fa-map-marker-alt"></i> 주소 <br>
	<div class="maddress">
		<input class="input" type="text" id="sample6_postcode" name="comaddress1" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()"  value="우편번호 찾기"><br>
		<input class="input" type="text" id="sample6_address" name="comaddress2" placeholder="주소"><br>
		<input class="input" type="text" id="sample6_detailAddress" name="comaddress3" placeholder="상세주소">
		<input class="input" type="text" id="sample6_extraAddress" name="comaddress4" placeholder="참고항목">
	</div><br>
	
<div id="map" style="width:100%;height:450px;"></div>
<br>
<div id="coordXY"></div>
<input type="hidden" id="cxaddress" name="cxaddress">
<input type="hidden" id="cyaddress" name="cyaddress">
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
	<button class="button" type="button" onclick="commemberjoin()">회원가입(기업)</button>
</form>
</div>
</body>
</html>