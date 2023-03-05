<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div style="margin-top: 50px; margin-left: 100px;">
		<img alt="" src="미니언/05.png" align="left" hspace="20">
		
		<%
		//로그인이 성공했을 때 세션으로 부터 id 얻기 
		//세션의 myid를 얻어와서 myid 라고 지정
		String myid=(String)session.getAttribute("myid");
		
		//db에서 id에 해당하는 이름 얻기
		MemberDao dao=new MemberDao();
		String name=dao.getName(myid);
		%>
		
		<br><br>
		<b style="font-size: 20pt;"><%=name %>님 안녕하세요</b>
		<br><br>
		
		<!-- 
		<button type="button" class="btn btn-default" style="width: 120px;" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
		 -->
	
	</div>
</body>
</html>