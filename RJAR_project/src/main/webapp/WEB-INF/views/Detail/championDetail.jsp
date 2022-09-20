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
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.js"
   integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
   crossorigin="anonymous"></script>

<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
   integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
   crossorigin="anonymous"></script>

<style type="text/css">
#selectOption {
   width: 200px;
   height: 55px;
   margin: 5px;
   border-radius: 7px;
   border: 2px solid black;
   font-size: 20px;
   font-weight: bold;
}

option {
   font-weight: bold;
}

#champion_profile{
    width: 100%;
    height: 300px;
   background-color: antiquewhite;
}

#champ_img_box{
    width: 600px;
    height: 300px;
    margin-left: 20px;
}

#champ_img_box2{
    margin-left: 20px;
    margin-top: 0px;
    width: 150px;
    height: 200px;
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

#build_box{
    /* background-color: antiquewhite; */
    overflow: hidden;
    width: 100%;
    height: 1080px;
}

#rune_box1{
    width: 950px;
    height: 330px;
 /*    background-color: #d7fff1; */
    float: left;
    margin-top: 20px;
    margin-left: 10px;
    border-radius: 8px;
}

#rune_box2{
    width: 950px;
    height: 330px;
 /*    background-color: #d7fff1; */
    float: left;
    margin-top: 20px;
    margin-left: 10px;
    border-radius: 8px;
    display: none;
}

.rune_table,.rune_table2{
   float:left;
      text-align: center;
      width: 237px;
      margin-top: 20px;
}

.rune_table>thead>tr>th,
.rune_table2>thead>tr>th{
    width: 280px;
    height: 50px;
    /* border: solid 2px black; */
}

.rune_table>thead>tr>th>img,tbody>tr>th>img,
.rune_table2>thead>tr>th>img,tbody>tr>th>img{
    width: 45px;
    height: 45px;
    margin-left: 5px;
    margin-right: 5px;
}

#under1,#under1_1,#under2,#under1_2,#under3,#under1_3,#under4,#t2_under1,
#t2_under1_1,#t2_under2,#t2_under1_2,#t2_under3,#t2_under1_3,#t2_under4{
    border-right: 1px solid gray;
}

#under1>img,
#t2_under1>img{
    margin-bottom: 10px;
    margin-top: 10px;
}

#under1>img,#under2>img, #under1_1>img,#under1_2>img,#under3>img,
#t2_under2>img, #t2_under1_1>img,#t2_under1_2>img,#t2_under3>img{
    margin-bottom: 10px;
}

.runeWinPick{
   width: 200px;
    height: 280px;
    background-color: white;
    float: left;
    padding-top: 100px;
    margin-top: 20px;
}

.runeWin{
    font-size: 25px;
    margin-left: 70px;
    margin-top: 100px;
}

.runePick{
    font-size: 25px;
    margin-left: 70px;
}

.perks>img,.t2_perks>img{
    background-color: black;
    border-radius: 100px;
    width: 35px;
    height: 35px;
    margin-top: 8px;
    margin-bottom: 8px;
    margin-left:8px;
    margin-right:8px;
}

#spell_start_box{
   float: left;
   width: 490px;
   height: 300px;
/*    background-color: black; */
}

#spell_box{
/*     background-color: aquamarine; */
    margin-left: 10px;
    margin-top: 20px;
    margin-right: 15px;
    width: 490px;
    height: 200px;
    border-radius: 8px;
}

#spell_table{
    text-align: left;
    width: 460px;
    border: solid 1px;
    margin-top: 25px;
    margin-left: 15px;
}

#start_box{
    float: left;
/*     background-color: aquamarine; */
    margin-left: 10px;
    margin-top: 20px;
    margin-right: 15px;
    width: 490px;
    height: 200px;
    border-radius: 8px;
}

#start_table{
    text-align: left;
    width: 460px;
    border: solid 1px;
    margin-top: 25px;
    margin-left: 15px;
}

#boots_box{
    float: left;
/*     background-color: aquamarine; */
    margin-left: 10px;
    margin-top: 20px;
    margin-right: 15px;
    width: 490px;
    height: 200px;
    border-radius: 8px;
}

#boots_table{
    text-align: left;
    width: 460px;
    border: solid 1px;
    margin-top: 25px;
    margin-left: 15px;
}

#skill_box{
    margin-top: 370px;
    margin-left: 20px;
    border-radius: 8px;
    border: solid 2px;
    width: 900px;
    height: 200px;
}

#skill_text{
    margin-left: 20px;
/*     float: left;
    margin-top: -50px; */
    font-size: 20px;
}

#lv>div:not(.LV15):not(.LV11):not(.LV6){
    width: 40px;
    height: 45px;
    margin-top: 40px;
    margin-right: 5px;
    border-radius: 8px;
    background-color: black;
    float: left;
    text-align: center;
    line-height: 50px;
}

.LV6, .LV11{
    width: 40px;
    height: 45px;
    margin-top: 40px;
    margin-right: 5px;
    border-radius: 8px;
    background-color: cornflowerblue;
    float: left;
    text-align: center;
    line-height: 50px;
}

.LV15{
    width: 40px;
    height: 45px;
    margin-top: 40px;
    margin-right: 3px;
    border-radius: 8px;
    background-color: black;
    float: left;
    text-align: center;
    line-height: 50px;
}

#item_table_box{
   background-color: white;
    position: absolute;
    margin-top: 30px;
    margin-left: 20px;
    width: 900px;
    height: 400px;
    border-radius: 8px;
    border: solid 2px;
}


#item_table{
    margin-top: 20px;
    margin-left: 20px;
    width: 700px;
    height: 350px;
}

.item_img{
   width: 50px;
    height: 50px;
    margin-right: 10px;
    margin-top: 20px;
    margin-left: 30px;
}

#r_contents {
   margin-left: 170px;
}

</style>
</head>
<body>
   <jsp:include page="../header.jsp"></jsp:include>
   <form id="select" action="tierDetail" method="get">
      <div class="tierVersion">
         <select id="selectOption" name="tier">
            <option id="bronze" value="bronze" style="color: #964b00;">+Bronze</option>
            <option id="silver" value="silver" style="color: #c0c0c0;">+Silver</option>
            <option id="gold" value="gold" style="color: #ffd700;">+Gold</option>
            <option id="platinum" value="platinum" style="color: #006fff;">+Platinum</option>
            <option id="diamond" value="diamond" style="color: #87cefa;">+Diamond</option>
         </select>
         <input value="${championName}" name="championName" type="hidden">
      </div>
   </form>
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
                <h2 style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;${champion_kr_name}-${lane}</h2><br>
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
<div>
<button type="button" id="top1" class="btn btn-primary" style="width:100px; height:50px;">
TOP1
</button>
<button type="button" id="top2" class="btn btn-primary" style="width:100px; height:50px;">
TOP2
</button>
</div>
<div id="build_box">
    <div id="rune_box1">
        <table class="rune_table" style="margin-left:20px;">
        <thead>
        <tr>
        <th style="border-right: 1px solid gray;">
           ${mainRunePng.get(0)}
        </th>
        </tr>
        </thead> <!-- 꼭대기 -->
        
        <tbody>
        <c:choose>
        <c:when test="${runes1.getMain_rune()==8100||runes1.getMain_rune()==8000}">
           <tr>
           <th id="under1">
           ${mainRunePng.get(1)}
           ${mainRunePng.get(2)}
           ${mainRunePng.get(3)}
           ${mainRunePng.get(4)}
           </th>
           </tr>
        </c:when>
         <c:otherwise >
            <tr>
           <th id="under1">
           ${mainRunePng.get(1)}
           ${mainRunePng.get(2)}
           ${mainRunePng.get(3)}
           </th>
           </tr>
         </c:otherwise>
        </c:choose><!-- 4층 -->
        
        <c:choose>
        <c:when test="${runes1.getMain_rune()==8100||runes1.getMain_rune()==8000}">
           <tr>
           <th id="under2">
           ${mainRunePng.get(5)}
           ${mainRunePng.get(6)}
           ${mainRunePng.get(7)}
           </th>
           </tr>
           <tr>
           <th id="under3">
           ${mainRunePng.get(8)}
           ${mainRunePng.get(9)}
           ${mainRunePng.get(10)}
           </th>
           </tr>
        </c:when>
         <c:otherwise >
            <tr>
           <th id="under2">
           ${mainRunePng.get(4)}
           ${mainRunePng.get(5)}
           ${mainRunePng.get(6)}
           </th>
           </tr>
            <tr>
           <th id="under3">
           ${mainRunePng.get(7)}
           ${mainRunePng.get(8)}
           ${mainRunePng.get(9)}
           </th>
           </tr>
         </c:otherwise>
        </c:choose><!-- 3층 2층 -->
        
        <c:choose>
        <c:when test="${runes1.getMain_rune()==8100}">
           <tr>
           <th id="under4">
           ${mainRunePng.get(11)}
           ${mainRunePng.get(12)}
           ${mainRunePng.get(13)}
           ${mainRunePng.get(14)}
           </th>
           </tr>
        </c:when>
        <c:when test="${runes1.getMain_rune()==8000}">
           <tr>
           <th id="under4">
           ${mainRunePng.get(11)}
           ${mainRunePng.get(12)}
           ${mainRunePng.get(13)}
           </th>
           </tr>
        </c:when>
        <c:otherwise >
           <tr>
           <th id="under4">
           ${mainRunePng.get(10)}
           ${mainRunePng.get(11)}
           ${mainRunePng.get(12)}
           </th>
           </tr>
        </c:otherwise>
        </c:choose>
        </tbody>
        </table> <!-- main runeBox-->
        
        <table class ="rune_table">
        <thead>
           <tr>
        <th style="border-right: 1px solid gray;">
           ${subRunePng.get(0)}
        </th>
        </tr>
        </thead>
        <tr><th style="height: 68px; border-right: 1px solid gray;"></th></tr>
        <c:choose>
        <c:when test="${runes1.getSub_rune()==8100||runes1.getSub_rune()==8000}">
           <tr>
           <th id="under2">
           ${subRunePng.get(5)}
           ${subRunePng.get(6)}
           ${subRunePng.get(7)}
           </th>
           </tr>
           <tr>
           <th id="under1_1">
           ${subRunePng.get(8)}
           ${subRunePng.get(9)}
           ${subRunePng.get(10)}
           </th>
           </tr>
        </c:when>
         <c:otherwise >
            <tr>
           <th id="under1_1">
           ${subRunePng.get(4)}
           ${subRunePng.get(5)}
           ${subRunePng.get(6)}
           </th>
           </tr>
            <tr>
           <th id="under1_2">
           ${subRunePng.get(7)}
           ${subRunePng.get(8)}
           ${subRunePng.get(9)}
           </th>
           </tr>
         </c:otherwise>
        </c:choose>
        
        <c:choose>
        <c:when test="${runes1.getSub_rune()==8100}">
           <tr>
           <th id="under1_3">
           ${subRunePng.get(11)}
           ${subRunePng.get(12)}
           ${subRunePng.get(13)}
           ${subRunePng.get(14)}
           </th>
           </tr>
        </c:when>
        <c:when test="${runes1.getSub_rune()==8000}">
           <tr>
           <th id="under1_3">
           ${subRunePng.get(11)}
           ${subRunePng.get(12)}
           ${subRunePng.get(13)}
           </th>
           </tr>
        </c:when>
        <c:otherwise >
           <tr>
           <th id="under1_3">
           ${subRunePng.get(10)}
           ${subRunePng.get(11)}
           ${subRunePng.get(12)}
           </th>
           </tr>
        </c:otherwise>
        </c:choose>
        </table> <!-- sub_runeBox -->
        
        <table class="rune_table">
        <thead>
        <tr><th style="height: 50px; border-right: 1px solid gray;"></th></tr>
        </thead>
        <tr><th style="height: 70px; border-right: 1px solid gray;"></th></tr>
        <tr>
        <th class="perks" style="border-right: 1px solid gray;">
        <img id ="statperks1" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks2" src="https://opgg-static.akamaized.net/images/lol/perkShard/5005.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5005">
        <img id ="statperks3" src="https://opgg-static.akamaized.net/images/lol/perkShard/5007.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5007">
        </th>
        </tr>
        <tr>
        <th class="perks" style="border-right: 1px solid gray;">
        <img id ="statperks4" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks5" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks6" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5003">
        </th>
        </tr>
        <tr>
        <th class="perks" style="border-right: 1px solid gray;">
        <img id ="statperks7" src="https://opgg-static.akamaized.net/images/lol/perkShard/5001.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5001">
        <img id ="statperks8" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks9" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5003">
        </th>
        </tr>
        </table>
        <div class="runeWinPick">
        <font class="runeWin">${rune_win1}%</font> <br> 
        <font class="runePick">${rune_pick1}</font>   
        <font style="color: gray;">게임</font>
        </div>
    </div><!-- rune_box1 -->
    
    
    
    
    
    
    
    <div id = "rune_box2">
        <table class="rune_table2" style="margin-top:20px; margin-left:20px">
        <thead>
        <tr>
        <th style="border-right: 1px solid gray;">
           ${mainRunePng2.get(0)}
        </th>
        </tr>
        </thead> <!-- 꼭대기 -->
        
        <tbody>
        <c:choose>
        <c:when test="${runes2.getMain_rune()==8100||runes2.getMain_rune()==8000}">
           <tr>
           <th id="t2_under1">
           ${mainRunePng2.get(1)}
           ${mainRunePng2.get(2)}
           ${mainRunePng2.get(3)}
           ${mainRunePng2.get(4)}
           </th>
           </tr>
        </c:when>
         <c:otherwise >
            <tr>
           <th id="t2_under1">
           ${mainRunePng2.get(1)}
           ${mainRunePng2.get(2)}
           ${mainRunePng2.get(3)}
           </th>
           </tr>
         </c:otherwise>
        </c:choose><!-- 4층 -->
        
        <c:choose>
        <c:when test="${runes2.getMain_rune()==8100||runes2.getMain_rune()==8000}">
           <tr>
           <th id="t2_under2">
           ${mainRunePng2.get(5)}
           ${mainRunePng2.get(6)}
           ${mainRunePng2.get(7)}
           </th>
           </tr>
           <tr>
           <th id="t2_under3">
           ${mainRunePng2.get(8)}
           ${mainRunePng2.get(9)}
           ${mainRunePng2.get(10)}
           </th>
           </tr>
        </c:when>
         <c:otherwise >
            <tr>
           <th id="t2_under2">
           ${mainRunePng2.get(4)}
           ${mainRunePng2.get(5)}
           ${mainRunePng2.get(6)}
           </th>
           </tr>
            <tr>
           <th id="t2_under3">
           ${mainRunePng2.get(7)}
           ${mainRunePng2.get(8)}
           ${mainRunePng2.get(9)}
           </th>
           </tr>
         </c:otherwise>
        </c:choose><!-- 3층 2층 -->
        
        <c:choose>
        <c:when test="${runes2.getMain_rune()==8100}">
           <tr>
           <th id="t2_under4">
           ${mainRunePng2.get(11)}
           ${mainRunePng2.get(12)}
           ${mainRunePng2.get(13)}
           ${mainRunePng2.get(14)}
           </th>
           </tr>
        </c:when>
        <c:when test="${runes2.getMain_rune()==8000}">
           <tr>
           <th id="t2_under4">
           ${mainRunePng2.get(11)}
           ${mainRunePng2.get(12)}
           ${mainRunePng2.get(13)}
           </th>
           </tr>
        </c:when>
        <c:otherwise >
           <tr>
           <th id="t2_under4">
           ${mainRunePng2.get(10)}
           ${mainRunePng2.get(11)}
           ${mainRunePng2.get(12)}
           </th>
           </tr>
        </c:otherwise>
        </c:choose>
        </tbody>
        </table> <!-- main runeBox-->
        
        <table class ="rune_table2">
        <thead>
           <tr>
        <th style="border-right: 1px solid gray;">
           ${subRunePng2.get(0)}
        </th>
        </tr>
        </thead>
        <tr><th style="height: 68px; border-right: 1px solid gray;"></th></tr>
        <c:choose>
        <c:when test="${runes2.getSub_rune()==8100||runes2.getSub_rune()==8000}">
           <tr>
           <th id="t2_under1_1">
           ${subRunePng2.get(5)}
           ${subRunePng2.get(6)}
           ${subRunePng2.get(7)}
           </th>
           </tr>
           <tr>
           <th id="t2_under1_2">
           ${subRunePng2.get(8)}
           ${subRunePng2.get(9)}
           ${subRunePng2.get(10)}
           </th>
           </tr>
        </c:when>
         <c:otherwise >
            <tr>
           <th id="under1_1">
           ${subRunePng2.get(4)}
           ${subRunePng2.get(5)}
           ${subRunePng2.get(6)}
           </th>
           </tr>
            <tr>
           <th id="t2_under1_2">
           ${subRunePng2.get(7)}
           ${subRunePng2.get(8)}
           ${subRunePng2.get(9)}
           </th>
           </tr>
         </c:otherwise>
        </c:choose>
        
        <c:choose>
        <c:when test="${runes2.getSub_rune()==8100}">
           <tr>
           <th id="t2_under1_2">
           ${subRunePng2.get(11)}
           ${subRunePng2.get(12)}
           ${subRunePng2.get(13)}
           ${subRunePng2.get(14)}
           </th>
           </tr>
        </c:when>
        <c:when test="${runes2.getSub_rune()==8000}">
           <tr>
           <th id="t2_under1_3">
           ${subRunePng2.get(11)}
           ${subRunePng2.get(12)}
           ${subRunePng2.get(13)}
           </th>
           </tr>
        </c:when>
        <c:otherwise >
           <tr>
           <th id="t2_under1_3">
           ${subRunePng2.get(10)}
           ${subRunePng2.get(11)}
           ${subRunePng2.get(12)}
           </th>
           </tr>
        </c:otherwise>
        </c:choose>
        </table> <!-- sub_runeBox -->
        
        <table class="rune_table2">
        <thead>
        <tr><th style="height: 50px; border-right: 1px solid gray;"></th></tr>
        </thead>
        <tr><th style="height: 70px; border-right: 1px solid gray;"></th></tr>
        <tr>
        <th class="t2_perks" style="border-right: 1px solid gray;">
        <img id ="statperks10" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks11" src="https://opgg-static.akamaized.net/images/lol/perkShard/5005.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5005">
        <img id ="statperks12" src="https://opgg-static.akamaized.net/images/lol/perkShard/5007.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5007">
        </th>
        </tr>
        <tr>
        <th class="t2_perks" style="border-right: 1px solid gray;">
        <img id ="statperks13" src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5008">
        <img id ="statperks14" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks15" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5003">
        </th>
        </tr>
        <tr>
        <th class="t2_perks" style="border-right: 1px solid gray;">
        <img id ="statperks16" src="https://opgg-static.akamaized.net/images/lol/perkShard/5001.png?image=q_auto,f_webp,w_48&v=1662451509327"
        data-value = "5001">
        <img id ="statperks17" src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5002">
        <img id ="statperks18" src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509143"
        data-value = "5003">
        </th>
        </tr>
        </table>
        <div class="runeWinPick">
        <font class="runeWin">${rune_win2}%</font> <br> 
        <font class="runePick">${rune_pick2}</font>   
        <font style="color: gray;">게임</font>
        </div>
     </div> <!--end rune_box   -->


   <div id="spell_start_box">
       <div id="spell_box">
           <table id="spell_table">
               <thead style="font-size: 20px;">
                   <tr>
                       <th>소환사 주문</th>
                       <th>픽률</th>
                       <th>승률</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <th>
                           <img style="width: 50px; height: 50px; margin-right: 10px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/${spell.spell1}.png" alt="">
                           <img style="width: 50px; height: 50px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/${spell.spell2}.png" alt="">
                       </th>
                       <th>
                           <font font-weight="bold" size="4">${spell.spell_pick}%</font><br>
                           <font font-weight="lighter">${spell.spell_cnt}</font>
                       </th>
                       <th>
                           ${spell.spell_winrate}%
                       </th>
                   </tr>
                    <c:if test="${!empty spell2}">
                      <tr>
                          <th>
                              <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/${spell2.spell1}.png" alt="">
                              <img style="width: 50px; height: 50px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/10.6.1/img/spell/${spell2.spell2}.png" alt="">
                          </th>
                          <th>
                              <font font-weight="bold" size="4">${spell2.spell_pick}%</font><br>
                              <font font-weight="lighter">${spell2.spell_cnt}</font>
                          </th>
                          <th>
                              ${spell2.spell_winrate}%
                          </th>
                      </tr>
                      </c:if>
               </tbody>
           </table>
       </div> <!-- end spell_box -->
       
       <div id="start_box">
           <table id="start_table">
               <thead style="font-size: 20px;">
                   <tr>
                       <th>시작 아이템</th>
                       <th>픽률</th>
                       <th>승률</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <th>
                           <img style="width: 50px; height: 50px; margin-right: 10px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${start1.start1}.png" alt="">
                           <c:if test="${start1.start2!=0}">
                              <img style="width: 50px; height: 50px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${start1.start2}.png" alt="">
                          </c:if>
                       </th>
                       <th>
                           ${start1.start_pick}<br>
                           ${start1.start_cnt}
                       </th>
                       <th>
                           ${start1.start_winrate}
                       </th>
                   </tr>
                   <tr>
                       <th>
                           <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${start2.start1}.png" alt="">
                           <c:if test="${start2.start2!=0}">
                              <img style="width: 50px; height: 50px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${start2.start2}.png" alt="">
                          </c:if>
                       </th>
                       <th>
                           ${start2.start_pick}<br>
                           ${start2.start_cnt}
                       </th>
                       <th>
                           ${start2.start_winrate}
                       </th>
                   </tr>
               </tbody>
           </table>
       </div> <!-- end start_box -->
         
       <div id="boots_box">
           <table id="boots_table">
               <thead style="font-size: 20px;">
                   <tr>
                       <th>신발</th>
                       <th>픽률</th>
                       <th>승률</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <th>
                           <img style="width: 50px; height: 50px; margin-right: 10px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${boots1.boots}.png" alt="">
                       </th>
                       <th>
                           ${boots1.boots_pick}<br>
                           ${boots1.boots_cnt}
                       </th>
                       <th>
                           ${boots1.boots_winrate}
                       </th>
                   </tr>
                   <tr>
                       <th>
                           <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${boots2.boots}.png" alt="">
                       </th>
                       <th>
                           ${boots2.boots_pick}<br>
                           ${bootst2.boots_cnt}
                       </th>
                       <th>
                           ${boots2.boots_winrate}
                       </th>
                   </tr>
               </tbody>
           </table>
       </div> <!-- end boots_box -->
       
   </div> <!-- end spell_start_box -->


   
      <div id="skill_box">
         <div id="skill_text">
            <br>
            <h4>스킬 빌드</h4>
         </div>
         <div id="lv" style="border-bottom: solid 1px gray; width: 700px; height: 10px;">
         <div class="LV1" style="margin-left: 10px;"><font class="lv1" size="5px">${skill1.lv1}</font></div>
         <div class="LV2"><font class="lv2" size="5px">${skill1.lv2}</font></div>
         <div class="LV3"><font class="lv3" size="5px">${skill1.lv3}</font></div>
         <div class="LV4"><font class="lv4" size="5px">${skill1.lv4}</font></div>
         <div class="LV5"><font class="lv5" size="5px">${skill1.lv5}</font></div>
         <div class="LV6"><font color="white" size="5px">R</font></div>
         <div class="LV7"><font class="lv7" size="5px">${skill1.lv7}</font></div>
         <div class="LV8"><font class="lv8" size="5px">${skill1.lv8}</font></div>
         <div class="LV9"><font class="lv9" size="5px">${skill1.lv9}</font></div>
         <div class="LV10"><font class="lv10" size="5px">${skill1.lv10}</font></div>
         <div class="LV11"><font class="lv11" color="white" size="5px">R</font></div>
         <div class="LV12"><font class="lv12" size="5px">${skill1.lv12}</font></div>
         <div class="LV13"><font class="lv13" size="5px">${skill1.lv13}</font></div>
         <div class="LV14"><font class="lv14" size="5px">${skill1.lv14}</font></div>
         <div class="LV15"><font class="lv15" size="5px">${skill1.lv15}</font></div>
         </div>
         <div id="skill_win_cnt" style="float:left; width:300px; height:200px;">
            <div>${skill1.skill_winrate}%</div>
            <div>${skill1.skill_cnt}게임</div>
         </div>
     </div> <!-- end skill_box -->
        
     <div id="item_build">
        <div id="item_table_box">
           <table id="item_table">
              <thead style="font-size:23px">
                 <tr>
                    <th>스킬빌드</th>
                    <th style="text-align: center">픽률</th>
                    <th style="text-align: center">승률</th>
                 </tr>
              </thead>
              <tbody>
                 <tr>
                    <th>
                       <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build.item1}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build.item2}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build.item3}.png" alt="">
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build.item_pick}%<br>
                       ${build.item_cnt}게임
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build.item_winrate}%
                    </th>
                 </tr>
                 
                 <tr>
                    <th>
                       <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build2.item1}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build2.item2}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build2.item3}.png" alt="">
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build2.item_pick}%<br>
                       ${build2.item_cnt}게임
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build2.item_winrate}%
                    </th>
                 </tr>
                 <tr>
                    <th>
                       <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build3.item1}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build3.item2}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build3.item3}.png" alt="">
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build3.item_pick}%<br>
                       ${build3.item_cnt}게임
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build3.item_winrate}%
                    </th>
                 </tr>
                 <tr>
                    <th>
                       <img class="item_img" style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build4.item1}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build4.item2}.png" alt="">
                       >
                       <img style="width: 50px; height: 50px; margin-right: 10px; margin-top: 20px;" src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/item/${build4.item3}.png" alt="">
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build4.item_pick}%<br>
                       ${build4.item_cnt}게임
                    </th>
                    <th style="text-align: center; font-size:18px">
                       ${build4.item_winrate}%
                    </th>
                 </tr>      
              </tbody>
           </table>
        </div>   
     </div>
        
        
    </div> <!--end build_box-->
    
   <div >
   <h1 style="font-size: 25px;">운영 Tip</h1>
      <br>
      <table id="rTable" Style="width: 1250px;">
         <!-- 댓글 출력 -->
      </table>
      <br>
      <table>
         <c:if test="${!empty sessionScope.m_nick}">
            <tr>
               <td><textarea rows="2" cols="100" id="r_contents"></textarea></td>
               <td><input type="button" class="btn btn-primary" value="댓글입력"
                  onclick="replyInsert(${championId})"
                  style = "width: 110px; height: 60px;"></td>
            </tr>
         </c:if>
      </table>
            <br>
   </div>
</body>
<script type="text/javascript">
let tier = '${tier}';
let championId = '${championId}';
$(function () {
   switch (tier) {
   case 'bronze':
      $('#bronze').prop('selected', true);
      break;
   case 'silver':
      $('#silver').prop('selected', true);
      break;
   case 'gold':
      $('#gold').prop('selected', true);
      break;
   case 'platinum':
      $('#platinum').prop('selected', true);      
      break;
   case 'diamond':
      $('#diamond').prop('selected', true);
      break;

   default:
      break;
   }
   
   statperks_ids1 = [$("#statperks1"),$("#statperks2"),$("#statperks3")]   
   statperks_ids2 = [$("#statperks4"),$("#statperks5"),$("#statperks6")]
   statperks_ids3 = [$("#statperks7"),$("#statperks8"),$("#statperks9")]

   for (var i = 0; i < statperks_ids1.length; i++) {
      if (${statperks3} === Number(statperks_ids1[i].attr("data-value"))){
         console.log('같음');
      } else{
         statperks_ids1[i].css("filter", "grayscale(100%)");
         statperks_ids1[i].css("opacity", "0.7");
      }
   }
   for (var i = 0; i < statperks_ids2.length; i++) {
      if (${statperks2} === Number(statperks_ids2[i].attr("data-value"))){
         console.log('같음');
      } else{
         statperks_ids2[i].css("filter", "grayscale(100%)");
         statperks_ids2[i].css("opacity", "0.7");
      }
   }
   for (var i = 0; i < statperks_ids3.length; i++) {
      if (${statperks1} === Number(statperks_ids3[i].attr("data-value"))){
         console.log('같음');
      } else{
         statperks_ids3[i].css("filter", "grayscale(100%)");
         statperks_ids3[i].css("opacity", "0.7");
      }
   }
   
   lv_list=[$(".lv1"),$(".lv2"),$(".lv3"),$(".lv4"),$(".lv5"),$(".lv7"),$(".lv8"),$(".lv9"),$(".lv10"),$(".lv12"),$(".lv13"),$(".lv14"),$(".lv15")]
   lv=["${skill1.lv1}","${skill1.lv2}","${skill1.lv3}","${skill1.lv4}","${skill1.lv5}","${skill1.lv7}","${skill1.lv8}","${skill1.lv9}","${skill1.lv10}",
      "${skill1.lv12}","${skill1.lv13}","${skill1.lv14}","${skill1.lv15}"]
   
   for(var j=0;j<lv_list.length;j++){
      if(lv[j]==="Q") lv_list[j].css("color","lightskyblue");
      
      else if(lv[j]==="W") lv_list[j].css("color","lightcoral");
      
      else lv_list[j].css("color","lightgreen");
   }
      $.ajax({
            type: 'get',
            url: 'selectReply',
            data: {championId : championId},
         
            contentType : 'application/json;charset=UTF-8',   
               
            success: function(data) {
               console.log("1:",data);
               let admin = '관리자';
               rList = '';
            $.each(data, function(i, reply){
               rList+='<tr height="25" align="center" style ="border-bottom: 1px solid lightgray;">'
                  +'<td width="450">'+reply.r_contents+'</td>'
                  +'<td width="70">'+reply.r_nick+'</td>'
                  +'<td width="70">'+reply.r_date+'</td>';
               if (reply.r_nick == "${sessionScope.m_nick}" || admin == "${sessionScope.m_nick}"){
                  rList += '<td width="70"><button class="btn btn-outline-dark" onclick="correctReply('+reply.r_num+')">수정</button>'
                        +'<button class="btn btn-outline-dark" onclick="deleteReply('+reply.r_num+')">삭제</button></td></tr>';
               }else{
                  rList += '</tr>';            
               }
            });
             $('#rTable').html(rList);
            }, error: function(err) {
               console.log(err);
            }
         }); //ajax End
});


$("#top1").click(function(){
   
   $("#rune_box1").css("display", "block");
   $("#rune_box2").css("display", "none");
   
});

$("#top2").click(function(){
   let statperks_ids4 = [$("#statperks10"),$("#statperks11"),$("#statperks12")]   
   let statperks_ids5 = [$("#statperks13"),$("#statperks14"),$("#statperks15")]
   let statperks_ids6 = [$("#statperks16"),$("#statperks17"),$("#statperks18")]

   for (var i = 0; i < statperks_ids4.length; i++) {
       if (${statperks2_3} === Number(statperks_ids4[i].attr("data-value"))){
         console.log('같음');
      } else{
         statperks_ids4[i].css("filter", "grayscale(100%)");
         statperks_ids4[i].css("opacity", "0.7");
      }
   }
   for (var i = 0; i < statperks_ids5.length; i++) {
      if (${statperks2_2} === Number(statperks_ids5[i].attr("data-value"))){
         console.log('같음');
      } else{
         statperks_ids5[i].css("filter", "grayscale(100%)");
         statperks_ids5[i].css("opacity", "0.7");
      }
   }
   for (var i = 0; i < statperks_ids6.length; i++) {
      if (${statperks2_1} === Number(statperks_ids6[i].attr("data-value"))){
         console.log('같음');
      } else{
         statperks_ids6[i].css("filter", "grayscale(100%)");
         statperks_ids6[i].css("opacity", "0.7");
      }
   }
   
   $("#rune_box2").css("display", "block");
   $("#rune_box1").css("display", "none");
});

$(".lane_btn").click(function(){
   console.log($(this).val());
   let championName = "${championName}";
   let button_value = $(this).val();
   let $form = $("<form action='runeLine' method ='get'></form>");
   $("<input type='hidden'>").attr("name", "lane").val(button_value).appendTo($form);
   $("<input type='hidden'>").attr("name", "championName").val(championName).appendTo($form);
   $("<input type='hidden'>").attr("name", "tier").val(tier).appendTo($form);
   $form.appendTo("body");
   $form.submit();
});

$('#selectOption').on('change', function (){
   $('#select').submit();
});

function replyInsert(championId){
   let r_contents = $('#r_contents').val();
   
   $('#r_contents').val("");
   $.ajax({
      type: 'get',
      url: 'replyInsert',
      data: {championId : championId , r_contents : r_contents},
   
      contentType : 'application/json;charset=UTF-8',   
         
      success: function(data) {
         console.log("1:",data);
         let admin = '관리자';
         rList = '';
      $.each(data, function(i, reply){
         rList+='<tr height="25" align="center" style ="border-bottom: 1px solid lightgray;">'
            +'<input type="hidden" value='+reply.r_num+'>'
            +'<td width="70">'+reply.r_nick+'</td>' // 닉네임으로 바꿀예정
            +'<td width="450">'+reply.r_contents+'</td>'
            +'<td width="70">'+reply.r_date+'</td>';
         if (reply.r_nick == "${sessionScope.m_nick}" || admin == "${sessionScope.m_nick}"){
            rList += '<td width="70"><button class="btn btn-outline-dark" onclick="correctReply('+reply.r_num+')">수정</button>'
            +'<button class="btn btn-outline-dark" onclick="deleteReply('+reply.r_num+')">삭제</button></td></tr>';
         }else{
            rList += '</tr>';            
         }
      });
       $('#rTable').html(rList);
      }, error: function(err) {
         console.log(err);
      }
   }); //ajax End
}

//댓글 입력 후 엔터 칠 때
$("#r_contents").keydown(function(key) {                
   if (key.keyCode == 13) {                    
      if ($('#r_contents').val() != ""){
         let r_contents = $('#r_contents').val();
         $('#r_contents').val("");
         $.ajax({
            type: 'get',
            url: 'replyInsert',
            data: {championId : championId , r_contents : r_contents},
         
            contentType : 'application/json;charset=UTF-8',   
               
            success: function(data) {
               console.log("1:",data);
               let admin = '관리자';
               rList = '';
            $.each(data, function(i, reply){
               rList+='<tr height="25" align="center" style ="border-bottom: 1px solid lightgray;">'
                  +'<input type="hidden" value='+reply.r_num+'>'
                  +'<td width="70">'+reply.r_nick+'</td>'
                  +'<td width="450">'+reply.r_contents+'</td>'
                  +'<td width="70">'+reply.r_date+'</td>';
               if (reply.r_nick == "${sessionScope.m_nick}" || admin == "${sessionScope.m_nick}"){
                  rList += '<td width="70"><button class="btn btn-outline-dark" onclick="correctReply('+reply.r_num+')">수정</button>'
                  +'<button class="btn btn-outline-dark" onclick="deleteReply('+reply.r_num+')">삭제</button></td></tr>';
               }else{
                  rList += '</tr>';            
               }
            });
             $('#rTable').html(rList);
            }, error: function(err) {
               console.log(err);
            }
         }); //ajax End
      }
   }
});

//댓글 삭제
function deleteReply(r_num){
   
   $.ajax({
      type: 'get',
      url: 'deleteReply',
      data: {championId : championId , r_num : r_num},
   
      contentType : 'application/json;charset=UTF-8',   
   
      success: function(data) {
         console.log("1:",data);
         let admin = '관리자';
         rList = '';
      $.each(data, function(i, reply){
         rList+='<tr height="25" align="center" style ="border-bottom: 1px solid lightgray;">'
            +'<input type="hidden" value='+reply.r_num+'>'
            +'<td width="70">'+reply.r_nick+'</td>' // 닉네임으로 바꿀예정
            +'<td width="450">'+reply.r_contents+'</td>'
            +'<td width="70">'+reply.r_date+'</td>';
         if (reply.r_nick == "${sessionScope.m_nick}" || admin == "${sessionScope.m_nick}"){
            rList += '<td width="200"><button class="btn btn-outline-dark" onclick="correctReply('+reply.r_num+')">수정</button>'
            +'<button class="btn btn-outline-dark" onclick="deleteReply('+reply.r_num+')">삭제</button></td></tr>';
         }else{
            rList += '</tr>';            
         }
      });
       $('#rTable').html(rList);
      }, error: function(err) {
         console.log(err);
      }
   }); //ajax End
}
//댓글 수정 클릭 시 
function correctReply(r_num){
   
   $.ajax({
      type: 'get',
      url: 'correctReply',
      data: {championId : championId , r_num : r_num},
   
      contentType : 'application/json;charset=UTF-8',   
      
      success: function(reply) {
         console.log("1:",reply);
         $('#r_contents').val(reply.r_contents);
         $('#inputButton').attr('onclick', 'replyUpdate('+reply.r_num+')');
         $('#inputButton').attr("value", "수정완료");
//        $('#rTable').html(rList);
      }, error: function(err) {
         console.log(err);
      }
   }); //ajax End
}

//댓글 수정완료 버튼
function replyUpdate(r_num)  {
   
   let r_contents = $('#r_contents').val();
   
   $('#r_contents').val("");
   $.ajax({
      type: 'get',
      url: 'replyUpdate',
      data: {championId : championId , r_num : r_num, r_contents : r_contents},
   
      contentType : 'application/json;charset=UTF-8',   
         
      success: function(data) {
         console.log("1:",data);
         let admin = '관리자';
         rList = '';
      $.each(data, function(i, reply){
         rList+='<tr height="25" align="center" style ="border-bottom: 1px solid lightgray;">'
            +'<input type="hidden" value='+reply.r_num+'>'
            +'<td width="70">'+reply.r_nick+'</td>'
            +'<td width="450">'+reply.r_contents+'</td>'
            +'<td width="70">'+reply.r_date+'</td>';
         if (reply.r_nick == "${sessionScope.m_nick}" || admin == "${sessionScope.m_nick}"){
            rList += '<td width="70"><button class="btn btn-outline-dark" onclick="correctReply('+reply.r_num+')">수정</button>'
            +'<button class="btn btn-outline-dark" onclick="deleteReply('+reply.r_num+')">삭제</button></td></tr>';
         }else{
            rList += '</tr>';            
         }
      });
      $('#rTable').html(rList);
      
      $('#inputButton').attr('onclick', 'replyInsert('+championId+')');
      $('#inputButton').attr("value", "댓글입력");
      }, error: function(err) {
         console.log(err);
      }
   });
   
}
</script>
</html>