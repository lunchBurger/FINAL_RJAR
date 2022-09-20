package com.rjar.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.service.championDetail.ChampionDetailMM;
import com.rjar.www.service.member.MemberMM;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

	@Autowired
	private ChampionDetailMM champmm;
	
	@Autowired
	private MemberMM membermm;

	ModelAndView mav;

	// servlet-context.xml에서 해당 패키지 스캔
	@GetMapping(value = "/")
	public String home() {
		return "home";
	}

	@GetMapping(value = "/home")
	public String main() {

		return "home";
	}

	@GetMapping(value = "/championHome")
	public ModelAndView championDetail() {
		String tier = "platinum";
		String lane = "TOP";
		mav = champmm.getChampionInfo(tier, lane);
		return mav;
	}

	@GetMapping(value = "/laboratory")
	public String laboratory() {

		return "laboratory";
	}

	@GetMapping(value = "/multiSearch")
	public String multiSearch() {

		return "multiSearch";
	}

	@PostMapping(value = "/myPage")
	public ModelAndView myPage(HttpSession session) {
		mav = new ModelAndView(); // mav 객체 생성
		String m_nick = (String)session.getAttribute("m_nick");
		System.out.println("session="+m_nick);
		mav = membermm.getMyPageInfo(m_nick);
		
		mav.setViewName("myPage");

		return mav;
	}

	@GetMapping(value = "/lck")
	public String lck() {

		return "lck";
	}

}
