package com.spring.board.model;

import java.util.List;
import java.util.Map;

public interface InterBoardDAO {

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

	// 게시물 1개 조회하기
	PostVO postView(String pno);

	// 게시물 1개 삭제하기 
	int postDelEnd(String pno);

	// 게시물 수정 처리하기
	int postEditEnd(PostVO postvo);

	// 댓글 조회하기
	List<CommentVO> getCommentListPaging(Map<String, String> paraMap);

	// 하나의 게시물당 댓글의 totalPage 수 알아오기
	int commentTotalPage(Map<String, String> paraMap);

	// 댓글쓰기(Ajax 처리)
	int addComment(CommentVO commentvo);

	// 본인 댓글 삭제하기(Ajax 처리)
	int commentDel(String cno);

	


	
	
	
	
	
	
	
}
