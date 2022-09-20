package com.rjar.www.service.member;

import java.util.ArrayList;

import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.rjar.www.bean.Member;
import com.rjar.www.bean.Reply;
import com.rjar.www.dao.IMemberDao;
import com.rjar.www.exception.CheckException;
import com.rjar.www.exception.CheckUserException;
import com.rjar.www.exception.IdCheckException;
import com.rjar.www.exception.NoMatchingPwException;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberMM {

	@Autowired
	private IMemberDao mDao;

	@Autowired
	private Member member;
	
//	@Autowired
//	private Reply reply;

	ModelAndView mav;

	// 로그인
	public ModelAndView memberAccess(HttpSession session, Member mm) {

		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		// 회원가입할 때 암호화해서 저장해뒀던 비밀번호를 받아옴
		member = mDao.getSecurityPw(mm.getM_id());
		String pwEncode = member.getM_pw();
		System.out.println("가져온 암호화된 비밀번호 : " + pwEncode);

		if (pwEncode != null) {
			if (pwEncoder.matches(mm.getM_pw(), pwEncode)) {
				System.out.println("로그인 중...");
				// 세션에 로그인 마킹
				session.setAttribute("m_nick", member.getM_nick());
				session.setAttribute("m_id", mm.getM_id());
				System.out.println("id : " + mm.getM_id());
				System.out.println("nick : " + member.getM_nick());
				view = "redirect:/home";
			} else { // 비밀번호 오류
				System.out.println("잘못된 비밀번호 :" + mm.getM_pw());
				view = "login";
				mav.addObject("check", 2);
			}
		} else {
			System.out.println("잘못된 아이디 :" + mm.getM_id());
			view = "login";
			mav.addObject("check", 2);
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView memberJoin(Member mm) {
		// 비밀번호 암호화
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		mm.setM_pw(pwEncoder.encode(mm.getM_pw()));
		System.out.println("암호화된 밀번호 : " + mm.getM_pw());

		if (mDao.insertMember(mm)) {
			mav = new ModelAndView();
			mav.addObject("m_nick", mm.getM_nick());
			mav.setViewName("redirect:/join3");
			System.out.println("insert 성공");
			System.out.println("회원가입 페이지3으로 이동");
		} else {
			System.out.println("insert 실패");
			mav.setViewName("./");
		}
		return mav;
	}

	public String idAvailable(String m_id) {

		System.out.println("idAvailable 진입");

		// 유효성 검사를 통과한 아이디만 DB에서 검사
		if (m_id.length() < 5 || m_id.length() > 20 || !(Pattern.matches("[0-9|a-z]*", m_id))) {
			System.out.println("유효성 검사");
			// 오류를 발생시킴
			throw new CheckException("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
		} else {
			Member checkId = mDao.checkId(m_id);
			log.info(checkId);
			if (checkId != null) {
				throw new CheckException("이미 사용중인 아이디입니다.");
			}
			return "사용할 수 있는 아이디입니다.";
		} // end else

	} // end idAvaliable

	// 메소드 오버로딩
	public String checkId(Member mm) {

		// 프론트에서 넘어온 값 저장
		log.info("프론트 값 : " + mm);
		String id = mm.getM_id();
		int que = mm.getM_que();
		String ans = mm.getM_ans();

		mm = mDao.checkPw(id); // 서버에서 넘어온 값 저장
		log.info("서버 값 : " + mm);

		if (mm != null) {
			if (que != mm.getM_que() || !ans.equals(mm.getM_ans())) {
				throw new IdCheckException("질문 또는 답변이 틀립니다.");
			}
			member.setM_id(mm.getM_id());
			member.setM_pw(mm.getM_pw());
			return "redirect:/findPw2";
		} else {
			throw new IdCheckException("가입되지 않은 아이디입니다.");
		}
	}

	public String nickAvailable(String m_nick) {

		System.out.println("nickAvailable 진입");

		if (m_nick.length() < 2 || m_nick.length() > 10) {
			System.out.println("유효성 검사");
			// 오류를 발생시킴
			throw new CheckException("닉네임은 2글자 이상 10글자 이하로 이루어져야 합니다.");
		} else {
			if (mDao.checkNick(m_nick) != null) {
				throw new CheckException("이미 존재하는 닉네임입니다.");
			}
			return "사용할 수 있는 닉네임입니다.";
		}
	}

	public String nameAvailable(Member mm) {

		// 프론트에서 넘어온 값 저장
		String name = mm.getM_name();
		String tel = mm.getM_tel();
		String phone = mm.getM_phone();

		System.out.println("nameAvailable 진입");
		mm = mDao.checkName(name); // 서버에서 넘어온 값 저장
		log.info(mm);

		if (mm != null) {
			System.out.println("아이디 존재");
			if (!mm.getM_tel().equals(tel) || !mm.getM_phone().equals(phone)) { // 통신사 같은지 검사
				System.out.println("통신사 틀림");
				throw new CheckException("올바르지 않은 정보입니다.");
			}
			member.setM_id(mm.getM_id());
			return "";
		} else {
			System.out.println("아이디 존재하지 않음");
			throw new CheckException("가입되지 않은 이름입니다.");
		}
	}

	public ModelAndView changePw(String m_pw, String currentPw) {

		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		m_pw = pwEncoder.encode(m_pw); // 변경할 비밀번호 암호화
		member.setM_pw(m_pw);
		System.out.println(m_pw);
		int result = mDao.changePw(member);

		if (result > 0) {
			System.out.println(result + " 비밀번호 변경 성공");
			mav = new ModelAndView();
			mav.addObject("msg", "비밀번호 변경 성공");
			mav.setViewName("redirect:/login");
			return mav;
		} else {
			throw new NoMatchingPwException("오류");
		}
	}

	public void checkUser(String m_name) {

		String result = mDao.checkUser(m_name);
		System.out.println("result" + result);

		if (result != null) {
			System.out.println("!null");
			throw new CheckUserException("이미 생성된 계정이 존재합니다.");
		} else {
			System.out.println("null");
		}
	}

	public ModelAndView getMyPageInfo(String m_nick) {
		mav = new ModelAndView();
		List<Member> myPage = new ArrayList<>();
		List<Reply> rList = null;
		rList = mDao.getReplyList(m_nick);
		myPage = mDao.getMyPageInfo(m_nick);
		System.out.println(myPage);
		System.out.println(myPage.get(0).getM_id());
		System.out.println(myPage.get(0).getM_name());
		System.out.println(myPage.get(0).getM_phone());
		System.out.println(myPage.get(0).getM_tel());
		
		if(rList!=null && rList.size()!=0) {
			System.out.println(rList);
			mav.addObject("rList",rList);
			mav.addObject("myReply", make_Reply_html(rList));
			mav.addObject("m_name", myPage.get(0).getM_name());
			mav.addObject("m_id", myPage.get(0).getM_id());
			mav.addObject("m_phone", myPage.get(0).getM_phone());
			mav.addObject("m_tel", myPage.get(0).getM_tel());
		}else {
			mav.addObject("myReply", make_noData_html());
			mav.addObject("m_name", myPage.get(0).getM_name());
			mav.addObject("m_id", myPage.get(0).getM_id());
			mav.addObject("m_phone", myPage.get(0).getM_phone());
			mav.addObject("m_tel", myPage.get(0).getM_tel());
		}

		return mav;
	}
	
	public ModelAndView modifyNick(HttpSession session, String m_nick, String wantNick) {
		mav = new ModelAndView();
		member.setM_nick(m_nick);
		member.setM_MNick(wantNick);

		int result = mDao.nickModify(member);
		System.out.println(result);

		if (result > 0) {
			System.out.println(result + " 닉네임 변경 선공");
			session.setAttribute("m_nick", wantNick);
			mav = new ModelAndView();
			mav.addObject("msg", 1);
			mav.setViewName("redirect:/home");
			return mav;

		} else {
			
			throw new CheckException("오류");
		}
	}

	public String delete(String m_nick, HttpSession session) {
		member.setM_nick(m_nick);
		
		int result = mDao.deleteMember(member);
		System.out.println("delete_result="+result);
		
		if(result>0) {
			session.invalidate();
			System.out.println(result+"계정 삭제 성공");
					
			return "redirect:/home";		
		}else {
			
			throw new CheckException("오류");
		}

	}

	private Object make_noData_html() {
		StringBuffer sb = new StringBuffer();
		sb.append("<tr class=table-active>");
		sb.append("<td></td>");
		sb.append("<td>데이터가 없습니다.</td>");
		sb.append("<td></td>");
		sb.append("</tr>");
		
		
		return sb.toString();
	}

	private Object make_Reply_html(List<Reply> rList) {
		StringBuffer sb = new StringBuffer();
		System.out.println("rList길이="+rList.size());
		for(int i=0; i<rList.size(); i++) {
			sb.append("<tr class=table-active>");
			sb.append("<td>"+rList.get(i).getR_nick()+"</td>");
			sb.append("<td><a href='http://localhost:8081/www/clickDetail?championId="+rList.get(i).getChampionId()+"'>"+rList.get(i).getR_contents()+"</a></td>");
			sb.append("<td>"+rList.get(i).getR_date()+"</td>");
			sb.append("</tr>");
		}
		
		System.out.println("sb="+sb);
		
		
		return sb.toString();
	}

}
