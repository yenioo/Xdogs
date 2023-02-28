<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>boardAdd</title>

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
	
	input:focus, select:focus {
		outline: none;
		border: 2px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	form#boardAdd_frm {
	  	padding: 65px 0;
	    margin: 0 auto;
	    margin-bottom: 40px;
	    border-top: 0;
	}
	
	/* 폼 내용 전체 */
	div#boardAdd_box{
		width:350px;
	}
	
	/* input 박스*/
 	div#input_board > input {
		border: 2px solid #dbdbdb;
		width: 99%;
		padding: 10px 30px;
		opacity: 0.85;
		border-radius: 9px;
		font-size: 10pt;
		line-height: 20px;
		margin-bottom: 19px; 
		margin-top: 7px;
	} 
	
	div#input_board > input:focus {
    	outline: none;
		border: 2px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	div#input_board > input::placeholder {
		color: #999999;
	}
	
	div#input_board:hover{
	 	opacity: 1;
	}
	
	.error {
		color: rgb(0 101 204);
		font-size: 9pt;
		margin-left: 20px;
		font-weight: normal;
	}
	
	/* 게시판추가 버튼 */
	button#btnBoardAdd {
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
	
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		
	});// end of $(document).ready(function(){})-------------------------
	
	
	// 게시판 추가하기
	function goBoardAdd() {
		
		// 게시판명 유효성 검사
		const bsubject = $("input#bsubject").val().trim();
		console.log("bsubject" + bsubject);
		if(bsubject == "") {
			$(".subjectAlert").show();
			// alert("게시판명을 입력하세요.");
			return; // 종료
		}
		
		// 폼(form)을 전송(submit)
		const frm = document.boardAdd_frm;
		frm.method = "POST";
		frm.action = "<%= ctxPath%>/boardAddEnd.com";
		frm.submit(); 
		
	}
	
</script>

</head>
<body>

	<%-- **** 게시판 추가하기 **** --%>
	<form id="boardAdd_frm" name="boardAdd_frm">
		<div id="boardAdd_box" class="d-flex flex-column m-auto">

			<div id="input_board" class="d-flex flex-column"> 
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">게시판명<span class="error subjectAlert" style="display:none;">게시판명을 입력해주세요.</span></div>
				<input type="text" name="bsubject" id="bsubject" size="50" placeholder="게시판명" required> 
			</div>
			
			<div class="d-flex flex-column">
				<button id="btnBoardAdd" onclick="goBoardAdd()">게시판 추가</button>
			</div>
		</div>
		<input type="hidden" name="fk_userid" id="fk_userid" value="${sessionScope.loginuser.userid}" />
	</form>
	
</body>
</html>