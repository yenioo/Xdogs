package com.spring.board.model;

public class BoardVO {

	private String bno;        // 게시판번호
	private String fk_userid;  // 아이디
	private String bsubject;   // 게시판제목
	private String updateday;  // 최종 수정일
	private String status;     // 게시판 삭제여부
    
    public BoardVO() {}

	public BoardVO(String bno, String fk_userid, String bsubject, String updateday, String status) {
		super();
		this.bno = bno;
		this.fk_userid = fk_userid;
		this.bsubject = bsubject;
		this.updateday = updateday;
		this.status = status;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getBsubject() {
		return bsubject;
	}

	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
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
	
    

	
	
	
	
	
}
