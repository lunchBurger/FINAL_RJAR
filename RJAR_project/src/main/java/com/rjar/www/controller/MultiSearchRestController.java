package com.rjar.www.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rjar.www.bean.summonersearch.MultiSearchBean;
import com.rjar.www.exception.SummonerNotFoundException;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController // @ResponseBody 생략
//@RequiredArgsConstructor
@RequestMapping(value = "/multiSearch")
public class MultiSearchRestController {

	@Autowired
	private MultiSearchBean msb;
//	@Autowired
//	private IMultiSearchDao msDao; db

	ArrayList<MultiSearchBean> msbList;

	private static String api_key = "RGAPI-08c7da92-9810-4c40-8560-b6af5f2443ac";
	private static boolean keyflag = false;

	@GetMapping(value = "/executeMultiSearch")
	public ArrayList<MultiSearchBean> multiSearch(String summoners) throws IOException, SummonerNotFoundException {

		long beforeTime = System.currentTimeMillis(); // 코드 실행 전의 시간

		ArrayList<MultiSearchBean> msbList = null;

//		-------------------------- 시작 --------------------------
		msbList = getSummonersInfo(summoners); // 멀티서치에 뿌릴 정보 받아오기
		log.info("msbList : " + msbList);
		System.out.println("msbList : " + msbList);

		if (msbList.isEmpty()) { // 객체가 비어있다면
			System.out.println("isEmpty");
			throw new SummonerNotFoundException("API_KEY가 잠겼거나, 검색 결과와 일치하는 소환사가 없습니다. 정확하게 붙여넣으신건지, 소환사명에 오타나 특수문자가 들어간건 아닌지 확인 해주세요.");
		}
//		-------------------------- 시작 --------------------------

		long afterTime = System.currentTimeMillis(); // 코드 실행 후의 시간
		double secDiffTime = ((double) afterTime - beforeTime) / 1000;

		for (int i = 0; i < msbList.size(); i++) {
			System.out.println("---------- 최종 데이터 값 모두 출력 ----------");
			System.out.println("소환사 이름 : " + msbList.get(i).getSummonerName());
			System.out.println("티어 : " + msbList.get(i).getTier());
			System.out.println("랭크 : " + msbList.get(i).getRank());
			System.out.println("LP : " + msbList.get(i).getLp());
			System.out.println("종합 승리 : " + msbList.get(i).getTotalWins());
			System.out.println("종합 패배 : " + msbList.get(i).getTotalLosses());
			System.out.println("종합 승률 : " + msbList.get(i).getTotalWinRate());
			System.out.println("모스트 라인: " + msbList.get(i).getMostLane());
			System.out.println("모스트 라인 승률: " + msbList.get(i).getMostLaneWinRate());
			System.out.println("서브 라인: " + msbList.get(i).getSubLane());
			System.out.println("서브 라인 승률: " + msbList.get(i).getSubLaneWinRate());

			for (int j = 0; j < 10; j++) {
				System.out.println();
				System.out.println("이제부터 10개씩 저장된 값");
				System.out.println("챔피언 이름 : " + msbList.get(i).getChampionName()[j]);
				System.out.println("라인 : " + msbList.get(i).getLanes()[j]);
				System.out.println("킬 : " + msbList.get(i).getKills()[j]);
				System.out.println("데스 : " + msbList.get(i).getDeaths()[j]);
				System.out.println("어시스트 : " + msbList.get(i).getAssists()[j]);
				System.out.println("결과 : " + msbList.get(i).getWins()[j]);
				System.out.println("게임을 언제 했는지 : " + msbList.get(i).getAgoTimeDate()[j]);
				System.out.println();
			}
		}

		System.out.println("총 걸린 시간 : " + secDiffTime);

		return msbList;
	}

	public ArrayList<MultiSearchBean> getSummonersInfo(String summoners) throws IOException {

		// 나중에 summoners 유무 체크
		String replaceVal = "님이 방에 참가했습니다.";

		// 소환사 이름 가공
		log.info("검색창에서 넘어온 값 : " + summoners);
		String summoners1 = summoners.replace(replaceVal, ""); // replaceVal 제거
		log.info("replaceval 제거 : " + summoners1);

		// 개행과 쉼표 문자를 기준으로 나누어서 소환사 이름 저장
		String[] summonerName = summoners1.split("\\R|,");

		for (int i = 0; i < summonerName.length; i++) {
			summonerName[i] = summonerName[i].trim(); // 앞뒤 공백 제거
			log.info("앞뒤 공백 제거 : " + summonerName[i]);
		}
		System.out.println("가공한 소환사의 이름들 : " + Arrays.toString(summonerName));
		System.out.println();

		msbList = new ArrayList<>();

		int searchCnt = 0;
		for (int i = 0; i < summonerName.length; i++) {

			if (searchCnt > 4) { // 유효한 소환사 닉네임 5개까지만 검색
				System.out.println("break");
				System.out.println();
				break;
			} // end if

//			int result = msDao.checkSummonerName(summonerName[i]); // 소환사 이름으로 DB 검색
//			if (result > 0) {
//				System.out.println("result: " + result);
//				System.out.println("소환사 이름 DB검색 성공");
//				System.out.println();
//
//				if (result < 10) {
//
//				}
//			} else {
//
//				System.out.println("result: " + result);
//				System.out.println("소환사 이름 DB검색 실패");
//				System.out.println();

			try {
				System.out.println(summonerName[i] + "의 puuid 받아오는중...");

				msb = new MultiSearchBean();
				msb.setSummonerName(summonerName[i]); // 소환사의 이름 저장
				msbList.add(getPuuid(summonerName[i])); // 데이터 받아오기
				System.out.println(i + "명 완료...");
				searchCnt++;
				System.out.println("searchCnt : " + searchCnt);
				System.out.println();
			} catch (Exception e) {
				System.out.println("--------------------------");
				System.out.println("존재하지 않는 소환사 이름이거나 api_key lock걸린 상황 !!!");
				System.out.println("--------------------------");
				continue;
			}

//		} db관련

		} // end for

		return msbList;
	} // end getSummonersInfo

	// 소환사 이름으로 puuid 받아오기
	public MultiSearchBean getPuuid(String orlSummonerName) throws IOException {

		// puuid검색을 위해 닉네임의 공백이 있을경우 공백 제거
		String summonerName = orlSummonerName.replaceAll("\\s", "");
		String proFileUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + summonerName
				+ "?api_key=" + api_key;

		String result = connectURL(proFileUrl); // url connect
		JsonNode json = parseStringToJson(result); // String(json모양) -> JsonNode
		JsonNode jsonId = json.get("id"); // JsonNode에서 id 저장
		JsonNode jsonPuuid = json.get("puuid"); // JsonNode에서 puuid 저장

		String id = replaceQuotationMarks(jsonId.toString()); // 큰따옴표 제거한 값 저장
		String puuid = replaceQuotationMarks(jsonPuuid.toString()); // 큰따옴표 제거한 값 저장

		System.out.println("id : " + id);
		System.out.println("puuid : " + puuid);

		String name = json.get("name").toString(); // 원래 소환사 이름
		name = replaceQuotationMarks(name); // 큰따옴표 제거한 값 저장
		System.out.println("orlSummonerName : " + orlSummonerName);

		// 검색한 소환사의 닉네임과 proFileUrl에 저장된 닉네임이 다를경우(공백이 다를확률99.999%)
		if (!orlSummonerName.equals(name)) {
			System.out.println();
			System.out.println("공백 틀렸으므로 수정");
			msb.setSummonerName(name); // 소환사의 이름 다시 저장
		}

		// 리그 정보가 없어도 게임정보 가져오기
		try {
			// 리그 정보 저장
			leagueInfo(id);
		} catch (Exception e) {
			// 게임 정보 저장
			System.out.println();
			System.out.println("리그 정보 없음");

			// 리그 정보가 없다면 레벨 출력
			msb.setRank("");
			msb.setLp("");
			getGameId(puuid.toString());
			return msb;
		}
		// 게임 정보 저장
		getGameId(puuid.toString());

		return msb;
	}

	// 리그정보 가져오기
	public void leagueInfo(String id) throws IOException {

		String leagueUrl = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key="
				+ api_key;
		String result = connectURL(leagueUrl); // url connect
		JsonNode json = parseStringToJson(result); // String to jsonNode

		System.out.println("프로필 데이터 저장중...");
		System.out.println("json의 사이즈 : " + json.size());
		System.out.println();

		if (json.size() > 1) { // 자유 랭크와 솔로랭크 둘 다 전적이 존재한다면
			for (int i = 0; i < 2; i++) {
				System.out.println();
				System.out.println("큐타입 : " + json.get(i).get("queueType"));
				System.out.println();
				if (json.get(i).get("queueType").toString().equals("\"RANKED_SOLO_5x5\"")) { // 큐 타입이 솔로랭크라면
					// 큐 타입 불러와보기
					System.out.println();
					System.out.println("데이터 큐 타입");
					JsonNode jsonQueueType1 = json.get(i).get("queueType"); // JsonNode에서 tier 저장
					System.out.println("jsonQueueType : " + jsonQueueType1);
					System.out.println();
					// tier 저장
					System.out.println("티어");
					JsonNode jsonTier = json.get(i).get("tier"); // JsonNode에서 tier 저장
					System.out.println("jsonTier : " + jsonTier);

					String jsonTier2 = replaceQuotationMarks(jsonTier.toString()); // 큰따옴표 제거
					msb.setTier(jsonTier2.toString()); // 큰따옴표 제거한 값 저장
					System.out.println("Tier : " + msb.getTier());

					// 랭크 저장
					System.out.println("랭크");
					JsonNode jsonRank = json.get(i).get("rank"); // JsonNode에서 tier 저장
					System.out.println("jsonRank : " + jsonRank);

					String jsonRank2 = replaceQuotationMarks(jsonRank.toString()); // 큰따옴표 제거
					msb.setRank(jsonRank2); // 큰따옴표 제거한 값 저장
					System.out.println("rank : " + msb.getRank());

					// LP 저장
					System.out.println("LP");
					JsonNode jsonLP = json.get(i).get("leaguePoints"); // JsonNode에서 tier 저장
					System.out.println("jsonLP : " + jsonLP);

					msb.setLp("(" + jsonLP.toString() + ")"); // 큰따옴표 제거한 값 저장
					System.out.println("leaguePoints : " + msb.getLp());

					// 전체 경기 승리 수 저장
					System.out.println("전체 경기 승리 수");
					JsonNode jsonWins = json.get(i).get("wins"); // JsonNode에서 tier 저장
					System.out.println("jsonWins : " + jsonWins);

					msb.setTotalWins(Integer.parseInt(jsonWins.toString())); // 큰따옴표 제거한 값 저장
					System.out.println("wins : " + msb.getTotalWins());

					// 전체 경기 패배 수 저장
					System.out.println("전체 패배 수");
					JsonNode jsonLosses = json.get(i).get("losses"); // JsonNode에서 tier 저장
					System.out.println("jsonLosses : " + jsonLosses);

					msb.setTotalLosses(Integer.parseInt(jsonLosses.toString())); // 큰따옴표 제거한 값 저장
					System.out.println("losses : " + msb.getTotalLosses());

					// 전체 경기의 승률 저장
					System.out.println("승률");
					if (msb.getTotalLosses() > 0) {
						double winRate = 0;
						winRate = (double) msb.getTotalWins() / (msb.getTotalWins() + msb.getTotalLosses()) * 100;
						msb.setTotalWinRate(Math.round((int) winRate));
					} else {
						msb.setTotalWinRate(-1);
					}
					System.out.println("totalWinRate : " + msb.getTotalWinRate());
					break;
				} // end if
			} // end for
		} else {

			// tier 저장
			System.out.println("티어");
			JsonNode jsonTier = json.get(0).get("tier"); // JsonNode에서 tier 저장
			System.out.println("jsonTier : " + jsonTier);

			String jsonTier2 = replaceQuotationMarks(jsonTier.toString()); // 큰따옴표 제거
			msb.setTier(jsonTier2.toString()); // 큰따옴표 제거한 값 저장
			System.out.println("Tier : " + msb.getTier());

			// 랭크 저장
			System.out.println("랭크");
			JsonNode jsonRank = json.get(0).get("rank"); // JsonNode에서 tier 저장
			System.out.println("jsonRank : " + jsonRank);

			String jsonRank2 = replaceQuotationMarks(jsonRank.toString()); // 큰따옴표 제거
			msb.setRank(jsonRank2); // 큰따옴표 제거한 값 저장
			System.out.println("rank : " + msb.getRank());

			// LP 저장
			System.out.println("LP");
			JsonNode jsonLP = json.get(0).get("leaguePoints"); // JsonNode에서 tier 저장
			System.out.println("jsonLP : " + jsonLP);

			msb.setLp(jsonLP.toString()); // 큰따옴표 제거한 값 저장
			System.out.println("leaguePoints : " + msb.getLp());

			// 전체 경기 승리 수 저장
			System.out.println("전체 경기 승리 수");
			JsonNode jsonWins = json.get(0).get("wins"); // JsonNode에서 tier 저장
			System.out.println("jsonWins : " + jsonWins);

			msb.setTotalWins(Integer.parseInt(jsonWins.toString())); // 큰따옴표 제거한 값 저장
			System.out.println("wins : " + msb.getTotalWins());

			// 전체 경기 패배 수 저장
			System.out.println("전체 패배 수");
			JsonNode jsonLosses = json.get(0).get("losses"); // JsonNode에서 tier 저장
			System.out.println("jsonLosses : " + jsonLosses);

			msb.setTotalLosses(Integer.parseInt(jsonLosses.toString())); // 큰따옴표 제거한 값 저장
			System.out.println("losses : " + msb.getTotalLosses());

			// 전체 경기의 승률 저장
			System.out.println("승률");
			if (msb.getTotalLosses() > 0) {
				double winRate = 0;
				winRate = (double) msb.getTotalWins() / (msb.getTotalWins() + msb.getTotalLosses()) * 100;
				msb.setTotalWinRate(Math.round((int) winRate));
			} else {
				msb.setTotalWinRate(-1);
			}
			System.out.println("totalWinRate : " + msb.getTotalWinRate());
		} // end if

	}

	// puuid로 gameId 10개씩 받기
	public void getGameId(String puuid) throws IOException {

		System.out.println("gmaeID 가져오는 중...");
		String matchUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + puuid
				+ "/ids?start=0&count=10&api_key=" + api_key;
		String result = connectURL(matchUrl); // url connect
		String gameId = replaceSquareBrackets(result); // 대괄호 제거한 값 저장
		gameId = replaceQuotationMarks(gameId); // 큰따옴표 제거한 값 저장

		// 쉼표를 기준으로 나누기
		String[] gameIds = gameId.split(",");

		String[] championName = new String[10];
		String[] lanes = new String[10];
		int[] kills = new int[10];
		int[] deaths = new int[10];
		int[] assists = new int[10];
		String[] wins = new String[10]; // 승패 여부
		String[] agoTimeDate = new String[10]; // 경기 끝난 날짜
//		int[] participantId = new int[10]; // db관련
//		long[] endGameDate = new long[10]; // 경기 끝난 날짜(유닉스) db관련

		// 게임이아디에서 데이터 가져오기
		for (int i = 0; i < gameIds.length; i++) {
			System.out.println("검색할 게임 아이디 : " + gameIds[i]);
			msb.setGameId(gameIds); // 게임 아이디 저장
			System.out.println("저장된 게임 아이디: " + msb.getGameId()[i]);

			Object[] data = getGameData(gameIds[i]); // 게임아이디를 넘겨줌
			System.out.println("반환된 데이터 : " + Arrays.toString(data));

			championName[i] = replaceQuotationMarks(data[0].toString()); // 큰따옴표 제거
			lanes[i] = replaceQuotationMarks(data[1].toString()); // 큰따옴표 제거
			kills[i] = Integer.parseInt(data[2].toString());
			deaths[i] = Integer.parseInt(data[3].toString());
			assists[i] = Integer.parseInt(data[4].toString());
			wins[i] = data[5].toString(); // 큰따옴표 제거
			agoTimeDate[i] = data[6].toString();
//			participantId[i] = Integer.parseInt(data[7].toString()); db관련
//			endGameDate[i] = Long.parseLong(data[8].toString()); db관련

			System.out.println("---------- 받아온 데이터 ----------");
			System.out.println(Arrays.toString(data));
			System.out.println("-------------------------------");

		} // end for

		msb.setChampionName(championName);
		msb.setLanes(lanes);
		msb.setKills(kills);
		msb.setDeaths(deaths);
		msb.setAssists(assists);
		msb.setWins(wins);
		msb.setAgoTimeDate(agoTimeDate);
//		msb.setParticipantId(participantId); db관련
//		msb.setEndGameDate(endGameDate); db관련

		mostLane(msb.getLanes()); // 주 라인 & 서브 라인 구하기

		System.out.println("---------");
		System.out.println("mostLane : " + msb.getMostLane()); // 주 라인 출력
		System.out.println("subLane : " + msb.getSubLane()); // 서브 라인 출력
		System.out.println("---------");

//		insertMultiSearchData(); // 모든 데이터 DB insert

	}

	// 모든 데이터 DB insert
//	public void insertMultiSearchData() {
//
//		System.out.println();
//		System.out.println("DB insert 시작");
//
//		HashMap<String, Object> hMap;
//
//		for (int i = 0; i < msb.getGameId().length; i++) {
//
//			hMap = new HashMap<>();
//
//			hMap.put("gameId", msb.getGameId()[i]);
//			hMap.put("participantId", msb.getParticipantId()[i]);
//			hMap.put("endGameDate", msb.getEndGameDate()[i]);
//			hMap.put("summonerName", msb.getSummonerName());
//			hMap.put("tier", msb.getTier());
//			hMap.put("rank", msb.getRank());
//			hMap.put("lp", msb.getLp());
//			hMap.put("championName", msb.getChampionName()[i]);
//			hMap.put("lanes", msb.getLanes()[i]);
//			hMap.put("kills", msb.getKills()[i]);
//			hMap.put("deaths", msb.getDeaths()[i]);
//			hMap.put("assists", msb.getAssists()[i]);
//
//			boolean result = msDao.insertMultiSearchTable(hMap);
//			System.out.println(result);
//		}
//
//	} // end insertMultiSearchData

	// 주로 가는 라인 & 라인 승률 구하기
	public void mostLane(String[] lanes) {

		int[] laneCnt = new int[5]; // 라인이 나온 횟수 저장
		int maxIdx = -1; // 최대 값의 인덱스 저장
		int max = 0; // 최대 값 저장

		for (String lane : lanes) {
			if (lane.equals("TOP")) {
				laneCnt[0]++;
			} else if (lane.equals("JUNGLE")) {
				laneCnt[1]++;
			} else if (lane.equals("MIDDLE")) {
				laneCnt[2]++;
			} else if (lane.equals("BOTTOM")) {
				laneCnt[3]++;
			} else if (lane.equals("UTILITY")) {
				laneCnt[4]++;
			} else {
				System.out.println("none");
			}
		}

		for (int i = 0; i < 5; i++) {
			if (max < laneCnt[i]) { // 최대 값을 구하고 그 값의 인덱스를 저장
				max = laneCnt[i]; // 최대 값 저장
				maxIdx = i; // 최대 값의 인덱스 저장
			}
		}

		System.out.println("최대 값 인덱스 : " + maxIdx);

		if (maxIdx == 0) {
			msb.setMostLane("TOP");
		} else if (maxIdx == 1) {
			msb.setMostLane("JUNGLE");
		} else if (maxIdx == 2) {
			msb.setMostLane("MIDDLE");
		} else if (maxIdx == 3) {
			msb.setMostLane("BOTTOM");
		} else if (maxIdx == 4) {
			msb.setMostLane("UTILITY");
		} else {
			msb.setMostLane("none");
			System.out.println("none");
		}

		if (maxIdx > -1) {
			msb.setMostLaneRate((int) Math.round(max / 10.0 * 100)); // 모스트 라인 가는 비율 구하기
			msb.setMostLaneWinRate(laneWinRate(max, msb.getMostLane())); // 모스트 라인의 승률 구하기
			subLane(maxIdx, laneCnt); // 두 번째로 큰 최대 값 구하기
		}

	} // end mostLane

	// 두 번째로 큰 최대 값 구하기
	public void subLane(int maxIdx, int[] laneCnt) {

		int subMax = 0;
		int subIdx = -1;

		for (int i = 0; i < 5; i++) {
			if (i != maxIdx) { // 최대 값 인덱스는 제외하고 두 번째로 큰 최대 값을 구함
				if (subMax < laneCnt[i]) {
					subMax = laneCnt[i];
					subIdx = i;
				}
			}
		} // end for

		System.out.println("두 번째로 큰 최대 값 인덱스 : " + subIdx);

		if (subIdx == 0) {
			msb.setSubLane("TOP");
		} else if (subIdx == 1) {
			msb.setSubLane("JUNGLE");
		} else if (subIdx == 2) {
			msb.setSubLane("MIDDLE");
		} else if (subIdx == 3) {
			msb.setSubLane("BOTTOM");
		} else if (subIdx == 4) {
			msb.setSubLane("UTILITY");
		} else {
			msb.setSubLane("none");
			System.out.println("none");
		}

		if (subIdx > -1) {
			msb.setSubLaneRate((int) Math.round(subMax / 10.0 * 100)); // 서브 라인 가는 비율 구하기
			msb.setSubLaneWinRate(laneWinRate(subMax, msb.getSubLane())); // 서브 라인의 승률 구하기
		}

	} // end scdLane

	// 라인 승률 구하기
	public int laneWinRate(int gameCnt, String lane) {

		int winGame = 0; // 이긴 경기 카운트
		int laneWinRate = 0; // 승률(정수형)

		for (int i = 0; i < msb.getWins().length; i++) { // 경기 수 만큼 반복
			if (msb.getLanes()[i].equals(lane)) { // 해당 경기의 라인이 모스트 라인과 같다면
				if (msb.getWins()[i].equals("true")) { // 이긴 경기라면
					System.out.println("이긴 경기 발견!");
					winGame++;
				}
			}
		} // end for
		System.out.println();
		System.out.println(msb.getMostLane() + " 경기 수: " + gameCnt + ", " + msb.getSubLane() + "이긴 경기 수: " + winGame);
		laneWinRate = (int) Math.round((double) winGame / gameCnt * 100);
		System.out.println(Math.round((double) winGame / gameCnt * 100));
		System.out.println("라인 승률: " + laneWinRate);

		return laneWinRate;

	} // end laneWinRate

	// 게임아이디로 데이터 가져오기
	private Object[] getGameData(String gameId) throws IOException {

		String gameUrl = "";

		// api_key 번갈아가면서 사용
		if (!keyflag) {
			api_key = "RGAPI-e5a10a37-c4df-4398-b5eb-883710384d2a";
			keyflag = true;
			
		} else {
			api_key = "RGAPI-08c7da92-9810-4c40-8560-b6af5f2443ac";
			keyflag = false;
		}
		
		System.out.println("게임아이디를 이용해 데이터 가져오는중...");

		System.out.println("gameId : " + gameId);
		gameUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/" + gameId + "?api_key=" + api_key;
		keyflag = false;

		String result = connectURL(gameUrl); // url connect
		JsonNode json = parseStringToJson(result); // Stinrg -> JsonNode

		System.out.println("------------------------------------");
		System.out.println("gameid json : " + json);
		System.out.println("------------------------------------");

		// 소환사 이름 저장
		System.out.println("검색할 소환사 이름 : " + msb.getSummonerName());

//		Object[] data = new Object[9]; // 데이터 담을 공간 db관련
		Object[] data = new Object[7]; // 데이터 담을 공간
		String summonerName = "\"" + msb.getSummonerName() + "\""; // 포맷 맞춰주기

		long currentTime = System.currentTimeMillis() / 1000; // 현재 시간 구하기
		long endTimeDate = Long.parseLong(json.get("info").get("gameEndTimestamp").toString()) / 1000; // 게임이 끝난 시간
		System.out.println("현재 유닉스 시간 : " + currentTime);
		System.out.println("게임이 끝난 유닉스 시간 : " + endTimeDate);
//		data[8] = endTimeDate; db관련

		long agoTime = currentTime - endTimeDate; // 몇시간 전에 했는지 구하기
		System.out.println("agoTime : " + agoTime);

//		// 맞춰진 형식으로 띄우기 위해 계산
		if (agoTime / 2592000 >= 1) {
			long monTime = agoTime / 2592000;
			data[6] = monTime + "달 전";
		} else if (agoTime / 86400 >= 1) { // 일 계산
			long dayTime = agoTime / 86400;
			data[6] = dayTime + "일 전"; // 하루 이상이면
		} else if (agoTime / 3600 >= 1) {
			long hourTime = agoTime / 3600;
			data[6] = hourTime + "시간 전"; // 1시간 이상이면
		} else if (agoTime / 60 >= 1) {
			long minTime = agoTime / 60;
			data[6] = minTime + "분 전"; // 1분 이상이면
		}

		System.out.println("게임한 시간 : " + data[6]);

//		10명의 소환사의 이름과 비교한 후 같으면 데이터 저장
		for (int j = 0; j < 10; j++) {
			String sumNameToComp = json.get("info").get("participants").get(j).get("summonerName").toString();
			System.out.println(j + "번째 소환사 이름 : " + sumNameToComp);

			if (sumNameToComp.equals(summonerName)) { // 검색한 소환사 이름과 같으면
				System.out.println("----- 소환사 이름 일치 -----");
				data[0] = json.get("info").get("participants").get(j).get("championName");
				data[1] = json.get("info").get("participants").get(j).get("teamPosition");
				data[2] = json.get("info").get("participants").get(j).get("kills");
				data[3] = json.get("info").get("participants").get(j).get("deaths");
				data[4] = json.get("info").get("participants").get(j).get("assists");
				data[5] = json.get("info").get("participants").get(j).get("win");
//				data[7] = json.get("info").get("participants").get(j).get("participantId");

				System.out.println(Arrays.toString(data));
				System.out.println();

				return data;
			}
		}

		return data;
	}

	// url 커넥션
	public static String connectURL(String getUrl) throws IOException {

		System.out.println();
		System.out.println("URL connecting...");
		URL url = new URL(getUrl);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		urlconnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

		String brRead = "";
		String result = "";

		// br,readLine() 한 줄 이상이 있다면
		while ((brRead = br.readLine()) != null) {
			result += brRead;
			System.out.println("connectURL : " + result);
		} // while end

		// url에서 긁어온 값을 String으로 반환
		return result;
	}

	// 문자열 -> JsonNode
	public static JsonNode parseStringToJson(String result) throws IOException {

		System.out.println("String to JsonNode...");

		ObjectMapper objMapper = new ObjectMapper();
		JsonNode jsonNode = objMapper.readTree(result); // String을 JsonNode로 변환
		System.out.println("jsonNode : " + jsonNode);

		return jsonNode;
	}

	// 큰따옴표 제거 메소드
	public static String replaceQuotationMarks(String str) {
		System.out.println("큰따옴표 제거 전 : " + str);
		str = str.replace("\"", ""); // 큰따옴표 제거
		System.out.println("큰따옴표 제거 후 : " + str);
		return str;
	}

	// 대괄호 제거 메소드
	public static String replaceSquareBrackets(String str) {
		System.out.println("대괄호 제거 전 : " + str);
		str = str.replace("[", ""); // 대괄호 제거
		str = str.replace("]", ""); // 대괄호 제거
		System.out.println("대괄호 제거 후 : " + str);
		return str;
	}

}
