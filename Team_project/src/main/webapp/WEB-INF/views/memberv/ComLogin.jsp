<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function comlogin(){
		comloginform.submit();
	}
</script>
<style>
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
            padding: 40px;
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
			font-siza : 25px;
        }
        .p{
        	text-align: center;
        	font-size:35px;
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
	<form action="comlogin" method="post" name="comloginform">
            <p><i class="far fa-building"></i> COMPANY LOGIN </p><br><br>
            <ul id="input_button">
                <li id="id_pass">
                    <ul>
                        <li>
                            <span> ID </span>
                            <input type="text" id="comnumber" name="comnumber"><br><br>
                        </li>
                        
                        <li id="pass">
                            <span> PW </span>
                            <input type="password" id="compassword" name="compassword"><br><br>
                        </li>
                    </ul>
                </li>
                <li id="login_btn">
                    <button class="button" onclick="comlogin()">로그인</button>
                </li>
            </ul>
            <ul id="btns">
                <li><br><a href="#">아이디/비밀번호 찾기</a></li>
            </ul>
            </form>
        </div>
</body>
</html>