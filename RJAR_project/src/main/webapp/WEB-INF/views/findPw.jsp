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
	
<title>비밀번호 찾기</title>
<style type="text/css">

#findIdDiv {
	width: 400px;
	height: 530px;
	border: 1px solid #758592;
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

#topDiv {
	float: center;
	height: 90px;
	font-size: 17px;
}

.inputDiv {
	margin: 0px 10px 10px 40px;
	height: 40px;
	font-size: 15px;
}

.findInput {
	float: left;
	height: 45px;
	width: 295px;
	font-size: 15px;
}

#bottomDiv {
	height: 180px;
	margin: 0px 0px 0px 30px;
	font-size: 15px;
}

#findPwBtn {
	height: 40px;
	width: 250px;
	margin: 20px 0px 20px 70px;
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

#pwQuestion{
	height: 40px;
	width: 320px;
	font-size: 17px;
	margin-bottom: 7px; 
}

#answer{
	height: 40px;
	width: 320px;
	font-size: 15px;
	margin-bottom: 7px;
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
		<a href="findId">
			<input class="findBtn" type="button" value="아아디 찾기" style="float: left;">
		</a>
		<input class="findBtn" type="button" value="비밀번호 찾기" style="background-color: #333333; color: #ffffff;">
		<div id="findIdDiv">
			<form action="./checkPw">
				<div id="titleDiv">
					<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
				</div>
				<div>
				<label style="margin: 0px 0px 0px 145px; font-size: 20px;">비밀번호 찾기</label>
				</div>
				<div id="pageSeparator">
					<div class="circle" style="background-color: #333333;"></div>
					<div class="circle"></div>
				</div>
				
				<div id="topDiv">
					<div id="id" class="inputDiv">
						<label style="float: left; width: 300px;">아이디</label>
						<input id="idInput" name="m_id" class="findInput" placeholder="내용을 입력해 주세요." required="required" oninvalid="this.setCustomValidity('아이디를 입력해 주세요.')" oninput="this.setCustomValidity('')">
						<label id="nameCheckResult" style="font-size: 13px; color: red; margin-left: 30px;">${msg}</label>
					</div>
				</div>
				
				<div id="bottomDiv">
					<label style="margin-right: 200px;">질문</label>
					<select id="pwQuestion" name="m_que" required="required" oninvalid="this.setCustomValidity('질문을 선택해 주세요.')" oninput="this.setCustomValidity('')">
						<option value="" selected="selected">질문을 선택하세요.</option>
						<option value="0">당신의 초등학교 이름</option>
						<option value="1">당신이 가장 좋아하는 게임</option>
						<option value="2">당신의 보물 제1호</option>
					</select>
					<input id="answer" name="m_ans" type="text" placeholder="답변" required="required" oninvalid="this.setCustomValidity('답변을 입력해 주세요.')" oninput="this.setCustomValidity('')">
					<div id="answerCheckResult"></div>
				</div>
				<input id="findPwBtn" class="btn btn-primary btn-lg" type="submit" value="비밀번호 찾기">
			</form>
		</div>
	</div>
</body>
</html>