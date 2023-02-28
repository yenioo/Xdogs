package com.spring.board.model;

public class CommentVO {

	private String cno;           // 댓글번호
	private String fk_pno;        // 원게시글번호
	private String fk_userid;     // 작성자 아이디
	private String content;       // 댓글내용
	private String writeday;      // 작성일
	private String status;        // 댓글삭제여부
	
	public CommentVO() {}

	public CommentVO(String cno, String fk_pno, String fk_userid, String content, String writeday, String status) {
		super();
		this.cno = cno;
		this.fk_pno = fk_pno;
		this.fk_userid = fk_userid;
		this.content = content;
		this.writeday = writeday;
		this.status = status;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getFk_pno() {
		return fk_pno;
	}

	public void setFk_pno(String fk_pno) {
		this.fk_pno = fk_pno;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	
}
