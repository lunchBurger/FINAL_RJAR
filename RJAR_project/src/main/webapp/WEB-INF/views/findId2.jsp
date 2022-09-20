<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">
	
<title>아이디 찾기</title>
<style type="text/css">

#findIdDiv {
	width: 400px;
	height: 530px;
	border: 1px solid #758592;
}

#topDiv {
	margin-top: 0px;
	float: center;
	height: 220px;
	font-size: 17px;
}

#titleDiv {
	text-align: center;
	font-size: 50px;
	margin-top: 20px;
}

#pageSeparator {
	width: 200px;
	height: 20px;
	margin: 0px 0px 20px 123px;
}

.circle {
	border: 1px solid #758592;
	border-radius: 50px;
	width: 15px;
	height: 15px;
	float: left;
	margin: 5px 0px 0px 39px;
}

#showIdDiv{
	border: 1px solid #758592;
	border-radius: 5px;
	width: 300px;
	height: 80px;
	margin: 30px 0px 0px 49px;
}

#bottomDiv {
	height: 100px;
	margin: 0px 0px 0px 30px;
	font-size: 17px;
}

#loginBtn {
	width: 130px;
	height: 40px;
	font-size: 15px;
 	margin-left: 11px;
}

#findPwBtn {
	width: 130px;
	height: 40px;
	font-size: 15px;
 	margin-left: 50px;
}

.showIdLabel{
	margin: 10px 0px 0px 30px;
	font-size: 15px;
}

#main{
	width: 400px;
	height: 578px;
 	margin: 100px 0px 0px 559px;
}

.findBtn{
	width: 200px;
	height: 48px;
	border: 1px solid #ffffff;
	border-radius: 3px;
}

a {
	text-decoration: none;
	color: black;
}
    a:visited {
	text-decoration: none;
}
    a:hover {
	text-decoration: none;
}
    a:focus {
	text-decoration: none;
}
    a:hover, a:active {
	text-decoration: none;
}

</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<div id="main">
		<input class="findBtn" type="button" value="아아디 찾기" style="background-color: #333333; color: #ffffff; float: left;">
		<a href="findPw">
			<input class="findBtn" type="button" value="비밀번호 찾기">
		</a>
		<div id="findIdDiv">
			<div id="titleDiv">
				<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
			</div>
			<div>
				<label style="margin: 0px 0px 0px 145px; font-size: 20px;">아이디 찾기</label>
			</div>
			<div id="pageSeparator">
				<div class="circle"></div>
				<div class="circle" style="background-color: #333333;"></div>
			</div>
				
			<div id="topDiv">
				<div id="showIdDiv">
					<label class="showIdLabel">가입하신 아이디는</label><br>
					<label class="showIdLabel" style="margin: 0px 0px 0px 100px; font-size: 25px;">${m_id}</label>
					<label style="margin-left: 30px; font-size: 15px;">입니다.</label>
				</div>
			</div>
				
			<div id="bottomDiv">
				<a href="./login">
					<input id="loginBtn" class="btn btn-primary btn-lg" type="button" value="로그인">
				</a>
				<a href="./findPw">
					<input id="findPwBtn" class="btn btn-primary btn-lg" type="button" value="비밀번호 찾기">
				</a>
			</div>
		</div>
	</div>
</body>
</html>