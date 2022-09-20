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
<title>Insert title here</title>

<style type="text/css">
.main {
	width: 1500px;
	height: 1500px;
	background-color: blue;
	z-index: 1;
}

.middle {
	width: 1100px;
	height: 1500px;
	background-color: red;
	position: relative;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.middleHead {
	width: 1100px;
	height: 200px;
	position: relative;
	background-color: green;
	margin: auto;
}

.middleDetail {
	width: 1500px;
	height: 1000px;
	position: absolute;
	background-color: yellow;
}

.test {
	width: 1500px;
	height: 1000px;
	position: absolute;
	background: purple;
	z-index: 3;
}

.header{
    z-index:2;
}
</style>

</head>
<body>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<div class="test"></div>
	<div class="header">

		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="main">
		<div class="middle">
			<div class="middleHead"></div>
			<div class="middleDetail"></div>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>