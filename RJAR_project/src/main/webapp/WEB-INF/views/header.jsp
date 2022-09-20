<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com"> <!-- 이거 지우고 밑에거 활성화 -->
<!-- <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">

<title>Insert title here</title>


<style type="text/css">
.header {
	width: 1500px;
	/* 	height: 500px;
	position: relative; */
}

.container-fluid {
	width: 1100px;
	
}

.summoner-search-outter-box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 100px;
}

.main-text-center {
	width: 500px;
	height: 300px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -150px;
	margin-top: -100px;
}

#summoner-search-box {
	margin-left: -150px;
	width: 500px;
}
</style>

</head>
<body>
	<!-- Option 1: Bootstrap Bundle with Popper -->

	<script src="https://code.jquery.com/jquery-3.5.1.slim.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<div class="header">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="./home">RJAR</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarColor01"
					aria-controls="navbarColor01" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarColor01">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link"
							href="./championHome" style="font-family: 'Poor Story', cursive">챔피언분석</a></li>
						<li class="nav-item"><a class="nav-link" href="./laboratory"
							style="font-family: 'Poor Story', cursive">연구소</a></li>
						<li class="nav-item"><a class="nav-link" href="./multiSearch"
							style="font-family: 'Poor Story', cursive">멀티서치</a></li>
					</ul>
				</div>
				<form action="summonerSearch" method="Get">
					<div class="summoner-search-outter-box"
						style="text-align: center; vertical-align: middle;">
						<div class="summoner-search-box"
							style="display: block; margin-right: 3px;">
							<input class="form-control me-sm-2" type="text"
								placeholder="소환사명을 입력하세요" name="summonerName" style="font-family: 'Poor Story', cursive">
						</div>
						<div class="summoner-search-button">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
						</div>
					</div>
				</form>

				<c:if test="${sessionScope.m_nick != null}">
					<form method="post" id='logOutFrm' name="form"
						style="margin: 0px;">
						<ul class="navbar-nav me-auto" id="myDropMenu">
							<li class="nav-item dropdown" style="height: 40px"><p
									class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false"
									style="font-family: 'Poor Story', cursive">${sessionScope.m_nick}</p>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#" onclick="document.form.action='./myPage'; document.form.submit()"
										style="font-family: 'Poor Story', cursive">나의 정보</a>

									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#"
										onclick="document.form.action='./logout'; document.form.submit()"
										style="font-family: 'Poor Story', cursive">로그아웃</a>
								</div>
							</li>
						</ul>
					</form>
				</c:if>
				
				<c:if test="${sessionScope.m_nick == null}">
					<a href="./login">
						<button id="login-btn" type="button" class="btn btn-success"
							style="font-family: 'Poor Story', cursive">로그인</button>
					</a>
				</c:if>
			</div>
		</nav>
	</div>
	<script type="text/javascript">
	$(document).ready(
			function() {
				//서브메뉴 우선 숨기기
				$('.dropdown-menu').hide();
				//메인메뉴의 <li> 태그를 클릭할때마다 이벤트 함수 발생
				$('#myDropMenu>li').click(
						function(e) {
							//click 시 <li> 태그의 a 태그 href(하이퍼링크) 타는 것을 막아주기
							e.preventDefault();
							// 클릭한 메인메뉴 <li>태그의 .sub_menu 를 제외한 모든 서브메뉴는 hide()로 숨기기
							$('.dropdown-menu').not($(this).find('.dropdown-menu').toggle()).hide();
						});

			});
	console.log('${sessionScope.m_nick}')
</script>
</body>
</html>