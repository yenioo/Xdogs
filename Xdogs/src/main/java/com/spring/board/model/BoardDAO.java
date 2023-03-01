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
		int n = sqlsession.delete("board.goBoardDel", paraMap);
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

	// 게시물 추가 처리하기
	@Override
	public int postAddEnd(PostVO postvo) {
		int n = sqlsession.insert("board.postAddEnd", postvo);
	    return n;
	}

	// 게시물 1개 조회하기
	@Override
	public PostVO postView(String pno) {
		PostVO postvo = sqlsession.selectOne("board.postView", pno);
		return postvo;
	}

	// 게시물 1개 삭제하기 
	@Override
	public int postDelEnd(String pno) {
		int n = sqlsession.insert("board.postDelEnd", pno);
		return n;
	}

	// 게시물 수정 처리하기
	@Override
	public int postEditEnd(PostVO postvo) {
		int n = sqlsession.insert("board.postEditEnd", postvo);
	    return n;
	}

	// 댓글 조회하기
	@Override
	public List<CommentVO> getCommentListPaging(Map<String, String> paraMap) {
		List<CommentVO> commentList = sqlsession.selectList("board.getCommentListPaging", paraMap);
		return commentList;
	}

	// 하나의 게시물당 댓글의 totalPage 수 알아오기
	@Override
	public int commentTotalPage(Map<String, String> paraMap) {
		int totalPage = sqlsession.selectOne("board.commentTotalPage", paraMap);
		return totalPage; 
	}

	// 댓글쓰기(Ajax 처리)
	@Override
	public int addComment(CommentVO commentvo) {
		int n = sqlsession.insert("board.addComment", commentvo);
		return n;
	}

	// 본인 댓글 삭제하기(Ajax 처리)
	@Override
	public int commentDel(String cno) {
		int n = sqlsession.delete("board.commentDel", cno);
		return n;
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
