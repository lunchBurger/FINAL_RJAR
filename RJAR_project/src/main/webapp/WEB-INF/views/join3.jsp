<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">

<title>회원가입</title>
<style type="text/css">
#joinPage2 {
	width: 500px;
	height: 640px;
	border: 1px solid #758592;
	margin: 60px 0px 0px 510px;
}

#titleDiv {
	text-align: center;
	font-size: 40px;
	margin-top: 20px;
}

#pageSeparator {
	width: 200px;
	height: 30px;
	margin: 5px 0px 3px 150px;
}

.circle {
	border: 1px solid #758592;
	border-radius: 50px;
	width: 13px;
	height: 13px;
	float: left;
	margin: 5px 0px 0px 39px
}

#joinTextDiv {
	text-align: center;
	font-size: 20px;
}

#topDiv {
	height: 180px;
	width: 500px;
}

#bottomDiv {
	height: 150px;
	width: 500px;
}

#joinBtn {
	width: 120px;
	height: 50px;
	margin: 30px 0px 0px 190px;
	/* 	border-radius: 5px; */
	/* 	border: 0px; */
	/* 	background-color: #5383e8; */
	/* 	font-size: 20px; */
	/* 	color: #ffffff; */
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
	<div id="joinPage2">
		<div id="titleDiv">
			<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
		</div>
		<div id="joinTextDiv">회원가입</div>
		<div id="pageSeparator">
			<div class="circle"></div>
			<div class="circle"></div>
			<div class="circle" style="background-color: #333333;"></div>
		</div>

		<div id="topDiv">
			<label style="font-size: 40px; margin: 30px 0px 0px 160px;">가입 완료</label>
			<label style="font-size: 25px; margin: 20px 0px 0px 140px;">${m_nick}님 환영합니다.</label>
		</div>
		<!-- end topDiv -->


		<div>
			<a href="./login"> <input id="joinBtn"
				class="btn btn-primary btn-lg" type="button" value="로그인">
			</a>
		</div>

	</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
// 	console.log('닉네임 : ', ${m_nick});
</script>
</body>
</html>