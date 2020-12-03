<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script>
	function memberUpdate(){
		membermypage.submit();
	}
	function memberout(mid,mpassword){
		var s = prompt("비밀번호를 입력해주세요");
		if(mpassword == s){
			alert("비밀번호가 일치합니다.");
			var c = confirm("정말 탈퇴하시겠습니까?");
			if(c == true){
				alert("Ok");
				location.href="memberout?mid="+mid;
			}else{
				alert("No");
			}
		}else{
			alert("비밀번호가 틀립니다..");
		}
					
	}
	
	
	function ggymlist(mid){
		location.href="commemberlistpaging?mid="+mid;
	}
</script>
<style>
 		.mypageboard {
            margin: auto;
            padding: 30px 50px;
            border: 2px solid black;
            border-radius: 20px;
            width: 800px;
            height: auto;
            font-size: 20px;
        }
   		.titlename {
   			font-size : 50px;
   			text-align : center;
   		}
	   	.button {
			padding: 15px 25px;
			font-size: 24px;
			text-align: center;
			cursor: pointer;
			outline: none;
			color: #fff;
			background-color: black;
			border: none;
			border-radius: 24px;
			box-shadow: 0 9px #999;
			margin:25px 10px;
			width: 200px;
			height: 100px;
		}
	
		.button:hover {
			background-color: 1ABC9C;
		}
		.button:active {
			background-color: #3e8e41;
			box-shadow: 0 5px #666;
			transform: translateY(4px);
		}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false" />
<br><br>
<p class="titlename"><i class="fas fa-house-user"></i> ${mypage.mname}님의 마이페이지 <i class="fas fa-house-user"></i></p>
<br><br>
<div class="mypageboard">
	<table style="font-size:25px;">
		<tr>
			<td style="width:130px; height:75px;"><i class="far fa-id-card"></i> 이름</td>
			<td>${mypage.mname}</td>
		</tr>
		<tr>
			<td style="width:130px; height:75px;"><i class="fas fa-map-marked-alt"></i> 주소</td>
			<td style="font-size:20px;">${mypage.maddress2} ${mypage.maddress3} ${mypage.maddress4}</td>
		</tr>
		<tr>	
			<td style="width:130px; height:75px;"><i class="fas fa-phone-volume"></i> 전화번호</td>
			<td>${mypage.mphone}</td>
		</tr>
		<tr>	
			<td style="width:130px; height:75px;"><i class="fas fa-envelope-open-text"></i>	이메일</td>
			<td>${mypage.memail}</td>
		</tr>
		<tr>	
			<td style="width:130px; height:75px;"><i class="fas fa-venus-mars"></i> 성별</td>
			<td>${mypage.mgender}</td>
		</tr>
		<tr>
			<td style="width:130px; height:75px;"><i class="fas fa-birthday-cake"></i> 생년월일</td>
			<td>${mypage.mbirth}</td>
		</tr>
	
	</table>
	<button class="button" onclick="memberUpdate()">회원정보 수정</button>
	<button class="button" onclick="location.href='basketlist'">장바구니</button>
	<button class="button" onclick="memberout('${mypage.mid}','${mypage.mpassword}')">회원 탈퇴</button>
	<button class="button" onclick="ggymlist('${mypage.mid}')">찜 리스트</button>
	<button class="button" onclick="location.href='paylistgo?payid=${sessionScope.loginId}'">구매목록</button>
</div>
	<form action="memberupdate" method="post" name="membermypage">
		<input type="hidden" id="mid" name="mid" value="${mypage.mid}" readonly>
		<input type="hidden" id="mpssword" name="mpassword" value="${mypage.mpassword}">
		<input type="hidden" id="kakaoId" name="kakaoId" value="${mypage.kakaoId}" readonly>
		<input type="hidden" id="naverId" name="naverId" value="${mypage.naverId}">
		<input type="hidden" id="googleId" name="googleId" value="${mypage.googleId}">
		<input type="hidden" id="mname" name="mname" value="${mypage.mname}" readonly><br>
		<input type="hidden" id="maddress1" name="maddress1" value="${mypage.maddress1}" readonly><br>
		<input type="hidden" id="maddress2" name="maddress2" value="${mypage.maddress2}" readonly><br>
		<input type="hidden" id="maddress1" name="maddress3" value="${mypage.maddress3}" readonly><br>
		<input type="hidden" id="maddress2" name="maddress4" value="${mypage.maddress4}" readonly><br>
		<input type="hidden" id="mphone" name="mphone" value="${mypage.mphone}" readonly><br>
		<input type="hidden" id="memail" name="memail" value="${mypage.memail}" readonly><br>
		<input type="hidden" id="mgender" name="mgender" value="${mypage.mgender}" readonly><br>
		<input type="hidden" id="mbirth" name="mbirth" value="${mypage.mbirth}" readonly><br>
	</form>
</body>
</html>