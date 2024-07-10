<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// JSP 
	/*
		Java Sever Pages
		HTML에서 자바 코드를 사용할 수 있는 구조
	*/

// JSP 요소 : 1. 선언부
	// 
	String str1 = "JSP";
	String str2 = "안녕하세요...";
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HelloJSP</title>
</head>
<body>
	<h2>처음 만들어보는 <%= str1 %></h2> <!-- 2. 표현식 -->
	<p>
		<%
			// 3. 스크립틀릿
			out.println(str2 + str1 + "입니다. 열공합시다^^*" );
		
		%>
	</p>

	<table>
		<%-- for(Member m : mlist) { --%>
		<tr>
			<td><%--= m.name --%></td>
			<td><%--= m.email --%></td>
		</tr>
		<%-- } --%>
	</table>
	 -->
	
</body>
</html>