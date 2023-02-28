<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	
	if("${requestScope.message}" != ""){
		alert("${requestScope.message}"); //메시지 출력
	}
	// 페이지이동
	location.href = "${requestScope.loc}"; //페이지 이동
	
	opener.location.reload(true); //부모창이 있으면 새로고침
	self.close(); //팝업창 닫기
	

</script>