package com.spring.login.service;

import java.util.Map;

import com.spring.login.model.MemberVO;

public interface InterLoginService {

	// 로그인 처리하기
	MemberVO getLogin(Map<String, String> paraMap);

	// 회원가입 처리하기
	int memberRegister(MemberVO mvo);

	// 아이디 중복확인
	int idDuplicateCheck(String userid);

	// 비밀번호 업데이트
	int goUpdatePwd(Map<String, String> paraMap);

	// 탈퇴 처리하기
	int goDelMember(String userid);
	
}
