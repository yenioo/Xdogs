package com.spring.board.model;

import java.util.List;
import java.util.Map;

public interface InterBoardDAO {

	// 로그인 처리하기
	MemberVO getLogin(Map<String, String> paraMap);

	// 회원가입 처리하기
	int memberRegister(MemberVO mvo);

	// 아이디 중복확인
	String getIdDuplicateCheck(String useridCheck);

	// 비밀번호 업데이트
	int goUpdatePwd(Map<String, String> paraMap);

	// 탈퇴 처리하기
	int goDelMember(String userid);

	// ********** 게시판 ********** //
	// 게시판 목록
	List<BoardVO> boardList();

	// 게시판 삭제
	int goBoardDel(Map<String, String[]> paraMap);

	// 게시판 추가 처리하기
	int boardAddEnd(BoardVO boardvo);

	// 조회하고자 하는 게시판 번호 받아오기
	String getBoardName(String bno);

	// 하나의 게시판 목록
	List<BoardVO> postList(String bno);

	// 게시물 추가 처리하기
	int postAddEnd(PostVO postvo);

}
