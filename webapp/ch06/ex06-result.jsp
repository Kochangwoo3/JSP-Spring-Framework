<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	System.out.println("userid: " + userid);
	System.out.println("userpw: " + userpw);
	
	
	if(userid.equals(userpw)){
		System.out.println(userid + ": 로그인 성공");
		// 최상위 요청으로 리다이렉트
		//response.sendRedirect(request.getContextPath());
		response.sendRedirect("ex01.jsp");
	} else {
		System.out.println(userid + ": 로그인 실패!!!");
		//response.sendRedirect("http://localhost:8090/jwbook/ch06/ex06-loginForm.jsp");
		response.sendRedirect("ex06-loginForm.jsp");
	}
%>