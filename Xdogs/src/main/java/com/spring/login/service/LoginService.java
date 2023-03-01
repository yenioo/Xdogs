package com.spring.login.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.login.model.InterLoginDAO;
import com.spring.login.model.MemberVO;

@Service
public class LoginService implements InterLoginService {

	@Autowired
	private InterLoginDAO dao;
	
	// 로그인 처리하기
		@Override
		public MemberVO getLogin(Map<String, String> paraMap) {
			MemberVO loginuser = dao.getLogin(paraMap);
			return loginuser;
		}

		// 회원가입 처리하기
		@Override
		public int memberRegister(MemberVO mvo) {
			int n = dao.memberRegister(mvo);
			return n;
		}

		// 아이디 중복확인
		@Override
		public int idDuplicateCheck(String userid) {
			int n = dao.idDuplicateCheck(userid);
			return n;
		}

		// 비밀번호 업데이트
		@Override
		public int goUpdatePwd(Map<String, String> paraMap) {
			int n = dao.goUpdatePwd(paraMap);
			return n;
		}

		// 탈퇴 처리하기
		@Override
		public int goDelMember(String userid) {
			int n = dao.goDelMember(userid);
			return n;
		}
	
}
