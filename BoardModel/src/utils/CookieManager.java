package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public static void makeCookie(HttpServletResponse response,String cName,
								String cValue, int cTime) {
		//1.쿠키객체를 생성한다.
		Cookie cookie = new Cookie(cName,cValue);
		//2. 쿠키의 생성 경로 설정
		cookie.setPath("/");
		//3. 유지시간
		cookie.setMaxAge(cTime);
		//4. 응답헤더에 쿠키 정보 저장
		response.addCookie(cookie);
	}
	
	public static String readCookie(HttpServletRequest request,String cName) {
		String cookieValue="";
		
		//1. 요청 헤더에서 쿠키정보 얻기
		Cookie[] cookies = request.getCookies();
		//2. 쿠키정보가 있는지 확인
		if(cookies !=null){
			for(Cookie c : cookies){
				String cookieName = c.getName();
				if(cookieName.equals(cName)) {
					cookieValue = c.getValue();
					
				}
			}
		}
		
		return cookieValue;
	}
	
	//쿠키 삭제
	public static void deleteCookie(HttpServletResponse response,String cName) {
		makeCookie(response,cName,"",0);
	}
}