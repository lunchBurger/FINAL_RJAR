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
</head>
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

#champion_profile {
   width: 100%;
   height: 300px;
   background-color: antiquewhite;
}

#champ_img_box {
   width: 600px;
   height: 300px;
   background-color: blue;
}

#champ_img_box2 {
   margin-left: 20px;
   margin-top: 0px;
   width: 150px;
   height: 200px;
   /* background-color: aliceblue; */
   float: left;
}

.lane_btn {
   width: 150px;
   height: 40px;
   margin-top: 40px;
   margin-left: 30px;
}

#champ_img {
   margin-top: 30px;
   margin-left: 10px;
   width: 160px;
   height: 170px;
}

.champ_skill {
   margin-top: 20px;
   width: 45px;
   height: 45px;
}

#champ_skill_box {
   margin-left: 30px;
   float: left;
}

#champ_skill_box>div {
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

#build_box {
   background-color: antiquewhite;
   overflow: hidden;
   width: 100%;
   height: 1080px;
}

#rune_box1 {
    width: 900px;
    height: 385px;
    margin: auto;
    margin-top: 50px;
    padding-left: 45px;
}
}

.rune_table, .rune_table2 {
   float: left;
   text-align: center;
}

.rune_table>thead>tr>th, .rune_table2>thead>tr>th {
   width: 280px;
   height: 50px;
   /* border: solid 2px black; */
}

.rune_table>thead>tr>th>img, tbody>tr>th>img, .rune_table2>thead>tr>th>img,
   tbody>tr>th>img {
   width: 45px;
   height: 45px;
   margin-left: 5px;
   margin-right: 5px;
}

#under1>img, #t2_under1>img {
   margin-bottom: 10px;
   margin-top: 10px;
}

#under1>img, #under2>img, #under1_1>img, #under1_2>img, #under3>img,
   #t2_under2>img, #t2_under1_1>img, #t2_under1_2>img, #t2_under3>img {
   margin-bottom: 10px;
}

.runeWinPick {
   width: 200px;
   height: 280px;
   background-color: white;
   float: left;
   padding-top: 100px;
}

.runeWin {
   font-size: 25px;
   margin-left: 70px;
   margin-top: 100px;
}

.runePick {
   font-size: 25px;
   margin-left: 70px;
}

.perks>img, .t2_perks>img {
   background-color: black;
   border-radius: 100px;
   width: 35px;
   height: 35px;
   margin-top: 8px;
   margin-bottom: 8px;
   margin-left: 8px;
   margin-right: 8px;
}

#spell_box {
   float: left;
   background-color: aquamarine;
   margin-left: 15px;
   margin-top: 20px;
   margin-right: 15px;
   width: 530px;
   height: 200px;
   border-radius: 8px;
}

#spell_table {
   text-align: left;
   width: 500px;
   border: solid 1px;
   margin-top: 25px;
   margin-left: 15px;
}

#start_box {
   float: left;
   background-color: aquamarine;
   margin-left: 15px;
   margin-top: 20px;
   margin-right: 15px;
   width: 530px;
   height: 200px;
   border-radius: 8px;
}

#start_table {
   text-align: left;
   width: 500px;
   border: solid 1px;
   margin-top: 25px;
   margin-left: 15px;
}

.wholeBox {
   width: 1500px;
   z-index: 2;
}

.vsBox {
   margin: auto;
   width: 742px;
   height: 150px;
   margin-top: 20px;
}

.outerVsGraghBox {
   width: 500px;
   height: 100px;
   float: left;
}

#champ {
   float: left;
}

#counter {
   float: left;
}

.champNameBox {
   margin-top: 20px;
}

.champName {
   float: left;
   font-weight: bold;
   font-size: 30px;
   text-align: center;
   width: 100px;
   height: 50px;
}

.counterName {
   float: right;
   font-weight: bold;
   font-size: 30px;
   text-align: center;
   width: 100px;
   height: 50px;
}

.innerVsGraghBox {
   float: left;
   margin-left: 23px;
   width: 450px;
}

.vsGragh {
   float: left;
   height: 25px;
   color: white;
}

#vsGragh1 {
   text-align: left;
   float: left;
   background-color: blue;
}

#vsGragh2 {
   text-align: right;
   float: left;
   background-color: red;
}

.outerBox {
   width: 600px;
   height: 50px;
   margin: auto;
}

.font1 {
   font-size: 20px;
   float: left;
}

.font2 {
   font-size: 20px;
   float: right;
}

.innerWinRateBox {
   float: left;
   width: 600px;
   height: 13px;
}

.gragh_1 {
   float: left;
   height: 13px;
   background-color: blue;
}

.gragh_2 {
   float: left;
   height: 13px;
   background-color: red;
}

.counterTable {
   float: right;
   font-size: 20px;
   border: 2px solid black;
}

.counterList {
   width: 80px;
   border-bottom: 2px solid black;
   background-color: inherit;
}

.counterList {
  top: 50%;
  left: 50%;
  box-shadow: 0 27px 55px 0 rgba(0, 0, 0, 0.3), 0 17px 17px 0 rgba(0, 0, 0, 0.15);
}
.counterList :hover {
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.25), 0 2px 2px 0 rgba(0, 0, 0, 0.1);
}
.counterList :hover{
  transform: scale(1.06);
  transition: transform 500ms cubic-bezier(0.165, 0.84, 0.44, 1) 0ms;
}
.counterList :hover {
  opacity: 0.45;
  transform: scale(1);
  -webkit-animation-name: bgin;
          animation-name: bgin;
  -webkit-animation-duration: 400ms;
          animation-duration: 400ms;
  transition: opacity 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms, transform 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
}

.background {
    z-index: 1;
    margin: auto;
    width: 1500px;
    height: 650px;
}

font{
   color:white;
}
table th font{
   color: white;
   
}
table tr{
   height: 58px;
}   

table {
   background-color: #0000;
   border-radius: 3px;
}
</style>
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
         </select> <input value="${championName}" name="championName" type="hidden">
      </div>
   </form>
   <div id="champion_profile">
      <div id="champ_img_box">
         <div id="lane_btn_box">
            <button class="lane_btn" value="${lane1}">${lane1}</button>
            <c:if test="${!empty lane2}">
               <button class="lane_btn" value="${lane2}">${lane2}</button>
            </c:if>
         </div>
         <div id="champ_img_box2">
            <img id="champ_img"
               src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${championName}.png"
               alt="">
         </div>
         <div id="champ_text">
            <h2 style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;${champion_kr_name}-${lane}</h2>
            <br>
            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;챔피언 티어 : 3티어</h5>
         </div>
         <div id="champ_skill_box">
            <div id="p">
               <img class="champ_skill"
                  src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/passive/${start1.passive}"
                  alt="">
            </div>
            <div id="q">
               <img class="champ_skill"
                  src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.q}"
                  alt="">
            </div>
            <div id="w">
               <img class="champ_skill"
                  src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.w}"
                  alt="">
            </div>
            <div id="e">
               <img class="champ_skill"
                  src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.e}"
                  alt="">
            </div>
            <div id="r">
               <img class="champ_skill"
                  src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/spell/${start1.r}"
                  alt="">
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
   <div class="background">
      <div class="wholeBox">
         <div class="counterTable">
            <table>
               <tr>
                  <td class="counterList"></td>
                  <td class="counterList" style="color:white">이름</td>
                  <td class="counterList" style="color:white">승률</td>
                  <td class="counterList" style="color:white">게임수</td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter1}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter1}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter1} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(0).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(0).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter2}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter2}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter2} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(1).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(1).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter3}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter3}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter3} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(2).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(2).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter4}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter4}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter4} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(3).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(3).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter5}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter5}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter5} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(4).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(4).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter6}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter6}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter6} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(5).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(5).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter7}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter7}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter7} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(6).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(6).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter8}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter8}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter8} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(7).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(7).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter9}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter9}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter9} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(8).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(8).getGameCount()}</font></td>
               </tr>
               <tr class="championTr" data-champion="${counters.counter10}">
                  <td class="counterList"><img
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counters.counter10}.png"
                     style="width: 52px; height: 52px;"></td>
                  <td class="counterList"><font> ${counters.counter10} </font></td>
                  <td class="counterList"><font>${vsWinRate.get(9).getVsWinRate()}</font></td>
                  <td class="counterList"><font>${vsWinRate.get(9).getGameCount()}</font></td>
               </tr>
            </table>
         </div>
         <div class="rateBox">
            <div class="vsBox">
               <div class="championImg">
                  <img id="champ"
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${championName}.png"
                     alt="">
               </div>

               <div class="outerVsGraghBox">
                  <div class="champNameBox">
                     <font class="champName">${championName}</font>
                  </div>
                  <div class="champNameBox">
                     <font class="counterName">${counter}</font>
                  </div>

                  <div class="innerVsGraghBox">
                     <div class="vsGragh" id="vsGragh1" style="width: ${vsWinRate1}%">${championName}</div>
                     <div class="vsGragh" id="vsGragh2" style="width: ${vsWinRate2}%">${counter}</div>
                  </div>
               </div>

               <div class="championImg">
                  <img id=counter
                     src="https://ddragon.leagueoflegends.com/cdn/12.15.1/img/champion/${counter}.png"
                     alt="">
               </div>
            </div>




            <div class="wholeGraghBox">
               <div class="outerBox">
                  <div>
                     <font class="font1">${vsWinRate1}</font>
                  </div>
                  <div>
                     <font class="font2">${vsWinRate2}</font>
                  </div>
                  <font style="margin-left: 255px; color: white;">승률</font>

                  <div class="innerWinRateBox">
                     <div class="gragh_1" style="width: ${vsWinRate1}%;"></div>
                     <div class="gragh_2" style="width: ${vsWinRate2}%;"></div>
                  </div>
               </div>

               <div class="outerBox">
                  <div>
                     <font class="font1">${kda1}</font>
                  </div>
                  <div>
                     <font class="font2">${kda2}</font>
                  </div>
                  <font style="margin-left: 260px; color: white;">KDA</font>
                  <div class="innerWinRateBox">
                     <div class="gragh_1" style="width: ${kdaWidth1}%;"></div>
                     <div class="gragh_2" style="width: ${kdaWidth2}%;"></div>
                  </div>
               </div>

               <div class="outerBox">
                  <div>
                     <font class="font1">${PswinRate1}</font>
                  </div>
                  <div>
                     <font class="font2">${PswinRate2}</font>
                  </div>
                  <font style="margin-left: 225px; color: white;">포지션승률</font>
                  <div class="innerWinRateBox">
                     <div class="gragh_1" style="width: ${PswinRateWidth1}%;"></div>
                     <div class="gragh_2" style="width: ${PswinRateWidth2}%;"></div>
                  </div>
               </div>

               <div class="outerBox">
                  <div>
                     <font class="font1">${damageDealt1}</font>
                  </div>
                  <div>
                     <font class="font2">${damageDealt2}</font>
                  </div>
                  <font style="margin-left: 210px; color: white;">가한피해량</font>
                  <div class="innerWinRateBox">
                     <div class="gragh_1" style="width: ${damageDealtWidth1}%;"></div>
                     <div class="gragh_2" style="width: ${damageDealtWidth2}%;"></div>
                  </div>
               </div>

               <div class="outerBox">
                  <div>
                     <font class="font1">${killParticipation1}</font>
                  </div>
                  <div>
                     <font class="font2">${killParticipation2}</font>
                  </div>
                  <font style="margin-left: 225px; color: white;">킬관여율</font>
                  <div class="innerWinRateBox">
                     <div class="gragh_1" style="width: ${killParticipation1}%;"></div>
                     <div class="gragh_2" style="width: ${killParticipation2}%;"></div>
                  </div>
               </div>

               <div class="outerBox">
                  <div>
                     <font class="font1">${banRate1}</font>
                  </div>
                  <div>
                     <font class="font2">${banRate2}</font>
                  </div>
                  <font style="margin-left: 255px; color: white;">밴률</font>
                  <div class="innerWinRateBox">
                     <div class="gragh_1" style="width: ${banRateWidth1}%;"></div>
                     <div class="gragh_2" style="width: ${banRateWidth2}%;"></div>
                  </div>
               </div>


            </div>
            <!-- End wholeGraghBox -->
         </div>
      </div>
      <!-- End wholeBox -->
   </div>
   <div id="rune_box1">
      <table class="rune_table">
         <thead>
            <tr>
               <th>${mainRunePng.get(0)}</th>
            </tr>
         </thead>
         <!-- 꼭대기 -->

         <tbody>
            <c:choose>
               <c:when
                  test="${counterRunes.getMain_rune()==8100||counterRunes.getMain_rune()==8000}">
                  <tr>
                     <th id="under1">${mainRunePng.get(1)}${mainRunePng.get(2)}
                        ${mainRunePng.get(3)} ${mainRunePng.get(4)}</th>
                  </tr>
               </c:when>
               <c:otherwise>
                  <tr>
                     <th id="under1">${mainRunePng.get(1)}${mainRunePng.get(2)}
                        ${mainRunePng.get(3)}</th>
                  </tr>
               </c:otherwise>
            </c:choose>
            <!-- 4층 -->

            <c:choose>
               <c:when
                  test="${counterRunes.getMain_rune()==8100||counterRunes.getMain_rune()==8000}">
                  <tr>
                     <th id="under2">${mainRunePng.get(5)}${mainRunePng.get(6)}
                        ${mainRunePng.get(7)}</th>
                  </tr>
                  <tr>
                     <th id="under3">${mainRunePng.get(8)}${mainRunePng.get(9)}
                        ${mainRunePng.get(10)}</th>
                  </tr>
               </c:when>
               <c:otherwise>
                  <tr>
                     <th id="under2">${mainRunePng.get(4)}${mainRunePng.get(5)}
                        ${mainRunePng.get(6)}</th>
                  </tr>
                  <tr>
                     <th id="under3">${mainRunePng.get(7)}${mainRunePng.get(8)}
                        ${mainRunePng.get(9)}</th>
                  </tr>
               </c:otherwise>
            </c:choose>
            <!-- 3층 2층 -->

            <c:choose>
               <c:when test="${counterRunes.getMain_rune()==8100}">
                  <tr>
                     <th id="under4">${mainRunePng.get(11)}
                        ${mainRunePng.get(12)} ${mainRunePng.get(13)}
                        ${mainRunePng.get(14)}</th>
                  </tr>
               </c:when>
               <c:when test="${runes1.getMain_rune()==8000}">
                  <tr>
                     <th id="under4">${mainRunePng.get(11)}
                        ${mainRunePng.get(12)} ${mainRunePng.get(13)}</th>
                  </tr>
               </c:when>
               <c:otherwise>
                  <tr>
                     <th id="under4">${mainRunePng.get(10)}
                        ${mainRunePng.get(11)} ${mainRunePng.get(12)}</th>
                  </tr>
               </c:otherwise>
            </c:choose>
         </tbody>
      </table>
      <!-- main runeBox-->

      <table class="rune_table">
         <thead>
            <tr>
               <th>${subRunePng.get(0)}</th>
            </tr>
         </thead>
         <tr>
            <th style="height: 68px;"></th>
         </tr>
         <c:choose>
            <c:when
               test="${counterRunes.getSub_rune()==8100||counterRunes.getSub_rune()==8000}">
               <tr>
                  <th id="under2">${subRunePng.get(5)}${subRunePng.get(6)}
                     ${subRunePng.get(7)}</th>
               </tr>
               <tr>
                  <th id="under1_1">${subRunePng.get(8)}${subRunePng.get(9)}
                     ${subRunePng.get(10)}</th>
               </tr>
            </c:when>
            <c:otherwise>
               <tr>
                  <th id="under1_1">${subRunePng.get(4)}${subRunePng.get(5)}
                     ${subRunePng.get(6)}</th>
               </tr>
               <tr>
                  <th id="under1_2">${subRunePng.get(7)}${subRunePng.get(8)}
                     ${subRunePng.get(9)}</th>
               </tr>
            </c:otherwise>
         </c:choose>

         <c:choose>
            <c:when test="${counterRunes.getSub_rune()==8100}">
               <tr>
                  <th id="under1_3">${subRunePng.get(11)}${subRunePng.get(12)}
                     ${subRunePng.get(13)} ${subRunePng.get(14)}</th>
               </tr>
            </c:when>
            <c:when test="${counterRunes.getSub_rune()==8000}">
               <tr>
                  <th id="under1_3">${subRunePng.get(11)}${subRunePng.get(12)}
                     ${subRunePng.get(13)}</th>
               </tr>
            </c:when>
            <c:otherwise>
               <tr>
                  <th id="under1_3">${subRunePng.get(10)}${subRunePng.get(11)}
                     ${subRunePng.get(12)}</th>
               </tr>
            </c:otherwise>
         </c:choose>
      </table>
      <!-- sub_runeBox -->

      <table class="rune_table">
         <thead>
            <tr>
               <th style="height: 50px;"></th>
            </tr>
         </thead>
         <tr>
            <th style="height: 70px;"></th>
         </tr>
         <tr>
            <th class="perks"><img id="statperks1"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
               data-value="5008"> <img id="statperks2"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5005.png?image=q_auto,f_webp,w_48&v=1662451509327"
               data-value="5005"> <img id="statperks3"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5007.png?image=q_auto,f_webp,w_48&v=1662451509327"
               data-value="5007"></th>
         </tr>
         <tr>
            <th class="perks"><img id="statperks4"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=q_auto,f_webp,w_48&v=1662451509327"
               data-value="5008"> <img id="statperks5"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
               data-value="5002"> <img id="statperks6"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509327"
               data-value="5003"></th>
         </tr>
         <tr>
            <th class="perks"><img id="statperks7"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5001.png?image=q_auto,f_webp,w_48&v=1662451509327"
               data-value="5001"> <img id="statperks8"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=q_auto,f_webp,w_48&v=1662451509143"
               data-value="5002"> <img id="statperks9"
               src="https://opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=q_auto,f_webp,w_48&v=1662451509143"
               data-value="5003"></th>
         </tr>
      </table>
   </div>
</body>
<script type="text/javascript">
let tier = '${tier}';
let lane = '${lane}';
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
   
   $(".background").css('background-image', 'url(http://ddragon.leagueoflegends.com/cdn/img/champion/splash/'+'${championName}'+'_0.jpg)');
   $(".background").css('opacity','0.8');
});

//클릭 시 상세페이지로 다시 이동
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

$('.championTr').click(function(){
   let championName = "${championName}";
   let counter = $(this).attr('data-champion');
   let $form = $("<form action='counterCal' method ='get'></form>");
   $("<input type='hidden'>").attr("name", "championName").val(championName).appendTo($form);
   $("<input type='hidden'>").attr("name", "counter1").val(counter).appendTo($form);   
   $("<input type='hidden'>").attr("name", "lane").val(lane).appendTo($form);
   $("<input type='hidden'>").attr("name", "tier").val(tier).appendTo($form);
   $form.appendTo("body");
   $form.submit();
});

</script>
</html>