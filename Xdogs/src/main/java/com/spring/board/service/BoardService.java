package com.spring.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.model.BoardVO;
import com.spring.board.model.InterBoardDAO;
import com.spring.board.model.MemberVO;
import com.spring.board.model.PostVO;

@Service
public class BoardService implements InterBoardService {

	@Autowired    
	private InterBoardDAO dao;

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
	public String getIdDuplicateCheck(String useridCheck) {
		String userid = dao.getIdDuplicateCheck(useridCheck);
		return userid;
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

	// ********** 게시판 ********** //
	// 게시판 목록
	@Override
	public List<BoardVO> boardList() {
		List<BoardVO> boardList = dao.boardList();
	    return boardList;
	}

	// 게시판 삭제
	@Override
	public int goBoardDel(Map<String, String[]> paraMap) {
		int n = dao.goBoardDel(paraMap);
		return n;
	}

	// 게시판 추가 처리하기
	@Override
	public int boardAddEnd(BoardVO boardvo) {
		int n = dao.boardAddEnd(boardvo);
	    return n;
	}

	// 조회하고자 하는 게시판 번호 받아오기
	@Override
	public String getBoardName(String bno) {
		String boardName = dao.getBoardName(bno);
		return boardName;
	}

	// 하나의 게시판 목록
	@Override
	public List<BoardVO> postList(String bno) {
		List<BoardVO> postList = dao.postList(bno);
	    return postList;
	}

	// 게시물 추가 처리하기
	@Override
	public int postAddEnd(PostVO postvo) {
		int n = dao.postAddEnd(postvo);
	    return n;
	}


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
