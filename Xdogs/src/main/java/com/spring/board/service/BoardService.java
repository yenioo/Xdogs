package com.spring.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.model.BoardVO;
import com.spring.board.model.CommentVO;
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

	// 게시물 1개 조회하기
	@Override
	public PostVO postView(String pno) {
		PostVO postdvo = dao.postView(pno);
		return postdvo;
	}

	// 게시물 1개 삭제하기 
	@Override
	public int postDelEnd(String pno) {
		int n = dao.postDelEnd(pno);
	    return n;
	}

	// 게시물 수정 처리하기
	@Override
	public int postEditEnd(PostVO postvo) {
		int n = dao.postEditEnd(postvo);
	    return n;
	}

	// 댓글 조회하기
	@Override
	public List<CommentVO> getCommentListPaging(Map<String, String> paraMap) {
		List<CommentVO> commentList = dao.getCommentListPaging(paraMap);
		return commentList;
	}

	// 하나의 게시물당 댓글의 totalPage 수 알아오기
	@Override
	public int commentTotalPage(Map<String, String> paraMap) {
		int totalPage = dao.commentTotalPage(paraMap);
		return totalPage;
	}

	// 댓글쓰기(Ajax 처리)
	@Override
	public int addComment(CommentVO commentvo) {
		int n = dao.addComment(commentvo);
	    return n;
	}

	// 본인 댓글 삭제하기(Ajax 처리)
	@Override
	public int commentDel(String cno) {
		int n = dao.commentDel(cno); 
		return n;
	}

	




	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
