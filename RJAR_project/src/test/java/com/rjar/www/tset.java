package com.rjar.www;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

class tset {

	@Autowired
	private A a;

	public void print() throws IOException {
		
		String api_key = "RGAPI-4843ae9e-7ede-4140-8341-164bbda24a7b";
		String summonerName = "여눙1";

		String proFileUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + summonerName
				+ "?api_key=" + api_key;
//		URL에서 URLConnection 객체 얻기(프로토콜이 http://인 경우 아래 객체로 캐스팅 가능)
		URL url = new URL(proFileUrl);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		urlconnection.setRequestMethod("GET");
//		urlconnection.setRequestProperty("Content-type", "application/json");
//		urlconnection.setDoOutput(true);
		BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

		String result = "";
		result = br.readLine();
		System.out.println(result);
	}

}
