package com.rjar.www.bean.summonersearch;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class MultiSearchBean {
	
	private String summonerName;
	private String tier;
	private String rank;
	private String lp;
	private int totalWins;
	private int totalLosses;
	private int totalWinRate;
	
	private String mostLane; // 모스트 라인
	private String subLane; // 서브 라인
	
	private int mostLaneRate; // 모스트 라인에 가는 비율
	private int subLaneRate; // 서브 라인에 가는 비율
	
	private int mostLaneWinRate; // 모스트 라인 승률
	private int subLaneWinRate; // 서브 라인 승률
	
	private String[] gameId;
	private int[] participantId;
	private String[] championName;
	private String[] lanes;
	private int[] kills;
	private int[] deaths;
	private int[] assists;
	private String[] wins; // 10게임 경경기 결과
//	private long[] endGameDate; // 게임 끝난 시간 db관련
	private String[] agoTimeDate; // endGameDate를 이용하여 가공
	
	// most는 전체 게임 고려이기 때문에 따로 클래스를 만들지 고려하고 나중에
//	private String[] mostChampionNames;
//	private double[] mostChampionKDA;
//	private int[] mostChampGameCount; // 모스트 챔피언들의 경기 수
//	private int[] mostChampionWinRate; // 모스트 챔피언들의 경기 수
	
}
