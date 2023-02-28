<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>oneBoardList</title>

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
	
	form {
		margin-left: 140px;
	}
	
	th {background-color: #DDD}

    a {text-decoration: none !important;}
	
	/* 게시판명 input */
	#boardName {
    	margin: 12px 15px 0px 18px;
	    position: relative;
	    top: -7px;
	    padding: 4px 12px;
	    font-size: 11pt;
        border-radius: 4px;
	}
	
	#btnPostAdd {
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
	    width: 15%;
	    margin: 0 0 10px 0;
	}
	
	#btnPostAdd:hover {
		opacity: 1;
	}
	
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
	});// end of $(document).ready(function(){})-------------------------
	
	
	// 게시물 추가버튼 클릭시
	function goPostAdd(bno) {
	  
	  // 게시물 추가 팝업창 띄우기 (GET 방식). postAdd.java 클래스에 넘겨준다.
	  const url = "<%= ctxPath%>/postAdd.com?bno="+bno;
	  window.open(url, "postAdd", 
	  			"left=380px, top=50px, width=750px, height=650px"); // 팝업창 띄우기(url, 팝업창이름, "팝업창 크기지정")  *url 은 보여줄 페이지(boardAdd.java) 이다.
	}// end of function goPostAdd(){}----------------------------

	// 게시물 보기
	function goPostView() {
	  // 게시물 보기 팝업창 띄우기 (GET 방식). postView.java 클래스에 넘겨준다.
	  const url = "<%= ctxPath%>/postView.com";
	  window.open(url, "postView", 
	  			"left=380px, top=50px, width=750px, height=650px"); // 팝업창 띄우기(url, 팝업창이름, "팝업창 크기지정")  *url 은 보여줄 페이지(postView.java) 이다.
	}// end of function goPostView(){}----------------------------
	
	
	
	
</script>


</head>
<body>

<div class="container">
  <div style="margin: auto; padding-left: 3%;">

	<br>
	<span style="margin-bottom: 30px;">
		<span style="float: left;"><h2>게시판명</h2></span> <!-- 추후 생략할 것 !!!  -->
		<input type="text" name="boardName" id="boardName" value="${requestScope.bsubject}" readonly />
		<input type="hidden" name="bno" id="bno" value="${requestScope.bno}" />
	</span>  
	
	
	<div class="text-center" style="display: block; margin-bottom: 20px; margin-top: 25px;">
		<a id="btnPostAdd" href="javascript:goPostAdd('${requestScope.bno}');" style="float: right; margin: 0 53px 10px 10px;">게시물 추가</a>
	</div>
	
	<c:if test="${not empty requestScope.postList}">
		<table style="width: 1024px" class="table table-bordered">
			<thead>
			    <tr>
					<th style="width: 200px; text-align: left;">제목</th>
					<th style="width: 360px; text-align: left;">설명</th>
					<th style="width: 150px; text-align: center;">생성일</th>
					<th style="width: 150px; text-align: center;">수정일</th>
					<th style="width: 70px;  text-align: center;">작성자</th>
			    </tr>
			</thead>
			
			<tbody>
				<c:forEach var="postvo" items="${requestScope.postList}" varStatus="status">
				    <tr>
				       <td align="left"><span class="subject" onclick="goPostView('${boardvo.pno}')">${postvo.psubject}</span></td>
				       <td align="left"><span class="summary" onclick="goPostView('${boardvo.pno}')">${postvo.psummary}</span></td>
				       <td align="center">${postvo.writeday}</td>
				       <td align="center">${postvo.updateday}</td>
				       <td align="center">${postvo.fk_userid}</td>
				    </tr> 
				</c:forEach>
			</tbody>
    	</table>
    </c:if>
    
    
    <%-- === 페이지바 보여주기  === --%>
    <%-- <div align="center" style="border: solid 0px gray; width: 70%; margin: 20px auto;">
		${requestScope.pageBar}    
    </div> --%>
    
    
    <%-- === 글검색 폼 추가하기 : 글제목, 글쓴이로 검색  === --%>
    <%-- <form name="searchFrm" style="margin-top: 20px;">
    	<select name="searchType" id="searchType" style="height: 26px;">
    		<option value="subject">글제목</option>  value 값은 컬럼명을 의미함
    		<option value="name">글쓴이</option>     value 값은 컬럼명을 의미함
    	</select>
    	<input type="text" name="searchWord" id="searchWord" size="40" autocomplete="off" />  autocomplete="off" 은 input 태그에 입력했었던 모든 키워드를 불러오는 자동완성 기능을 사용하지 않는 것 
    	<input type="text" style="display: none;" />  form 태그내에 input 태그가 오로지 1개 뿐일경우에는 엔터를 했을 경우 검색이 되어지므로 이것을 방지하고자 만든것이다. 즉, form 태그에 input 태그가 오로지 1개일 경우에는 엔터만 쳐도 바로 form 이 전송되어져서 input 태그를 2개이상 만들어서 바로 전송되는 것을 막는다. 이 때 추가로 만든 input 태그는 type="text" style="display: none;" 와 같이 해줌으로써 실제로 보이지 않도록 설정해준다. 
    	<button type="button" class="btn btn-secondary btn-sm" onclick="goSearch()">검색</button>
    </form> --%>
    
    <%-- === 검색어 입력시 자동글 완성하기   === --%>
    <%-- <div id="displayList" style="border:solid 1px gray; border-top:0px; height:100px; margin-left:75px; margin-top:-1px; overflow:auto;"> overflow:auto; 는 내용물의 양이 가변적이어서 내용물의 크기가 주어진 공간을 넘어가는 경우에만 스크롤바가 생긴다.
    </div> --%>

  </div>
</div>

</body>
</html>