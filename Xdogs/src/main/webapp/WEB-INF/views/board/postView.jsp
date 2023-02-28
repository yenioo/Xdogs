<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>postView</title>

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
	
	form#postView_frm {
	  	padding: 65px 0;
	    margin: 0 auto;
	    margin-bottom: 40px;
	    border-top: 0;
	}
	
	/* 폼 내용 전체 */
	div#postView_box{
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
	
	/* 댓글 등록 버튼 */
	button#btnComAdd {
		position: relative;
	    left: 89%;
	    width: 10%;
	    background-color: #007BFF;
	    color: white;
	    height: 31px;
	    opacity: 0.9;
	    font-size: 11pt;
	    line-height: 20px;
	    border-radius: 9px;
	    border-style: none;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	/* 게시물삭제,수정 버튼 */
	button#btnPostDel,
	button#btnPostEdit {
		border-style: none;
		width: 47%;
	    height: 45px;
	    opacity: 0.9;
		padding: 12px;
		font-size: 13pt;
		line-height: 20px;
	    border-radius: 9px;
	    border-style: none;
	    font-weight: 600;
	    margin-top: 19px;
	    cursor: pointer;
	}
	button#btnPostDel {
		margin-right: 26px; background-color: #F0F0F0; color: #333333;
	}
	button#btnPostEdit {
		background-color: #007BFF; color: white;
	}
	
</style>

<script type="text/javascript">

	$(document).ready(function(){

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
		
	});//end of $(document).ready(function(){})-------------------------
	
	
	<%-- // 삭제하기 버튼 클릭시 
	function goPostDel() {
		var result = confirm("게시물을 정말 삭제하시겠습니까?");
        if(result) { 
        	//yes
            // 폼(form)을 전송(submit)
			const frm = document.postView_frm;
			frm.nbno.value = "${requestScope.boardvo.bno}";
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/board_delEnd.up";
			frm.submit(); 
        } else {    
        	//no
        	return; // 종료
        }
        self.close(); // 팝업창 닫기
	});
	
	// 수정하기 버튼 클릭시 
	function goPostEdit() {
		
		// 글제목 유효성 검사
		const subject = $("input#subject").val().trim();
		if(subject == "") {
			$(".subjectAlert").fadeIn("fast");
			setTimeout(function(){
				$(".subjectAlert").fadeOut("fast");
			}, 1500);
		    //alert("제목을 입력하세요.");
			return; // 종료
		}
		
		var content = editor.getHTML();  // (스마트 에디터 사용 할 경우) <p>글내용</p> 와 같이 출력됨.
        
		//content = content.replace(/&nbsp;/gi, ""); // 공백을 "" 으로 변환
		//content = content.substring(content.indexOf("<p>")+3);   // "            </p>"  => index 3 부터 까지
		//content = content.substring(0, content.indexOf("</p>")); // "            "
		//alert("content >>" + content);   
		
		/* if(content.trim().length == 0 || content == "<br>"){
			$(".contentAlert").fadeIn("fast");
			setTimeout(function(){
				$(".contentAlert").fadeOut("fast");
			}, 1500);
			//alert("내용을 입력하세요.");
			return;
		} */
		
		if(content == "<p><br></p>"){
			$(".contentAlert").fadeIn("fast");
			setTimeout(function(){
				$(".contentAlert").fadeOut("fast");
			}, 1500);
			//alert("내용을 입력하세요.");
			return;
		}
		
		// 폼(form)을 전송(submit)
		const frm = document.postView_frm;
		frm.method = "POST";
        frm.fk_employee_no.value = "${sessionScope.loginuser.userid}";
        frm.content.value = content;
        frm.commentCheck.value = commentCheck;
        frm.action = "<%= ctxPath%>/freeboard_editEnd.up";  
        frm.submit();
        self.close(); // 팝업창 닫기
	}); --%>
		
	// 게시물 수정하기
	function goPostEdit() {
		// 게시물 추가 팝업창 띄우기 (GET 방식). postEdit.java 클래스에 넘겨준다.
		const url = "<%= ctxPath%>/postEdit.com";
		window.open(url, "postEdit", 
			"left=380px, top=50px, width=750px, height=650px"); // 팝업창 띄우기(url, 팝업창이름, "팝업창 크기지정")  *url 은 보여줄 페이지(boardAdd.java) 이다.
		self.close(); // 팝업창 닫기
	}// end of function goPostEdit(){}----------------------------

	
</script>

</head>
<body>

	<%-- **** 게시물 보기 **** --%>
	<form id="postView_frm" name="postView_frm">
		<div id="postView_box" class="d-flex flex-column m-auto">

			<div id="input_post" class="d-flex flex-column"> 
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">제목</div>
				<%-- <div class="psubject" style="padding: 10px 30px; font-size: 10pt; line-height: 20px; margin: 7px 0 19 0px;">${requestScope.boardvo.psubject}</div> --%>
				<div class="psubject" style="padding: 10px 30px; font-size: 10pt; line-height: 20px; margin: 7px 0 19 0px;">뚱이</div>
				
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">내용</div>
				<%-- <div class="pcontent" style="padding: 10px 30px; font-size: 10pt; line-height: 20px; margin: 7px 0 19 0px;">${requestScope.boardvo.pcontent}</div> --%>
				<div class="pcontent" style="padding: 10px 30px; font-size: 10pt; line-height: 20px; margin: 7px 0 19 0px;">8살 됐는데 여전히 애기에요. 너무 귀여워요.</div>
				
				<!-- <div id="editor" class="editor"></div> -->
				<div class="subject" style="font-weight: 600; font-size: 13.5pt; margin-top: 19px;">댓글</div>
				<input type="text" name="postcomment" id="postcomment" style="margin-bottom: 5px;"> 
				<button id="btnComAdd" onclick="gocomAdd()">등록</button>
				
				<table class="table" style="margin-top: 3.5%; margin-bottom: 20%;">
					<thead>
					  <tr>
						 <th style="width: 23%; text-align: center;">내용</th>
						 <th style="width: 5%; text-align: center;">작성자</th>
						 <th style="width: 5%; text-align: center;">작성일자</th>
				      </tr>
				    </thead> 
				    <tbody id="commentDisplay"></tbody>
				</table>
			</div>
			
			<div class="d-flex flex-column">
				<span>
					<button id="btnPostDel" onclick="goPostDel()">삭제하기</button>
					<button id="btnPostEdit" onclick="goPostEdit()">수정하기</button>
				</span>
			</div>
		</div>
	</form>
	
</body>
</html>