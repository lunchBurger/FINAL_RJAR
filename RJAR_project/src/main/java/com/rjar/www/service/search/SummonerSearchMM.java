package com.rjar.www.service.search;

import java.io.BufferedReader;

import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.rjar.www.bean.summonersearch.GameDetailShowInfo;
import com.rjar.www.dao.ISummonerSearchDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SummonerSearchMM {

	@Autowired
	private ISummonerSearchDao isc;

	// 전적 검색에 필요한 데이터를 API로 받아오기
	ModelAndView mav;
	String api_key = "RGAPI-c1e2d22b-74b0-43fc-8d41-c6c2445bcc1f";
	BufferedReader br = null;
	JsonParser jsonParser = new JsonParser();

	@SuppressWarnings("deprecation")
	public ModelAndView sSummonerSearch(String summonerName) {

		log.info("소환사 이름:"+summonerName);
		mav = new ModelAndView();

		try {
			// 소환사 프로필 정보 및 id(puuid, accountId) 추출
			String apiUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+summonerName+"?api_key="+api_key;
			String urlBr = getUrl(apiUrl);
			
			System.out.println("1="+urlBr);

			// bufferedReader로 가져온 urlBr 데이터를 json 객체로 Parser
			JsonObject k = (JsonObject) jsonParser.parse(urlBr);
			int profileIconId = k.get("profileIconId").getAsInt();
			String puuid = k.get("puuid").getAsString();
			long summonerLevel = k.get("summonerLevel").getAsLong();
			String id = k.get("id").getAsString();
			String name = k.get("name").getAsString();

			// 소환사 상세정보 추출(전체게임 승률, 티어, 티어포인트)
			String apiUrl1 = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+id+"?api_key="+api_key;

			urlBr = getUrl(apiUrl1);
			JsonArray jsonArray = (JsonArray) jsonParser.parse(urlBr);
			
			System.out.println("2="+urlBr);

			// 위에 jsonArray를 parser하고난 후에 json object를 구하기 위한 과정이다.
			// solo rank와 free rank가 추출되는데, 둘다, 둘중 하나 혹은 하나도 출력되지 않는 경우도 있기에 아래와 같이 수식을
			// 작성하였다.
			String freeTier = "";
			String freeRank = "";
			int freeLeaguePoint = 0;
			int freeWins = 0;
			int freeLosses = 0;
			double freeWinRate = 0;

			String soloTier = "";
			String soloRank = "";
			int soloLeaguePoint = 0;
			int soloWins = 0;
			int soloLosses = 0;
			double soloWinRate = 0;

			// solo, free 둘다 출력되는 경우
			if (jsonArray.size() == 2) {
				JsonObject p = (JsonObject) jsonArray.get(0);
				JsonObject p1 = (JsonObject) jsonArray.get(1);

				if (p.get("queueType").getAsString().equals("RANKED_FLEX_SR")) {
					freeTier = p.get("tier").getAsString();
					freeRank = p.get("rank").getAsString();
					freeLeaguePoint = p.get("leaguePoints").getAsInt();
					freeWins = p.get("wins").getAsInt();
					freeLosses = p.get("losses").getAsInt();
					freeWinRate = Math.round(((double) freeWins / (freeWins + freeLosses)) * 100) / 100.0;
					soloTier = p1.get("tier").getAsString();
					soloRank = p1.get("rank").getAsString();
					soloLeaguePoint = p1.get("leaguePoints").getAsInt();
					soloWins = p1.get("wins").getAsInt();
					soloLosses = p1.get("losses").getAsInt();
					soloWinRate = Math.round(((double) soloWins / (soloWins + soloLosses)) * 100) / 100.0;
				} else {
					freeTier = p1.get("tier").getAsString();
					freeRank = p1.get("rank").getAsString();
					freeLeaguePoint = p1.get("leaguePoints").getAsInt();
					freeWins = p1.get("wins").getAsInt();
					freeLosses = p1.get("losses").getAsInt();
					freeWinRate = Math.round(((double) freeWins / (freeWins + freeLosses)) * 100) / 100.0;
					soloTier = p.get("tier").getAsString();
					soloRank = p.get("rank").getAsString();
					soloLeaguePoint = p.get("leaguePoints").getAsInt();
					soloWins = p.get("wins").getAsInt();
					soloLosses = p.get("losses").getAsInt();
					soloWinRate = Math.round(((double) soloWins / (soloWins + soloLosses)) * 100) / 100.0;

				}
				// solo 혹은 free 둘중 하나만 출력되는 경우
			} else if (jsonArray.size() == 1) {
				JsonObject p = (JsonObject) jsonArray.get(0);
				// free 데이터 출력
				if (p.get("queueType").getAsString().equals("RANKED_FLEX_SR")) {
					freeTier = p.get("tier").getAsString();
					freeRank = p.get("rank").getAsString();
					freeLeaguePoint = p.get("leaguePoints").getAsInt();
					freeWins = p.get("wins").getAsInt();
					freeLosses = p.get("losses").getAsInt();
					freeWinRate = Math.round(((double) freeWins / (freeWins + freeLosses)) * 100) / 100.0;
					soloTier = "Unranked";
					// solo 데이터 출력
				} else {
					soloTier = p.get("tier").getAsString();
					soloRank = p.get("rank").getAsString();
					soloLeaguePoint = p.get("leaguePoints").getAsInt();
					soloWins = p.get("wins").getAsInt();
					soloLosses = p.get("losses").getAsInt();
					soloWinRate = Math.round(((double) soloWins / (soloWins + soloLosses)) * 100) / 100.0;
					freeTier = "Unranked";
				}

				// solo, free 둘다 없을경우 unranked를 삽입
			} else {
				soloTier = "Unranked";
				freeTier = "Unranked";
			}
			
			System.out.println("3="+soloRank);

			// master, grandmaster, challenger는 rank 숫자가 없지만, api에서는 1을 제공한다.
			// 따라서 해당 티어들인 경우에는 null을 넘겨준다
			// 로마 숫자를 아라비아 숫자로 변경
			if (soloTier.equals("MASTER") || soloTier.equals("GRANDMASTER") || soloTier.equals("CHALLENGER")) {
				soloRank = "";
			}else if(soloRank.equals("I")){
				soloRank = "1";	
			}else if(soloRank.equals("II")) {
				soloRank = "2";	
			}else if(soloRank.equals("III")) {
				soloRank = "3";	
			}else if(soloRank.equals("IV")) {
				soloRank = "4";	
			}

			if (freeTier.equals("MASTER") || freeTier.equals("GRANDMASTER") || freeTier.equals("CHALLENGER")) {
				freeRank = "";
			}else if(freeRank.equals("I")){
				freeRank = "1";	
			}else if(freeRank.equals("II")) {
				freeRank = "2";	
			}else if(freeRank.equals("III")) {
				freeRank = "3";	
			}else if(freeRank.equals("IV")) {
				freeRank = "4";	
			}

			String loginDate = TimeCalculate(k.get("revisionDate").getAsLong());
			System.out.println("loginDate=" + loginDate);

			// 검색한 소환사의 최근 10경기 데이터 가져오기
			ModelAndView matchData = summonerMatchDetail(puuid, summonerName);
            
			System.out.println("pi="+profileIconId);
			mav.addObject("profileIconId", profileIconId);
			mav.addObject("loginDate", loginDate);
			mav.addObject("LV", summonerLevel);
			mav.addObject("name", name);
			mav.addObject("freeTier", freeTier);
			mav.addObject("freeRank", freeRank);
			mav.addObject("freeLeaguePoint", freeLeaguePoint);
			mav.addObject("freeWins", freeWins);
			mav.addObject("freeLosses", freeLosses);
			mav.addObject("freeWinRate", (int) (freeWinRate * 100));
			mav.addObject("soloTier", soloTier);
			mav.addObject("soloRank", soloRank);
			mav.addObject("soloLeaguePoint", soloLeaguePoint);
			mav.addObject("soloWins", soloWins);
			mav.addObject("soloLosses", soloLosses);
			mav.addObject("soloWinRate", (int) (soloWinRate * 100));

		} catch (Exception e) {
			System.out.println("오류=" + e.getMessage());
		}

		return mav;

	}

	private String getUrl(String apiUrl) throws Exception {
		URL url = new URL(apiUrl);
		// URL에서 URLConnection 객체 얻기(프로토콜이 http://인 경우 아래 객체로 캐스팅 가능)
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection(); // openConnection() 메서드는
																					// IOException 발생
		urlconnection.setRequestMethod("GET");
		br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
		System.out.println("url1="+br);

		String result = "";
		String line;
		while ((line = br.readLine()) != null) {
			result += line;
		}

		return result;
	}

	private ModelAndView summonerMatchDetail(Object puuid, String summonerName) {

		mav = new ModelAndView();
		String summonerMatch = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + puuid
				+ "/ids?start=0&count=20&api_key=" + api_key;
		System.out.println("summonerName=" + summonerName);
		System.out.println("puuid=" + puuid);
		try {
			String urlBr = getUrl(summonerMatch);
			JsonParser jsonParser = new JsonParser();
			JsonArray jsonArray = (JsonArray) jsonParser.parse(urlBr);
			System.out.println("gameData=" + jsonArray);

			// puuid로 10개의 matchId 불러오기
			ArrayList<String> matchDataList = new ArrayList<String>();
			if (jsonArray != null) {
				for (int i = 0; i < jsonArray.size(); i++) {
					matchDataList.add(jsonArray.get(i).toString());
				}
			}

			System.out.println("gameData=" + matchDataList.get(0).replaceAll("\"", ""));
			String matchUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/";

			List<List<GameDetailShowInfo>> totalGameData = new ArrayList<>();
			List<List<GameDetailShowInfo>> totalSoloGameData = new ArrayList<>();
			List<List<GameDetailShowInfo>> totalFreeGameData = new ArrayList<>();
			List<List<GameDetailShowInfo>> totalOtherGameData = new ArrayList<>();

			List<GameDetailShowInfo> myGame = new ArrayList<>();
			List<GameDetailShowInfo> mySoloGame = new ArrayList<>();
			List<GameDetailShowInfo> myFreeGame = new ArrayList<>();
			List<GameDetailShowInfo> myOtherGame = new ArrayList<>();
			List<GameDetailShowInfo> mySoloFreeGame = new ArrayList<>();
			// 10판 게임데이터 id만 불러와서 list에 넣기
			for (int j = 0; j < matchDataList.size(); j++) {
				String urlBr1 = getUrl(matchUrl + matchDataList.get(j).replaceAll("\"", "") + "?api_key=" + api_key);

				JsonParser jsonParser1 = new JsonParser();
				JsonObject p = (JsonObject) jsonParser1.parse(urlBr1);
				JsonObject info = (JsonObject) p.get("info");
				JsonArray participants = info.getAsJsonArray("participants");
				JsonArray team = info.getAsJsonArray("teams");

				// 1게임당 10명의 소환사 정보 불러오기
				List<GameDetailShowInfo> gameData = new ArrayList<>();
				List<GameDetailShowInfo> soloGameData = new ArrayList<>();
				List<GameDetailShowInfo> freeGameData = new ArrayList<>();
				List<GameDetailShowInfo> otherGameData = new ArrayList<>();

				for (int k = 0; k < 10; k++) {
//					Map<GameDetailShowInfo, Object> sgi = new HashMap<GameDetailShowInfo, Object>();
					GameDetailShowInfo gds = new GameDetailShowInfo();

					JsonObject participant = (JsonObject) participants.get(k);
					JsonObject challenges = (JsonObject) participant.get("challenges");
					JsonObject perks = (JsonObject) participant.get("perks");
					JsonArray styles = perks.getAsJsonArray("styles");
					JsonObject PrimeSelections = (JsonObject) styles.get(0);
					JsonObject SubSelections = (JsonObject) styles.get(1);
					JsonArray prime = PrimeSelections.getAsJsonArray("selections");
					JsonObject mainPrime = (JsonObject) prime.get(0);
					JsonObject purple = (JsonObject) team.get(0);
					JsonObject blue = (JsonObject) team.get(1);
					JsonObject dragon = null;
					JsonObject baron = null;
					JsonObject tower = null;
					JsonObject totalKills = null;

					// blue팀과 purple팀의 object kills을 각각 구하는 과정
					// blue팀 objects
					if (k < 5) {
						JsonObject objectives = (JsonObject) purple.get("objectives");
						baron = (JsonObject) objectives.get("baron");
						dragon = (JsonObject) objectives.get("dragon");
						tower = (JsonObject) objectives.get("tower");
						totalKills = (JsonObject) objectives.get("champion");
						// purple팀 objects
					} else {
						JsonObject objectives = (JsonObject) blue.get("objectives");
						baron = (JsonObject) objectives.get("baron");
						dragon = (JsonObject) objectives.get("dragon");
						tower = (JsonObject) objectives.get("tower");
						totalKills = (JsonObject) objectives.get("champion");
					}

					// 승리여부를 화면에 띄우기 위한 용어로 변환
					String winDefeat = null;
					if (participant.get("win").getAsString().equals("true")) {
						winDefeat = "승리";
					} else {
						winDefeat = "패배";
					}
					// death가 0일때 perfect를 부여하는 과정
					if (participant.get("deaths").getAsInt() == 0) {
						String kda = "perfect";
						gds.setSs_kda(kda);
					} else {
						gds.setSs_kda(String.format("%.2f",
								(double) (participant.get("kills").getAsInt() + participant.get("assists").getAsInt())
										/ participant.get("deaths").getAsInt()));
					}

					// 해당 챔피언이 어떤 킬을 했는지 확인하는 과정
					String killType = null;
					if (participant.get("pentaKills").getAsInt() == 1) {
						killType = "펜타킬";
					} else if (participant.get("quadraKills").getAsInt() == 1) {
						killType = "쿼드라킬";
					} else if (participant.get("tripleKills").getAsInt() == 1) {
						killType = "트리플킬";
					} else if (participant.get("doubleKills").getAsInt() == 1) {
						killType = "더블킬";
					} else {
						killType = "없음";
					}
					
					String endGameTime = null;
					String playTime = null;

					// 게임 끝난 시간 및 게임 시간을 구하는 과정
					if(info.get("gameEndTimestamp")!=null) {
						endGameTime = TimeCalculate(info.get("gameEndTimestamp").getAsLong());
						playTime = (info.get("gameDuration").getAsInt()) / 60 + "분 "
								+ (info.get("gameDuration").getAsInt()) % 60 + "초";						
					}else {
						break;
					}
					

					// 7개의 아이템들을 리스트에 넣어 저장
					List<Integer> items = new ArrayList<Integer>();
					items.add(participant.get("item0").getAsInt());
					items.add(participant.get("item1").getAsInt());
					items.add(participant.get("item2").getAsInt());
					items.add(participant.get("item3").getAsInt());
					items.add(participant.get("item4").getAsInt());
					items.add(participant.get("item5").getAsInt());
					items.add(participant.get("item6").getAsInt());

					// 분당 cs를 구하는 과정
					double perCs1 = ((double) (participant.get("totalMinionsKilled").getAsInt()
							+ participant.get("neutralMinionsKilled").getAsInt())
							/ (info.get("gameDuration").getAsInt() / 60));
					String perCs = String.format("%.1f", perCs1);
					// 킬관여율 계산
					String killParticipant = String.format("%.0f",
							(double) (participant.get("kills").getAsInt() + participant.get("assists").getAsInt())
									/ totalKills.get("kills").getAsInt() * 100);

					// 피들스틱 챔피언 이름 변경
					String champName = null;
					if (participant.get("championName").getAsString().equals("FiddleSticks")) {
						gds.setSs_championName("Fiddlesticks");
					} else {
						gds.setSs_championName(participant.get("championName").getAsString());
					}

					// 게임타입을 작성
					String gameType = null;
					switch (info.get("queueId").getAsInt()) {
					case 420:
						gameType = "솔랭";
						break;
					case 430:
						gameType = "일반";
						break;
					case 440:
						gameType = "자유 5:5 랭크";
						break;
					case 450:
						gameType = "무작위 총력전";
						break;
					case 1400:
						gameType = "궁극기 주문서";
						break;
					case 840:
						gameType = "AI대전(초급)";
						break;
					case 850:
						gameType = "AI대전(중급)";
						break;
					case 700:
						gameType = "격전";
					}

					// json object로 가져온것들을 bean에 주입시키는 과정

					gds.setSs_participantId(participant.get("participantId").getAsInt());
					gds.setSs_championId(participant.get("championId").getAsInt());
					gds.setSs_champLevel(participant.get("champLevel").getAsInt());
					gds.setSs_summonerName(participant.get("summonerName").getAsString());

					gds.setSs_win(winDefeat);
					gds.setSs_spell1(participant.get("summoner1Id").getAsInt());
					gds.setSs_spell2(participant.get("summoner2Id").getAsInt());
					gds.setSs_lane(participant.get("teamPosition").getAsString());
					gds.setSs_mainRune(mainPrime.get("perk").getAsInt());
					gds.setSs_subRune(SubSelections.get("style").getAsInt());

					gds.setSs_kills(participant.get("kills").getAsInt());
					gds.setSs_assists(participant.get("assists").getAsInt());
					gds.setSs_deaths(participant.get("deaths").getAsInt());

					gds.setSs_killType(killType);
					gds.setSs_killParticipation(killParticipant);
					gds.setSs_totalDamageDealtToChampions(participant.get("totalDamageDealtToChampions").getAsInt());
					gds.setSs_totalDamageTaken(participant.get("totalDamageTaken").getAsInt());

					gds.setSs_visionWardBuy(participant.get("visionWardsBoughtInGame").getAsInt());
					gds.setSs_wardKilled(participant.get("wardsKilled").getAsInt());
					gds.setSs_wardPlaced(participant.get("wardsPlaced").getAsInt());
					gds.setSs_cs(participant.get("totalMinionsKilled").getAsInt()
							+ participant.get("neutralMinionsKilled").getAsInt());
					gds.setSs_perCs(perCs);

					gds.setSs_items(items);

					gds.setSs_earnGold(participant.get("goldEarned").getAsInt());
					gds.setSs_dragon(dragon.get("kills").getAsInt());
					gds.setSs_baron(baron.get("kills").getAsInt());
					gds.setSs_tower(tower.get("kills").getAsInt());
					gds.setSs_totalKills(totalKills.get("kills").getAsInt());

					gds.setSs_gameDuration(playTime);
					gds.setSs_gameEndTimestamp(endGameTime);
					gds.setSs_gameType(gameType);

					// 검색한 소환사의 정보를 따로 저장
					if (puuid.equals(participant.get("puuid").getAsString())) {
						// puuid가 일치한 본인의 게임 데이터를 가져와 따로 저장한다
						// 메인에 기본적으로 띄워지는 본인 경기를 출력하기 위함

						// 본인포함 전체 게임 정보 저장
						gameData.add(gds);
						soloGameData.add(gds);
						freeGameData.add(gds);
						otherGameData.add(gds);

						// 본인 게임 정보만 저장
						myGame.add(gds);
						mySoloGame.add(gds);
						myFreeGame.add(gds);
						myOtherGame.add(gds);
						mySoloFreeGame.add(gds);

					} else {
						// puuid가 일치하지 않는 다른 게임 저장
						// 본인포함 전체 게임 정보 저장
						gameData.add(gds);
						soloGameData.add(gds);
						freeGameData.add(gds);
						otherGameData.add(gds);
					}

				}
				// 각각 필요한 게임 타입에 따라 필요없는 게임 타입을 제거하는 과정
				soloGameData.removeIf(gds -> !gds.getSs_gameType().equals("솔랭"));
				freeGameData.removeIf(gds -> !gds.getSs_gameType().equals("자유 5:5 랭크"));
				otherGameData
						.removeIf(gds -> gds.getSs_gameType().equals("솔랭") || gds.getSs_gameType().equals("자유 5:5 랭크"));

				// 리스트로 묶인 각각의 게임을 다시 리스트로 넣는다.
				// make_html로 출력하기 위함
				// removeIf로 제거할 경우 해당 리스트는 0으로 표시, 제거되지 않을 경우에는 10으로 표시됨
				if (soloGameData.size() == 10) {
					totalSoloGameData.add(soloGameData);
				}

				if (freeGameData.size() == 10) {
					totalFreeGameData.add(freeGameData);
				}

				if (otherGameData.size() == 10) {
					totalOtherGameData.add(otherGameData);
				}
				// 게임타입에 상관없는 전체 게임 데이터
				totalGameData.add(gameData);

			}
			// 각각 필요한 게임 타입에 따라 필요없는 게임 타입을 제거하는 과정
			mySoloGame.removeIf(gds -> !gds.getSs_gameType().equals("솔랭"));
			myFreeGame.removeIf(gds -> !gds.getSs_gameType().equals("자유 5:5 랭크"));
			myOtherGame.removeIf(gds -> gds.getSs_gameType().equals("솔랭") || gds.getSs_gameType().equals("자유 5:5 랭크"));
			mySoloFreeGame.removeIf(gds -> !(gds.getSs_gameType().equals("솔랭")
					|| gds.getSs_gameType().equals("자유 5:5 랭크") || gds.getSs_gameType().equals("일반")));

			ModelAndView mostLine = MostLine(mySoloFreeGame);
			ModelAndView chmpCnt = ChampCnt(mySoloFreeGame);	
			System.out.println("myTotalGame="+totalGameData);
			
			mav.addObject("myGames", makeHtml_myGameData(myGame, totalGameData));
			mav.addObject("mySoloGames", makeHtml_myGameData(mySoloGame, totalSoloGameData));
			mav.addObject("myFreeGame", makeHtml_myGameData(myFreeGame, totalFreeGameData));
			mav.addObject("myOtherGame", makeHtml_myGameData(myOtherGame, totalOtherGameData));
			
			System.out.println(myGame);

		} catch (Exception e) {
			System.out.println("오류=" + e.getMessage());
			e.printStackTrace();

		}

		return mav;
	}

	private ModelAndView ChampCnt(List<GameDetailShowInfo> mySoloFreeGame) {
		HashSet<String> ChampName = new HashSet<>();
		ArrayList<String> ChampTotalList = new ArrayList<>();

		for (int i = 0; i < mySoloFreeGame.size(); i++) {
			ChampName.add(mySoloFreeGame.get(i).getSs_championName());
		}
		ChampTotalList = new ArrayList<String>(ChampName);

		int[] ChampTotalCnt = new int[ChampTotalList.size()];
		int[] ChampWinCnt = new int[ChampTotalList.size()];
		int[] ChampKill = new int[ChampTotalList.size()];
		int[] ChampDeath = new int[ChampTotalList.size()];
		int[] ChampAssist = new int[ChampTotalList.size()];
		String[] ChampList = ChampTotalList.toArray(new String[ChampTotalList.size()]);

		System.out.println("ChampTotalList=" + ChampTotalList);

		for (int i = 0; i < ChampTotalList.size(); i++) {
			for (int j = 0; j < mySoloFreeGame.size(); j++) {
				if (mySoloFreeGame.get(j).getSs_championName().equals(ChampTotalList.get(i))) {
					ChampTotalCnt[i]++;
					ChampKill[i] += mySoloFreeGame.get(j).getSs_kills();
					ChampDeath[i] += mySoloFreeGame.get(j).getSs_deaths();
					ChampAssist[i] += mySoloFreeGame.get(j).getSs_assists();

					if (mySoloFreeGame.get(j).getSs_win().equals("승리")) {
						ChampWinCnt[i]++;
					}
				}
			}
		}

		for (int i = 0; i < ChampTotalList.size() - 1; i++)
			for (int j = 0; j < ChampTotalList.size() - 1 - i; j++)
				if (ChampTotalCnt[j] < ChampTotalCnt[j + 1]) {
					int TcTmp = ChampTotalCnt[j];
					String cTmp = ChampList[j];
					int WTmp = ChampWinCnt[j];
					int KTmp = ChampKill[j];
					int Dtmp = ChampDeath[j];
					int Atmp = ChampAssist[j];

					ChampTotalCnt[j] = ChampTotalCnt[j + 1];
					ChampList[j] = ChampList[j + 1];
					ChampWinCnt[j] = ChampWinCnt[j + 1];
					ChampKill[j] = ChampKill[j + 1];
					ChampDeath[j] = ChampDeath[j + 1];
					ChampAssist[j] = ChampAssist[j + 1];

					ChampTotalCnt[j + 1] = TcTmp;
					ChampList[j + 1] = cTmp;
					ChampWinCnt[j + 1] = WTmp;
					ChampKill[j + 1] = KTmp;
					ChampDeath[j + 1] = Dtmp;
					ChampAssist[j + 1] = Atmp;
				}

		System.out.println(Arrays.toString(ChampList));
		System.out.println(Arrays.toString(ChampTotalCnt));
		System.out.println(Arrays.toString(ChampWinCnt));
		System.out.println(Arrays.toString(ChampKill));
		System.out.println(Arrays.toString(ChampDeath));
		System.out.println(Arrays.toString(ChampAssist));

		return mav.addObject("myChampPlay",
				makeHtmlMyTier(ChampList, ChampTotalCnt, ChampWinCnt, ChampKill, ChampDeath, ChampAssist));

	}

	private Object makeHtmlMyTier(String[] champList, int[] champTotalCnt, int[] champWinCnt,
			int[] champKill, int[] champDeath, int[] champAssist) {
		StringBuffer sb = new StringBuffer();
		
		if(champList.length==0) {
			System.out.println("데이터 노!");
			
		}else {
			for(int i=0; i<champList.length; i++) {
				String kda = null;
				if(champDeath[i]==0) {
					kda = "Perfect";
				}else {
					kda=String.format("%.2f",((double) (champKill[i] + champAssist[i])) / champDeath[i]);					
				}
				
				sb.append("<tr class=\"table-light\" style=\"font-size: 12px\">");
				sb.append("<th scope=\"row\" style=\"padding: 3px\">");
				sb.append("<div style=\"float: left; width: 18px\">");
				sb.append("<img src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/champion/"+champList[i]+".png\" width=\"18px\">");
				sb.append("</div>");
				sb.append("<div style=\"float: left; width: 70px; font-size:2px\">");
				sb.append("<span>" + String.format("%.1f",
						((double)(champKill[i]) / champTotalCnt[i])) + "</span> / <span style=\"color:red\">" + String.format("%.1f",
								((double)(champDeath[i]) / champTotalCnt[i]))
				+ "</span> / <span>" + String.format("%.1f",
						((double)(champAssist[i]) / champTotalCnt[i])) + "</span>");
				sb.append("</div>");
				sb.append("</th>");
				sb.append("<td style=\"padding: 3px\">"+champTotalCnt[i]+"경기</td>");
				sb.append("<td style=\"padding: 3px; font-weight : bold\">"+kda+"</td>");
				sb.append("<td style=\"padding: 3px\">"+String.format("%.0f", (((double) champWinCnt[i]) / champTotalCnt[i]) * 100)+"%</td>");
				sb.append("</tr>");
				
			}
		}
		return sb.toString();
	}

	private ModelAndView MostLine(List<GameDetailShowInfo> mySoloGame) {
		int[] MostLaneCnt = new int[5];
		int[] MostLaneWin = new int[5];
		double[] MostLaneCs = new double[5];
		double[] MostLaneGold = new double[5];
		double[] MostLaneVW = new double[5];
		double[] MostLaneWP = new double[5];
		double[] MostLaneWK = new double[5];
		int[] MostLaneKill = new int[5];
		int[] MostLaneDeath = new int[5];
		int[] MostLaneAssist = new int[5];

		ArrayList<Object> test = new ArrayList<>();

		int maxIdx = -1; // 최대 값의 인덱스 저장
		int max = 0; // 최대 값 저장
		String MLane = null;
		for (int i = 0; i < mySoloGame.size(); i++) {
			System.out.println(mySoloGame.get(i).getSs_gameDuration().split("분"));
			String [] GTime = mySoloGame.get(i).getSs_gameDuration().split("분");
			System.out.println(GTime[0]);
			int gameTime = Integer.valueOf(GTime[0]);

			if (mySoloGame.get(i).getSs_lane().equals("TOP")) {
				MostLaneCnt[0]++;
				MostLaneCs[0] += Double.valueOf(mySoloGame.get(i).getSs_perCs());
				MostLaneGold[0] += (double) mySoloGame.get(i).getSs_earnGold() / gameTime;
				MostLaneVW[0] += (double) mySoloGame.get(i).getSs_visionWardBuy() / gameTime;
				MostLaneWP[0] += (double) mySoloGame.get(i).getSs_wardPlaced() / gameTime;
				MostLaneWK[0] += (double) mySoloGame.get(i).getSs_wardKilled() / gameTime;
				MostLaneKill[0] += mySoloGame.get(i).getSs_kills();
				MostLaneDeath[0] += mySoloGame.get(i).getSs_deaths();
				MostLaneAssist[0] += mySoloGame.get(i).getSs_assists();
				if (mySoloGame.get(i).getSs_win().equals("승리")) {
					MostLaneWin[0]++;
				}
			} else if (mySoloGame.get(i).getSs_lane().equals("JUNGLE")) {
				MostLaneCnt[1]++;
				MostLaneCs[1] += Double.valueOf(mySoloGame.get(i).getSs_perCs());
				MostLaneGold[1] += (double) mySoloGame.get(i).getSs_earnGold() / gameTime;
				MostLaneVW[1] += (double) mySoloGame.get(i).getSs_visionWardBuy() / gameTime;
				MostLaneWP[1] += (double) mySoloGame.get(i).getSs_wardPlaced() / gameTime;
				MostLaneWK[1] += (double) mySoloGame.get(i).getSs_wardKilled() / gameTime;
				MostLaneKill[1] += mySoloGame.get(i).getSs_kills();
				MostLaneDeath[1] += mySoloGame.get(i).getSs_deaths();
				MostLaneAssist[1] += mySoloGame.get(i).getSs_assists();
				if (mySoloGame.get(i).getSs_win().equals("승리")) {
					MostLaneWin[1]++;
				}
			} else if (mySoloGame.get(i).getSs_lane().equals("MIDDLE")) {
				MostLaneCnt[2]++;
				MostLaneCs[2] += Double.valueOf(mySoloGame.get(i).getSs_perCs());
				MostLaneGold[2] += (double) mySoloGame.get(i).getSs_earnGold() / gameTime;
				MostLaneVW[2] += (double) mySoloGame.get(i).getSs_visionWardBuy() / gameTime;
				MostLaneWP[2] += (double) mySoloGame.get(i).getSs_wardPlaced() / gameTime;
				MostLaneWK[2] += (double) mySoloGame.get(i).getSs_wardKilled() / gameTime;
				MostLaneKill[2] += mySoloGame.get(i).getSs_kills();
				MostLaneDeath[2] += mySoloGame.get(i).getSs_deaths();
				MostLaneAssist[2] += mySoloGame.get(i).getSs_assists();
				if (mySoloGame.get(i).getSs_win().equals("승리")) {
					MostLaneWin[2]++;
				}
			} else if (mySoloGame.get(i).getSs_lane().equals("BOTTOM")) {
				MostLaneCnt[3]++;
				MostLaneCs[3] += Double.valueOf(mySoloGame.get(i).getSs_perCs());
				MostLaneGold[3] += (double) mySoloGame.get(i).getSs_earnGold() / gameTime;
				MostLaneVW[3] += (double) mySoloGame.get(i).getSs_visionWardBuy() / gameTime;
				MostLaneWP[3] += (double) mySoloGame.get(i).getSs_wardPlaced() / gameTime;
				MostLaneWK[3] += (double) mySoloGame.get(i).getSs_wardKilled() / gameTime;
				MostLaneKill[3] += mySoloGame.get(i).getSs_kills();
				MostLaneDeath[3] += mySoloGame.get(i).getSs_deaths();
				MostLaneAssist[3] += mySoloGame.get(i).getSs_assists();
				if (mySoloGame.get(i).getSs_win().equals("승리")) {
					MostLaneWin[3]++;
				}

			} else if (mySoloGame.get(i).getSs_lane().equals("UTILITY")) {
				MostLaneCnt[4]++;
				MostLaneCs[4] += Double.valueOf(mySoloGame.get(i).getSs_perCs());
				MostLaneGold[4] += (double) mySoloGame.get(i).getSs_earnGold() / gameTime;
				MostLaneVW[4] += (double) mySoloGame.get(i).getSs_visionWardBuy() / gameTime;
				MostLaneWP[4] += (double) mySoloGame.get(i).getSs_wardPlaced() / gameTime;
				MostLaneWK[4] += (double) mySoloGame.get(i).getSs_wardKilled() / gameTime;
				MostLaneKill[4] += mySoloGame.get(i).getSs_kills();
				MostLaneDeath[4] += mySoloGame.get(i).getSs_deaths();
				MostLaneAssist[4] += mySoloGame.get(i).getSs_assists();
				if (mySoloGame.get(i).getSs_win().equals("승리")) {
					MostLaneWin[4]++;
				}

			}
			for (int j = 0; j < 5; j++) {
				if (max < MostLaneCnt[j]) { // 최대 값을 구하고 그 값의 인덱스를 저장
					max = MostLaneCnt[j]; // 최대 값 저장
					maxIdx = j; // 최대 값의 인덱스 저장
				}
			}
			if (maxIdx == 0) {
				MLane = "TOP";
			} else if (maxIdx == 1) {
				MLane = "JUNGLE";
			} else if (maxIdx == 2) {
				MLane = "MIDDLE";
			} else if (maxIdx == 3) {
				MLane = "BOTTOM";
			} else if (maxIdx == 4) {
				MLane = "UTILITY";
			} else {
				MLane = "none";
				System.out.println("none");
			}
		}

		if (maxIdx == -1 || MostLaneCnt[maxIdx] == 0) {
			mav.addObject("isNot", 0);
			mav.addObject("MostLaneCs", 0);
			mav.addObject("MostLaneGold", 0);
			mav.addObject("MostLaneVW", 0);
			mav.addObject("MostLaneWP", 0);
			mav.addObject("MostLaneWK", 0);
		} else {
			mav.addObject("isNot", 1);
			mav.addObject("RGCnt", mySoloGame.size());
			mav.addObject("MLane", MLane);
			mav.addObject("MostLane", MostLaneCnt[maxIdx]);
			mav.addObject("MostLaneWin", MostLaneWin[maxIdx]);
			mav.addObject("MostwinRate",
					String.format("%.0f", (((double) MostLaneWin[maxIdx]) / MostLaneCnt[maxIdx]) * 100));
			mav.addObject("MostLaneCs", Math.round((MostLaneCs[maxIdx] / MostLaneCnt[maxIdx]) * 100) / 100.0);
			mav.addObject("MostLaneGold", Math.round((MostLaneGold[maxIdx] / MostLaneCnt[maxIdx]) * 100) / 100.0);
			mav.addObject("MostLaneVW", Math.round((MostLaneVW[maxIdx] / MostLaneCnt[maxIdx]) * 100) / 100.0);
			mav.addObject("MostLaneWP", Math.round((MostLaneWP[maxIdx] / MostLaneCnt[maxIdx]) * 100) / 100.0);
			mav.addObject("MostLaneWK", Math.round((MostLaneWK[maxIdx] / MostLaneCnt[maxIdx]) * 100) / 100.0);
			mav.addObject("MostLaneKda", String.format("%.2f",
					((double) (MostLaneKill[maxIdx] + MostLaneAssist[maxIdx])) / MostLaneDeath[maxIdx]));
		}
		return mav;
	}

	private Object makeHtml_myGameData(List<GameDetailShowInfo> myGame, List<List<GameDetailShowInfo>> totalGameData) {
		StringBuffer sb = new StringBuffer();

		// 전적 및 잘못된 소환사 이름일 경우 띄우는 div 메시지
		if (myGame.size() == 0) {
			sb.append("<div class=\"card\">");
			sb.append("<div class=\"card-body\">");
			sb.append("<p class=\"card-text\" style=\"font-family: 'Poor Story', cursive\">기록된 전적이 없습니다.</p>");
			sb.append("</div>");
			sb.append("</div>");

		} else {
			for (int i = 0; i < myGame.size(); i++) {
				// 본인 전적검색의 정보 가져오기
				GameDetailShowInfo gds = myGame.get(i);
				// 상세정보 클릭시의 전체 정보를 가져오기
				List<GameDetailShowInfo> ml = totalGameData.get(i);

				// 본인 전적검색의 승리여부를 배경색이나 글자 색으로 표현하기 위한 수식
				String backgroundColor = null;
				String itemBoxColor = null;
				String fontColor = null;
				int blueTotalGoldEarn = 0;
				int purpleTotalGoldEarn = 0;

				if (gds.getSs_win().equals("승리")) {
					backgroundColor = "#A5C6F6";
					itemBoxColor = "#5F90D9";
					fontColor = "blue";
				} else {
					backgroundColor = "#FEC0C0";
					itemBoxColor = "#D38389";
					fontColor = "red";
				}

				// 상세보기 클릭시 본인 및 타인의 전적검색 승리여부를 배경색이나 글자 색으로 표현하기 위한 수식
				String blueBackgroundColor = null;
				String purpleBackgroundColor = null;
				String blueItemBoxColor = null;
				String purpleItemBoxColor = null;
				String blueGraphColor = null;
				String purpleGraphColor = null;
				String blueFontColor = null;
				String purpleFontColor = null;

				if (ml.get(0).getSs_win().equals("승리")) {
					blueBackgroundColor = "table-info";
					purpleBackgroundColor = "table-danger";
					blueItemBoxColor = "#5F90D9";
					purpleItemBoxColor = "#D38389";
					blueGraphColor = "progress-bar bg-info";
					purpleGraphColor = "progress-bar bg-danger";
					blueFontColor = "blue";
					purpleFontColor = "red";

				} else if (ml.get(5).getSs_win().equals("승리")) {
					blueBackgroundColor = "table-danger";
					purpleBackgroundColor = "table-info";
					blueItemBoxColor = "#D38389";
					purpleItemBoxColor = "#5F90D9";
					blueGraphColor = "progress-bar bg-danger";
					purpleGraphColor = "progress-bar bg-info";
					blueFontColor = "red";
					purpleFontColor = "blue";
				}

				// 받은피해량과 가한피해량의 max값 구하기
				// 각각 소환사의 받은피해량과 가한피해량의 %를 구해 그래프에 대입하기위한 방식
				int maxDamageDealt = ml.get(0).getSs_totalDamageDealtToChampions();
				int maxDamageTaken = ml.get(0).getSs_totalDamageTaken();

				for (int p = 0; p < 10; p++) {
					if (maxDamageDealt < ml.get(p).getSs_totalDamageDealtToChampions()) {
						maxDamageDealt = ml.get(p).getSs_totalDamageDealtToChampions();
					}
					if (maxDamageTaken < ml.get(p).getSs_totalDamageTaken()) {
						maxDamageTaken = ml.get(p).getSs_totalDamageTaken();
					}
				}

				sb.append("<div class=\"card\" id=\"cardflex\" style=\"background-color:" + backgroundColor
						+ "; margin-bottom:5px; display:none\">");
				sb.append("<div class=\"card-body\" id=\"dataFlexBox\" style=\"padding:5px\">");
				sb.append("<div class=\"gameDate\">");
				sb.append("<div class=\"gameType\" style=\"color:" + fontColor
						+ "; font-family: 'Poor Story', cursive\">" + gds.getSs_gameType() + "</div>");
				sb.append("<div class=\"gameEndTime\" style=\"font-family: 'Poor Story', cursive\">"
						+ gds.getSs_gameEndTimestamp() + "</div>");
				sb.append("<div class=\"winOrDefeat\" style=\"color:" + fontColor
						+ ";font-family: 'Poor Story', cursive\">" + gds.getSs_win() + "</div>");
				sb.append("<div class=\"gameDuration\" style=\"font-family: 'Poor Story', cursive\">"
						+ gds.getSs_gameDuration() + "</div>");
				sb.append("</div>");
				sb.append("<div class=\"championData\">");
				sb.append("<div class=\"imageLevelBox\">");
				sb.append("<div class=\"imageLevel\">");
				sb.append("<div id=\"champImage\" style=\"height: 60px\">");
				sb.append("<a href='http://localhost:8080/www/clickDetail?championId=" + gds.getSs_championId()
						+ "'onclick=\"event.stopPropagation()\">");
				sb.append("<img src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/champion/"
						+ gds.getSs_championName() + ".png\" width=\"50px\">");
				sb.append("</a>");
				sb.append("</div>");
				sb.append("<div id=\"champLevel\">");
				sb.append(
						"<span class=\"badge rounded-pill bg-primary\" style=\"color: white; height:20px; font-size :10px;\">"
								+ gds.getSs_champLevel() + "</span>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("<div class=\"spellBox\">");
				sb.append("<div id=\"spell1\">");
				sb.append("<img src=\"./resources/spell/" + gds.getSs_spell1() + ".png\" width=\"25px\">");
				sb.append("</div>");
				sb.append("<div id=\"spell2\">");
				sb.append("<img src=\"./resources/spell/" + gds.getSs_spell2() + ".png\" width=\"25px\">");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("<div class=\"runeBox\">");
				sb.append("<div id=\"mainRune\">");
				sb.append("<img src=\"./resources/runes/" + gds.getSs_mainRune() + ".png\" width=\"25px\">");
				sb.append("</div>");
				sb.append("<div id=\"subRune\">");
				sb.append("<img src=\"./resources/runes/" + gds.getSs_subRune() + ".png\" width=\"25px\">");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("<div class=\"lane\">");
				sb.append("<h6>" + gds.getSs_lane() + "</h6>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("<div class=\"itemsBox\">");
				sb.append("<div class=\"items\">");

				// 아이템 정보 출력(이미지, 색상)
				for (int j = 0; j < 7; j++) {
					if (gds.getSs_items().get(j) == 0) {
						sb.append("<div id=\"item\" style=\"background-color:" + itemBoxColor + "\" >");
						sb.append("</div>");
					} else {
						sb.append("<div id=\"item\">");
						sb.append("<img src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/"
								+ gds.getSs_items().get(j) + ".png\" width=\"28px\">");
						sb.append("</div>");
					}
				}
				sb.append("</div>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("<div class=\"stats\">");
				sb.append("<div id=\"bigKda\" style=\"width: 100%; height: 30px\">");
				sb.append("<span>" + gds.getSs_kills() + "</span> / <span style=\"color:red\">" + gds.getSs_deaths()
						+ "</span> / <span>" + gds.getSs_assists() + "</span>");
				sb.append("</div>");
				sb.append("<div class=\"kdaKp\" style=\"margin-top:-5px\">");
				sb.append("<p style=\"height: 5px; float: none\">KDA " + gds.getSs_kda() + "</p>");
				sb.append(
						"<p style=\"height: 5px; float: none\"><span style=\"font-family: 'Poor Story', cursive\">킬관여</span> "
								+ gds.getSs_killParticipation() + "%</p>");
				sb.append("</div>");

				// 킬타입이 없을시 span이 주어지지 않도록 설정, 있을경우 span 부여
				if (gds.getSs_killType().equals("없음")) {
					sb.append("<div class =\"killType\">");
					sb.append("</div>");
				} else {
					sb.append("<div class =\"killType\" style=\"margin-top:10px\">");
					sb.append(
							" <span class=\"badge rounded-pill bg-danger\" style=\"font-family: 'Poor Story', cursive\">"
									+ gds.getSs_killType() + "</span>");
					sb.append("</div>");
				}

				sb.append("</div>");
				sb.append("<div class=\"CS\">");
				sb.append("<p style=\"height: 5px\">CS " + gds.getSs_cs() + "</p>");
				sb.append("<p style=\"height: 5px\">(" + gds.getSs_perCs() + "/분)</p>");
				sb.append("<p style=\"height: 5px\">" + gds.getSs_visionWardBuy() + "</p>");
				sb.append("<p style=\"height: 5px\">" + gds.getSs_wardPlaced() + "/" + gds.getSs_wardKilled() + "</p>");
				sb.append("</div>");
				sb.append("<div class=\"teamList\">");
				sb.append("<div class=\"blueTeam\">");

				for (int k = 0; k < 5; k++) {
					blueTotalGoldEarn += ml.get(k).getSs_earnGold();

					sb.append("<div class=\"summoner\">");
					sb.append("<div class=\"miniSumImage\" style=\"margin-right:1.5px\">");
					sb.append("<a href='http://localhost:8080/www/clickDetail?championId="
							+ ml.get(k).getSs_championId() + "'onclick=\"event.stopPropagation()\">");
					sb.append(
							"<img class=\"minichampImg\" src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/champion/"
									+ ml.get(k).getSs_championName() + ".png\" width=\"18px\">");
					sb.append("</a>");
					sb.append("</div>");
					sb.append("<div class=\"miniSumName\" style=\"font-family: 'Poor Story', cursive;\">");
					sb.append("<a href='http://localhost:8080/www/summonerSearch?summonerName="
							+ ml.get(k).getSs_summonerName()
							+ "' class=\"miniName\" onclick=\"event.stopPropagation()\">"
							+ ml.get(k).getSs_summonerName() + "</a>");
					sb.append("</div>");
					sb.append("</div>");
				}

				sb.append("</div>");
				sb.append("<div class=\"purpleTeam\">");

				for (int k = 5; k < 10; k++) {
					purpleTotalGoldEarn += ml.get(k).getSs_earnGold();
					// ai 대전일 경우 퍼플팀에 챔피언 이름으로 출력됨. 다만 해당 챔피언 이름으로한 소환사 계정이 있으므로 구별짓기 위해 (봇)을 따로 부여
					if (gds.getSs_gameType().equals("AI대전(초급)") || gds.getSs_gameType().equals("AI대전(중급)")) {
						sb.append("<div class=\"summoner\">");
						sb.append("<div class=\"miniSumImage\" style=\"margin-right:1.5px;\">");
						sb.append("<a href='http://localhost:8080/www/clickDetail?championId="
								+ ml.get(k).getSs_championId() + "'onclick=\"event.stopPropagation()\">");
						sb.append(
								"<img class=\"minichampImg\" src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/champion/"
										+ ml.get(k).getSs_championName() + ".png\" width=\"18px\" >");
						sb.append("</a>");
						sb.append("</div>");
						sb.append("<div class=\"miniSumName\" style=\"font-family: 'Poor Story', cursive;\">");
						sb.append("<p>(봇)</p>");
						sb.append("</div>");
						sb.append("</div>");

					} else {
						sb.append("<div class=\"summoner\">");
						sb.append("<div class=\"miniSumImage\" style=\"margin-right:1.5px\">");
						sb.append("<a href='http://localhost:8080/www/clickDetail?championId="
								+ ml.get(k).getSs_championId() + "' onclick=\"event.stopPropagation()\">");
						sb.append(
								"<img class=\"minichampImg\" src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/champion/"
										+ ml.get(k).getSs_championName() + ".png\" width=\"18px\">");
						sb.append("</a>");
						sb.append("</div>");
						sb.append("<div class=\"miniSumName\" style=\"font-family: 'Poor Story', cursive;\">");
						sb.append("<a href='http://localhost:8080/www/summonerSearch?summonerName="
								+ ml.get(k).getSs_summonerName()
								+ "' class=\"miniName\" onclick=\"event.stopPropagation()\">"
								+ ml.get(k).getSs_summonerName() + "</a>");
						sb.append("</div>");
						sb.append("</div>");
					}
				}
				sb.append("</div>");
				sb.append("</div>");
				sb.append("<div class=\"arrowBox\">");
				sb.append("<div class=\"arrow-wrap\">");
				sb.append("<span class=\"arrow-top\"><img src=\"./resources/loginImg/up.png\" width=\"25px\"></span>");
				sb.append("<span class=\"arrow-bottom\"><img src=\"./resources/loginImg/down.png\" width=\"25px\"></span>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("<div class=\"otherPlayerList\">");
				sb.append("<table class=\"table table-hover\">");
				sb.append("<thead style=\"height: 5px; text-align: center\">");
				sb.append("<tr>");
				sb.append("<th scope=\"col\">Type</th>");
				sb.append("<th scope=\"col\">KDA</th>");
				sb.append("<th scope=\"col\" style=\"font-family: 'Poor Story', cursive\">가한 피해량</th>");
				sb.append("<th scope=\"col\" style=\"font-family: 'Poor Story', cursive\">받은 피해량</th>");
				sb.append("<th scope=\"col\" style=\"font-family: 'Poor Story', cursive\">와드</th>");
				sb.append("<th scope=\"col\">CS</th>");
				sb.append("<th scope=\"col\" style=\"font-family: 'Poor Story', cursive\">아이템</th>");
				sb.append("</tr>");
				sb.append("</thead>");
				sb.append("<tbody>");

				// blue 팀 데이터 출력
				for (int k = 0; k < 5; k++) {
					sb.append("<tr class=" + blueBackgroundColor + " style=\"height: 50px\">");
					sb.append("<th scope=\"row\" style=\"width: 24%; padding-right : 5px; padding-left : 5px\">");
					sb.append("<div class=\"otherChampImageLevel\">");
					sb.append("<div id=\"champImage\">");
					sb.append("<a href='http://localhost:8080/www/clickDetail?championId="
							+ ml.get(k).getSs_championId() + "' onclick=\"event.stopPropagation()\">");
					sb.append("<img src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/champion/"
							+ ml.get(k).getSs_championName() + ".png\" width=\"35px\">");
					sb.append("</a>");
					sb.append("</div>");
					sb.append("<div id=\"otherChampLevel\">");
					sb.append(
							"<span class=\"badge rounded-pill bg-primary\" id=\"otherImage\" style=\"color: white; height: 11px; font-size: 5px\">"
									+ ml.get(k).getSs_champLevel() + "</span>");
					sb.append("</div>");
					sb.append("</div>");
					sb.append("<div class=\"otherSpellBox\">");
					sb.append("<div id=\"otherSpell1\">");
					sb.append("<img class=\"miniSpell\" src=\"./resources/spell/" + ml.get(k).getSs_spell1()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("<div id=\"otherSpell2\">");
					sb.append("<img class=\"miniSpell\" src=\"./resources/spell/" + ml.get(k).getSs_spell2()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("</div>");
					sb.append("<div class=\"otherRuneBox\">");
					sb.append("<div id=\"otherMainRune\">");
					sb.append("<img class=\"miniRune\" src=\"./resources/runes/" + ml.get(k).getSs_mainRune()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("<div id=\"otherSubRune\">");
					sb.append("<img class=\"miniRune\" src=\"./resources/runes/" + ml.get(k).getSs_subRune()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("</div>");
					sb.append("<div class=\"otherSummonerName\">");
					sb.append("<a href='http://localhost:8080/www/summonerSearch?summonerName="
							+ ml.get(k).getSs_summonerName()
							+ "' class=\"miniName\" onclick=\"event.stopPropagation()\" style=\"font-family: 'Poor Story', cursive;\">"
							+ ml.get(k).getSs_summonerName() + "</a>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">" + ml.get(k).getSs_lane()
							+ "</p>");
					sb.append("</div>");
					sb.append("</th>");
					sb.append("<td style=\"width: 10%\">");
					sb.append("<div class=\"otherKda\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; font-weight: bold;\">" + ml.get(k).getSs_kills()
							+ "/" + ml.get(k).getSs_deaths() + "/" + ml.get(k).getSs_assists() + "("
							+ ml.get(k).getSs_killParticipation() + "%)</p>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">KDA "
							+ ml.get(k).getSs_kda() + "</p>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 13%\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; text-align: center\">"
							+ ml.get(k).getSs_totalDamageDealtToChampions() + "</p>");
					sb.append("<div class=\"progress\">");
					sb.append(
							"<div class=\"progress-bar bg-danger\" role=\"progressbar\" style=\"width:"
									+ String.format("%.0f",
											(double) (ml.get(k).getSs_totalDamageDealtToChampions()) / maxDamageDealt
													* 100)
									+ "%;\" aria-valuenow=\"100\" aria-valuemin=\"0\" aria-valuemax=\"100\"></div>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 13%\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; text-align: center\">"
							+ ml.get(k).getSs_totalDamageTaken() + "</p>");
					sb.append("<div class=\"progress\">");
					sb.append("<div class=\"progress-bar\" role=\"progressbar\" style=\"width:"
							+ String.format("%.0f",
									(double) (ml.get(k).getSs_totalDamageTaken()) / maxDamageTaken * 100)
							+ "%;\" aria-valuenow=\"100\" aria-valuemin=\"0\" aria-valuemax=\"100\"></div>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 7%\">");
					sb.append("<div class=\"otherWard\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; font-weight: bold;\">"
							+ ml.get(k).getSs_visionWardBuy() + "</p>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">"
							+ ml.get(k).getSs_wardPlaced() + "/" + ml.get(k).getSs_wardKilled() + "</p>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 8%\">");
					sb.append("<div class=\"otherCs\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; font-weight: bold;\">" + ml.get(k).getSs_cs()
							+ "</p>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">("
							+ ml.get(k).getSs_perCs() + "/분)</p>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 25%; padding-left:5px; padding-right:5px\">");
					sb.append("<div class=\"otherItemsBox\">");
					sb.append("<div class=\"items\">");

					for (int j = 0; j < 7; j++) {
						if (ml.get(k).getSs_items().get(j) == 0) {
							sb.append("<div id=\"item\" style=\"background-color:" + blueItemBoxColor + "\" >");
							sb.append("</div>");
						} else {
							sb.append("<div id=\"item\">");
							sb.append("<img src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/"
									+ ml.get(k).getSs_items().get(j) + ".png\" width=\"28px\">");
							sb.append("</div>");
						}
					}
					sb.append("</div>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("</tr>");
				}
				// blue, purple팀의 Object 및 기타 게임정보 출력
				sb.append("<tr class=\"table-light\">");
				sb.append("<td style=\"color:" + blueFontColor + "\">Baron : <span style=\"color:black\">"
						+ ml.get(0).getSs_baron() + "</span> Dragon : <span style=\"color:black\">"
						+ ml.get(0).getSs_dragon() + "</span> Tower : <span style=\"color:black\">"
						+ ml.get(0).getSs_tower() + "</span></td>");
				sb.append("<td colspan=\"5\" style=\"text-align: center; height: 20px;\">");
				sb.append("<p class=\"graphTitle\" style=\"top: -2.5px\">Total Kill</p>");
				sb.append("<div class=\"progress\" style=\"margin-top: -25px;\">");
				sb.append("<div class=\"" + blueGraphColor + "\" role=\"progressbar\" style=\"width:"
						+ String.format("%.0f",
								(double) (ml.get(0).getSs_totalKills())
										/ (ml.get(0).getSs_totalKills() + ml.get(5).getSs_totalKills()) * 100)
						+ "%; text-align: left\" aria-valuenow=\"15\" aria-valuemin=\"0\" aria-valuemax=\"100\">"
						+ ml.get(0).getSs_totalKills() + "</div>");
				sb.append("<div class=\"" + purpleGraphColor + "\" role=\"progressbar\" style=\"width:"
						+ String.format("%.0f",
								(double) (ml.get(5).getSs_totalKills())
										/ (ml.get(0).getSs_totalKills() + ml.get(5).getSs_totalKills()) * 100)
						+ "%; text-align: right\" aria-valuenow=\"30\" aria-valuemin=\"0\" aria-valuemax=\"100\">"
						+ ml.get(5).getSs_totalKills() + "</div>");
				sb.append("</div>");
				sb.append("<p class=\"graphTitle\" style=\"top: 3px\">Total Gold</p>");
				sb.append("<div class=\"progress\" style=\"margin-top: -20px;\">");
				sb.append("<div class=\"" + blueGraphColor + "\" role=\"progressbar\" style=\"width:"
						+ String.format("%.0f",
								(double) (blueTotalGoldEarn) / (blueTotalGoldEarn + purpleTotalGoldEarn) * 100)
						+ "%; text-align: left\" aria-valuenow=\"15\" aria-valuemin=\"0\" aria-valuemax=\"100\">"
						+ blueTotalGoldEarn + "</div>");
				sb.append("<div class=\"" + purpleGraphColor + "\" role=\"progressbar\" style=\"width:"
						+ String.format("%.0f",
								(double) (purpleTotalGoldEarn) / (blueTotalGoldEarn + purpleTotalGoldEarn) * 100)
						+ "%; text-align: right\" aria-valuenow=\"30\" aria-valuemin=\"0\" aria-valuemax=\"100\">"
						+ purpleTotalGoldEarn + "</div>");
				sb.append("</div>");
				sb.append("</td>");
				sb.append("<td style=\"text-align: right; color:" + purpleFontColor
						+ "\">Baron : <span style=\"color:black\">" + ml.get(5).getSs_baron()
						+ "</span> Dragon : <span style=\"color:black\">" + ml.get(5).getSs_dragon()
						+ "</span> Tower : <span style=\"color:black\">" + ml.get(5).getSs_tower() + "</span></td>");
				sb.append("</tr>");

				// purple 팀 데이터 출력
				for (int k = 5; k < 10; k++) {
					sb.append("<tr class=" + purpleBackgroundColor + " style=\"height: 50px\">");
					sb.append("<th scope=\"row\" style=\"width: 24%; padding-right : 5px; padding-left : 5px\">");
					sb.append("<div class=\"otherChampImageLevel\">");
					sb.append("<div id=\"champImage\">");
					sb.append("<a href='http://localhost:8080/www/clickDetail?championId="
							+ ml.get(k).getSs_championId() + "' onclick=\"event.stopPropagation()\">");
					sb.append("<img src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/champion/"
							+ ml.get(k).getSs_championName() + ".png\" width=\"35px\">");
					sb.append("</a>");
					sb.append("</div>");
					sb.append("<div id=\"otherChampLevel\">");
					sb.append(
							"<span class=\"badge rounded-pill bg-primary\" id=\"otherImage\" style=\"color: white; height: 11px; font-size: 5px\">"
									+ ml.get(k).getSs_champLevel() + "</span>");
					sb.append("</div>");
					sb.append("</div>");
					sb.append("<div class=\"otherSpellBox\">");
					sb.append("<div id=\"otherSpell1\">");
					sb.append("<img class=\"miniSpell\" src=\"./resources/spell/" + ml.get(k).getSs_spell1()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("<div id=\"otherSpell2\">");
					sb.append("<img class=\"miniSpell\" src=\"./resources/spell/" + ml.get(k).getSs_spell2()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("</div>");
					sb.append("<div class=\"otherRuneBox\">");
					sb.append("<div id=\"otherMainRune\">");
					sb.append("<img class=\"miniRune\" src=\"./resources/runes/" + ml.get(k).getSs_mainRune()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("<div id=\"otherSubRune\">");
					sb.append("<img class=\"miniRune\" src=\"./resources/runes/" + ml.get(k).getSs_subRune()
							+ ".png\" width=\"18px\">");
					sb.append("</div>");
					sb.append("</div>");
					sb.append("<div class=\"otherSummonerName\">");
					sb.append("<a href='http://localhost:8080/www/summonerSearch?summonerName="
							+ ml.get(k).getSs_summonerName()
							+ "' class=\"miniName\" onclick=\"event.stopPropagation()\" style=\"font-family: 'Poor Story', cursive;\">"
							+ ml.get(k).getSs_summonerName() + "</a>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">" + ml.get(k).getSs_lane()
							+ "</p>");
					sb.append("</div>");
					sb.append("</th>");
					sb.append("<td style=\"width: 10%\">");
					sb.append("<div class=\"otherKda\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; font-weight: bold;\">" + ml.get(k).getSs_kills()
							+ "/" + ml.get(k).getSs_deaths() + "/" + ml.get(k).getSs_assists() + "("
							+ ml.get(k).getSs_killParticipation() + "%)</p>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">KDA "
							+ ml.get(k).getSs_kda() + "</p>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 13%\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; text-align: center\">"
							+ ml.get(k).getSs_totalDamageDealtToChampions() + "</p>");
					sb.append("<div class=\"progress\">");
					sb.append(
							"<div class=\"progress-bar bg-danger\" role=\"progressbar\" style=\"width:"
									+ String.format("%.0f",
											(double) (ml.get(k).getSs_totalDamageDealtToChampions()) / maxDamageDealt
													* 100)
									+ "%;\" aria-valuenow=\"100\" aria-valuemin=\"0\" aria-valuemax=\"100\"></div>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 13%\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; text-align: center\">"
							+ ml.get(k).getSs_totalDamageTaken() + "</p>");
					sb.append("<div class=\"progress\">");
					sb.append("<div class=\"progress-bar\" role=\"progressbar\" style=\"width:"
							+ String.format("%.0f",
									(double) (ml.get(k).getSs_totalDamageTaken()) / maxDamageTaken * 100)
							+ "%;\" aria-valuenow=\"100\" aria-valuemin=\"0\" aria-valuemax=\"100\"></div>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 7%\">");
					sb.append("<div class=\"otherWard\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; font-weight: bold;\">"
							+ ml.get(k).getSs_visionWardBuy() + "</p>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">"
							+ ml.get(k).getSs_wardPlaced() + "/" + ml.get(k).getSs_wardKilled() + "</p>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 8%\">");
					sb.append("<div class=\"otherCs\">");
					sb.append("<p style=\"height: 5px; font-size: 15px; font-weight: bold;\">" + ml.get(k).getSs_cs()
							+ "</p>");
					sb.append("<p style=\"height: 5px; font-size: 13px; font-weight: bold;\">("
							+ ml.get(k).getSs_perCs() + "/분)</p>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("<td style=\"width: 25%; padding-left:5px; padding-right:5px \">");
					sb.append("<div class=\"otherItemsBox\">");
					sb.append("<div class=\"items\">");

					for (int j = 0; j < 7; j++) {
						if (ml.get(k).getSs_items().get(j) == 0) {
							sb.append("<div id=\"item\" style=\"background-color:" + purpleItemBoxColor + "\" >");
							sb.append("</div>");
						} else {
							sb.append("<div id=\"item\">");
							sb.append("<img src=\"https://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/"
									+ ml.get(k).getSs_items().get(j) + ".png\" width=\"28px\">");
							sb.append("</div>");
						}
					}
					sb.append("</div>");
					sb.append("</div>");
					sb.append("</td>");
					sb.append("</tr>");

				}

				sb.append("</tbody>");
				sb.append("</table>");
				sb.append("</div>");

			}
		}
		return sb.toString();
	}

	private String TimeCalculate(long asLong) {
		long currentTime = System.currentTimeMillis() / 1000; // 현재 시간 구하기
		long calculateTime = asLong / 1000; // 게임이 끝난 시간
		long agoTime = currentTime - calculateTime; // 몇시간 전에 했는지 구하기

		String timeDate = null;
//		// 맞춰진 형식으로 띄우기 위해 계산
		if (agoTime / 2592000 >= 1) {
			long monTime = agoTime / 2592000;
			timeDate = monTime + "달 전";
		} else if (agoTime / 86400 >= 1) { // 일 계산
			long dayTime = agoTime / 86400;
			timeDate = dayTime + "일 전"; // 하루 이상이면
		} else if (agoTime / 3600 >= 1) {
			long hourTime = agoTime / 3600;
			timeDate = hourTime + "시간 전"; // 1시간 이상이면
		} else if (agoTime / 60 >= 1) {
			long minTime = agoTime / 60;
			timeDate = minTime + "분 전"; // 1분 이상이면
		}
		return timeDate;
	}

}