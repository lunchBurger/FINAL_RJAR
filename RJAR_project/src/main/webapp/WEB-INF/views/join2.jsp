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
	
<title>회원가입</title>
<style type="text/css">
#joinPage2 {
	width: 500px;
	height: 750px;
	border: 1px solid #758592;
	margin: 20px 0px 0px 510px;
}

#titleDiv {
	text-align: center;
	font-size: 40px;
	margin-top: 20px;
}

#pageSeparator {
	width: 200px;
	height: 20px;
	margin: 5px 0px 3px 150px;
}

.circle {
	border: 1px solid #758592;
	border-radius: 50px;
	width: 13px;
	height: 13px;
	float: left;
	margin: 5px 0px 0px 39px;
}

#joinTextDiv {
	text-align: center;
	font-size: 20px;
}

#topDiv {
	height: 500px;
	width: 400px;
	margin: 0px 0px 0px 50px;
	font-size: 14px;
}

#bottomDiv {
	height: 150px;
	width: 500px;
}

#joinBtn {
	width: 120px;
	height: 50px;
	margin: 40px 0px 0px 190px;
}

.topInfoDiv{
	width: 400px; 
	height: 40px;
}

#id{
	width: 300px;
	height: 30px;
	font-size: 17px;
/* 	border-radius: 5px; */
}

#nick{
	width: 300px;
	height: 30px;
	font-size: 17px;
/* 	border-radius: 5px; */
}

#idCheckBtn{
	height: 35px;
	font-size: 17px;
	float: right;
/* 	border-radius: 5px; */
}

#nickCheckBtn{
	height: 35px;
	font-size: 17px;
	float: right;
/* 	border-radius: 5px; */
}

.topInfo{
	height: 30px;
	width: 392px;
	font-size: 17px;
/* 	border-radius: 5px; */
}

#selectPhone{
	height: 35px;
/* 	border-radius: 5px; */
	width: 90px;
	font-size: 17px;
	margin-bottom: 7px; 
}

#phone{
	height: 30px;
	width: 222px;
/* 	border-radius: 5px; */
	font-size: 17px;
}

#certified{
	height: 35px;
	width: 70px;
/* 	border-radius: 5px; */
	font-size: 17px;
}

#certifiedNum{
	height: 30px;
	width: 150px;
/* 	border-radius: 5px; */
	font-size: 17px;
	margin-bottom: 7px;
}

#pwQuestion{
	height: 35px;
/* 	border-radius: 5px; */
	width: 400px;
	font-size: 17px;
	margin-bottom: 7px; 
}

#answer{
	height: 30px;
/* 	border-radius: 5px; */
	width: 392px;
	font-size: 17px;
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
<!--  <script type="text/javascript"> -->
<!-- // 	 window.history.forward(); -->
<!-- // 	 function noBack(){ -->
<!-- // 		 window.history.forward(); -->
<!-- // 		 console.log('noBakc') -->
<!-- // 		 } -->

<!-- </script> -->
<!-- onload : 문서의 모든 콘텐츠가 로드된 후 발생하는 이벤트, onpageshow : 뒤로가기했을 때도 이벤트 발생, onunload : 페이지를 떠났을 때 발생 -->
<!-- <body onload="noBack();" onpageshow="if(event.persisted) noBack(); console.log('event');"> -->
<!-- <body onpagehide="Init()"></body> -->

	<div id="joinPage2">
		<div id="titleDiv">
			<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
		</div>
		<div id="joinTextDiv">회원가입</div>
		<div id="pageSeparator">
			<div class="circle"></div>
			<div class="circle" style="background-color: #333333;"></div>
			<div class="circle"></div>
		</div>

	<form action="./memberJoin" method="post" onsubmit="return checkJoin()">	
		<div id="topDiv">
			아이디
			<div class="topInfoDiv">
				<input id="id" name="m_id" type="text" placeholder="아이디를 입력해주세요." required="required" oninvalid="this.setCustomValidity('아이디를 입력해 주세요.')" oninput="this.setCustomValidity('')">
				<input id="checkIdBtn" type="button" value="중복확인">
				<div id="idCheckResult" style="font-size: 13px; padding-left: 100px;"></div>
			</div>
			
			비밀번호
			<div class="topInfoDiv">
				<input id="pw" class="topInfo" name="m_pw" type="password" placeholder="비밀번호를 입력하세요." required="required" oninvalid="this.setCustomValidity('비밀번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
				<div id="pwInput" style="padding-left: 100px;"></div>
			</div>
			비밀번호 확인
			<div class="topInfoDiv">
				<input id="pwCheck" class="topInfo" type="password" placeholder="비밀번호를 다시 입력하세요." required="required" oninvalid="this.setCustomValidity('비밀번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
				<div id="pwCheckInput" style="padding-left: 100px; font-size: 13px;"></div>
			</div>
			이름
			<div class="topInfoDiv">
				<input class="topInfo" name="m_name" type="text" placeholder="이름을 입력하세요." required="required" oninvalid="this.setCustomValidity('이름을 입력해 주세요.')" oninput="this.setCustomValidity('')">
			</div>
			닉네임
			<div class="topInfoDiv">
				<input id="nick" name="m_nick" type="text" placeholder="닉네임을 입력하세요." required="required" oninvalid="this.setCustomValidity('닉네임을 입력해 주세요.')" oninput="this.setCustomValidity('')">
				<input id="checkNickBtn" type="button" value="중복확인">
				<div id="nickCheckResult" style="font-size: 13px; padding-left: 100px;"></div>
			</div>
			핸드폰 번호
			<div>
				<select id="selectPhone" name="m_tel" required="required" oninvalid="this.setCustomValidity('통신사를 선택해 주세요.')" oninput="this.setCustomValidity('')">
					<option value="" selected="selected">통신사</option>
					<option>SKT</option>
					<option>KT</option>
					<option>LG U+</option>
					<option>알뜰폰 SKT</option>
					<option>알뜰폰 KT</option>
					<option>알뜰폰 LG U+</option>
				</select>
				<input id="phone" name="m_phone" type="text" placeholder="핸드폰 번호" required="required" oninvalid="this.setCustomValidity('핸드폰 번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
				<input id="certified" type="button" value="인증" onclick="checkCertified($('#selectPhone').val(), $('#phone').val())">
				<input id="certifiedNum" type="text" placeholder="인증번호 입력" required="required" oninvalid="this.setCustomValidity('인증번호를 입력해 주세요.')" oninput="this.setCustomValidity('')">
				<div id="selectTel" style="float: right; font-size: 13px;"></div>
			</div>
			비밀번호 찾기 질문
			<div>
				<select id="pwQuestion" name="m_que" required="required" oninvalid="this.setCustomValidity('질문을 선택해 주세요.')" oninput="this.setCustomValidity('')">
					<option value="" selected="selected">질문</option>
					<option value="0">당신의 초등학교 이름</option>
					<option value="1">당신이 가장 좋아하는 게임</option>
					<option value="2">당신의 보물 제1호</option>
				</select>
				<input id="answer" name="m_ans" type="text" placeholder="답변" required="required" oninvalid="this.setCustomValidity('답변을 입력해 주세요.')" oninput="this.setCustomValidity('')">
				<div id="answerCheckResult" style="color: red; font-size: 13px;"></div>
			</div>
			
		</div> <!-- end topDiv -->
		<div>
<!-- 			<a href="./join3"> -->
				<input id="joinBtn" class="btn btn-primary btn-lg" type="submit" value="가입하기">
<!-- 			</a> -->
		</div>
	</form>

	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
	
	let idCheck = false;
	let pwCheck = false;
	let pwCheck2 = false;
	let phoneCheck = false;
	let nickCheck = false;
	let ansCheck = false;
	// 인증번호 담을 변수
	let authenticationNum;
	// 비밀번호 유효성 검사 규칙
	const regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	// 전화번호 정규식 검사 규식
	const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

	// id 값 변경할 때마다 중복확인 누르게 하기
	$('#id').on("propertychange change keyup paste input", function (){
		$('#idCheckResult').html('아이디 중복을 확인해 주세요.').css('color', 'red');
		idCheck = false;
	});
	
	// nick 값 변경할 때마다 중복확인 누르게 하기
	$('#nick').on("propertychange change keyup paste input", function (){
		$('#nickCheckResult').html('닉네임 중복을 확인해 주세요.').css('color', 'red');
		nickCheck = false;
	});
	
	// ans 값 변경할 때마다 체크
	$('#answer').on("propertychange change keyup paste input", function (){
		if($('#answer').val().length > 10){
			$('#answerCheckResult').html('최대 10자까지만 가능합니다.');
			ansCheck = false;
		} else{
			$('#answerCheckResult').html('')
			ansCheck = true;
		}
	});

		// id 중복확인
		$('#checkIdBtn').on('click', function (){
					console.log('id 중복확인');
					
					if ($('#id').val() != '') {
						$.ajax({
							method : 'get',
							url : 'member/checkId',
							data : 'm_id=' + $('#id').val(),
							success : function(data, status, xhr) {
								$('#idCheckResult').html(data).css('color', 'blue');
								idCheck = true
							},
							error : function(xhr, status) {
								$('#idCheckResult').html(xhr.responseText).css('color', 'red');
								idCheck = false;
							}
						}); // end ajax
					}
				}); // end on
				
		// nick 중복확인
		$('#checkNickBtn').on('click', function (){
					console.log('nick 중복확인');
						
					if ($('#nick').val() != '') {
						$.ajax({
							method : 'get',
							url : 'member/checkNick',
							data : 'm_nick=' + $('#nick').val(),
							success : function(data, status, xhr) {
								$('#nickCheckResult').html(data).css('color', 'blue');
								nickCheck = true
							},
							error : function(xhr, status) {
								$('#nickCheckResult').html(xhr.responseText).css('color', 'red');
								nickCheck = false;
							}
						}); // end ajax
					}
				}); // end on

		// 비밀번호 검사
		// 값이 변경될 때마다 검사
		// 유효성 검사는 컨틀롤러에 구현하는 게 바람직하지만 속도를 위해 프론트에 구현
		$('#pw').on("propertychange change keyup paste input", function () {
			console.log('비밀번호 검사');
			if (false === regPw.test($('#pw').val())) {
				$('#pwInput').html('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.').css('font-size', '10px').css('color', 'red');
				console.log("pwChekc : ", pwCheck);
				pwCheck = false;
				pwDiscrepancy();
			}
			else {
				console.log("통과");
				$('#pwInput').html('유효한 비밀번호 입니다.').css('color', 'blue').css('font-size', '13px');
				console.log("pwChekc : ", pwCheck);
				pwCheck = true;
				if($('#pw').val() === $('#pwCheck').val()){
					console.log('비밀번호 일치')
					$('#pwCheckInput').html('비밀번호 일치!').css('color', 'blue');
					pwCheck2 = true;
				}else if($('#pw').val() !== $('#pwCheck')){
// 					pwDiscrepancy();
				}
			}
		}); // end on
		
		function pwDiscrepancy() {
			console.log('비밀번호 불일치')
			$('#pwCheckInput').html('비밀번호 불일치!').css('color', 'red');
			pwCheck2 = false;
		}
					
		// 비밀번호 확인 검사
		// 값이 변경될 때마다 검사
		// 유효성 검사는 컨틀롤러에 구현하는 게 바람직하지만 속도를 위해 프론트에 구현
		$('#pwCheck').on("propertychange change keyup paste input", function() {
			if(pwCheck){
				if($('#pw').val() === $('#pwCheck').val()){
					console.log('비밀번호 일치')
					$('#pwCheckInput').html('비밀번호 일치!').css('color', 'blue');
					pwCheck2 = true;
				} else{
					console.log('비밀번호 불일치')
					$('#pwCheckInput').html('비밀번호 불일치!').css('color', 'red');
					pwCheck2 = false;
				}
			} // end if
		}); // end on

		// 인증번호
		function checkCertified(tel, pNum) {
			console.log('선택한 통신사 : ', tel);
			console.log('핸드폰 번호 : ', pNum);
			$('#selectTel').html('');

			// 통신사 선택 여부 확인
			if (tel === '') {
				$('#selectTel').html('통신사를 선택해 주세요.').css('color', 'red').css('margin-right', '100px');
				phoneCheck = false;
			} 
			else if(false === regPhone.test($('#phone').val())){
				$('#selectTel').html('핸드폰 번호를 정확히 입력해 주세요.').css('color', 'red').css('margin-right', '30px');
				console.log('핸드폰 번호 유효성 검사 false');
				phoneCheck = false;
			}else { // 램덤으로 뽑은 수의 소수자자리에서 내림 적용
				authenticationNum = getCertifiedNum(5);
				alert('인증번호 : '+authenticationNum);
			}
		}; // end certified()
		
		// 인증번호 생성
		function getCertifiedNum(n) {
			let num = '';
			for(let i = 0; i < n; i++){
				num += Math.floor(Math.random() * 10);
			} // end for
			return num;
		}

		// 가입하기
		function checkJoin() {
			
			console.log('가입하기');
			console.log('idCheck :', idCheck);
			console.log('pwCheck :', pwCheck);
			console.log('pwCheck2 :', pwCheck2);
			console.log('nickCheck :', nickCheck);
			console.log('인증번호 :', authenticationNum);
			console.log('답변 :', ansCheck);
			
			if(!idCheck){
				alert('아이디 중복 확인을 해주세요.');
				return false;
			} else if(!pwCheck){
				alert('규칙에 맞는 비밀번호를 입력해 주세요.');
				return false;
			} else if(!pwCheck2){
				alert('비밀번호 불일치');
				return false;
			} else if(!nickCheck){
				alert('닉네임 중복 확인을 해주세요.');
				return false;
			} else if($('#certifiedNum').val() !== authenticationNum){
				console.log('비교한번호',$('certifiedNum').val());
				alert('인증번호를 정확히 입력해 주세요.');
				return false;
			}else if(!ansCheck){
				return false;
			}else if(idCheck && pwCheck && pwCheck2 && nickCheck && ansCheck){
				return true;
			}
		}; // end on
	</script>

</body>
</html>