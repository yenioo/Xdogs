<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>myInfoUpdate</title>

  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

  <!-- Font Awesome 5 Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
  <!-- 직접 만든 CSS 1 -->
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/style1.css" />
  
  <!-- Optional JavaScript -->
  <script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.6.0.min.js"></script> <!-- jquery 라이브러리는 중복으로 선언되면 안된다. 아래의 header 또는 footer 파일에서 중복으로 선언하지 말자 -->
  <script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
  <script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> <%-- 스마트에디터(smarteditor) --%>
  
  <%--  ===== 스피너 및 datepicker 를 사용하기 위해  jquery-ui 사용하기 ===== --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.css" />
  <script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.js"></script>

  <%-- *** ajax로 파일을 업로드할때 가장 널리 사용하는 방법 ==> ajaxForm *** --%>
  <script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script>

<style type="text/css">
	@font-face {
	    font-family: 'Pretendard-Regular';
	    font-weight: 400;
	    font-style: normal;
	}
	
	*{
		font-family: Pretendard-Regular;		
	}
	
	input::placeholder{
		color: rgba(36, 42, 48, 0.48);
	}
	
	form {
		margin-left: 140px;
	}
	
	form input, form select {
		border: 2px solid #dbdbdb;
		border-radius: 9px;
		width: 68%;
		padding: 10px 17px;
		margin: 7px 0 0 0;
		opacity: 0.85;
		font-size: 10pt;
		line-height: 20px;
	    margin-bottom: 8px;
	}
	
	input:focus, select:focus {
		outline: none;
		border: 2px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	h2#topSubject {
		font-weight: bold; 
		font-size: 24pt; 
		text-align: center; 
		margin: 43px 0 25px 25px;
	}
	
	.error {
		color: rgb(0 101 204);
		font-size: 9pt;
		margin-left: 20px;
	}
	
	#btnWithdrawal, #btnUpdate {
		display: block;
		border-style: none;
	    height: 45px;
	    opacity: 0.9;
		padding: 12px;
		font-size: 13pt;
		line-height: 20px;
	    border-radius: 9px;
	    border-style: none;
	    background-color: #007BFF;
	    font-weight: 600;
	    cursor: pointer;
	    color: white;
	}
	
	#btnWithdrawal:hover,
	#btnUpdate:hover {
		opacity: 1;
	}
	
</style>

<script type="text/javascript">
var newpwdflag = false;    // 비밀번호 입력 확인용
var newpwdchxflag = false; // 비밀번호확인 입력 확인용


$(document).ready(function(){

	//$("#pwd").mouseup(function(){ // 요소에 마우스를 떼었을 때 이벤트가 발생
	$("#pwd").focusout(function(){
		confirmNewpwd();
	});
	
});// end of $(document).ready(function(){})---------------


// 비밀번호 입력
function confirmNewpwd(){
	const pwdReg = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/
	const pwd = $("#pwd").val();
	if(!pwdReg.test(pwd)){
		$("#pwd").focus();
		$("#pwdAlert").css("color","rgb(0 101 204)");
		return;
	} else {
		$("#pwdAlert").css("color","#666666");
		newpwdflag = true;
	}
}

//비밀번호 확인 입력
function confirmpwdTotal(){
	
	const pwdchx = $("#pwdCheck").val();
	if(pwdchx != $("#pwd").val().trim()){
		$("#pwdCheck").focus();
		$(".pwdchxAlert").show();
		return;
	} else {
		$(".pwdchxAlert").hide();
		newpwdchxflag = true;
	}
}

// 정보수정 버튼 클릭시
function goUpdatePwd(){
	// confirmNewpwd();
	confirmpwdTotal();
	
	const pwd = $("#pwd").val();
	//console.log("pwd : " +pwd);
	
	if(!(newpwdflag && newpwdchxflag)) {
		return;
	} else {
		
		$.ajax({
			url: "<%=ctxPath%>/goUpdatePwd.com",
			data:{"pwd":pwd,
				  "userid":"${sessionScope.loginuser.userid}"},
			//data: $("#pwdChangeFrm").serialize(),
			type:"POST",
			dataType:"JSON", 
			success:function(json){
				if(json.n == 1){
					alert("비밀번호가 변경되었습니다.");
					location.href="<%=ctxPath%>/index.com";
				} else {
					alert('비밀번호 변경이 실패되었습니다.');
				}
			}
		});
	}
}


// 탈퇴 버튼 클릭시
function goWithdrawal() {
	
	const bool = confirm("정말로 회원 탈퇴하시겠습니까?");
    if(bool) {
		const frm = document.pwdChangeFrm;   
		frm.action = "<%= ctxPath%>/goDelMember.com";
		frm.method = "POST";
		frm.submit();
    }
	
}


</script>

</head>
<body>

<div class="container col-md-6" style="display: block; left: 11%;">
	<div class="col-md-6">
    	<h2 id="topSubject">회원정보 수정</h2>
    </div>  
  
	<div class="collapse show" style="position: relative; right: 140px;">
		<form name="pwdChangeFrm">
			<div class="subject">이름</div>
			<input type="text" name="name" value="${sessionScope.loginuser.name}" readonly />
			
			<div style="vertical-align: middle;" class="subject">이메일</div>
			<input type="text" name="userid" value="${sessionScope.loginuser.userid}" readonly />
  	  			
			<div class="subject">비밀번호<span id="pwdAlert" class="pwdAlert" style="font-size: 9pt; color: #666666; margin-left: 15px;">비밀번호는 8자~15자 영문,숫자,특수문자로 입력하세요.</span></div>
			<input type="password" class="required" id="pwd" name="pwd" size="50" placeholder="비밀번호 입력" />
			<!-- <span class="error">비밀번호는 8자~15자 영문,숫자,특수문자로 입력하세요.</span> -->
		
			<div class="subject">비밀번호 확인<span class="error pwdchxAlert" style="display:none;">비밀번호가 일치하지 않습니다.</span></div>
			<input type="password" class="required" id="pwdCheck" name="pwdCheck" size="50" placeholder="비밀번호 확인" />
		</form>
	</div>    
   
	<div class="text-center" style="display: block; margin-bottom: 20px; margin-top: 25px;"> 
		<button id="btnWithdrawal" onclick="goWithdrawal()" style="float: left; margin-right: 19%; background-color: #F0F0F0; color: #333333;">탈퇴</button>
		<button id="btnUpdate" onclick="goUpdatePwd()" style="width: 28%;">정보 수정</button>
	</div>
</div>

</body>
</html>