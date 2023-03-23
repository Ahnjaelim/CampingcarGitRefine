package kr.co.ccrent.common;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthenticationInterceptor implements HandlerInterceptor{
	// controller가 요청을 ㅎ처리하기전에 호출하는 메소드
	// preGandle
//	클라이언트에 부여한 세션을 가져온다.
//	HttpSession session = request.getSession();
	/*
	 * 
	 *  로그인이 아니라면 로그인 페이지로 이동시킨다.
	 * if(session.getAttribute("user") == null){
	 * 
	 * response.sendRedirect(repuest.getContextPath()+"/board/login");	
	 * 
	 *  return false
	 * }
	 * 
	 * return true
	 */
	
	//예외가 발생하지 않는 경우에만 COntroller가 작업이 끝나면 호출되는 메소드 
	//posthandle
	
	
	//예외가 발생 여부에 상관없이 Controller가 작업이 끝남녀 호출되는 메소드
	//afterCompletion
}
