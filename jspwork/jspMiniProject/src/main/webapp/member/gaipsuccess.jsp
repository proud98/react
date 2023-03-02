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
	
	<%
	//id 읽어오기
	String id=request.getParameter("id");
	
	//dao선언
	MemberDao dao=new MemberDao();
	
	//아이디에 따른 이름 얻기 
	String name=dao.getName(id);
	%>
	
	<div>
		<img alt="" src="미니언/12.png"><br>
		<b><%=name %>님의 회원가입을 축하합니다</b>
		<br><br>
		<button type="button" class="btn btn-default" onclick="location.href=''">로그인</button>
		<button type="button" class="btn btn-default" onclick="location.href=''">Home</button>
	</div>
</body>
</html>