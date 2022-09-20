package com.rjar.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.service.search.SummonerSearchMM;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SummonerSearchController {
	
    @Autowired
	private SummonerSearchMM ssm;
    
	ModelAndView mav;

	@GetMapping(value = "/summonerSearch")
	public ModelAndView summonerSearch(String summonerName) throws Exception {
		
		long beforeTime = System.currentTimeMillis(); // 코드 실행 전의 시간

		mav = new ModelAndView(); // mav 객체 생성
		log.info(summonerName); // 검색한 소환사 이름 콘솔에 출력
		mav = ssm.sSummonerSearch(summonerName.replaceAll("\\s", "")); // 이름에 공백이 들어간경우 검색이되지 않아, 공백을 제거한 형태이다.
		
		long afterTime = System.currentTimeMillis(); // 코드 실행 후의 시간
		double secDiffTime = ((double) afterTime - beforeTime) / 1000;
		
		System.out.println("총 걸린 시간 : " + secDiffTime);

		mav.setViewName("summonerSearch"); // mav 객체에 이동할 뷰 이름 set
		
		return mav;
	}

}
