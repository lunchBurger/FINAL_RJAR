<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style type="text/css">
#most {
	background-color: #ebeef1;
	width: 1522px;
	height: 1080px;
	padding: 200px 10px 30px 10px;
}

.summoner-search-outter-box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 100px;
}

#categoryDiv {
	width: 200px;
	height: 500px;
	margin-left: 150px;
	border: 1px solid #758592;
	background-color: #ffffff;
	float: left;
}

#categoryList {
	list-style: none;
	width: 200px;
	align-content: center;
	padding: 0px 0px 0px 0px;
}

.category {
	padding-bottom: 10px;
	text-align: center; 
}

#writeDiv {
	float: left;
	width: 955px;
	height: 500px;
	margin-left: 50px;
	padding: 10px;
	border: 1px solid #758592;
	background-color: #ffffff;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="most">

		<div id="categoryDiv">
			<form action="community">
				<ul id="categoryList">
					<li id="freeBoard" class="category" style="padding-top: 150px;">
						<a href="">자유 게시판</a>
					</li>
					<li id="laneTip" class="category">
						<a href="">라인전 공략</a>
					</li>
					<li id="championTip" class="category">
						<a href="">챔피언 공략</a>
					</li>
					<li id="duoBoard" class="category">
						<a href="">듀오 게시판</a>
					</li>
				</ul>
			</form>
		</div>

		<div id="writeDiv">
			
				<form action="">
					<div id="topCategory" style="padding: 5px 10px 10px 10px">
						<div id="checkBox" style="float: left;">
							<input id="recent" type="checkbox">최신순
								&nbsp
							<input id="popularity" type="checkbox">인기순
						</div>
						
						<div id="selectAndSearch" style="float: right;">
							<select>
								<option>글 제목</option>
								<option>작성자</option>
							</select>
							<input type="text">
							<input type="submit" value="검색">
						</div>
					</div>
				</form>

		</div>

	</div>
</body>
</html>