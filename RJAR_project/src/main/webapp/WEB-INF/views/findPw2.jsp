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

#topDiv {
	margin-top: 0px;
	float: center;
	height: 250px;
	font-size: 15px;
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

#showIdDiv {
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
	width: 250px;
	height: 40px;
	font-size: 15px;
	margin: 30px 0px 0px 43px;
}

#findPwBtn {
	width: 130px;
	height: 40px;
	font-size: 15px;
	margin-left: 50px;
}

.showPwLabel {
	margin: 0px 0px 0px 50px;
	font-size: 15px;
}

#main {
	width: 400px;
	height: 578px;
	margin: 100px 0px 0px 559px;
}

.findBtn {
	width: 200px;
	height: 48px;
	border: 1px solid #ffffff;
	border-radius: 3px;
}

.pwInput {
	margin: 0px 0px 0px 50px;
	width: 295px;
	height: 40px;
}

.pwLabel {
	font-size: 13px;
	margin: 1px 0px 0px 58px;
	color: red;
	width: 300px;
	height: 13px;
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
			<div id="titleDiv">
				<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
			</div>
			<div>
				<label style="margin: 0px 0px 0px 145px; font-size: 20px;">비밀번호 찾기</label>
			</div>
			<div id="pageSeparator">
				<div class="circle"></div>
				<div class="circle" style="background-color: #333333;"></div>
			</div>
			<form action="./changePw" method="post" onsubmit="return checkChangePw()">
				<div id="topDiv">
					<label class="showPwLabel">변경할 비밀번호</label>
					<input id="pw" name="m_pw" class="pwInput" type="password" required="required" oninvalid="this.setCustomValidity('변경할 비밀번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
					<label id="currentPwCheckLabel" class="pwLabel"></label>
					<label class="showPwLabel">비밀번호 확인</label>
					<input id="pwCheck" class="pwInput" type="password" required="required" oninvalid="this.setCustomValidity('비밀번호를 한 번 더 입력해 주세요.')" oninput="this.setCustomValidity('')">
					<label id="pwCheckLabel" class="pwLabel">${msg}</label>
				</div>
					
				<div id="bottomDiv">
					<input id="loginBtn" class="btn btn-primary btn-lg" type="submit" value="로그인">
				</div>
			</form>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script type="text/javascript">

	let pwCheck = false;
	let pwCheck2 = false;
	let pwReg = false;
	// 비밀번호 유효성 검사 규칙
	const regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	
	// 비밀번호 검사
	// 값이 변경될 때마다 검사
	// 유효성 검사는 컨틀롤러에 구현하는 게 바람직하지만 속도를 위해 프론트에 구현

	$('#pw').on("propertychange change keyup paste input", function() {
		console.log('비밀번호 검사');
		$('#currentPwCheckLabel').html('');
		if (false === regPw.test($('#pw').val())) {
			$('#currentPwCheckLabel').html('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.').css('font-size', '10px').css('color', 'red');
			console.log("pwChekc : ", pwCheck);
			pwReg = false;
			pwDiscrepancy();
		} else {
			console.log("통과");
			$('#currentPwCheckLabel').html('유효한 비밀번호 입니다.').css('color', 'blue').css('font-size', '13px');
			console.log("pwChekc : ", pwCheck);
			pwReg = true;
			if($('#pw').val() === $('#pwCheck').val()){
				pwCoincidence()
			}else if($('#pw').val() !== $('#pwCheck')){
				pwDiscrepancy();
			}
		}
	}); // end on

	function pwCoincidence() {
		console.log('비밀번호 일치')
		$('#pwCheckLabel').html('비밀번호 일치!').css('color', 'blue');
		pwCheck = true;
		pwCheck2 = true;
	}

	function pwDiscrepancy() {
		console.log('비밀번호 불일치')
		$('#pwCheckLabel').html('비밀번호 불일치!').css('color', 'red');
		pwCheck = false;
		pwCheck2 = false;
	}
	// 비밀번호 확인 검사
	// 값이 변경될 때마다 검사
	// 유효성 검사는 컨틀롤러에 구현하는 게 바람직하지만 속도를 위해 프론트에 구현
	$('#pwCheck').on("propertychange change keyup paste input", function() {
		if ($('#pw').val() === $('#pwCheck').val()) {
			pwCoincidence();
		} else {
			pwDiscrepancy();
		}
	}); // end on
	
	function checkChangePw() {
		if($('#pw').val() !== $('#pwCheck').val()){
			alert('비밀번호 일치하지 않습니다.')
			return false;
		}
		else if(pwCheck && pwCheck2 && pwReg){
			return true;
		}else{
			alert('조건에 맞는 비밀번호를 사용해 주세요.')
			return false;
		}
	};
</script>
</body>
</html>