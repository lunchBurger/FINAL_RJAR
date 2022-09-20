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
#joinPage1 {
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

.termsDiv {
	overflow: auto;
	width: 400px;
	height: 150px;
	margin: 0px 30px 0px 50px;
	font-size: 12px;
	border: 1px solid #758592;
}

#bottomDiv {
	height: 150px;
	width: 500px;
}

.termsCheckBox {
 	margin: 0px 0px 0px 45px;
	width: 430px;
	height: 30px;
}

.termsCheckBoxLabel {
/*  	float: ; */
	padding: 4px 0px 0px 0px;
	font-size: 14px;
	height: 30px;
}

#nextBtn {
	width: 120px;
	height: 50px;
	margin: 5px 0px 0px 190px;
/* 	border-radius: 5px;
/* 	border: 0px; */
/* 	background-color: #5383e8; */
/* 	font-size: 20px; */
/* 	color: #ffffff; */
}

.checkBox {
	width: 20px;
	height: 20px;
 	float: left;
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
<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	<div id="joinPage1">
		<div id="titleDiv">
			<a href="./home" style=" text-decoration: none;">RJAR.GG</a>
		</div>
		<div id="joinTextDiv">회원가입</div>
		<div id="pageSeparator">
			<div class="circle" style="background-color: #333333;"></div>
			<div class="circle"></div>
			<div class="circle"></div>
		</div>
		
	<form action="join2" onsubmit="return isChekcBox()">
		<div id="topDiv">
			<div class="termsDiv">
				<strong>이용약관</strong>
				<div>본 약관은 2022년 09월 01일부터 적용됩니다.</div>
				<br>
				<strong>목적</strong>
				<div>본 약관은 ㈜알잘지지(이하 "회사" 또는 "알잘지지")에서 제공하는 서비스(이하"서비스")의
				이용 약관과 관련하여, 회사와 회원 간에 서비스 이용에 관환 권리 및 의무와 책임사항, 기타 필요한 사항을
				규정하는 것을 목적으로 합니다. 그리고 회사는 아래와 같은 서비스를 제공합니다.</div>
				<ol>
					<li>챔피언 분석
					<li>전적검색
					<li>멀티서치
					<li>커뮤니티
					<li>LCK에 관한 정보
					<li>연구소
				</ol>
			</div> <!-- end termsDiv -->
			
			<div class="termsCheckBox">
				<input id="checkBox1" name="checkbox" class="checkBox" type="checkbox" value="" onclick="checkBox()">
				<label class="termsCheckBoxLabel">
					RJAR.GG 서비스 이용약관 동의(필수)
				</label>
			</div>			
		</div> <!-- end topDiv -->
		
		<div class="bottomDiv">
			<div class="termsDiv">
				<strong>개인정보 수집·이용 동의서</strong>
				<div>'RJAR.GG'의 홈페이지 회원 가입을 신청하시는 분께 아래와 같이 개인정보의 수집·이용목적, 수집하는 
				개인정보의 항목, 개인정보의 보유 및 이용기간을 안내하여 드리오니 내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오.
				<br>
				<br>
					<strong>1.수집하는 개인정보의 항목</strong>
					<div>'RJAR.GG'은(는) 다음의 개인정보 항목을 수집합니다.
					<ol>
						<li>홈페이지 회원관리 및 관리<br>
						수집정보: 이메일 주소, 닉네임, 비밀번호
						<li>서비스 제공<br>
						수집정보: 닉네임, 비밀번호
						<li>인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 기록 및 수집이 될 수 있습니다.<br>
						회원이 Meta Plattform, Inc에 등록한 계정과의 연동을 위한 식별자, 회원이 Apple, Inc에 등록한 계졍과의 
						연동을 위한 식별자, 회원이 라이엇게임즈코리아 유한회사(Riot Games Korea Ltd.)에 등록한 계정과의 
						연동을 위한 식별자, 접속 IP정보, 쿠키, 접속로그, 서비스, 이용기록, 이용제한 기록 등
					</ol>
					<strong>2.개인정보의 수집·이용 목적</strong>
					<div>RJAR.GG은(는) 개인정보를 다음의 목적을 위해 수집·이용합니다. 수집한 개인정보는 다음의 목적 이외의 용도로 
					이용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</div>
					<ol>
						<li>홈페이지 회원가입 및 관리 <br>
						회원 가입의사 확인, 회원자격 유지•관리, 서비스 부정이용 방지, 각종 고지•통지, 분쟁 조정을 위한 기록 보존 등을 
						목적으로 개인정보를 수집·이용합니다.
						<li>민원 사무 처리<br>
						민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 수집·이용합니다.
						<li>재화 또는 서비스 제공<br>
						서비스 제공, 콘텐츠 제공 등을 목적으로 개인정보를 수집·이용합니다.
						<li>마케팅 및 광고에의 활용<br>
						신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 
						서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 수집·이용합니다.
					</ol>
					<strong>3.개인정보의 보유 및 이용 기간</strong>
					<div>'RJAR.GG'은(는) 법령에 따른 개인정보 보유∙이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유∙이용기간 내에서 
					개인정보를 처리, 보유합니다.<br>
					각각의 개인정보 보유 및 이용 기간은 다음과 같습니다.<br>
					<ol>
						<li>홈페이지 회원가입 및 관리: 홈페이지 탈퇴일로부터 30일이 경과하는 날까지. 다만, 관계 법령 위반에 따른 수사, 조사 등이 진행중인 경우에는 해당 수사, 조사 종료 시까지.
						<li>민원사무 처리: 민원사무 처리 완료 시까지. 단, 민원 발생 후 소송절차가 개시된 경우 해당 소송절차가 확정적으로 종결되는 날까지.
						<li>재화 또는 서비스 제공: 재화·서비스 공급 완료 시까지. 단, 관련 법령에서 소비자 보호 등을 위하여 필요한 경우 해당 법령에서 정한 기간의 만료일까지.
						<li>마케팅 및 광고에의 활용: 회원탈퇴 후 다른 사람이 탈퇴회원의 이메일주소를 이용하여 즉시 재가입하는 것을 방지하기 위하여 회원 탈퇴일로부터 30일이 되는 날까지. 단, 마케팅 및 맞춤서비스 제공과 관련하여 소송절차가 개시된 경우 해당 소송절차가 확정적으로 종결되는 날까지.
					</ol>
					</div>
					</div>	
				</div>
			</div> <!-- end termsDiv -->
		</div>
		<div style="height: 171px;">
			<div class="termsCheckBox">
				<input id="checkBox2" name="checkbox" class="checkBox" type="checkbox" value="" onclick="checkBox()">
				<label class="termsCheckBoxLabel">
					RJAR.GG 개인정보 수집 동의(필수)
				</label>
			</div>	
			<div class="termsCheckBox">
				<input id="checkBox3" name="checkbox" class="checkBox" type="checkbox" value="" onclick="checkBox()">
				<label class="termsCheckBoxLabel">
					이벤트 등 프로모션 알림 메일 및 푸시(선택)
				</label>
			</div>	
			<div class="termsCheckBox">
				<input name="checkbox" id="checkAll" class="checkBox" value="CheckAll" type="checkbox" onClick="this.value=check(this.form.checkbox)">
				<label class="termsCheckBoxLabel">
					모두 동의
				</label>
			</div>
<!-- 			<input id="nextBtn" class="btn btn-primary btn-lg" type="submit" value="다음"> -->
			<input id="nextBtn" type="submit" class="btn btn-primary btn-lg" value="다음">
		</div>
		</form>
	</div> <!-- end joinPage1 -->
	
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
   <script type="text/javascript">

      let checkflag = false;
      let essentialCheckflag = false;
      
      function checkBox() {
         if(checkflag){
            $('#checkAll').prop('checked', false);
            checkflag = false;
            essentialCheckflag = false;
         }else if($('#checkBox1').is(':checked') && $('#checkBox2').is(':checked')){
            console.log('필수 체크박스 on');
            essentialCheckflag = true;
         }else if ($('#checkBox1').is(':checked') && $('#checkBox2').is(':checked') && $('#checkBox3').is(':checked')) {
            $('#checkAll').prop('checked', true);
            console.log('체크박스 세개 on')
            essentialCheckflag = false;
            checkflag = true;
            return true
         } 
      }
   
      function check(field) {
         if (!checkflag) {
            for (i = 0; i < field.length; i++) {
               field[i].checked = true;
            }
            checkflag = true;
            return "check All";
         }else {
            for (i = 0; i < field.length; i++) {
               field[i].checked = false;
            }
            checkflag = false;
            essentialCheckflag = false;
            return "unCheck All";
         }
      } // end check()

      function isChekcBox() {
         if (checkflag) {
            console.log('체크');
            return true
         }else if(essentialCheckflag){
            console.log('필수 체크');
            return true
         }else {
            alert('약관에 동의해 주세요.')
            return false
         }
      }
   </script>

</body>
</html>