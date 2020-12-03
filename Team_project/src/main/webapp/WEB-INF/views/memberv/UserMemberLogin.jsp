<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	function memberlogingo(){
		memberloginform.submit();
	}
</script>
<style>
	
		
	
	/* 
	.button {
		padding: 15px 25px;
		font-size: 24px;
		text-align: center;
		cursor: pointer;
		outline: none;
		color: #fff;
		background-color: black;
		border: none;
		border-radius: 15px;
		box-shadow: 0 9px #999;
		margin-top:25px;
		width: 150px;
		height: 70px;
	}

	.button:hover {
		background-color: #1abc9c;
	}

	.button:active {
		background-color: #3e8e41;
		box-shadow: 0 5px #666;
		transform: translateY(4px);
	}   */
	    ul {
            list-style-type: none;
        }

        body {
            font-family: "맑은고딕", "돋움";
            color: 444444;
        }

        #login_box {
            width: 600px;
            height: auto;
            border: solid 1px #bbbbbb;
            border-radius: 15px;
            margin: 10px 0 0 10px;
            padding: 60px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 13%;
            text-align:center;
            font-size : 35px;
        }

        h2 {
            font-family: "Arial";
            margin-bottom: 10px;
            font-size: 25px
        }
		
        #login_box input {
            width: 200px;
            height: 30px;
            font-size: 25px;
        }

        #id_pass,
        #login_btn {
            display: inline-block;
            vertical-align: top;
             height: 90px;
        }

        #id_pass span {
            display: inline-block;
            width: 20px;
        }

        #pass {
            margin-top: 3px;
        }

        #login_btn button {
            margin-left: 5px;
            padding: 12px;
            border-radius: 5px;
        }

        #btns {
            margin: 12px 0 0 0;
            text-decoration: underline;
        }

        #btns li {
            margin-left: 10px;
            display: inline;
			font-siza : 35px;
        }
        .p{
        	text-align: center;
        	font-size:25px;
        	margin:20px;
        }
        span {
        	margin-right:40px;
        }
        .button{
        	 height: 86px;
        }
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
	<div id="login_box">
            <form action="memberlogin" method="post" name="memberloginform">
            <p><i class="fas fa-user"></i> USER LOGIN </p><br><br>
            <ul id="input_button">
                <li id="id_pass">
                    <ul>
                        <li>
                            <span> ID </span>
                            <input type="text" id="mid" name="mid"><br><br>
                        </li>
                        
                        <li id="pass">
                            <span> PW </span>
                            <input type="password" id="mpassword" name="mpassword"><br><br>
                        </li>
                    </ul>
                </li>
                <li id="login_btn">
                    <button class="button" onclick="memberlogingo()">로그인</button>
                </li>
            </ul>
            <ul id="btns">
                <li><br><a href="#">아이디/비밀번호 찾기</a></li>
            </ul>
           </form>
           <div style="margin-top:15px;height:60px;">
            <a href="naverlogin">
				<img style="float:left;width:239px;height:60px" src="${pageContext.request.contextPath}/resources/img/네이버 아이디로 로그인_완성형_Green.PNG">
			</a>
			<a href="kakaologin">
				<img style="float:left;width:239px;height:60px" src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png">
			</a>
			</div>
        </div>
        

</body>
</html>