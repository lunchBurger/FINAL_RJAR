package com.rjar.www.dao;

import java.util.HashMap;

public interface IMultiSearchDao {

	int checkSummonerName(String summonerName);
	
	boolean insertMultiSearchTable(HashMap<String, Object> hMap);
	
}
