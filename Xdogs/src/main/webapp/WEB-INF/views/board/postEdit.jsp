<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>postEdit</title>

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

	<!-- 텍스트에디터 시작-->
	<!-- <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script> -->
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css" />
	<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
	 <!-- Editor -->
	<!-- Color Picker -->
	<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
	<!-- Editor -->
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<!-- Editor's Plugin -->
	<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
	<!-- 텍스트에디터 끝 -->

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
	
	form#postEdit_frm {
	  	padding: 65px 0;
	    margin: 0 auto;
	    margin-bottom: 40px;
	    border-top: 0;
	}
	
	/* 폼 내용 전체 */
	div#postEdit_box{
		width:550px;
	}
	
	/* input 박스*/
 	div#input_post > input {
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
	
	div#input_post > input:focus {
    	outline: none;
		border: 2px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	div#input_post > input::placeholder {
		color: #999999;
	}
	
	div#input_post:hover{
	 	opacity: 1;
	}
	
	/* 게시물추가 버튼 */
	button#btnPostEdit {
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
	    margin-top: 19px;
	    cursor: pointer;
	}
	
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		// 수정하기 버튼 클릭시 
		$("button#btnPostEdit").click(function(){
			// 팝업창에서 부모창 함수 호출 ==> 아래코드 보고있었던 게시물로 이동 ★★★★★★★
			opener.location.href="<%= ctxPath%>/postView.com"; 
        	self.close(); // 팝업창 닫기
		});
		
		
		<%-- 텍스트 에디터 시작 --%>
		editor = new toastui.Editor({
		    el: document.querySelector("#editor"),
		    height: "270px",
		    initialEditType: "wysiwyg",
		    hooks: {
		      addImageBlobHook: function (blob, callback) {
		        const formData = new FormData();
		        formData.append("image", blob);
		        const imageURL = imageUpload(formData);
		        // console.log(imageURL);
		        callback(imageURL, "image");
		      },
		    },
		    language: 'ko-KR'
		 });
		<%-- 텍스트 에디터 끝 --%>
		
	});// end of $(document).ready(function(){})-------------------------
	
		
</script>

</head>
<body>

	<%-- **** 게시물 수정하기 **** --%>
	<form id="postEdit_frm" name="postEdit_frm">
		<div id="postEdit_box" class="d-flex flex-column m-auto">

			<div id="input_post" class="d-flex flex-column"> 
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">제목<span class="error subjectAlert" style="display:none;">제목을 입력해주세요.</span></div>
				<input type="text" name="postsubject" id="postsubject" size="50" placeholder="제목을 입력해주세요" required> 
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">내용<span class="error contentAlert" style="display:none;">내용을 입력해주세요.</span></div>
				<!-- <input type="text" name="postcontent" id="postcontent" size="50" placeholder="내용을 입력해주세요" required>  -->
				<div id="editor" class="editor"></div>
			</div>
			
			<div class="d-flex flex-column">
				<button id="btnPostEdit" onclick="goPostEdit()">수정하기</button>
			</div>
		</div>
	</form>
	
</body>
</html>