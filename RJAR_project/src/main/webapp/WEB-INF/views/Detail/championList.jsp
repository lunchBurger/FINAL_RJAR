<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
.tierVersion {
   width: 549px;
   margin-top: 16px;
}

#selectOption {
    width: 183px;
    height: 57px;
   margin: 5px;
   border: 2px solid black;
   font-size: 20px;
   font-weight: bold;
    margin-right: 354px;
    margin-bottom: 20px;
}
}

option {
   font-weight: bold;
}

.laneTd {
   width: 200px;
   padding: 1px;
}

*, *:before, *:after {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-size: 1.2rem;
  font-family: "Open Sans", sans-serif;
  color: #444;
  background-color: #fff;
  margin: 0;
  padding: 4rem;
}

.lane_ {
   display: inline-block;
   padding: 1em 2em;
   border-radius: 5px;
   color: white;
   font-weight: bold;
   font-size: 15px;
   letter-spacing: 2px;
   text-transform: uppercase;
   text-decoration: none;
   background: linear-gradient(to right, #333 25%, lightgray 75%);
   background-position: 1% 50%;
   background-size: 400% 300%;
   border: 1px solid lightgray;
   transition: 700ms cubic-bezier(0.165, 0.84, 0.44, 1);
    width: 145px;
    height: 60px;
}

.lane_ {
  transition: 400ms cubic-bezier(0.165, 0.84, 0.44, 1);
}

.lane_:hover {
  color: white;
  color: #fff;
  background-position: 99% 50%;
}

.tierChamp {
  top: 50%;
  left: 50%;
  box-shadow: 0 27px 55px 0 rgba(0, 0, 0, 0.3), 0 17px 17px 0 rgba(0, 0, 0, 0.15);
}
.tierChamp:hover {
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.25), 0 2px 2px 0 rgba(0, 0, 0, 0.1);
}
.tierChamp:hover{
  transform: scale(1.06);
  transition: transform 500ms cubic-bezier(0.165, 0.84, 0.44, 1) 0ms;
}
.tierChamp:hover {
  filter: grayscale(100%);
  transform: scale(1);
  -webkit-animation-name: bgin;
          animation-name: bgin;
  -webkit-animation-duration: 400ms;
          animation-duration: 400ms;
  transition: opacity 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms, transform 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
}

.champion {
  top: 50%;
  left: 50%;
  box-shadow: 0 27px 55px 0 rgba(0, 0, 0, 0.3), 0 17px 17px 0 rgba(0, 0, 0, 0.15);
}
.champion :hover {
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.25), 0 2px 2px 0 rgba(0, 0, 0, 0.1);
}
.champion :hover{
  transform: scale(1.06);
  transition: transform 500ms cubic-bezier(0.165, 0.84, 0.44, 1) 0ms;
}
.champion :hover {
  opacity: 0.45;
  transform: scale(1);
  -webkit-animation-name: bgin;
          animation-name: bgin;
  -webkit-animation-duration: 400ms;
          animation-duration: 400ms;
  transition: opacity 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms, transform 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
}

.champList {
   width: 545px;
}

.champion { /* 이미지 감싼 태그 */
   margin-left: 10px;
   margin-top: 3px;
   float: left;
   width: 60px;
   height: 80px;
   
}

.listimg {
   width: 60px;
   height: 60px;
}

.championName {
   margin: auto;
   display: block;
   width: 50px;
   /* 이 두께를 넘어가야 ..처리됨 */
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
   font-weight: bold;
}
/* 검색 자동완성 */
.searchResult {
   position: absolute;
   background-color: white;
   width: 500px; 
}

.championDetail {
   height: 45px;
   border-bottom: 1px solid lightgray;
   padding-top: 5px;
}

.selectImg {
   margin-right: 10px;
   width:35px;
   height:35px;
   border-radius: 3px;
}
/* 검색 자동완성 */
.laneimg {
   float: left;
   width: 500px;
   height: 55px;
   margin-bottom: 10px;
   border-radius: 5px;
   positon : relative;
}

.championList {
   positon :relative;
}

.laneimg tr td{
   padding: 0px;
}
#free{
   background-color: white;
    border: hidden;
}

.a_img{
   background-color: white;
    border: hidden;
}

.tierList {
   float: right;
   width: 735px;
}

.tier{
   font-size: 20px;
}

.tierList th {
   padding-top: 10px;
   padding-bottom: 15px;
   font-size: 13px;
    text-align: -webkit-center;
}

.tierChampimg {
   width: 45px;
   height: 45px;
}

.counter {
   float: left;
   width: 30px;
   height: 30px;
}

.counterimg {
   width: 30px;
   height: 30px;
    margin-left: 20px;
}

.kr_name {
   display: block;
   width: 170px;
   margin-left: 0px;
   margin-top: 10px;
   text-align: center;
}

.rate {
   width: 80px;
   font-weight: bold;
   text-align: center;
}

small {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
   height: 16px;
   text-align: center;
   font-size: 15px;
   line-height: 1.33;
}

font {
   margin-left: 17px;
   font-size: 13px;
}

.ui-autocomplete {
   overflow-y: scroll;
   overflow-x: hidden;
}

.chamImg {
   border: none;
   width: 100px;
   float: left;
   overflow: auto;
   margin-left: 10px;
}

.i_cham {
   border-radius: 8px;
}

#searchInput {
    width: 500px;
    height: 45px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: solid 3px gray;
    margin-right: 65px;
}

#searchInput:focus {
   outline: solid 2px #B3CDFF;
}

body {
   padding: 0px;

}

</style>


</head>
<body>
   <div style="width: 1300px; margin: auto;">
      <table style="width: 1200px;">
         <tr>
            <td style="width: 450px;">
               <form id="select" action="tierOrLane" method="get">
                  <div class="tierVersion">
                     <select id="selectOption" name="tier">
                        <option id="bronze" value="bronze" style="color: #964b00;">+Bronze</option>
                        <option id="silver" value="silver" style="color: #c0c0c0;">+Silver</option>
                        <option id="gold" value="gold" style="color: #ffd700;">+Gold</option>
                        <option id="platinum" value="platinum" style="color: #006fff;">+Platinum</option>
                        <option id="diamond" value="diamond" style="color: #87cefa;">+Diamond</option>
                     </select>
                  </div>
                  <input class="lane_" value="TOP" name="lane" type="hidden">
               </form>

            </td>
            <td class="laneTd">
               <button class="lane_" value="TOP">
                  <span>Top</span>
               </button>
            </td>
            <td class="laneTd">
               <button class="lane_" value="JUNGLE">
                  <span>Jungle</span>
               </button>
            </td>
            <td class="laneTd">
               <button class="lane_" value="MIDDLE">
                  <span>Middle</span>
               </button>
            </td>
            <td class="laneTd">
               <button class="lane_" value="BOTTOM">
                  <span>Bottom</span>
               </button>
            </td>
            <td class="laneTd">
               <button class="lane_" value="UTILITY">
                  <span>Supporter</span>
               </button>
            </td>
         </tr>
      </table>

      <div class="tierList">
            <table class="tierList">${tierList}
            </table>
      </div>
      <div>
      <form id="selectForm" action="selectDetail">
         <input id="searchInput" type="text" placeholder="챔피언 검색(가렌, 그라가스...)" name ="champion_kr_name">
      </form>
         <div class="searchResult"></div>
         
      </div>

      <div>
         <table class="laneimg">
            <tr>
               <td><button class="a_img" value = "all"><img
                     name="All"
                     src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-fill.png"
                     width="50px;" height="50px;"></button>
               </td>
               <td><button class="a_img" value = "TOP"><img
                     name='Top'
                     src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-top.png"
                     width="50px;" height="50px;"></button>
               </td>
               <td><button class="a_img" value = "JUNGLE"><img
                     name='Jungle'
                     src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-jungle.png"
                     width="50px;" height="50px;"></button>
               </td>
               <td><button class="a_img" value = "MIDDLE"><img
                     name='Middle'
                     src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-middle.png"
                     width="50px;" height="50px;"></button>
               </td>
               <td><button class="a_img" value = "BOTTOM"><img
                     name='Bot'
                     src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-bottom.png"
                     width="50px;" height="50px;"></button>
               </td>
               <td><button class="a_img" value = "UTILITY"><img
                     name='Supporter'
                     src="https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-utility.png"
                     width="50px;" height="50px;"></button>
               </td>
               <td><button class="a_img" id = "free"><img
                     name='free'
                     src="https://s-lol-web.op.gg/images/icon/icon-rotation.svg"
                     width="50px;" height="50px;"></button>
               </td>
            </tr>
         </table>

      </div>
      <div class="champList">${nameIdList}</div>
   </div>
</body>
<script type="text/javascript">
   
</script>
</html>