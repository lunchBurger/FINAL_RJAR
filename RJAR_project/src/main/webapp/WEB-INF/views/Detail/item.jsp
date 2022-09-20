<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#champion_profile{
    width: 100%;
    height: 300px;
    background-color: antiquewhite;
}

#champ_img_box{
    width: 600px;
    height: 300px;
}

#champ_img_box2{
    margin-left: 20px;
    margin-top: 0px;
    width: 150px;
    height: 200px;
    /* background-color: aliceblue; */
    float: left;
}

.lane_btn{
    width: 150px;
    height: 40px;
    margin-top: 40px;
    margin-left: 30px;
}

#champ_img{
    margin-top: 30px;
    margin-left: 10px;
    width: 160px;
    height: 170px;
}
.champ_skill{
    margin-top: 20px;
    width: 45px;
    height: 45px;
}

#champ_skill_box{
    margin-left: 30px;
    float: left;
}

#champ_skill_box>div{
    float: left;
    margin-left: 5px;
}

#nav{
    width: 100%;
    height: 50px;
    background-color: black;
}

#nav>nav>ul>li>form{
    margin-left: 80px;
    font-size: 20px;
    margin-top: 10px;
    float: left;
}

#nav>nav>ul>li>form{
    text-decoration-line: none;
    color: black;
}
.btn{
	background-color: antiquewhite;
}

#item_table_box{
    float: left;
    margin-top: 30px;
    margin-left: 20px;
    width: 730px;
    height: 400px;
    border-radius: 8px;
}

#item_table{
    margin-top: 20px;
    margin-left: 20px;
    width: 700px;
    height: 350px;
	background-color: skyblue;
	border-collapse: collapse;
	border-radius: 10px;
	border-style: hidden;
	box-shadow: 0 0 0 4px #000;
}

#item_table>tbody>tr>th{
    border-bottom: solid 1px gray;
}

#item_table>tbody>tr>th>img{
    margin-top: 20px;
    margin-left: 20px;
    width: 700px;
    height: 350px;
    margin-left:20px;
}

#boots_box{
	margin-top: 30px;
	float:left;
}

#boots_table{
    margin-top: 20px;
    margin-left: 20px;
    width: 700px;
    height: 350px;
	background-color: skyblue;
	border-collapse: collapse;
	border-radius: 10px;
	border-style: hidden;
	box-shadow: 0 0 0 4px #000;
	float: left;
}

#boots_table>tbody>tr>th{
    border-bottom: solid 1px gray;
}

#boots_table>tbody>tr>th>img{
    margin-top: 20px;
    margin-left: 20px;
    width: 400px;
    height: 350px;
    margin-left:20px;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="champion_profile">
		<div id="champ_img_box">
			<div id="lane_btn_box">
	            <button class="lane_btn" value ="${lane1}">${lane1}</button>
	            
				<c:if test="${!empty lane2}">
		            <button class="lane_btn" value ="${lane2}">${lane2}</button>
				</c:if>           
	        </div>
	        <div id="champ_img_box2">
	            <img id="champ_img" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${championName}.png" alt="">
	        </div>
	        <div id="champ_text">
	                <h2 style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;${championName}-${lane}</h2><br>
	                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;챔피언 티어 : 3티어</h5>
	         </div>
	         <div id="champ_skill_box">
	            <div id="p">
	                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/passive/${start1.passive}" alt="">
	            </div>
	            <div id="q">
	                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.q}" alt="">
	            </div>
	            <div id="w">
	                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.w}" alt="">
	            </div>
	            <div id="e">
	                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.e}" alt="">
	            </div>
	            <div id="r">
	                <img class="champ_skill" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.r}" alt="">
	            </div>
	        </div>
	    </div>
	</div>
	<div id="nav">
	    <nav>
		    <ul style="list-style: none; margin: 0px;">
		    	<li>
		    		<form action="build" method="get">
						<input type="hidden" value="${tier}" name="tier">
						<input type="hidden" value="${lane}" name="lane">
						<input type="hidden" value="${championName}" name="championName">
						<button class="btn">
							<font color="white">빌드</font>
						</button>
					</form>
		    	</li>
		    	<li>
		    		<form action="itemInfo" method="get">
						<input type="hidden" value="${tier}" name="tier">
						<input type="hidden" value="${lane}" name="lane">
						<input type="hidden" value="${championName}" name="championName">
						<button class="btn">
							<font color="white">아이템</font>
						</button>
					</form>
		    	</li>
		    	<li>
		    	    <form action="counterInfo" method="get">
						<input type="hidden" value="${tier}" name="tier">
						<input type="hidden" value="${lane}" name="lane">
						<input type="hidden" value="${championName}" name="championName">
						<button class="btn">
							<font color="white">카운터</font>
						</button>
					</form>
		    	</li>
		    </ul>
	    </nav>
	</div>
    <div id="item_table_box">
		<table id="item_table">
		   <thead style="font-size:23px">
		      <tr>
		         <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 아이템 빌드</th>
		         <th style="text-align: center">픽률</th>
		         <th style="text-align: center">승률</th>
		      </tr>
		   </thead>
		   <tbody>
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item.item_pick}%<br>
		            ${item.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item.item_winrate}%
		         </th>
		      </tr>
		      
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item1.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item1.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item1.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item1.item_pick}%<br>
		            ${item1.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item1.item_winrate}%
		         </th>
		      </tr>
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item2.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item2.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item2.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item2.item_pick}%<br>
		            ${item2.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item2.item_winrate}%
		         </th>
		      </tr>
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item3.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item3.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item3.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item3.item_pick}%<br>
		            ${item3.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item3.item_winrate}%
		         </th>
		      </tr>      
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item4.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item4.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item4.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item4.item_pick}%<br>
		            ${item4.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item4.item_winrate}%
		         </th>
		      </tr>      
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item5.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item5.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item5.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item5.item_pick}%<br>
		            ${item5.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item5.item_winrate}%
		         </th>
		      </tr>      
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item6.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item6.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item6.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item6.item_pick}%<br>
		            ${item6.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item6.item_winrate}%
		         </th>
		      </tr>      
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item7.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item7.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item7.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item7.item_pick}%<br>
		            ${item7.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item7.item_winrate}%
		         </th>
		      </tr>      
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item8.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item8.item2}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item8.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item8.item_pick}%<br>
		            ${item8.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item8.item_winrate}%
		         </th>
		      </tr>      
		      <tr>
		         <th>
		            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item9.item1}.png" alt="">
		            <font size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item9.item2}.png" alt="">
		            <font style="margin-top:40px" size="5px">▶</font>
		            <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${item9.item3}.png" alt="">
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item9.item_pick}%<br>
		            ${item9.item_cnt}게임
		         </th>
		         <th style="text-align: center; font-size:18px">
		            ${item9.item_winrate}%
		            </th>
		         </tr>      
		      </tbody>
		   </table>
	</div>
	<div id="boots_box">
	   <table id="boots_table">
	      <thead style="font-size:23px">
	      <tr>
	         <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 신발</th>
	         <th style="text-align: center">픽률</th>
	         <th style="text-align: center">승률</th>
	      </tr>
	   </thead>
	   <tbody>
	      <tr>
	         <th>
	            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${boots.boots}.png" alt="">
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots.boots_pick}%<br>
	            ${boots.boots_cnt}게임
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots.boots_winrate}%
	         </th>
	      </tr>
	      
	      <tr>
	         <th>
	            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${boots1.boots}.png" alt="">
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots1.boots_pick}%<br>
	            ${boots1.boots_cnt}게임
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots1.boots_winrate}%
	         </th>
	      </tr>
	      <tr>
	         <th>
	            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${boots2.boots}.png" alt="">
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots2.boots_pick}%<br>
	            ${boots2.boots_cnt}게임
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots2.boots_winrate}%
	         </th>
	      </tr>
	      <tr>
	         <th>
	            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${boots3.boots}.png" alt="">
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots3.boots_pick}%<br>
	            ${boots3.boots_cnt}게임
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots3.boots_winrate}%
	         </th>
	      </tr>      
	      <tr>
	         <th>
	            <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${boots4.boots}.png" alt="">
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots4.boots_pick}%<br>
	            ${boots4.boots_cnt}게임
	         </th>
	         <th style="text-align: center; font-size:18px">
	            ${boots4.boots_winrate}%
	            </th>
	         </tr>
	      </tbody>
	   </table>
	</div>
</body>
</html>