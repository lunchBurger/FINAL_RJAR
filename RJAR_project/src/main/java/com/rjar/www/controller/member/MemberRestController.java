package com.rjar.www.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rjar.www.bean.Member;
import com.rjar.www.service.member.MemberMM;

@RestController
@RequestMapping(value = "/member")
public class MemberRestController {

	@Autowired
	private MemberMM membermm;

	// 리턴 값한글 깨짐 방지
	@GetMapping(value = "/checkId", produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> idAvailable(String m_id) {
		// 오류를 이용하여 분기를 정함
		return ResponseEntity.ok(membermm.idAvailable(m_id));
	}

	@GetMapping(value = "/checkNick", produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> nickAvailable(String m_nick) {
		// 오류를 이용하여 분기를 정함
		return ResponseEntity.ok(membermm.nickAvailable(m_nick));
	}
	
	@GetMapping(value = "/phoneCheck", produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> phoneAvailable(Member mm){
		return ResponseEntity.ok(membermm.nameAvailable(mm));
	}
	
}
