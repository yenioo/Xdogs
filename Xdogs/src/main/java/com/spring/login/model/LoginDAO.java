package com.spring.login.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO implements InterLoginDAO {

	@Resource
	private SqlSessionTemplate sqlsession;

	// 로그인 처리하기
	@Override
	public MemberVO getLogin(Map<String, String> paraMap) {
		MemberVO loginuser = sqlsession.selectOne("login.getLogin", paraMap);
		return loginuser;
	}

	// 회원가입 처리하기
	@Override
	public int memberRegister(MemberVO mvo) {
		int n = sqlsession.insert("login.memberRegister", mvo);
		return n;
	}

	// 아이디 중복확인
	@Override
	public int idDuplicateCheck(String userid) {
		int n = sqlsession.selectOne("login.idDuplicateCheck", userid);
		return n;
	}


	// 비밀번호 업데이트
	@Override
	public int goUpdatePwd(Map<String, String> paraMap) {
		int n = sqlsession.update("login.goUpdatePwd", paraMap);
		return n;
	}

	// 탈퇴 처리하기
	@Override
	public int goDelMember(String userid) {
		int n = sqlsession.delete("login.goDelMember", userid);
		return n;
	}
	
}
