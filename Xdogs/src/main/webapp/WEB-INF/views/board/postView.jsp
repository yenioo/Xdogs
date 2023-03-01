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
 	div#input_post > input,
 	div#pcontent, 
 	div#psubject {
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
	
	.error {
		color: rgb(0 101 204);
		font-size: 9pt;
		margin-left: 20px;
		font-weight: normal;
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
	
	/* 댓글 삭제 버튼 */
	#delcmtbtn {
	    cursor: pointer;
	    color: #ea4335;
	    font-weight: bold;
	    position: relative;
	    top: 0px;
	    left: 17px;
	}
	.bd_toolbar{
		border: 1px solid #d9d9d9;
		border-radius: 7px;
	    width: 35px;
	    height: 26px;
	    position: relative;
	    margin-right: 5px;
	    color: #7f7f7f;
    	text-align: center;
    	padding-top: 3px;
    	display: inline-block;
    	font-size: 10pt;
    	top: 8px;
    	position: relative;
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

		// 페이징 처리한 댓글 읽어오기. 맨처음에 (1)페이지를 읽어오기.
		goViewComment(1);    
		
		/* 본인이 작성한 게시물에만 삭제,수정버튼 보여주기 */
		if('${sessionScope.loginuser.userid}' == '${requestScope.postvo.fk_userid}') {
			$("#btnPostDel").show();
			$("#btnPostEdit").show();
		} else {
			$("#btnPostDel").hide();
			$("#btnPostEdit").hide();
		}
		
		<%-- 텍스트 에디터 시작 --%>
 		editor = new toastui.Editor({
		    el: document.querySelector("#editor"),
		    height: "270px",
		    initialValue: '${requestScope.boardvo.content}',
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
	
	
	// 글삭제 하기
	function goPostDel() {
		var result = confirm("게시물을 정말 삭제하시겠습니까?");
        if(result) { 
        	//yes
        	// 폼(form)을 전송(submit)
			const frm = document.postView_frm;
			frm.method = "POST";
		    frm.pno.value = "${requestScope.pno}";
			frm.action = "<%= ctxPath%>/postDelEnd.com";
			frm.submit(); 
        } else {    
        	//no
        	return;
        }
	}
	
		
	// 게시물 수정하기
	function goPostEdit() {
		// 게시물 추가 팝업창 띄우기 (GET 방식). postEdit.java 클래스에 넘겨준다.
		const url = "<%= ctxPath%>/postEdit.com?pno="+${requestScope.pno};
		window.open(url, "postEdit", 
			"left=380px, top=50px, width=750px, height=650px"); // 팝업창 띄우기(url, 팝업창이름, "팝업창 크기지정")  *url 은 보여줄 페이지(boardAdd.java) 이다.
		self.close(); // 팝업창 닫기
	}

	
	
	
	/* ********* 댓글 처리 ********* */
	// 댓글 작성하기
	function goCommentAdd() {
	  
		// 댓글 작성 유효성 검사
		const commentContent = $("input#postcomment").val().trim();
			if(commentContent == "") {
			$(".contentAlert").show();
			return;
		}
		
		$.ajax({
			url:"<%= ctxPath%>/addComment.com",
			data:{"fk_pno":"${requestScope.pno}"
				 ,"fk_userid":"${sessionScope.loginuser.userid}"
				 ,"content":$("input#postcomment").val()},
				//data:queryString,
			type:"POST",
			dataType:"JSON",
			success:function(json){
				const n  = json.n;
				if(n==1) {
					 	
					goViewComment(1);  // 페이징 처리한 댓글 1페이지 읽어오기.	
					location.href="javascript:location.reload(true)"; // 현재 페이지로 이동(새로고침) 
				}
				//$("input#postcomment").val("");  // 댓글 입력란 비우기
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }					
		});
	  
	}
	
	
	// Ajax로 불러온 댓글내용을 페이징 처리하기
	function goViewComment(currentShowPageNo) {  // currentShowPageNo 은 문서가 로딩되자마자 기본적으로 int타입 1값을 넘겨준다. 하지만, 페이징처리를 map 으로 해주어서  다른 페이지번호를 클릭 시 String 타입으로 바뀐다. (예: 2페이지 클릭시)
		
		$.ajax({
			url:"<%= ctxPath%>/commentList.com",
			data:{"fk_pno":"${requestScope.pno}",   // 읽고싶은 원글 번호 
				  "currentShowPageNo":currentShowPageNo},  // 현재 보고있는 페이지번호  
			dataType:"JSON",  
			success:function(json){
				// console.log(JSON.stringify(json));
				let html = "";
				
				if(json.length > 0) {
					$.each(json, function(index, item){
						const userid = '${sessionScope.loginuser.userid}'.split('@', 1);
						console.log("userid : "+userid);
						
						html += "<tr>"+
									/* "<td class='comment'>"+(index+1)+"</td>"+ */  // index 는 0부터 시작하기 때문에 + 1 해줌.
									"<th style='width: 22%; text-align: center; font-size: 10pt; font-weight: normal;'>"+item.content+"</th>"+ 
									"<th style='width: 5%; text-align: center; font-size: 10pt; font-weight: normal;'>"+item.fk_userid+"</th>"+
						            /* "<th style='width: 4%; text-align: center; font-size: 10pt; font-weight: normal;'>"+item.writeday+"</th>"; */
						            "<th style='width: 6%; text-align: left; font-size: 10pt; font-weight: normal;'>"+item.writeday;
						            
						            <%-- ***** 댓글 작성자만 본인 댓글 삭제 권한 부여 ***** --%>
								    if( userid == item.fk_userid){
								      	/* html += "<th style='width: 2%; text-align: center;'><a class='bd_toolbar' id='delcmtbtn' onclick='commentDel("+item.cno+")'>삭제</a></th>"; */
								      	html += "<a class='bd_toolbar' id='delcmtbtn' onclick='commentDel("+item.cno+")'>삭제</a>";
								    }
					    html += "</th>"+
					    	  "</tr>";
					  }); 
				}
				else {
					html += "<tr>"+"<th colspan='3' style='text-align: center; font-size: 10pt; font-weight: normal;>댓글이 없습니다</th>"+"</tr>";
				}
				$("tbody#commentDisplay").html(html);  // 여기에 찍어준다.
				
				// 페이지바 함수 호출
				makeCommentPageBar(currentShowPageNo);	
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }	
		});
	}
	
	
	// 댓글 페이지바
	function makeCommentPageBar(currentShowPageNo) {
		
		<%-- 하나의 게시물당 댓글의 totalPage 수 알아오기(Ajax 처리) --%>
		$.ajax({
			url:"<%= ctxPath%>/commentTotalPage.com",
			data:{"fk_pno":"${requestScope.pno}", // 읽고싶은 원글 번호
				  "sizePerPage":"3"},             // 한 페이지에 몇개의 댓글개수를 보여줄 것인지
			type:"GET",
			dataType:"JSON",
			success:function(json){
				
				if(json.totalPage > 0) { // 댓글이 있는 경우
					const totalPage = json.totalPage;
					const blockSize = 5; // 1개 블럭(토막)당 보여지는 페이지번호의 개수
					let loop = 1;
				      
			        if(typeof currentShowPageNo == "string") { // currentShowPageNo 타입이  String 일 경우 
			        	//  기본적으로 int타입 1값을 넘겨준다. 하지만, 페이징처리를 map 으로 해주어서  다른 페이지번호를 클릭 시 String 타입으로 바뀐다. (예: 2페이지 클릭시)
			        	currentShowPageNo = Number(currentShowPageNo);
			        }
			       
					let pageNo = Math.floor( (currentShowPageNo - 1)/blockSize ) * blockSize + 1;
					let pageBarHTML = "<nav><ul class='pagination mg-pagebar'style='align-items: center;display: inline-flex;'>";
					
					// === [맨처음][이전] 만들기 === //
					if(pageNo != 1) {
						pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='처음' href='javascript:goViewComment(\"1\")'><span aria-hidden='true'>&laquo;</span></a></li>";
						pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='이전' href='javascript:goViewComment(\""+(pageNo-1)+"\")'><span aria-hidden='true'>&lt;</span></a></li>";
			        }
				      
 					while( !(loop > blockSize || pageNo > totalPage) ) {  // loop가  blockSize보다 커지지 않는다면 (지금은 blockSize 가 2 로 loop 가 1~2 라면) 또는 페이지수가 총페이지수를 초과하지 않는다면 반복한다.
				    
 						if(pageNo == currentShowPageNo) {  // 해당 블럭의 페이지번호 시작값(1, 11, 21, ...)
 							 pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
 				         }
 				         else {
 				        	 pageBarHTML += "<li class='page-item'><a class='page-link' href='javascript:goViewComment(\""+pageNo+"\")'>"+pageNo+"</a></li>";
 				         }
 				         loop++;
 				         pageNo++;
			        }// end of while--------------------------
			        
 				    // [다음][마지막] 만들기
 				    // 페이지 이동시  url 이 아닌, ajax 방식으로 함수를 호출하여 이동한다.
 					if(pageNo <= totalPage) {
 						pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='다음' href='javascript:goViewComment(\""+pageNo+"\")'><span aria-hidden='true'>&gt;</span></a></li>";  // while 문을 돌면서 빠져나오면 pageNo++; 되어지기 때문에  (pageNo+1) 로 할 필요가 없다.   
 						pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='마지막' href='javascript:goViewComment(\""+totalPage+"\")'><span aria-hidden='true'>&raquo;</span></a></li>";
			        	
 					}
				    pageBarHTML += "</ul></nav>";       
			        $("div#pageBar").html(pageBarHTML);
			        
				}// end of if(json.totalPage > 0)----------------
				
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		});
	}
	
	
	// 본인 댓글 삭제하기
	function commentDel(cno) {
		
		var result = confirm("댓글을 삭제하시겠습니까?");
		// 확인 클릭시
		if(result) { 
			$.ajax({
				url:"<%= ctxPath%>/commentDel.com",
				data:{"cno":cno},
				type:"POST",
				dataType:"JSON",
				success:function(json){  
					alert("댓글이 삭제되었습니다.");
					location.href="javascript:location.reload(true)"; // 현재 페이지로 이동(새로고침) 
				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});
		} else {
	        // 취소 클릭시
	    	return;
	    }
	}
	
	
</script>

</head>
<body>

	<%-- **** 게시물 보기 **** --%>
	<form id="postView_frm" name="postView_frm">
		<div id="postView_box" class="d-flex flex-column m-auto">

			<div id="input_post" class="d-flex flex-column"> 
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">제목</div>
				<%-- <input type="text" name="name" value="${requestScope.postvo.psubject}" readonly /> --%>
				<div id="psubject"style="padding: 10px 30px; font-size: 10pt; line-height: 20px; margin: 7px 0 19 0px;">${requestScope.postvo.psubject}</div>
				
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">내용</div>
				<%-- <input type="text" name="name" value="${requestScope.postvo.pcontent}" style="height: 200px; overflow-x: auto;" readonly /> --%>
				<div id="pcontent" style="padding: 10px 30px; font-size: 10pt; line-height: 20px; margin: 7px 0 19 0px; height: 250px;">${requestScope.postvo.pcontent}</div>
				
				<div class="subject" style="font-weight: 600; font-size: 13.5pt;">댓글<span class="error contentAlert" style="display:none;">댓글을 입력해주세요.</span></div>
				<input type="text" name="postcomment" id="postcomment" style="margin-bottom: 5px;"> 
				<button id="btnComAdd" onclick="goCommentAdd()">등록</button>
				
				<!-- 댓글목록 보여주기 시작 -->
				<table class="table" style="margin-top: 3.5%;">
					<thead>
					  <tr>
						 <th style="width: 22%; text-align: center;">내용</th>
						 <th style="width: 5%; text-align: center;">작성자</th>
						 <th style="width: 6%; text-align: left;">작성일자</th>
				      </tr>
				    </thead> 
				    <tbody id="commentDisplay"></tbody>
				</table>
				<!-- 댓글목록 보여주기 끝 -->
				
				<%-- 댓글 페이지바 시작 --%>
				<!-- <div style="display: flex; margin-bottom: 50px;">
					<div id="pageBar" style="margin: auto; text-align: center;"></div>
				</div> -->
				<div id="pageBar" class="mg-paging" align="center" style="width: fit-content; margin:20px auto; margin-top: 19px; font-size: 9pt;"></div>
				<%-- 댓글 페이지바 끝 --%>
			</div>
			
			<div class="d-flex flex-column">
				<span>
					<button id="btnPostDel" onclick="goPostDel()">삭제하기</button>
					<button id="btnPostEdit" onclick="goPostEdit()">수정하기</button>
				</span>
			</div>
		</div>
		<input type="hidden" name="fk_userid" id="fk_userid" value="" />
		<input type="hidden" name="pno" id="pno" value="" />
		<input type="hidden" name="pcontent" id="pcontent" value="">
	</form>
	
</body>
</html>