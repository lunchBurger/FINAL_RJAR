package com.rjar.www;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Component;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
public class B {

	private final static String api_key = "RGAPI-08c7da92-9810-4c40-8560-b6af5f2443ac";

	public void pirnt() throws IOException {

		String proFileUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/아수?api_key=" + api_key;

		System.out.println("URL connecting...");
		URL url = new URL(proFileUrl);
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

		JsonParser jsonParser = new JsonParser();
		JsonObject jsonNode = (JsonObject) jsonParser.parse(result);
		
		System.out.println("result : " + result);
		String id = jsonNode.get("id").toString();
		
		System.out.println("id"+id);
	}

}
