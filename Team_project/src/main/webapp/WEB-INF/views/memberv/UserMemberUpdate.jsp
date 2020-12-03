<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2ae2da091765540d6419c005c1a3c6c&libraries=services"></script>
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
					
					marker.setMap(null);
					
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
	
	function memberUpdateProcess(pw){
		var pwd = document.getElementById("mpassword").value;
		var name = document.getElementById("mname").value;
		var address = document.getElementById("sample6_postcode").value;
		var phone = document.getElementById("mphone").value;
		var email = document.getElementById("memail").value;
		 if(pwd.length < 8){
	    	 Swal.fire({
			 	icon: 'error',
			 	title: '비밀번호를 입력해주세요. ex) ASas!@12',
			 })
	    	 document.getElementById("mpassword").focus();
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
	     }else {
    		 var s = prompt("비밀번호를 입력해주세요");	
 			if(pw == s){
 				alert("비밀번호가 일치합니다.");
 				memberupdateprocessform.submit();
 			}else{
 				alert("비밀번호가 틀립니다.");
 			}
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
</script>
<style>
input{
	width:300px;
	text-align:center;
	border:none;
}
.memberupdate{
	margin:auto;
	display:block;	
	width: 750px;
	font-size:20px;
	text-align:center;
}
.updatetitle{
	font-size:35px;
	text-align:center;
}
.buttons{
	width: 150px;
	height: 30px;
	background-color: #fefefe;
}

</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false" />
<p class="updatetitle"><i class="fas fa-user-edit"></i> 회원정보 수정</p><br>
<div class="memberupdate">
	<form action="memberupdateprocess" method="post" name="memberupdateprocessform">
	<div>
	<table border="1">
		<tr>
			<td style="width:200px;"><i class="far fa-id-card"></i> 아이디</td>
			<td style="width:550px;"><input type="text" id="mid" name="mid" value="${memberUpdate.mid}" readonly>
		</tr>
		<tr>
			<td><i class="fas fa-unlock-alt"></i> 비밀번호</td>
			<td><input type="password" id="mpassword" name="mpassword" value="${memberUpdate.mpassword}" onkeyup="pwdCh()" onblur="disappear2()"><br>
				<span id="eqMsg2"></span>
			</td>
		</tr>
		<tr>
			<td><i class="fas fa-signature"></i> 이름</td>
			<td><input type="text" id="mname" name="mname" value="${memberUpdate.mname}"></td>
		</tr>
		<tr>
			<td><i class="fas fa-birthday-cake"></i> 생년월일</td>
			<td><input type="text" id="mbirth" name="mbirth" value="${memberUpdate.mbirth}" readonly></td>
		</tr>
		<tr>	
			<td><i class="fas fa-phone"></i> 전화번호</td>
			<td><input type="text" id="mphone" name="mphone" value="${memberUpdate.mphone}" onkeyup="phoneCh()" onblur="disappear4()"><br>
				<span id="eqMsg4"></span>
			</td>
		</tr>
		<tr>	
			<td><i class="far fa-envelope-open"></i> 이메일</td>
			<td><input type="text" id="memail" name="memail" value="${memberUpdate.memail}"></td>
		</tr>
		<tr>	
			<td><i class="fas fa-venus-mars"></i> 성별</td>
			<td><input type="text" id="mgender" name="mgender" value="${memberUpdate.mgender}" readonly></td>
		</tr>
		<tr>
			<td><i class="fas fa-map-marker-alt"></i> 주소</td>
			<td style="width:700px;">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input class="input" type="text" id="sample6_postcode" name="maddress1" placeholder="우편번호" value="${memberUpdate.maddress1}">
			<input class="input" type="text" id="sample6_address" name="maddress2" placeholder="주소" value="${memberUpdate.maddress2}"><br> 
			<input class="input" type="text" id="sample6_detailAddress" name="maddress3" placeholder="상세주소" value="${memberUpdate.maddress3}"><br> 
			<input class="input" type="text" id="sample6_extraAddress" name="maddress4" placeholder="참고항목" value="${memberUpdate.maddress4}"><br><br>
			<div id="map" style="width:100%;height:450px;"></div>
			</td>
		</tr>
	</table>
	</div>
	<br>
	<div id="coordXY"></div>
		<script>
		var address      = document.getElementById("sample6_address");
		var mxaddress = ${memberUpdate.mxaddress};
		var myaddress = ${memberUpdate.myaddress};
		var mapContainer = document.getElementById("map");
		var coordXY   = document.getElementById("coordXY");
		var mapOption;
		var map;
		var x,y          = "";
	
		if (address.value!="") {
		 mapOption = {
		  center: new daum.maps.LatLng(mxaddress, myaddress), // 임의의 지도 중심좌표 , 제주도 다음본사로 잡아봤다.
		  level: 4            // 지도의 확대 레벨
		
		 };
		} 
		
		// 지도 생성
		map = new daum.maps.Map(mapContainer, mapOption);
		var markerPosition  = new kakao.maps.LatLng(mxaddress, myaddress); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		</script>
		<br>
		<input type="hidden" id="mxaddress" name="mxaddress" value="${memberUpdate.mxaddress}">
		<input type="hidden" id="myaddress" name="myaddress" value="${memberUpdate.myaddress}">
	</form>
	<button type="button" class="buttons" onclick="memberUpdateProcess('${memberUpdate.mpassword}')" >수정하기</button>	
	</div>
</body>
</html>