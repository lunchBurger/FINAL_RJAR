package com.rjar.www.bean.summonersearch;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class LeftPageChampionDetails {
	
	// 사용하지 않는 것들은 지울 예정
	
	// 전적 검색 페이지에 필요한 데이터(전적 세부 div 제외)

	// ------- 전적 검색의 왼쪽 상단 페이지에 필요한 데이터 -------
	private String ssSummonerImage; // 롤 프로필 사진
	private String ssSearchSummonerName; // 검색한 소환사 이름
	private int ssSummonerLevel; // 검색한 소환사 레벨
	
	// ------- 전적 검색의 왼쪽 중단 페이지에 필요한 데이터 -------		
	private String ssTierImage; // 티어 이미지
	private String ssLeaguePoint; // 리그 포인트
	private String ssTier; // 티어
	private double ssWinRate; // 종합 승률
	private int ssTotalGameWin; // 해당 시즌 전체 승리 게임 수
	private int ssTotalGameLose; // 해당 시즌 전체 패배 게임 수
	
	// ------- 전적 검색의 왼쪽 하단 페이지에 필요한 데이터 -------	
	private String ssPlayedChampionName; // 플레이했던 챔피언 이름
	private double ssPlayedChampionKDA; // 하나의 챔피언 종합 KDA
	private double ssPlayedChampionKills; // 하나의 챔피언 종합 킬 수
	private double ssPlayedChampionDeaths; // 하나의 챔피언 종합 데스 수
	private double ssPlayedChampionAssists; // 하나의 챔피언 종합 어시 수
	private double ssPlayedChampionWinRate; // 플래이했던 챔피언 종합 승률
	
	private int ssPlayedChampionCS; // 플레이했던 챔피언의 종합 CS
	private int ssPlayedChampionCSRate; // 플레이했던 챔피언의 종합 CS 평균
	private int ssPlayedChampionGameCount; // 플레이했던 챔피언의 게임 수
		
}
