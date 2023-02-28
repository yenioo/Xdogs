<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>login</title>

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
	
	form#login_frm {
	  	padding: 65px 0;
	    margin: 0 auto;
	    margin-top: 40px;
	    margin-bottom: 40px;
	    border-top: 0;
	}
	
	/* 로그인폼 내용 전체 */
	div#login_box{
		width:350px;
	}
	
	/* 아이디, 비밀번호 박스*/
 	div#input_login > input {
		border: 2px solid #dbdbdb;
		width: 99%;
		padding: 10px 30px;
		margin: 3px 0;
		opacity: 0.85;
		border-radius: 9px;
		font-size: 10pt;
		line-height: 20px;
	} 
	
	div#input_login > input:focus {
    	outline: none;
		border: 2px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	div#input_login > input::placeholder {
		color: #999999;
	}
	
	div#input_login:hover,
	button#btn_submit:hover {
	 	opacity: 1;
	}
	
	/* 계정 저장 */
	div#idPwdSave,
	div#register {
		font-size: 10pt;
		color: rgba(36, 42, 48, 0.48);
		font-weight: 600;
	}

	/* 로그인 버튼 */
	button#btn_submit {
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
	    color: white;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	#btn_register {
		border-style: none;
		background-color: #ffffff;
		color: rgba(36, 42, 48, 0.48);;
		font-size: 10pt;
	}
	
	#id_save_find label, #id_save_find a{
		font-weight: 600;
	}
	
	#idPwdSave * {
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	
$(document).ready(function(){
	
	//계정정보 저장했을때
	if(localStorage.getItem("saveid") != null){
		$("input#userid").val(localStorage.getItem("saveid"));
		$("input#saveid").prop("checked",true);
	}
	
	// 패스워드 엔터시
	$("input#pwd").keydown(function(e){
		if(e.keyCode == 13) { // 엔터를 했을 경우
			goLogin();
		}
	});
	
});// end of $(document).ready(function(){})---------------

// 로그인 처리 함수
function goLogin() {

	const userid = $("input#userid").val().trim();
	const pwd = $("input#pwd").val().trim();

	if (userid == "") {
		alert("이메일(아이디)를 입력하세요.");
		$("input#userid").val("");
		$("input#userid").focus();
		return; // 종료
	}

	if (pwd == "") {
		alert("비밀번호를 입력하세요.");
		$("input#pwd").val("");
		$("input#pwd").focus();
		return; // 종료
	}
	
	// 계정 저장을 체크했을 경우
	if ($("#saveid").prop("checked")) {
		localStorage.setItem("saveid", userid);
	}
	// 계정 저장 체크 해제했을 경우
	else{
		localStorage.removeItem("saveid");
	}
	
	const frm = document.login_frm;
	frm.action = "<%=ctxPath%>/loginEnd.com";
    frm.method = "post";
    frm.submit(); 
}

</script>

</head>
<body>
	<%-- **** 로그인 폼 **** --%>
	<form id="login_frm" name="login_frm">
		<div id="login_box" class="d-flex flex-column m-auto">
			<div>
		    	<h2 style="font-weight: bold; font-size: 24pt; padding: 0 0 20px 131px;">로그인</h2>
		    </div>  

			<div id="input_login" class="d-flex flex-column">
				<input type="text" name="userid" id="userid" placeholder="이메일(아이디)" required> 
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호" required>
			</div>

			<div id="id_save_find" class="w-98 d-flex justify-content-between" style="padding: 8px 11px 10px 3px;">

				<div id="idPwdSave">
					<input id="saveid" type="checkbox" style="position: relative; top:2px; border: 1px solid #c1c1c1; margin: 0 4px 0 2px;" title="계정 저장 선택" />
					<label for="saveid">계정 저장</label>
				</div>
				
				<div id="register">
					<a id="btn_register" href="<%=ctxPath%>/memberRegister.com" style="text-decoration: none; position: relative; left: -7px;">회원가입</a>
				</div>

			</div>

			<div class="d-flex flex-column">
				<button id="btn_submit"  onclick="goLogin()">로그인</button>
			</div>
		</div>
	</form>
</body>
</html>