package com.spring.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.common.AES256;
import com.spring.board.common.MyUtil;
import com.spring.board.common.Sha256;
import com.spring.login.model.MemberVO;
import com.spring.login.service.InterLoginService;

@Controller
public class LoginController {

	@Autowired
	private InterLoginService service;

	@Autowired
	private AES256 aes;

	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mav) { // 해당메소드로 왔을 때 /index.action 로 틀어버린다.
		mav.setViewName("redirect:/index.com"); // /index.action 로 이동한다.
		return mav;
	}

	// 메인
	@RequestMapping(value = "/index.com")
	public ModelAndView index(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("main/index");

		return mav;
	}

	// 로그인 페이지 요청
	@RequestMapping(value = "/login.com", method = { RequestMethod.GET })
	public ModelAndView login(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("login/login");
		return mav;
	}

	// 로그인 처리
	@RequestMapping(value = "/loginEnd.com", method = { RequestMethod.POST })
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request) {

		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd)); // pwd 는 단방향 암호화

		MemberVO loginuser = service.getLogin(paraMap);

		// 로그인 실패시
		if (loginuser == null) {
			String message = "아이디 또는 비밀번호를 잘못 입력 하셨습니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		// 로그인 성공시
		else {

			// 세션에 저장하기
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);

			mav.setViewName("redirect:/index.com"); // 시작페이지로 이동
		}
		return mav;
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout.com")
	public ModelAndView logout(ModelAndView mav, HttpServletRequest request) {

		// 로그아웃시 현재 보았던 그 페이지로 돌아가는 것임 //
		HttpSession session = request.getSession();
		String goBackURL = (String) session.getAttribute("goBackURL"); // session 에 저장된 키값 "goBackURL"을 불러온다.
		session.invalidate(); // 세션정보 초기화하기

		String loc = "";
		// 이전에 활동하던 페이지가 있다라면
		loc = request.getContextPath() + "/index.com";

		mav.addObject("loc", loc);
		mav.setViewName("message");
		return mav;

	}

	// 회원가입 페이지 요청
	@RequestMapping(value = "/memberRegister.com")
	public ModelAndView memberRegister(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("login/memberRegister");

		return mav;
	}

	// 회원가입 처리
	@RequestMapping(value = "/memberRegisterEnd.com", method = { RequestMethod.POST })
	public ModelAndView memberRegisterEnd(HttpServletRequest request, ModelAndView mav, MemberVO mvo) throws Throwable {

		// mvo.setUserid(aes.encrypt(mvo.getUserid()));
		mvo.setUserid(mvo.getUserid());
		mvo.setPwd(Sha256.encrypt(mvo.getPwd()));
		mvo.setName(mvo.getName());

		// 회원으로 insert 해주기
		int n = service.memberRegister(mvo);

		String message = "";
		String loc = "";

		if (n == 1) {
			message = "회원가입 되었습니다. 감사합니다.";
			loc = request.getContextPath() + "/login.com";
		} else {
			message = "회원가입이 실패하였습니다.";
			loc = "history.back()";
		}

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		return mav;
	}

	// 아이디 중복처리
	@ResponseBody
	@RequestMapping(value = "/idDuplicateCheck.com", method = { RequestMethod.POST }, produces = "text/plain;charset=UTF-8") 
	public String idDuplicateCheck(HttpServletRequest request) throws Throwable {

		String userid = request.getParameter("userid");
		// 기존 회원의 아이디 여부 확인
		int n = service.idDuplicateCheck(userid);
		//String isExists = service.getIdDuplicateCheck(userid);

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", n);
		//System.out.println("n >>>>>>" + n);
		return jsonobj.toString();
	}

	// 나의 정보수정
	@RequestMapping(value = "/myInfoUpdate.com")
	public ModelAndView myInfoUpdate(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("login/myInfoUpdate");

		return mav;
	}

	// 비밀번호 업데이트
	@ResponseBody
	@RequestMapping(value = "/goUpdatePwd.com", method = { RequestMethod.POST })
	public String goUpdatePwd(HttpServletRequest request) throws Throwable {

		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		// System.out.println("-- userid : " +userid);
		// System.out.println("-- pwd : " +pwd);

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("pwd", Sha256.encrypt(pwd));
		paraMap.put("userid", userid);

		// 비밀번호 업데이트해주기
		int n = service.goUpdatePwd(paraMap);

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", n);
		return jsonobj.toString();
	}

	// 탈퇴 처리하기
	@RequestMapping(value = "/goDelMember.com", method = { RequestMethod.POST })
	public ModelAndView goDelMember(ModelAndView mav, HttpServletRequest request) {

		String userid = request.getParameter("userid");
		int n = service.goDelMember(userid);

		String message = "";
		String loc = "";

		if (n == 1) {
			message = "회원 탈퇴되었습니다. 그 동안 이용해주셔서 감사합니다.";
			// 로그아웃 및 세션 초기화
			HttpSession session = request.getSession();
			session.invalidate(); // 세션정보 초기화하기

			loc = request.getContextPath() + "/index.com";
		} else {
			message = "회원 탈퇴가 실패하였습니다.";
			loc = "history.back()";
		}

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		return mav;
	}


	
	
	// 로그인 또는 로그아웃을 했을 때 현재 보이던 그 페이지로 그대로 돌아가기 위한 메소드 생성
	public void getCurrentURL(HttpServletRequest request) { // 로그인 또는 로그아웃 이전에 활동하던 페이지로 돌아가도록 한다.
		HttpSession session = request.getSession();
		// MyUtil.java 클래스의 getCurrentURL 메소드에서 받아온 request 를 session 에 저장해준다.
		session.setAttribute("goBackURL", MyUtil.getCurrentURL(request));
	}

}

