package com.rjar.www.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rjar.www.bean.summonersearch.GameDetailShowInfo;

public interface ISummonerSearchDao {

	List<GameDetailShowInfo> SearchGame(String ss_gameId);
	
	boolean insertGameData(Map<String, Object> preMap);


}
