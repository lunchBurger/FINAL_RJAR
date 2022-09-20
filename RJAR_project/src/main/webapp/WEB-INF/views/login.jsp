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
	
<title>로그인</title>
<style type="text/css">

#topDiv {
	margin-top: 50px;
	float: center;
	height: 120px;
}

#loginDiv {
	width: 400px;
	height: 530px;
	border: 1px solid #758592;
	margin: 110px 0px 0px 559px;
}

#titleDiv {
	text-align: center;
	font-size: 50px;
	margin-top: 50px;
}

.inputDiv {
	margin: 0px 10px 10px 20px;
	width: 358px;
	height: 50px;
	border-radius: 10px;
}

.img {
	height: 50px;
	border-radius: 10px 0px 0px 10px;
	border: 1px solid #758592;
	width: 54px;
	float: left;
}

.loginInput {
	float: left;
	height: 48px;
	width: 295px;
	border: 1px solid #758592;
	border-radius: 0px 10px 10px 0px;
	font-size: 20px;
}

#loginState {
	margin: 0px 0px 0px 30px;
	width: 300px;
	height: 30px;
}

#bottomDiv {
	margin: 20px;
	height: 150px;
	margin: 30px 0px 0px 20px;
}

#loginBtn {
	height: 40px;
	width: 300px;
	margin: 0px 0px 20px 30px;
	/* 	background-color: #5383e8; */
	/* 	color: #ffffff; */
	/* 	border: 0; */
	/* 	border-radius: 5px; */
}

#findIdPw {
	margin: 30px 0px 0px 105px;
	font-size: 14px;
}

#text {
	margin: 20px 0px 10px 75px;
	font-size: 18px;
}

#join {
	margin-left: 150px;
	font-size: 14px;
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

	<div id="loginDiv">
		<form action="./access" method="post">
			<div id="titleDiv">
				<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
			</div>
			
			<div id="topDiv">
				<div id="id" class="inputDiv">
					<img class="img" alt="id" src="./resources/loginImg/id.PNG">
					<input class="loginInput" name="m_id" required="required" oninvalid="this.setCustomValidity('를 입력해 주세요.')" oninput="this.setCustomValidity('')">
				</div>
				
				<div id="pw" class="inputDiv">
					<img class="img" alt="pw" src="./resources/loginImg/pw.PNG">
					<input class="loginInput" type="password" name="m_pw" required="required" oninvalid="this.setCustomValidity('비밀번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
				</div>
				<label id="accessLabel" style="color: red; margin: 0px 0px 0px 30px; font-size: 13px;"></label>
				
<!-- 				<div id="loginState"> -->
<!-- 					<input type="checkbox" style="width: 15px; height: 16px; float: left; padding: 0px;"> -->
<!-- 					<div id="loginSatteText" style="float: left; padding: 2px 0px 0px 5px;"> -->
<!-- 						로그인 유지 -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			
			<div id="bottomDiv">
				<input id="loginBtn" class="btn btn-primary btn-lg" type="submit" value="로그인">
				<a id="findIdPw" href="./findId">아이디 · 비밀번호 찾기</a>
					<div id="text">RJAR.GG가 처음이신가요?</div>
				<a id="join" href="./join">회원가입</a>
			</div>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> -->
<script type="text/javascript">



	let msg = '${msg}';
	
	if(msg !== ''){
		alert(msg);
	}
	
	$(function() {
		let chk = '${check}';
		if (chk === '2') {
			$('#accessLabel').html('아이디 또는 비밀번호를 잘못 입력하였습니다.').css('color', 'red');
// 			Swal.fire({         
// 				icon : 'error', // Alert 타입
// 				title : '로그인 실패', // Alert 제목
// 				text : '아이디 또는 비밀번호 오류입니다.', // Alert 내용
// 			});
		} // end if
	});
</script>

</body>
</html>