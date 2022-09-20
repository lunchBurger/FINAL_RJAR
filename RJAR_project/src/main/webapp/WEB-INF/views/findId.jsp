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
	/* 	width: 382px; */
	height: 40px;
	font-size: 15px;
	/* 	border-radius: 10px; */
}

.findInput {
	float: left;
	height: 45px;
	width: 295px;
	/* 	border: 1px solid #758592; */
	font-size: 15px;
}

#bottomDiv {
	height: 180px;
	margin: 0px 0px 0px 30px;
	font-size: 17px;
}

#findIdBtn {
	height: 40px;
	width: 250px;
	margin: 20px 0px 20px 70px;
	/* 	margin-top: 50px; */
}

#selectPhone {
	height: 40px;
	/* 	border-radius: 5px; */
	width: 90px;
	margin-bottom: 7px;
}

#phone {
	height: 40px;
	width: 222px;
	/* 	border-radius: 5px; */
	margin-bottom: 15px;
}

#certified {
	height: 40px;
	width: 90px;
	/* 	border-radius: 5px; */
	/* 	font-size: 17px; */
}

#certifiedNum {
	height: 40px;
	width: 222px;
	/* 	border-radius: 5px; */
	/* 	font-size: 17px; */
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

	<div id="main">
		<input class="findBtn" type="button" value="아아디 찾기" style="background-color: #333333; color: #ffffff; float: left;">
		<a href="findPw">
			<input class="findBtn" type="button" value="비밀번호 찾기">
		</a>
		<div id="findIdDiv">
			<form action="./findId2" onsubmit="return checkFindId()">
				<div id="titleDiv">
					<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
				</div>
				<div>
				<label style="margin: 0px 0px 0px 145px; font-size: 20px;">아이디 찾기</label>
				</div>
				<div id="pageSeparator">
					<div class="circle" style="background-color: #333333;"></div>
					<div class="circle"></div>
				</div>
				
				<div id="topDiv">
					<div id="id" class="inputDiv">
						<label style="float: left; width: 300px;">가입한 이름</label>
						<input id="name" name="m_name" class="findInput" placeholder="내용을 입력해 주세요." required="required" oninvalid="this.setCustomValidity('이름을 입력해 주세요.')" oninput="this.setCustomValidity('')">
						<label id="nameCheckResult" style="font-size: 13px; color: red;">${msg}</label>
					</div>
				</div>
				
				<div id="bottomDiv">
					<label style="margin: 5px 300px 8px 0px;">핸드폰</label>
					<select id="selectPhone" name="m_tel" required="required" oninvalid="this.setCustomValidity('통신사를 선택해 주세요.')" oninput="this.setCustomValidity('')">
						<option value="" selected="selected">통신사</option>
						<option>SKT</option>
						<option>KT</option>
						<option>LG U+</option>
						<option>알뜰폰 SKT</option>
						<option>알뜰폰 KT</option>
						<option>알뜰폰 LG U+</option>
					</select>
					<input id="phone" name="m_phone" type="text" placeholder="-를 생략하고 입력하세요." required="required" oninvalid="this.setCustomValidity('핸드폰 번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
					<input id="certified" class="" type="button" value="인증" onclick="checkCertified($('#selectPhone').val(), $('#phone').val())">
					<input id="certifiedNum" type="text" placeholder="인증번호 입력" required="required" oninvalid="this.setCustomValidity('인증번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
					<label id="resultPhone" style="font-size: 13px; margin-left: 5px;"></label>
				</div>
				<input id="findIdBtn" class="btn btn-primary btn-lg" type="submit" value="아이디 찾기">
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> -->
<script type="text/javascript">

	//인증번호 담을 변수
	let authenticationNum;
	// 전화번호 정규식 검사 규식
	const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	//인증번호
	function checkCertified(tel, pNum) {
		console.log('선택한 통신사 : ', tel);
		console.log('핸드폰 번호 : ', pNum);

		$('#resultPhone').html('');

		// 통신사 선택 여부 확인
		if($('#name').val() === ''){
			$('#resultPhone').html('이름을 입력해 주세요.').css('color', 'red');
			phoneCheck = false;
		} else if (tel === '') {
			$('#resultPhone').html('통신사를 선택해 주세요.').css('color', 'red');
			phoneCheck = false;
		} else if (false === regPhone.test($('#phone').val())) {
			$('#resultPhone').html('핸드폰 번호를 정확히 입력해 주세요.').css('color', 'red');
			console.log('핸드폰 번호 유효성 검사 false');
			phoneCheck = false;
		} else {
			
			$.ajax({
				method : 'get',
				url : 'member/phoneCheck',
				data : {'m_name' : $('#name').val(),
					'm_tel' : $('#selectPhone').val(),
					'm_phone' : $('#phone').val()},
				success : function(data, status, xhr) {
					console.log('data : ', data);
					authenticationNum = getCertifiedNum(5);
					alert('인증번호 : ' + authenticationNum);
				},
				error : function(xhr, status) {
					console.log(xhr);
					$('#resultPhone').html(xhr.responseText).css('color', 'red');
				}
			}); // end ajax
		} // end else
	}; // end certified()

	// 인증번호 생성
	function getCertifiedNum(n) {
		let num = '';
		// 램덤으로 뽑은 수의 소수자자리에서 내림 적용
		for (let i = 0; i < n; i++) {
			num += Math.floor(Math.random() * 10);
		} // end for
		return num;
	}

	// 아이디 찾기
	function checkFindId() {
		
		console.log('인증번호 :', authenticationNum);
		
		if ($('#certifiedNum').val() !== authenticationNum) {
			console.log('비교한번호', $('certifiedNum').val());
			alert('인증번호를 정확히 입력해 주세요.');
			return false;
		} else {
			return true;
		}
	}; // end on
</script>

</body>
</html>