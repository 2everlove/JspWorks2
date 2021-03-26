package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화...");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter01.jsp 수행...");
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		//컨텐츠 유형
		response.setContentType("text/html; charset=utf-8");
		
		//폼의 입력 자료 처리
		String name = request.getParameter("name");
		
		if(name==null||name.equals("")) {
			//출력
			PrintWriter writer = response.getWriter();
			String message = "입력된 name 값은 null입니다.";
			writer.println(message);
			return;
		}
		chain.doFilter(request, response); //필터 실행
	}
	
	@Override
	public void destroy() {
		System.out.println("Filter01 해제...");
	}
}
