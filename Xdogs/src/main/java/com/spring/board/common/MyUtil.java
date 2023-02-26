package com.spring.board.common;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {

	// *** ? 다음의 데이터까지 포함한 현재 URL 주소를 알려주는 메소드 생성하기 *** //
	public static String getCurrentURL(HttpServletRequest request) {
		
		// 만약에 현재 URL 이
		// http://localhost:9090/MyMVC/member/memberList.up?sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=%EC%A0%95
		// 이라면
		
		String currentURL = request.getRequestURL().toString();  // 기본이 StringBuffer 타입을 String 타입으로 바꿔준다.  ? 앞까지만 나온다.
		// http://localhost:9090/MyMVC/member/memberList.up
		
		String queryString = request.getQueryString();  // ? 뒤부터 나온다.
		// sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정 (GET 방식일 경우)
		// null (POST 방식일 경우)
		
		if(queryString != null) {  // GET 방식일 경우
			currentURL += "?" + queryString;  // http://localhost:9090/MyMVC/member/memberList.up + ? + sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정
		}
		
		String ctxPath = request.getContextPath();
		//    /MyMVC
		
		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();  // http://localhost:9090/MyMVC
		//      27     =              21             +       6
		
		currentURL = currentURL.substring(beginIndex);
		//           /member/memberList.up?sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정
		
		return currentURL;
	}
	
	
	// *** 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성하기 *** //
	public static String secureCode(String str) {
		
		// !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
        // 관리자가 장난치려고 제품설명란에 스크립트 공격을 할 수 있다. 이것을 방지하기 위해 아래와 같이 태그 <>를 부등호(&lt; 와 &gt;)로 바꿔준다. 스크립트는 <script> 태그의 <> 가 없으면 읽어올 수 없기 때문이다.
	/*	
		=== 스마트에디터를 사용 안 할 경우 ===
		str = str.replaceAll("<", "&lt;");  // 태그 < 는 부등호 <(&lt;) 로 바꾼다.
		str = str.replaceAll(">", "&gt;");  // 태그 > 는 부등호 <(&gt;) 로 바꾼다.
	*/	
		// === 스마트에디터를 사용할 경우 ===
		str = str.replaceAll("<script", "&lt;script");  // 태그 < 는 부등호 <(&lt;) 로 바꾼다.
				
		return str;
	}
	
	
	
}
