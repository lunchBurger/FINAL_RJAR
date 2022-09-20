package com.rjar.www;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class A {

	@Autowired
	private B b;

	private final static String api_key = "RGAPI-08c7da92-9810-4c40-8560-b6af5f2443ac";

	@Test
	public void print() throws IOException {

		String gameUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/KR_6086366536?api_key=" + api_key;
		String result = connectURL(gameUrl); // url connect
		JsonNode json = parseStringToJson(gameUrl, result); // Stinrg -> JsonNode

		System.out.println("------------------------------------");
		System.out.println("gameid json : " + json);
		System.out.println("------------------------------------");

		String kill = json.get("info").get("participants").get(1).get("lane").toPrettyString();
		System.out.println("kill : " + kill);

	}

	public static String connectURL(String getUrl) throws IOException {

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
			System.out.println("while : " + result);
		} // while end

		// url에서 긁어온 값을 String으로 반환
		return result;
	}

	// 문자열 -> JsonNode
	public static JsonNode parseStringToJson(String getUrl, String result) throws IOException {

		System.out.println("String to JsonNode...");

//		JsonParser jsonParser = new JsonParser();
//		JsonObject jsonNode = (JsonObject) jsonParser.parse(result);

		ObjectMapper objMapper = new ObjectMapper();
		JsonNode jsonNode = objMapper.readTree(result); // String을 JsonNode로 변환
		System.out.println("jsonNode : " + jsonNode);

		return jsonNode;
	}

}
