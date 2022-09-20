package com.rjar.www.service.championDetail;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.rjar.www.bean.Champion;
import com.rjar.www.bean.ChampionDetail;
import com.rjar.www.bean.Reply;
import com.rjar.www.dao.IchampionDao;

@Service
public class ChampionDetailMM {

   @Autowired
   private IchampionDao champDao;

   ModelAndView mav;

   public ModelAndView getChampionInfo(String tier, String lane) {

      mav = new ModelAndView();

      // 옵션에 띄울 티어/ 티어 색깔
      mav.addObject("tier", tier);

      // 챔피언 사진에 들어갈 value들
      List<Champion> nameIdList = champDao.getChampionList();
      mav.addObject("nameIdList", makechampList(nameIdList));

      // 챔피언티어 정보에 들어갈 value들
      List<Champion> tierList = champDao.getTierList(tier, lane);
      mav.addObject("tierList", makeTierList(tierList));
      mav.setViewName("Detail/championHome");

      return mav;
   }

   private String makeTierList(List<Champion> tierList) {

      StringBuilder sb = new StringBuilder();

      sb.append("<tr class = 'jool'>");
      sb.append("<th>순위</th>");
      sb.append("<th colspan=\"2\" style=\"padding-left: 45px;\">챔피언</th>");
      sb.append("<th>티어</th>");
      sb.append("<th>승률</th>");
      sb.append("<th>픽률</th>");
      sb.append("<th>밴률</th>");
      sb.append("<th>상대하기 어려운 챔피언</th>");
      sb.append("<tr>");

      for (int i = 0; i < tierList.size(); i++) {

         sb.append("<tr class = 'jool'>");

         sb.append("<td style = 'width:50px;'><font style = 'text-align: center; text-weight: bold;'>" + (i + 1)
               + "</font></td>");

         sb.append("<td>");
         sb.append("<div class = 'tierChamp' data-championId = '" + tierList.get(i).getChampionId() + "'>");
         sb.append("<img class = 'tierChampimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
               + tierList.get(i).getChampionName() + ".png>");
         sb.append("</div>");
         sb.append("</td>");

         sb.append("<td class = 'kr_name'><small style = 'font-weight: bolder'>"
               + tierList.get(i).getChampion_kr_name() + "</small></td>");

         sb.append("<td><font class = 'tier'>" + tierList.get(i).getChampTier() + "</font></td>");
         sb.append("<td class = 'rate'><font>" + tierList.get(i).getWinRate1() + "</font></td>");
         sb.append("<td class = 'rate'><font>" + tierList.get(i).getBanRate1() + "</font></td>");
         sb.append("<td class = 'rate'><font>" + tierList.get(i).getPickRate() + "</font></td>");

         sb.append("<td>");
         sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter1() + ">");
         sb.append("<img class = 'counterimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
               + tierList.get(i).getCounter1() + ".png>");
         sb.append("</div>");

         sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter2() + ">");
         sb.append("<img class = 'counterimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
               + tierList.get(i).getCounter2() + ".png>");
         sb.append("</div>");

         sb.append("<div class = 'counter' value = " + tierList.get(i).getCounter3() + ">");
         sb.append("<img class = 'counterimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
               + tierList.get(i).getCounter3() + ".png>");
         sb.append("</div>");
         sb.append("</td>");

         sb.append("</tr>");

      }

      return sb.toString();
   }

   private String makechampList(List<Champion> nameIdList) {

      StringBuilder sb = new StringBuilder();

      for (int i = 0; i < nameIdList.size(); i++) {
         sb.append("<div class = 'champion' data-championId = '" + nameIdList.get(i).getChampionId() + "'>");
         sb.append("<img class = 'listimg' src = https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/"
               + nameIdList.get(i).getChampionName() + ".png>");
         sb.append("<br><small class = 'championName''>" + nameIdList.get(i).getChampion_kr_name() + "</small>");
         sb.append("</div>");
      }

      return sb.toString();
   }

   public String restTierList(Champion champ) {
      List<Champion> restTierList = champDao.getTierList(champ.getTier(), champ.getLane());
      String tierList = makeTierList(restTierList);
      return tierList;
   }

   public String restChampionList(Champion champ) {
      String lane = champ.getLane();
      String tier = champ.getTier();
      String all = "all";

      List<Champion> restChampionList = null;

      if (lane.equals(all)) {
         restChampionList = champDao.getChampionList();
      } else {
         restChampionList = champDao.getLaneChamp(lane, tier);
      }

      String championList = makechampList(restChampionList);
      return championList;
   }

   public String getRotationChamp() {
      String url = "https://kr.api.riotgames.com/lol/platform/v3/champion-rotations?api_key=RGAPI-5abbd2a5-6403-43ab-a67b-bdc1c426bcaf";

      RestTemplate restTemplate = new RestTemplate();
      String apiResult = restTemplate.getForObject(url, String.class);

      // 받아온 내용 json으로 파싱
      JsonParser parser = new JsonParser();
      JsonObject jsonObj = (JsonObject) parser.parse(apiResult);

      // 원하는 value값 꺼내고 그걸 다시 String 배열로 파싱
      Gson gson = new Gson();
      String[] freeChampionList = gson.fromJson(jsonObj.get("freeChampionIds"), String[].class);

      // 챔피언 아이디로 검색한 후 리스트에 담음
      int[] freeList = new int[16];
      for (int i = 0; i < freeChampionList.length; i++) {
         freeList[i] = Integer.parseInt(freeChampionList[i]);
      }
      List<Champion> rotationChampion = champDao.getRotaion(freeList[0], freeList[1], freeList[2], freeList[3],
            freeList[4], freeList[5], freeList[6], freeList[7], freeList[8], freeList[9], freeList[10],
            freeList[11], freeList[12], freeList[13], freeList[14], freeList[15]);
      // 리스트를 통해 태그 생성
      String rotationImg = makechampList(rotationChampion);

      return rotationImg;
   }

   public List<Champion> getSelectChamp(String text) {
      List<Champion> selectResult = champDao.getSelectChamp(text);

      return selectResult;
   }

   public ModelAndView clickDetail(int championId, String tier) {
      mav = new ModelAndView();
      // 챔피언이름/주로 가는 2가지 라인 가져오기
      List<ChampionDetail> championNameLane = champDao.getChampionName1(championId, tier);
      
      String champion_eg_name = championNameLane.get(0).getChampionName();
      String champion_kr_name = championNameLane.get(0).getChampion_kr_name();
      String lane1 = championNameLane.get(0).getLane();
      String lane2 = null;
      if(championNameLane.size() != 1) {
         lane2 = championNameLane.get(1).getLane();
      }
      mav.addObject("championName", champion_eg_name);
      mav.addObject("champion_kr_name", champion_kr_name);
      mav.addObject("championId", championId);
      mav.addObject("lane1", lane1);
      mav.addObject("lane2", lane2);
      mav.addObject("lane", ChampionLane(lane1));

      // 해당 챔피언 룬 (승률이 가장 높은 2개) 가져오기
      List<ChampionDetail> championRunes = champDao.getChampionRunes(champion_eg_name, lane1, tier);

      // 승률 1번째로 높은 룬
      ChampionDetail runes1 = championRunes.get(0);

      // 보조 능력치 쪼개기
      String statperks = championRunes.get(0).getStatperks();
      StringTokenizer st1 = new StringTokenizer(statperks, "|");

      // 룬 이미지 태그 만들어서 가져오기
      List<ChampionDetail> mainRunePng = selectRunes(runes1.getMain_rune());
      List<ChampionDetail> subRunePng = selectRunes(runes1.getSub_rune());

      mav.addObject("runes1", runes1);
      mav.addObject("mainRunePng", makeIngTag(mainRunePng, runes1));
      mav.addObject("subRunePng", makeIngTag(subRunePng, runes1));
      mav.addObject("statperks1", st1.nextToken());
      mav.addObject("statperks2", st1.nextToken());
      mav.addObject("statperks3", st1.nextToken());

      // 승률 2번째로 높은 룬
      ChampionDetail runes2 = null;
      for (int i = 1; i < championRunes.size(); i++) {
         if (championRunes.get(0).getSub_rune() != championRunes.get(i).getSub_rune()) {
            runes2 = championRunes.get(i);
            break;
         }else if (championRunes.get(0).getMain_rune() != championRunes.get(i).getMain_rune()){
            runes2 = championRunes.get(i);
            break;
         }
      }

      // 보조 능력치 쪼개기
      String statperks2 = championRunes.get(1).getStatperks();
      StringTokenizer st2 = new StringTokenizer(statperks2, "|");

      // 룬 이미지 가져오기
      List<ChampionDetail> mainRunePng2 = selectRunes(runes2.getMain_rune());
      List<ChampionDetail> subRunePng2 = selectRunes(runes2.getSub_rune());

      mav.addObject("runes2", runes2);
      mav.addObject("mainRunePng2", makeIngTag(mainRunePng2, runes2));
      mav.addObject("subRunePng2", makeIngTag(subRunePng2, runes2));
      mav.addObject("statperks2_1", st2.nextToken());
      mav.addObject("statperks2_2", st2.nextToken());
      mav.addObject("statperks2_3", st2.nextToken());

      // 승률 가장 높은 2가지 룬에 따른 게임 수/승률 검색
      List<ChampionDetail> rune_pickWin = new ArrayList<>();
      for (int i = 0; i < 2; i++) {
         int main_rune = championRunes.get(i).getMain_rune();
         int main_under1 = championRunes.get(i).getMain_under1();
         int main_under2 = championRunes.get(i).getMain_under2();
         int main_under3 = championRunes.get(i).getMain_under3();
         int main_under4 = championRunes.get(i).getMain_under4();
         int sub_rune = championRunes.get(i).getSub_rune();
         int sub_under1 = championRunes.get(i).getSub_under1();
         int sub_under2 = championRunes.get(i).getSub_under2();
         String statperks3 = championRunes.get(i).getStatperks();

         rune_pickWin.add(champDao.rune_pickWin(main_rune, main_under1, main_under2, main_under3, main_under4,
               sub_rune, sub_under1, sub_under2, statperks3, champion_eg_name, lane1, tier));

      }

      mav.addObject("rune_win1", rune_pickWin.get(0).getRune_winRate());
      mav.addObject("rune_win2", rune_pickWin.get(1).getRune_winRate());
      mav.addObject("rune_pick1", rune_pickWin.get(0).getRune_pick());
      mav.addObject("rune_pick2", rune_pickWin.get(1).getRune_pick());
      mav.addObject("tier", tier);
      
      
      // 스펠 판수, 승률, 픽률
      List<ChampionDetail> spells = champDao.getSpell(champion_eg_name, lane1);
      ChampionDetail spell;

      int cnt=0;
      for(int i=0;i<spells.size();i++) {
         for(int j=i;j<spells.size();j++) {
            if (spells.get(i).getSpell1().equals(spells.get(j).getSpell2()) && spells.get(i).getSpell2().equals(spells.get(j).getSpell1())) {
               int spell_cnt = spells.get(i).getSpell_cnt()+spells.get(j).getSpell_cnt();
               int   spell_win = spells.get(i).getSpell_win()+spells.get(j).getSpell_win();
               double winrate=((double)spell_win/spell_cnt)*100;
               double pickrate=((double)spell_cnt/spells.get(i).getSpell_total())*100;
               
               // 소숫점 두자리
               winrate=Math.round(winrate*100)/100.0;
               String spell_winrate=String.format("%.2f", winrate);
               
               pickrate=Math.round(pickrate*100)/100.0;
               String spell_pickrate=String.format("%.2f", pickrate);
               
               
               
               cnt++;
               
               if (cnt==1) {
                  spell=spells.get(j);
                  spells.set(i, spell.setSpell1(spell.getSpell1()));
                  spells.set(i, spell.setSpell2(spell.getSpell2()));
                  spells.set(i, spell.setSpell_cnt(spell_cnt));
                  spells.set(i, spell.setSpell_win(spell_win));
                  spells.set(i, spell.setSpell_winrate(spell_winrate));
                  spells.set(i, spell.setSpell_pick(spell_pickrate));
                  spells.set(i, spell.setLane(ChampionLane(spell.getLane())));
                  mav.addObject("spell",spell);
               }
               else if(cnt==2) {
                  spell=spells.get(j);
                  spells.set(i, spell.setSpell1(spell.getSpell1()));
                  spells.set(i, spell.setSpell2(spell.getSpell2()));
                  spells.set(i, spell.setSpell_cnt(spell_cnt));
                  spells.set(i, spell.setSpell_win(spell_win));
                  spells.set(i, spell.setSpell_winrate(spell_winrate));
                  spells.set(i, spell.setSpell_pick(spell_pickrate));
                  mav.addObject("spell2",spell);
               }
               if (cnt==3) break;
            }
         }
      }
      
      //아이템 판수, 승률, 픽률
      List<ChampionDetail> start_items = champDao.getStart_items(champion_eg_name, lane1);
      ChampionDetail start1=start_items.get(0);
      
      mav.addObject("start1",start1);
      
      if (start_items.get(1).getStart1()!=null){
         ChampionDetail start2=start_items.get(1);
         mav.addObject("start2",start2);
      }
      
      //신발 판수, 승률, 픽률
      List<ChampionDetail> boots = champDao.getBoots(champion_eg_name, lane1);
      ChampionDetail boots1=boots.get(0);
      ChampionDetail boots2=boots.get(1);
      
      mav.addObject("boots1",boots1);
      System.out.println("boots1="+boots1);
      
      mav.addObject("boots2",boots2);
      System.out.println("boots2="+boots2);
      
      
      //스킬 빌드
      List<ChampionDetail> skill_build=champDao.getSkill_build(champion_eg_name, lane1);
      
      ChampionDetail skill1=skill_build.get(0);
      System.out.println("skill1="+skill1);
      skill1=skill_build.get(0);
      skill_build.set(0, skill1.setLv1(ChampionSKill(skill1.getLv1())));
      skill_build.set(0, skill1.setLv2(ChampionSKill(skill1.getLv2())));         
      skill_build.set(0, skill1.setLv3(ChampionSKill(skill1.getLv3())));         
      skill_build.set(0, skill1.setLv4(ChampionSKill(skill1.getLv4())));
      skill_build.set(0, skill1.setLv5(ChampionSKill(skill1.getLv5())));
      skill_build.set(0, skill1.setLv6(ChampionSKill(skill1.getLv6())));
      skill_build.set(0, skill1.setLv7(ChampionSKill(skill1.getLv7())));
      skill_build.set(0, skill1.setLv8(ChampionSKill(skill1.getLv8())));
      skill_build.set(0, skill1.setLv9(ChampionSKill(skill1.getLv9())));
      skill_build.set(0, skill1.setLv10(ChampionSKill(skill1.getLv10())));
      skill_build.set(0, skill1.setLv11(ChampionSKill(skill1.getLv11())));
      skill_build.set(0, skill1.setLv12(ChampionSKill(skill1.getLv12())));
      skill_build.set(0, skill1.setLv13(ChampionSKill(skill1.getLv13())));
      skill_build.set(0, skill1.setLv14(ChampionSKill(skill1.getLv14())));
      skill_build.set(0, skill1.setLv15(ChampionSKill(skill1.getLv15())));
      
      mav.addObject("skill1",skill1);
      System.out.println("skill1="+skill1);
      
      // 아이템 빌드
      List<ChampionDetail> item_build=champDao.getItem_build(champion_eg_name, lane1, tier);
      ChampionDetail build=item_build.get(0);
      mav.addObject("build",build);
      System.out.println("build="+build);
        
      ChampionDetail build2=item_build.get(1);
      mav.addObject("build2",build2);
      System.out.println("build2="+build2);
        
      ChampionDetail build3=item_build.get(2);
      mav.addObject("build3",build3);
      System.out.println("build3="+build3);
        
      ChampionDetail build4=item_build.get(3);
      mav.addObject("build4",build4);
      System.out.println("build4="+build4);
      
      mav.setViewName("Detail/championDetail");
      return mav;
   }
   
   // 라인 영어 -> 한글
   public  String ChampionLane(String lane) {
      if(lane.equals("TOP")) return "탑";
      else if(lane.equals("JUNGLE")) return "정글";
      else if(lane.equals("MIDDLE")) return "미드";
      else if(lane.equals("BOTTOM")) return "원딜";
      else if(lane.equals("UTILITY")) return "서포터";
      
      return null;
   }
   
   // 스킬 숫자 -> q w e
   public  String ChampionSKill(String s) {
      if(s.equals("1")) return "Q";
      else if(s.equals("2")) return "W";
      else if(s.equals("3")) return "E";
      else if(s.equals("4")) return "R";
      return null;
   }

   public ModelAndView selectDetail(String championName, String tier) {
      mav = new ModelAndView();

      // 챔피언이름/주로 가는 2가지 라인 가져오기
      List<ChampionDetail> championNameLane = champDao.getChampionName2(championName, tier);
      
      String champion_eg_name = championNameLane.get(0).getChampionName();
      String champion_kr_name = championNameLane.get(0).getChampion_kr_name();
      int championId = championNameLane.get(0).getChampionId();
      String lane1 = championNameLane.get(0).getLane();
      String lane2 = null;
      if(championNameLane.size() != 1) {
         lane2 = championNameLane.get(1).getLane();
      }
      mav.addObject("championName", champion_eg_name);
      mav.addObject("champion_kr_name", champion_kr_name);
      mav.addObject("championId", championId);
      mav.addObject("lane1", lane1);
      mav.addObject("lane2", lane2);
      mav.addObject("lane", ChampionLane(lane1));
      
      // 해당 챔피언 룬 (승률이 가장 높은 2개) 가져오기
      List<ChampionDetail> championRunes = champDao.getChampionRunes(champion_eg_name, lane1, tier);

      // 승률 1번째로 높은 룬
      ChampionDetail runes1 = championRunes.get(0);

      // 보조 능력치 쪼개기
      String statperks = championRunes.get(0).getStatperks();
      StringTokenizer st1 = new StringTokenizer(statperks, "|");

      // 룬 이미지 태그 만들어서 가져오기
      List<ChampionDetail> mainRunePng = selectRunes(runes1.getMain_rune());
      List<ChampionDetail> subRunePng = selectRunes(runes1.getSub_rune());

      mav.addObject("runes1", runes1);
      mav.addObject("mainRunePng", makeIngTag(mainRunePng, runes1));
      mav.addObject("subRunePng", makeIngTag(subRunePng, runes1));
      mav.addObject("statperks1", st1.nextToken());
      mav.addObject("statperks2", st1.nextToken());
      mav.addObject("statperks3", st1.nextToken());

      // 승률 2번째로 높은 룬
      ChampionDetail runes2 = null;
      for (int i = 1; i < championRunes.size(); i++) {
         if (championRunes.get(0).getSub_rune() != championRunes.get(i).getSub_rune()) {
            runes2 = championRunes.get(i);
            break;
         }else if (championRunes.get(0).getMain_rune() != championRunes.get(i).getMain_rune()){
            runes2 = championRunes.get(i);
            break;
         }
      }

      // 보조 능력치 쪼개기
      String statperks2 = championRunes.get(1).getStatperks();
      StringTokenizer st2 = new StringTokenizer(statperks2, "|");

      // 룬 이미지 가져오기
      List<ChampionDetail> mainRunePng2 = selectRunes(runes2.getMain_rune());
      List<ChampionDetail> subRunePng2 = selectRunes(runes2.getSub_rune());

      mav.addObject("runes2", runes2);
      mav.addObject("mainRunePng2", makeIngTag(mainRunePng2, runes2));
      mav.addObject("subRunePng2", makeIngTag(subRunePng2, runes2));
      mav.addObject("statperks2_1", st2.nextToken());
      mav.addObject("statperks2_2", st2.nextToken());
      mav.addObject("statperks2_3", st2.nextToken());

      // 승률 가장 높은 2가지 룬에 따른 게임 수/승률 검색
      List<ChampionDetail> rune_pickWin = new ArrayList<>();
      for (int i = 0; i < 2; i++) {
         int main_rune = championRunes.get(i).getMain_rune();
         int main_under1 = championRunes.get(i).getMain_under1();
         int main_under2 = championRunes.get(i).getMain_under2();
         int main_under3 = championRunes.get(i).getMain_under3();
         int main_under4 = championRunes.get(i).getMain_under4();
         int sub_rune = championRunes.get(i).getSub_rune();
         int sub_under1 = championRunes.get(i).getSub_under1();
         int sub_under2 = championRunes.get(i).getSub_under2();
         String statperks3 = championRunes.get(i).getStatperks();

         rune_pickWin.add(champDao.rune_pickWin(main_rune, main_under1, main_under2, main_under3, main_under4,
               sub_rune, sub_under1, sub_under2, statperks3, champion_eg_name, lane1, tier));

      }

      mav.addObject("rune_win1", rune_pickWin.get(0).getRune_winRate());
      mav.addObject("rune_win2", rune_pickWin.get(1).getRune_winRate());
      mav.addObject("rune_pick1", rune_pickWin.get(0).getRune_pick());
      mav.addObject("rune_pick2", rune_pickWin.get(1).getRune_pick());
      mav.addObject("tier", tier);
      
      
      // 스펠 판수, 승률, 픽률
      List<ChampionDetail> spells = champDao.getSpell(champion_eg_name, lane1);
      ChampionDetail spell;

      int cnt=0;
      for(int i=0;i<spells.size();i++) {
         for(int j=i;j<spells.size();j++) {
            if (spells.get(i).getSpell1().equals(spells.get(j).getSpell2()) && spells.get(i).getSpell2().equals(spells.get(j).getSpell1())) {
               int spell_cnt = spells.get(i).getSpell_cnt()+spells.get(j).getSpell_cnt();
               int   spell_win = spells.get(i).getSpell_win()+spells.get(j).getSpell_win();
               double winrate=((double)spell_win/spell_cnt)*100;
               double pickrate=((double)spell_cnt/spells.get(i).getSpell_total())*100;
               
               // 소숫점 두자리
               winrate=Math.round(winrate*100)/100.0;
               String spell_winrate=String.format("%.2f", winrate);
               
               pickrate=Math.round(pickrate*100)/100.0;
               String spell_pickrate=String.format("%.2f", pickrate);
               
               
               
               cnt++;
               
               if (cnt==1) {
                  spell=spells.get(j);
                  spells.set(i, spell.setSpell1(spell.getSpell1()));
                  spells.set(i, spell.setSpell2(spell.getSpell2()));
                  spells.set(i, spell.setSpell_cnt(spell_cnt));
                  spells.set(i, spell.setSpell_win(spell_win));
                  spells.set(i, spell.setSpell_winrate(spell_winrate));
                  spells.set(i, spell.setSpell_pick(spell_pickrate));
                  spells.set(i, spell.setLane(ChampionLane(spell.getLane())));
                  mav.addObject("spell",spell);
               }
               else if(cnt==2) {
                  spell=spells.get(j);
                  spells.set(i, spell.setSpell1(spell.getSpell1()));
                  spells.set(i, spell.setSpell2(spell.getSpell2()));
                  spells.set(i, spell.setSpell_cnt(spell_cnt));
                  spells.set(i, spell.setSpell_win(spell_win));
                  spells.set(i, spell.setSpell_winrate(spell_winrate));
                  spells.set(i, spell.setSpell_pick(spell_pickrate));
                  mav.addObject("spell2",spell);
               }
               if (cnt==3) break;
            }
         }
      }
      
      //아이템 판수, 승률, 픽률
      List<ChampionDetail> start_items = champDao.getStart_items(champion_eg_name, lane1);
      ChampionDetail start1=start_items.get(0);
      
      mav.addObject("start1",start1);
      
      if (start_items.get(1).getStart1()!=null){
         ChampionDetail start2=start_items.get(1);
         mav.addObject("start2",start2);
      }
      
      //신발 판수, 승률, 픽률
      List<ChampionDetail> boots = champDao.getBoots(champion_eg_name, lane1);
      ChampionDetail boots1=boots.get(0);
      ChampionDetail boots2=boots.get(1);
      
      mav.addObject("boots1",boots1);
      System.out.println("boots1="+boots1);
      
      mav.addObject("boots2",boots2);
      System.out.println("boots2="+boots2);
      
      
      //스킬 빌드
      List<ChampionDetail> skill_build=champDao.getSkill_build(champion_eg_name, lane1);
      
      ChampionDetail skill1=skill_build.get(0);
      System.out.println("skill1="+skill1);
      skill1=skill_build.get(0);
      skill_build.set(0, skill1.setLv1(ChampionSKill(skill1.getLv1())));
      skill_build.set(0, skill1.setLv2(ChampionSKill(skill1.getLv2())));         
      skill_build.set(0, skill1.setLv3(ChampionSKill(skill1.getLv3())));         
      skill_build.set(0, skill1.setLv4(ChampionSKill(skill1.getLv4())));
      skill_build.set(0, skill1.setLv5(ChampionSKill(skill1.getLv5())));
      skill_build.set(0, skill1.setLv6(ChampionSKill(skill1.getLv6())));
      skill_build.set(0, skill1.setLv7(ChampionSKill(skill1.getLv7())));
      skill_build.set(0, skill1.setLv8(ChampionSKill(skill1.getLv8())));
      skill_build.set(0, skill1.setLv9(ChampionSKill(skill1.getLv9())));
      skill_build.set(0, skill1.setLv10(ChampionSKill(skill1.getLv10())));
      skill_build.set(0, skill1.setLv11(ChampionSKill(skill1.getLv11())));
      skill_build.set(0, skill1.setLv12(ChampionSKill(skill1.getLv12())));
      skill_build.set(0, skill1.setLv13(ChampionSKill(skill1.getLv13())));
      skill_build.set(0, skill1.setLv14(ChampionSKill(skill1.getLv14())));
      skill_build.set(0, skill1.setLv15(ChampionSKill(skill1.getLv15())));
      
      mav.addObject("skill1",skill1);
      System.out.println("skill1="+skill1);
      
      // 아이템 빌드
      List<ChampionDetail> item_build=champDao.getItem_build(champion_eg_name, lane1, tier);
      ChampionDetail build=item_build.get(0);
      mav.addObject("build",build);
      System.out.println("build="+build);
        
      ChampionDetail build2=item_build.get(1);
      mav.addObject("build2",build2);
      System.out.println("build2="+build2);
        
      ChampionDetail build3=item_build.get(2);
      mav.addObject("build3",build3);
      System.out.println("build3="+build3);
        
      ChampionDetail build4=item_build.get(3);
      mav.addObject("build4",build4);
      System.out.println("build4="+build4);
            
      mav.setViewName("Detail/championDetail");
      return mav;
   }

   
   private List<ChampionDetail> selectRunes(int rune) {

      List<ChampionDetail> runePngList = null;

      switch (rune) {

      case 8000: // 정밀
         String query1 = "SELECT RUNES_ID, RUNES_ICON FROM RUNES WHERE RUNES_ICON LIKE '%Precision%' "
               + "OR RUNES_ID = 8299";
         runePngList = champDao.getRunePng(query1);
         break;
      case 8100: // 지배
         String query2 = "SELECT RUNES_ID, RUNES_ICON FROM RUNES WHERE RUNES_ICON LIKE '%Domination%'";
         runePngList = champDao.getRunePng(query2);
         break;
      case 8200: // 마법
         String query3 = "SELECT RUNES_ID, RUNES_ICON FROM RUNES WHERE RUNES_ICON LIKE '%Sorcery%' "
               + "AND RUNES_ID != 8299 AND RUNES_ID != 8242";
         runePngList = champDao.getRunePng(query3);
         break;
      case 8300: // 영감
         String query4 = "SELECT RUNES_ID, RUNES_ICON FROM RUNES WHERE RUNES_ICON LIKE '%Inspiration%' "
               + "OR RUNES_ID IN (8300, 8410)";
         runePngList = champDao.getRunePng(query4);
         break;
      case 8400: // 결의
         String query5 = "SELECT RUNES_ID, RUNES_ICON FROM RUNES WHERE RUNES_ICON LIKE '%Resolve%' "
               + "AND RUNES_ID != 8410 OR RUNES_ID = 8242";
         runePngList = champDao.getRunePng(query5);
         break;
      }

      return runePngList;
   }

   private List<String> makeIngTag(List<ChampionDetail> runePng, ChampionDetail runes) {
      
      int main_rune = runes.getMain_rune();
      int main_under1 = runes.getMain_under1();
      int main_under2 = runes.getMain_under2();
      int main_under3 = runes.getMain_under3();
      int main_under4 = runes.getMain_under4();
      int sub_rune = runes.getSub_rune();
      int sub_under1 = runes.getSub_under1();
      int sub_under2 = runes.getSub_under2();
      //보조 능력치도 해야 함
      List<String> runeTagList = new ArrayList<>();
      for (int i = 0; i < runePng.size(); i++) {
         if (runePng.get(i).getRunes_id()!= main_rune &&runePng.get(i).getRunes_id()!= main_under1 &&runePng.get(i).getRunes_id()!= main_under2 &&
               runePng.get(i).getRunes_id()!= main_under3 &&runePng.get(i).getRunes_id()!= main_under4 &&runePng.get(i).getRunes_id()!= sub_rune &&
               runePng.get(i).getRunes_id()!= sub_under1 &&runePng.get(i).getRunes_id()!= sub_under2) {
            
            String tag = "<img src='https://ddragon.leagueoflegends.com/cdn/img/"+runePng.get(i).getRunes_icon()+"' "
                  + "style='filter:grayscale(100%);' data-value = '"+runePng.get(i).getRunes_id()+"' class ='runeImg'>"; 
            runeTagList.add(tag);
         }else {
            String tag = "<img src='https://ddragon.leagueoflegends.com/cdn/img/"+runePng.get(i).getRunes_icon()+"' "
                  + "data-value = '"+runePng.get(i).getRunes_id()+"' class ='runeImg'>"; 
            runeTagList.add(tag);            
         }
         
      }
      return runeTagList;
   }
   
   public ModelAndView runeInfo(String championName, String lane, String tier) {
      //해당 챔피언 룬 (승률이 가장 높은 2개) 가져오기
      List<ChampionDetail> championRunes = champDao.getChampionRunes(championName, lane, tier);
      
      //승률 1번째로 높은 룬
      ChampionDetail runes1 = championRunes.get(0);
      
      //보조 능력치 쪼개기
      String statperks = championRunes.get(0).getStatperks();
      StringTokenizer st1 = new StringTokenizer(statperks, "|");
      
      //룬 이미지 태그 만들어서 가져오기
      List<ChampionDetail> mainRunePng = selectRunes(runes1.getMain_rune());
      List<ChampionDetail> subRunePng = selectRunes(runes1.getSub_rune());
      
      mav.addObject("runes1", runes1);
      mav.addObject("mainRunePng", makeIngTag(mainRunePng, runes1));
      mav.addObject("subRunePng", makeIngTag(subRunePng, runes1));
      mav.addObject("statperks1", st1.nextToken());
      mav.addObject("statperks2", st1.nextToken());
      mav.addObject("statperks3", st1.nextToken());
      mav.addObject("lane", ChampionLane(lane));
      
      //승률 2번째로 높은 룬
      ChampionDetail runes2 =null;
      for (int i = 1; i < championRunes.size(); i++) {
         if (championRunes.get(0).getSub_rune() != championRunes.get(i).getSub_rune()) {
            runes2 = championRunes.get(i);
            break;
         }else if (championRunes.get(0).getMain_rune() != championRunes.get(i).getMain_rune()){
            runes2 = championRunes.get(i);
            break;
         }
      }
      
      //보조 능력치 쪼개기
      String statperks2 = championRunes.get(1).getStatperks();
      StringTokenizer st2 = new StringTokenizer(statperks2, "|");
      
      //룬 이미지 가져오기
      List<ChampionDetail> mainRunePng2 = selectRunes(runes2.getMain_rune());
      List<ChampionDetail> subRunePng2 = selectRunes(runes2.getSub_rune());
      
      mav.addObject("runes2", runes2);
      mav.addObject("mainRunePng2", makeIngTag(mainRunePng2, runes2));
      mav.addObject("subRunePng2", makeIngTag(subRunePng2, runes2));
      mav.addObject("statperks2_1", st2.nextToken());
      mav.addObject("statperks2_2", st2.nextToken());
      mav.addObject("statperks2_3", st2.nextToken());
      
      //승률 가장 높은 2가지 룬에 따른 게임 수/승률 검색
      List<ChampionDetail> rune_pickWin = new ArrayList<>();
      for (int i = 0; i < 2; i++) {
         int main_rune = championRunes.get(i).getMain_rune();
         int main_under1 = championRunes.get(i).getMain_under1();
         int main_under2 = championRunes.get(i).getMain_under2();
         int main_under3 = championRunes.get(i).getMain_under3();
         int main_under4 = championRunes.get(i).getMain_under4();
         int sub_rune = championRunes.get(i).getSub_rune();
         int sub_under1 = championRunes.get(i).getSub_under1();
         int sub_under2 = championRunes.get(i).getSub_under2();
         String statperks3 = championRunes.get(i).getStatperks();
         
         rune_pickWin.add(champDao.rune_pickWin(main_rune, main_under1, main_under2, main_under3, main_under4,
               sub_rune, sub_under1, sub_under2, statperks3, championName, lane, tier));
         
      }

      mav.addObject("rune_win1", rune_pickWin.get(0).getRune_winRate());
      mav.addObject("rune_win2", rune_pickWin.get(1).getRune_winRate());
      mav.addObject("rune_pick1", rune_pickWin.get(0).getRune_pick());
      mav.addObject("rune_pick2", rune_pickWin.get(1).getRune_pick());      
      mav.setViewName("Detail/championDetail");
      return mav;
   }

   public ModelAndView counterInfo(String championName, String lane, String tier) {
      mav = new ModelAndView();
      
      // 챔피언이름/주로 가는 2가지 라인 가져오기
      List<ChampionDetail> championNameLane = champDao.getChampionName2(championName, tier);
      String champion_kr_name = championNameLane.get(0).getChampion_kr_name();
      String lane1 = championNameLane.get(0).getLane();
      String lane2 = null;
      if(championNameLane.size() != 1) {
         lane2 = championNameLane.get(1).getLane();
      }

      Champion champAndCounter = champDao.getCounterInfo(championName, lane, tier);
      //카운터 챔피언에 대한 승률(라인전 기준 카운터이므로 승률은 높을 수 있음)
      List<Champion> vsWinRateList = new ArrayList<>();
      String[] counterList = {champAndCounter.getCounter1(), champAndCounter.getCounter2(),
                            champAndCounter.getCounter3(), champAndCounter.getCounter4(),
                            champAndCounter.getCounter5(), champAndCounter.getCounter6(),
                            champAndCounter.getCounter7(), champAndCounter.getCounter8(),
                            champAndCounter.getCounter9(), champAndCounter.getCounter10()};
      
      for (int i = 0; i < 10; i++) {         
         vsWinRateList.add(champDao.getvsWinRate(championName, counterList[i], lane, tier));
      }
      //해당 and 상대 챔피언 kda+ 딜량 + 킬관여
      Champion remainder = champDao.getRemainder(championName ,champAndCounter.getCounter1(), lane, tier); 
      //포지션 승률/밴률 검색
      Champion banWinRate = champDao.getBanWinRate(championName, champAndCounter.getCounter1(), lane, tier);
      //추천룬 가져오기
      List<ChampionDetail> counterRunes = champDao.getCounterRunes(championName, champAndCounter.getCounter1(),lane, tier);
      // 보조 능력치 쪼개기
      String statperks = counterRunes.get(0).getStatperks();
      StringTokenizer st1 = new StringTokenizer(statperks, "|");
      // 룬 이미지 검색 후 가져오기
      List<ChampionDetail> mainRunePng = selectRunes(counterRunes.get(0).getMain_rune());
      List<ChampionDetail> subRunePng = selectRunes(counterRunes.get(0).getSub_rune());
      
      List<ChampionDetail> start_items = champDao.getStart_items(championName, lane1);
      ChampionDetail start1=start_items.get(0);
      
      mav.addObject("start1",start1);
      mav.addObject("killParticipation1", remainder.getKillParticipation1());
      mav.addObject("killParticipation2", remainder.getKillParticipation2());
      mav.addObject("championName", championName);
      mav.addObject("champion_kr_name", champion_kr_name);
      mav.addObject("lane1", lane1);
      mav.addObject("lane2", lane2);
      mav.addObject("lane", ChampionLane(lane));
      mav.addObject("counters", champAndCounter);
      mav.addObject("counter", champAndCounter.getCounter1());
      mav.addObject("kda1", remainder.getKda1());
      mav.addObject("kda2", remainder.getKda2());
      mav.addObject("kdaWidth1", remainder.getKda1()/(remainder.getKda1()+remainder.getKda2())*100);
      mav.addObject("kdaWidth2", remainder.getKda2()/(remainder.getKda1()+remainder.getKda2())*100);
      mav.addObject("vsWinRate", vsWinRateList);
      mav.addObject("vsWinRate1", vsWinRateList.get(0).getVsWinRate());
      mav.addObject("vsWinRate2", (100-vsWinRateList.get(0).getVsWinRate()));
      mav.addObject("PswinRate1", banWinRate.getWinRate1());
      mav.addObject("PswinRate2", banWinRate.getWinRate2());
      mav.addObject("PswinRateWidth1", banWinRate.getWinRate1()/(banWinRate.getWinRate2()+banWinRate.getWinRate1())*100);
      mav.addObject("PswinRateWidth2", banWinRate.getWinRate2()/(banWinRate.getWinRate2()+banWinRate.getWinRate1())*100);
      mav.addObject("damageDealt1", Math.round(remainder.getDamageDealt1()));
      mav.addObject("damageDealt2", Math.round(remainder.getDamageDealt2()));
      mav.addObject("damageDealtWidth1", remainder.getDamageDealt1()/(remainder.getDamageDealt1()+remainder.getDamageDealt2())*100);
      mav.addObject("damageDealtWidth2", remainder.getDamageDealt2()/(remainder.getDamageDealt1()+remainder.getDamageDealt2())*100);
      mav.addObject("banRate1", banWinRate.getBanRate1());
      mav.addObject("banRate2", banWinRate.getBanRate2());
      mav.addObject("banRateWidth1", banWinRate.getBanRate1()/(banWinRate.getBanRate1()+banWinRate.getBanRate2())*100);
      mav.addObject("banRateWidth2", banWinRate.getBanRate2()/(banWinRate.getBanRate1()+banWinRate.getBanRate2())*100);
      mav.addObject("counterRunes", counterRunes.get(0));
      mav.addObject("mainRunePng", makeIngTag(mainRunePng, counterRunes.get(0)));
      mav.addObject("subRunePng", makeIngTag(subRunePng, counterRunes.get(0)));
      mav.addObject("statperks1", st1.nextToken());
      mav.addObject("statperks2", st1.nextToken());
      mav.addObject("statperks3", st1.nextToken());
      mav.addObject("tier", tier);
      mav.setViewName("Detail/counter");
      return mav;
   }

   public ModelAndView counterCal(String championName, String counter, String lane, String tier) {
      mav = new ModelAndView();
      // 챔피언이름/주로 가는 2가지 라인 가져오기
      List<ChampionDetail> championNameLane = champDao.getChampionName2(championName, tier);
      String champion_kr_name = championNameLane.get(0).getChampion_kr_name();
      String lane1 = championNameLane.get(0).getLane();
      String lane2 = null;
      if(championNameLane.size() != 1) {
         lane2 = championNameLane.get(1).getLane();
      }
      Champion vsWinRate = champDao.getvsWinRate(championName, counter, lane, tier);

      Champion champAndCounter = champDao.getCounterInfo(championName, lane, tier);
      //카운터 챔피언에 대한 승률(라인전 기준 카운터이므로 승률은 높을 수 있음)
      List<Champion> vsWinRateList = new ArrayList<>();
      String[] counterList = {champAndCounter.getCounter1(), champAndCounter.getCounter2(),
                            champAndCounter.getCounter3(), champAndCounter.getCounter4(),
                            champAndCounter.getCounter5(), champAndCounter.getCounter6(),
                            champAndCounter.getCounter7(), champAndCounter.getCounter8(),
                            champAndCounter.getCounter9(), champAndCounter.getCounter10()};
      for (int i = 0; i < 10; i++) {         
         vsWinRateList.add(champDao.getvsWinRate(championName, counterList[i], lane, tier));
      }
      //해당 and 상대 챔피언 kda+ 딜량 + 킬관여
      Champion remainder = champDao.getRemainder(championName ,counter, lane, tier); 
      //포지션 승률/밴률 검색
      Champion banWinRate = champDao.getBanWinRate(championName, counter, lane, tier);
      //추천룬 가져오기
      List<ChampionDetail> counterRunes = champDao.getCounterRunes(championName, counter, lane, tier);
      // 보조 능력치 쪼개기
      String statperks = counterRunes.get(0).getStatperks();
      StringTokenizer st1 = new StringTokenizer(statperks, "|");
      // 룬 이미지 검색 후 가져오기
      List<ChampionDetail> mainRunePng = selectRunes(counterRunes.get(0).getMain_rune());
      List<ChampionDetail> subRunePng = selectRunes(counterRunes.get(0).getSub_rune());

      mav.addObject("killParticipation1", remainder.getKillParticipation1());
      mav.addObject("killParticipation2", remainder.getKillParticipation2());
      mav.addObject("championName", championName);
      mav.addObject("champion_kr_name", champion_kr_name);
      mav.addObject("lane1", lane1);
      mav.addObject("lane2", lane2);
      mav.addObject("lane", ChampionLane(lane));
      mav.addObject("counters", champAndCounter);
      mav.addObject("counter", counter);
      mav.addObject("kda1", remainder.getKda1());
      mav.addObject("kda2", remainder.getKda2());
      mav.addObject("kdaWidth1", remainder.getKda1()/(remainder.getKda1()+remainder.getKda2())*100);
      mav.addObject("kdaWidth2", remainder.getKda2()/(remainder.getKda1()+remainder.getKda2())*100);
      mav.addObject("vsWinRate", vsWinRateList);
      mav.addObject("vsWinRate1", vsWinRate.getVsWinRate());
      mav.addObject("vsWinRate2", (100-vsWinRate.getVsWinRate()));
      mav.addObject("PswinRate1", banWinRate.getWinRate1());
      mav.addObject("PswinRate2", banWinRate.getWinRate2());
      mav.addObject("PswinRateWidth1", banWinRate.getWinRate1()/(banWinRate.getWinRate2()+banWinRate.getWinRate1())*100);
      mav.addObject("PswinRateWidth2", banWinRate.getWinRate2()/(banWinRate.getWinRate2()+banWinRate.getWinRate1())*100);
      mav.addObject("damageDealt1", Math.round(remainder.getDamageDealt1()));
      mav.addObject("damageDealt2", Math.round(remainder.getDamageDealt2()));
      mav.addObject("damageDealtWidth1", remainder.getDamageDealt1()/(remainder.getDamageDealt1()+remainder.getDamageDealt2())*100);
      mav.addObject("damageDealtWidth2", remainder.getDamageDealt2()/(remainder.getDamageDealt1()+remainder.getDamageDealt2())*100);
      mav.addObject("banRate1", banWinRate.getBanRate1());
      mav.addObject("banRate2", banWinRate.getBanRate2());
      mav.addObject("banRateWidth1", banWinRate.getBanRate1()/(banWinRate.getBanRate1()+banWinRate.getBanRate2())*100);
      mav.addObject("banRateWidth2", banWinRate.getBanRate2()/(banWinRate.getBanRate1()+banWinRate.getBanRate2())*100);
      mav.addObject("counterRunes", counterRunes.get(0));
      mav.addObject("mainRunePng", makeIngTag(mainRunePng, counterRunes.get(0)));
      mav.addObject("subRunePng", makeIngTag(subRunePng, counterRunes.get(0)));
      mav.addObject("statperks1", st1.nextToken());
      mav.addObject("statperks2", st1.nextToken());
      mav.addObject("statperks3", st1.nextToken());
      mav.addObject("tier", tier);
      mav.setViewName("Detail/counter");
      return mav;
   }

   public List<Reply> replyInsert(Reply reply) {
      List<Reply> rList = null;
      if (champDao.replyInsert(reply)) { //댓글 등록
         rList = champDao.getReplyList(reply.getChampionId());
         
      }
      System.out.println(rList);
      return rList;
   }
   //페이지 로드 시 댓글 검색
   public List<Reply> selectReply(Reply reply) {
      List<Reply> rList = champDao.getReplyList(reply.getChampionId());
      return rList;
   }
   
   
   public List<Reply> deleteReply(Reply reply) {
      boolean result = champDao.deleteReply(reply);
      List<Reply> rList = null; 
      if (result) {
         rList = champDao.getReplyList(reply.getChampionId());         
      }
      return rList;
   }

   public Reply correctReply(Reply reply) {
      Reply contents = champDao.correctReply(reply);
      return contents;
   }

   public List<Reply> replyUpdate(Reply reply) {
      boolean result = champDao.upDateReply(reply);
      List<Reply> rList = null; 
      if (result) {
         rList = champDao.getReplyList(reply.getChampionId());         
      }
      return rList;
   }
   
      public ModelAndView itemInfo(String championName, String lane, String tier) {
            mav = new ModelAndView();
            
            List<ChampionDetail> start_items = champDao.getStart_items(championName, lane);
            ChampionDetail start1=start_items.get(0);
            
            mav.addObject("start1",start1);
            
            List<ChampionDetail> championNameLane = champDao.getChampionName2(championName, tier);
            String champion_kr_name = championNameLane.get(0).getChampion_kr_name();
            mav.addObject("champion_kr_name", champion_kr_name);
            
            mav.addObject("championName", championName);
            mav.addObject("lane",lane);
            mav.addObject("tier",tier);
            
            String lane1 = championNameLane.get(0).getLane();
            mav.addObject("lane1",lane1);
            String lane2 = null;
            if(championNameLane.size() != 1) {
               lane2 = championNameLane.get(1).getLane();
               mav.addObject("lane2",lane2);
            }
            
            List<ChampionDetail> championItem = champDao.getChampionItem(championName, lane);
            ChampionDetail item_lst;
            
            item_lst=championItem.get(0);
            mav.addObject("item",item_lst);
            
            item_lst=championItem.get(1);
            mav.addObject("item1",item_lst);
            
            item_lst=championItem.get(2);
            mav.addObject("item2",item_lst);
            
            item_lst=championItem.get(3);
            mav.addObject("item3",item_lst);
            
            item_lst=championItem.get(4);
            mav.addObject("item4",item_lst);
            
            item_lst=championItem.get(5);
            mav.addObject("item5",item_lst);
            
            item_lst=championItem.get(6);
            mav.addObject("item6",item_lst);
            
            item_lst=championItem.get(7);
            mav.addObject("item7",item_lst);
            
            item_lst=championItem.get(8);
            mav.addObject("item8",item_lst);
            
            item_lst=championItem.get(9);
            mav.addObject("item9",item_lst);
            
            List<ChampionDetail> championBoots = champDao.getChampionBoots(championName, lane);
            ChampionDetail boots_lst;
            
            boots_lst=championBoots.get(0);
            mav.addObject("boots",boots_lst);
            
            boots_lst=championBoots.get(1);
            mav.addObject("boots1",boots_lst);
            
            boots_lst=championBoots.get(2);
            mav.addObject("boots2",boots_lst);
            
            boots_lst=championBoots.get(3);
            mav.addObject("boots3",boots_lst);
            
            boots_lst=championBoots.get(4);
            mav.addObject("boots4",boots_lst);

            
            mav.setViewName("Detail/item");
            return mav;
         }

}