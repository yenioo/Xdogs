package com.spring.login.model;

public class MemberVO {

	private String userid;           // 작성자 아이디
	private String pwd;              // 비밀번호
	private String name;             // 회원명
	private String mobile;           // 연락처
	private String postcode;         // 우편번호
	private String address;          // 주소
	private String detailaddress;    // 상세주소
	private String extraaddress;     // 추가주소
	private String birthday;         // 생년월일
	private String registerday;      // 가입일
	private String status;           // 회원탈퇴유무
	
	public MemberVO() {}

	public MemberVO(String userid, String pwd, String name, String mobile, String postcode, String address,
			String detailaddress, String extraaddress, String birthday, String registerday, String status) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.name = name;
		this.mobile = mobile;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
		this.birthday = birthday;
		this.registerday = registerday;
		this.status = status;
	}

	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getExtraaddress() {
		return extraaddress;
	}

	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	
	
	
	
}
