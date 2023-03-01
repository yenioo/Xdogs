package com.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.common.MyUtil;
import com.spring.board.model.BoardVO;
import com.spring.board.model.CommentVO;
import com.spring.board.model.PostVO;
import com.spring.board.service.InterBoardService;

@Controller
public class BoardController {

	@Autowired
	private InterBoardService service;

	// ********** 게시판 ********** //
	// 게시판 목록
	@RequestMapping(value = "/allBoardList.com")
	public ModelAndView allBoardList(ModelAndView mav, HttpServletRequest request) {

		// 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출
		getCurrentURL(request);

		List<BoardVO> boardList = null; // 초기값

		// 페이징 처리를 안한 전체 글목록 보여주기
		boardList = service.boardList();

		mav.addObject("boardList", boardList); // 구해온 값이 null이 아니라면 boardList를 list.jsp 에 넘긴다.
		mav.setViewName("board/allBoardList");

		return mav;
	}

	// 게시판 추가 팝업창
	@RequestMapping(value = "/boardAdd.com")
	public ModelAndView boardAdd(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("board/boardAdd");

		return mav;
	}

	// 게시판 추가 처리하기
	@RequestMapping(value = "/boardAddEnd.com", method = { RequestMethod.POST })
	public ModelAndView boardAddEnd(ModelAndView mav, BoardVO boardvo) {

		int n = service.boardAddEnd(boardvo);

		String message = "";
		String loc = "";

		if (n == 1) {
			// 성공시
			loc = "history.go(0)";
		} else {
			// 실패시
			loc = "history.back()";
		}

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("message");
		return mav;
	}

	// 게시판 삭제
	@ResponseBody
	@RequestMapping(value = "/boardDel.com")
	public String boardDel(HttpServletRequest request) throws Throwable {

		String[] bnoArr = request.getParameterValues("bnoArr");
		// System.out.println("-- bnoArr : " +bnoArr);

		Map<String, String[]> paraMap = new HashMap<String, String[]>();
		paraMap.put("bnoArr", bnoArr);

		int n = service.goBoardDel(paraMap);

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", n);
		return jsonobj.toString();
	}

	// 하나의 게시판 목록
	@RequestMapping(value = "/oneBoardList.com")
	public ModelAndView oneBoardList(ModelAndView mav, HttpServletRequest request) {

		// 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출
		// getCurrentURL(request);

		// 조회하고자 하는 게시판 번호 받아오기
		String bno = request.getParameter("bno");
		String bsubject = service.getBoardName(bno);

		List<BoardVO> postList = null; // 초기값
		// 페이징 처리를 안한 하나의 게시판 페이지 전체 글목록 보여주기
		postList = service.postList(bno);

		mav.addObject("bno", bno);
		mav.addObject("bsubject", bsubject);
		mav.addObject("postList", postList);
		mav.setViewName("board/oneBoardList");
		return mav;
	}

	// 게시물 추가 팝업창
	@RequestMapping(value = "/postAdd.com")
	public ModelAndView postAdd(ModelAndView mav, HttpServletRequest request) {

		String bno = request.getParameter("bno");

		mav.addObject("bno", bno);
		mav.setViewName("board/postAdd");

		return mav;
	}

	// 게시물 추가 처리하기
	@RequestMapping(value = "/postAddEnd.com", method = { RequestMethod.POST })
	public ModelAndView postAddEnd(ModelAndView mav, PostVO postvo) {

		// System.out.println(postvo.toString());
		int n = service.postAddEnd(postvo);

		String message = "";
		String loc = "";

		if (n == 1) {
			// 성공시
			loc = "history.go(0)";
		} else {
			// 실패시
			loc = "history.back()";
		}

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("message");
		return mav;
	}

	// 게시물 보기 팝업창
	@RequestMapping(value = "/postView.com")
	public ModelAndView postView(ModelAndView mav, HttpServletRequest request) {

		String bno = request.getParameter("bno");
		String pno = request.getParameter("pno");

		PostVO postvo = null;
		postvo = service.postView(pno);

		mav.addObject("bno", bno);
		mav.addObject("pno", pno);
		mav.addObject("postvo", postvo);
		mav.setViewName("board/postView");
		return mav;
	}

	// 게시물 삭제 처리하기
	@RequestMapping(value = "/postDelEnd.com", method = { RequestMethod.POST })
	public ModelAndView postDelEnd(ModelAndView mav, HttpServletRequest request) {

		String pno = request.getParameter("pno");
		//System.out.println("------ pno :" + pno);
		int n = service.postDelEnd(pno);

		String message = "";
		String loc = "";

		if (n == 1) {
			// 성공시
			loc = "history.go(0)";
		} else {
			// 실패시
			loc = "history.back()";
		}

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("message");
		return mav;
	}

	// 게시물 수정 팝업창
	@RequestMapping(value = "/postEdit.com")
	public ModelAndView postEdit(ModelAndView mav, HttpServletRequest request) {

		String pno = request.getParameter("pno");

		PostVO postvo = null;
		postvo = service.postView(pno);

		mav.addObject("pno", pno);
		mav.addObject("postvo", postvo);
		mav.setViewName("board/postEdit");
		return mav;
	}

	// 게시물 수정 처리하기
	@RequestMapping(value = "/postEditEnd.com", method = { RequestMethod.POST })
	public ModelAndView postEditEnd(ModelAndView mav, PostVO postvo, HttpServletRequest request) {

		// System.out.println(postvo.toString());
		int n = service.postEditEnd(postvo);

		String message = "";
		String loc = "";

		if (n == 1) {
			// 성공시
			message = "게시물이 수정되었습니다.";
			loc = request.getContextPath() + "/postView.com?pno="+postvo.getPno();
			
		} else {
			// 실패시
			message = "게시물이 수정이 실패되었습니다.";
			loc = request.getContextPath() + "/postView.com?pno="+postvo.getPno();
		}

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		return mav;
	}
	

	// 댓글 조회하기(Ajax 처리)
	@ResponseBody
	@RequestMapping(value = "/commentList.com", method = { RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String commentList(HttpServletRequest request) {

		String fk_pno = request.getParameter("fk_pno");
		String currentShowPageNo = request.getParameter("currentShowPageNo"); // 초기값 1
		// System.out.println("fk_pno >>"+fk_pno);
		// System.out.println("currentShowPageNo >>"+currentShowPageNo);

		if (currentShowPageNo == null) {
			currentShowPageNo = "1";
		}

		int sizePerPage = 3; // 한 페이지당 보여줄 게시물 건수
		int startRno = ((Integer.parseInt(currentShowPageNo) - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_pno", fk_pno);
		paraMap.put("startRno", String.valueOf(startRno)); // 시작 댓글 번호
		paraMap.put("endRno", String.valueOf(endRno)); // 끝 댓글 번호

		List<CommentVO> commentList = service.getCommentListPaging(paraMap);
		// System.out.println("commentList >>"+commentList);

		JSONArray jsonArr = new JSONArray();
		if (commentList != null) {
			for (CommentVO cmtvo : commentList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("cno", cmtvo.getCno());
				jsonObj.put("fk_pno", cmtvo.getFk_pno());
				jsonObj.put("fk_userid", cmtvo.getFk_userid());
				jsonObj.put("content", cmtvo.getContent());
				jsonObj.put("writeday", cmtvo.getWriteday());
				jsonArr.put(jsonObj);
			} // end of for--------------------
		}

		return jsonArr.toString();
	}

	// 하나의 게시물당 댓글의 totalPage 수 알아오기(Ajax 처리)
	@ResponseBody
	@RequestMapping(value = "commentTotalPage.com", method = {
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String commentTotalPage(HttpServletRequest request) {

		String fk_pno = request.getParameter("fk_pno");
		String sizePerPage = request.getParameter("sizePerPage");

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_pno", fk_pno);
		paraMap.put("sizePerPage", sizePerPage);
		// System.out.println("sizePerPage >>"+sizePerPage);

		// 원글 글번호(fk_pno)에 해당하는 댓글의 totalPage 수 알아오기
		int totalPage = service.commentTotalPage(paraMap);
		// System.out.println("totalPage >>"+totalPage);

		JSONObject josnObj = new JSONObject();
		josnObj.put("totalPage", totalPage);

		return josnObj.toString();
	}

	// 댓글쓰기(Ajax 처리)
	@ResponseBody
	@RequestMapping(value = "/addComment.com", method = { RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String addComment(CommentVO commentvo) throws Throwable {

		// System.out.println(commentvo.toString());
		int n = 0;
		try {
			n = service.addComment(commentvo);
			// System.out.println("n >>>>"+n);
		} catch (Throwable e) {
			e.printStackTrace();
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);

		return jsonObj.toString();
	}

	// 본인 댓글 삭제하기(Ajax 처리)
	@ResponseBody
	@RequestMapping(value = "/commentDel.com", method = { RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String commentDel(HttpServletRequest request) throws Throwable {

		String cno = request.getParameter("cno");

		int n = 0;
		try {
			n = service.commentDel(cno);
			// System.out.println("결과 n >>>>"+n);
		} catch (Throwable e) {
			e.printStackTrace();
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);

		return jsonObj.toString();
	}

	// 로그인 또는 로그아웃을 했을 때 현재 보이던 그 페이지로 그대로 돌아가기 위한 메소드 생성
	public void getCurrentURL(HttpServletRequest request) { // 로그인 또는 로그아웃 이전에 활동하던 페이지로 돌아가도록 한다.
		HttpSession session = request.getSession();
		// MyUtil.java 클래스의 getCurrentURL 메소드에서 받아온 request 를 session 에 저장해준다.
		session.setAttribute("goBackURL", MyUtil.getCurrentURL(request));
	}

}
