<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<title>index</title>

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

	#home {
		font-size: 14pt;
		font-weight: bold;
		padding-left: 2.5rem; !important
		cursor: pointer;
	}
</style>

</head>
<body>

<nav class="navbar navbar-expand-sm bg-light">
	
	<!-- Brand/logo --> 
	<%-- <a class="navbar-brand" href="<%= ctxPath %>/index.com" style="margin-right: 10%;"><img src="<%= ctxPath %>/resources/images/sist_logo.png" /></a>	--%>

	<!-- Links -->
	<ul class="navbar-nav">
	  <li class="nav-item" id="home">
	    <a class="nav-link" href="<%=ctxPath%>/index.com">Xdogs 반려견 커뮤니티</a>
	  </li>
	  
	  <li class="nav-item" style="margin-top: 7.5px; margin-left: 40ex; padding-right: 2.05rem;">
	  	<a class="text-info" href="<%=ctxPath%>/allBoardList.com">게시판</a> 
      </li>
     
      <li class="nav-item" style="padding-right: 2.05rem; margin-top: 7.5px;">
     	 <c:if test="${empty sessionScope.loginuser}">
     		<a class="text-info" href="<%=ctxPath%>/login.com">로그인</a> 
		 </c:if>
	     <c:if test="${not empty sessionScope.loginuser}">
	    	<a class="text-info" href="<%=ctxPath%>/logout.com">로그아웃</a>
	 	 </c:if>
      </li>
     
      <li class="nav-item" style="margin-top: 7.5px;">
		<c:if test="${empty sessionScope.loginuser}">
	        <a class="text-info" href="<%=ctxPath%>/memberRegister.com">회원가입</a> 
	        <%-- <a class="dropdown-item" href="<%=ctxPath%>/memberRegister.com">회원가입</a> --%>
		</c:if>
		<c:if test="${not empty sessionScope.loginuser}">
			<a class="text-info" href="<%=ctxPath %>/myInfoUpdate.com">정보수정</a>
		</c:if>     		
      
      
	  </li>
	  
	  <!-- <li class="nav-item">
	    <a class="nav-link" href="#">게시판</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">로그인</a>
	  </li> -->
	</ul>

</nav>

</body>
</html>