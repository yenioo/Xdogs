<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>memberRegister</title>

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
	
	h2#topSubject {
		font-weight: bold; 
		font-size: 24pt; 
		text-align: center; 
		margin: 43px 0 25px 25px;
	}
	
	#idCheck {
		color:#333333;
		height: 38px;
		border-style: none;
		border-radius: 5%;
	}
	
	input:focus, select:focus {
		outline: none;
		border: 2px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	.error {
		color: rgb(0 101 204);
		font-size: 9pt;
		margin-left: 20px;
	}
	
	#btnRegister {
		/* display: block;
		font-weight: bold;
		color:#333333;
		height: 30px;
		border-style: none;
		border-radius: 5%;
		width: 55%; */
		display: block;
		border-style: none;
		width: 99%;
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
	    width: 55%;
	}
	
	#btnRegister:hover {
		opacity: 1;
	}
	
</style>

<script type="text/javascript">
let b_flag_idDuplicate_click = false; // 아이디중복확인 클릭여부 확인용
var code = ""; // 이메일인증용
var b_emailSendCheck = false;
var b_emailCheck = false;
var emailCheck = false;

$(document).ready(function(){

	<%-- 
	//"아이디중복확인" 을 클릭했을 때 이벤트 처리하기
	$("button#idCheck").click(function () {
	  b_flag_idDuplicate_click = true;

	  $.ajax({
	    url: "<%= ctxPath%>/idDuplicateCheck.com",
	    data:{"userid":$("input#userid").val()},
		type:"post",
	    success: function (text) {
	      const json = JSON.parse(text);

	      if(json.isExists){
	    	    // 입력한 userid 가 이미 사용중이라면
				$("span#idcheckResult").html($("input#userid").val()+" 은 중복된 아이디 이므로 사용불가 합니다.").css("color", "red");
				$("input#userid").val("");  // 입력란에서 값 비워버리기
			} else {
				// 입력한 userid 가 존재하지 않는 경우라면
				$("span#idcheckResult").html($("input#userid").val()+" 은 사용가능 합니다.").css("color", "navy");
			}
	    },
	    error: function(request, status, error){
	        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    }
	  });
	  
	}); // end of $("button#idcheck").click(function() {})---------------------

	$("input#userid").bind("change", () => {  
		b_flag_idDuplicate_click = false;  
		// 초기화시킴. true 가 되어야지만 넘어감.
	}); --%>
	
	
});// end of $(document).ready(function(){})---------------


// 가입하기
function goRegister(){
	/* 유효성 검사 */
	// 이름
	const name = $("#name").val();
	if(name.trim() == ""){
		$("#name").focus();
		$(".nameAlert").show();
		return;
	} else {
		$(".nameAlert").hide();
	}
	
	//이메일
	const emailReg = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
	const userid = $("#userid").val();
	if(!emailReg.test(userid)){
		$("#userid").focus();
		$(".useridAlert").show();
		return;
	} else {
		$(".useridAlert").hide();
	}
	
	// 비밀번호
	const pwdReg = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/
	const pwd = $("#pwd").val();
	if(!pwdReg.test(pwd)){
		$("#pwd").focus();
		$("#pwdAlert").css("color","rgb(0 101 204)");
		return;
	} else {
		$("#pwdAlert").css("color","#666666");
	}
	
	//비밀번호 확인
	const pwdchx = $("#pwdCheck").val();
	if(pwd != pwdchx) {
		$("#pwdCheck").focus();
		$(".pwdchxAlert").show();
		return;
	} else {
		$(".pwdchxAlert").hide();
	}
	
	// 아이디중복확인 클릭여부 알아오기
	if (!b_flag_idDuplicate_click) { 
		// 클릭 안 했을 경우
	    alert('중복확인을 클릭해주세요.');
	    return;
	} else {
		// 클릭 했을 경우
		$.ajax({
		    url: "<%= ctxPath%>/idDuplicateCheck.com",
		    data:{"userid":$("input#userid").val()},
			type:"post",
		    success: function (text) {
		      const json = JSON.parse(text);

		      if(json.isExists != 0){
		    	    // 입력한 userid 가 이미 사용중이라면
					$("span#idcheckResult").html($("input#userid").val()+" 은 중복된 아이디 이므로 사용불가 합니다.").css("color", "red");
					$("input#userid").val("");  // 입력란에서 값 비워버리기
					
					b_flag_idDuplicate_click = false;  // 초기화시킴. true 가 되어야지만 넘어감.
					return;
					
				} else {
					// 입력한 userid 가 존재하지 않는 경우라면
					$("span#idcheckResult").html($("input#userid").val()+" 은 사용가능 합니다.").css("color", "navy");
				}
		    },
		    error: function(request, status, error){
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		  });
		
	}
	
	
    // 아이디값이 변경되면 가입하기 버튼을 클릭시 "아이디중복확인" 을 클릭했는지 클릭안했는지를 알아보기위한 용도 초기화 시키기
	$('input#userid').bind('change', () => {
	  b_flag_idDuplicate_click = false;
	});

	
	
	/* if(!b_emailSendCheck){
		$(".emailAlert").text("이메일 인증을 해주세요.");
		$(".emailAlert").show();
		$("#emailCheck").focus();
		return;
	}
	
	if(!b_emailCheck){
		$(".emailAlert").text("인증번호를 확인해주세요.");
		$(".emailAlert").show();
		$("#confirmEmail").focus();
		return;
	} */
	
	const frm = document.registerFrm;
	frm.method = "post";
	frm.action = "<%=ctxPath%>/memberRegisterEnd.com";
	frm.submit();
	
}

</script>

</head>
<body>

<div class="container col-md-6" style="display: block; left: 11%;">
	<div class="col-md-6">
    	<h2 id="topSubject">회원가입</h2>
    </div>  
  
	<div class="collapse show" style="position: relative; right: 140px;">
		<form name="registerFrm">
			<div class="subject">이름<span class="error nameAlert" style="display:none;">이름을 입력해주세요.</span></div>
			<input type="text" class="required" id="name"  name="name" size="50" placeholder="이름 입력" />
			
			<div style="vertical-align: middle;" class="subject">이메일<span class="error useridAlert" style="display:none;">이메일 형식에 맞지 않습니다.</span></div>
			<input type="text" class="required" id="userid"  name="userid" placeholder="이메일 입력" style="width: 53%; margin-right: 8px;"/>
			<button id="idCheck">중복확인</button>
			<span id="idcheckResult"></span>
  	  			
			<div class="subject">비밀번호<span id="pwdAlert" class="pwdAlert" style="font-size: 9pt; color: #666666; margin-left: 15px;">비밀번호는 8자~15자 영문,숫자,특수문자로 입력하세요.</span></div>
			<input type="password" class="required" id="pwd" name="pwd" size="50" placeholder="비밀번호 입력" />
			<!-- <span class="error">비밀번호는 8자~15자 영문,숫자,특수문자로 입력하세요.</span> -->
		
			<div class="subject">비밀번호 확인<span class="error pwdchxAlert" style="display:none;">비밀번호가 일치하지 않습니다.</span></div>
			<input type="password" class="required" id="pwdCheck" name="pwdCheck" size="50" placeholder="비밀번호 확인" />
		</form>
	</div>    
   
	<div class="text-center" id="register" style="display: block; margin-bottom: 20px; margin-top: 25px;"> 
		<button id="btnRegister" onclick="goRegister()">가입하기</button>
	</div>
</div>

</body>
</html>