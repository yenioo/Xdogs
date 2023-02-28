package com.spring.board.model;

public class PostVO {

	private String pno;           // 게시물번호
	private String fk_bno;        // 원게시판번호
	private String fk_userid;     // 작성자 아이디
	private String psummary;      // 설명
	private String psubject;      // 글제목
	private String pcontent;      // 글내용
	private String writeday;      // 작성일
	private String updateday;     // 작성일
	private String status;        // 글삭제여부
	private String commentcount;  // 댓글의 개수
	
	public PostVO() {}
	
	public PostVO(String pno, String fk_bno, String fk_userid, String psummary, String psubject, String pcontent,
			String writeday, String updateday, String status, String commentcount) {
		super();
		this.pno = pno;
		this.fk_bno = fk_bno;
		this.fk_userid = fk_userid;
		this.psummary = psummary;
		this.psubject = psubject;
		this.pcontent = pcontent;
		this.writeday = writeday;
		this.updateday = updateday;
		this.status = status;
		this.commentcount = commentcount;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getFk_bno() {
		return fk_bno;
	}

	public void setFk_bno(String fk_bno) {
		this.fk_bno = fk_bno;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getPsummary() {
		return psummary;
	}

	public void setPsummary(String psummary) {
		this.psummary = psummary;
	}

	public String getPsubject() {
		return psubject;
	}

	public void setPsubject(String psubject) {
		this.psubject = psubject;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public String getUpdateday() {
		return updateday;
	}

	public void setUpdateday(String updateday) {
		this.updateday = updateday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(String commentcount) {
		this.commentcount = commentcount;
	}
    
	
	
	
	
	
	
}
