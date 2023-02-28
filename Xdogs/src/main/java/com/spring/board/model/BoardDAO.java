package com.spring.board.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements InterBoardDAO {

	@Resource
	private SqlSessionTemplate sqlsession;

	// 로그인 처리하기
	@Override
	public MemberVO getLogin(Map<String, String> paraMap) {
		MemberVO loginuser = sqlsession.selectOne("board.getLogin", paraMap);
		return loginuser;
	}

	// 회원가입 처리하기
	@Override
	public int memberRegister(MemberVO mvo) {
		int n = sqlsession.insert("board.memberRegister", mvo);
		return n;
	}

	// 아이디 중복확인
	@Override
	public String getIdDuplicateCheck(String useridCheck) {
		String userid = sqlsession.selectOne("board.getIdDuplicateCheck", useridCheck);
		return userid;
	}

	// 비밀번호 업데이트
	@Override
	public int goUpdatePwd(Map<String, String> paraMap) {
		int n = sqlsession.update("board.goUpdatePwd", paraMap);
		return n;
	}

	// 탈퇴 처리하기
	@Override
	public int goDelMember(String userid) {
		int n = sqlsession.insert("board.goDelMember", userid);
		return n;
	}

	// ********** 게시판 ********** //
	// 게시판 목록
	@Override
	public List<BoardVO> boardList() {
		List<BoardVO> boardList = sqlsession.selectList("board.boardList");
	    return boardList;
	}

	// 게시판 삭제
	@Override
	public int goBoardDel(Map<String, String[]> paraMap) {
		int n = sqlsession.insert("board.goBoardDel", paraMap);
		return n;
	}
	
	// 게시판 추가 처리하기
	@Override
	public int boardAddEnd(BoardVO boardvo) {
		int n = sqlsession.insert("board.boardAddEnd", boardvo);
	    return n;
	}

	// 조회하고자 하는 게시판 번호 받아오기
	@Override
	public String getBoardName(String bno) {
		String boardName = sqlsession.selectOne("board.getBoardName", bno);
		return boardName;
	}

	// 하나의 게시판 목록
	@Override
	public List<BoardVO> postList(String bno) {
		List<BoardVO> postList = sqlsession.selectList("board.postList", bno);
	    return postList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
