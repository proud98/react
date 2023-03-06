<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
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
	request.setCharacterEncoding("utf-8");
	
	String myid=request.getParameter("myid");
	String content=request.getParameter("content");
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	//dto.setNum(request.getParameter("num")) 으로 한 번에 읽기도 가능

	AnswerDto dto=new AnswerDto();
	AnswerDao dao=new AnswerDao();
	
	dto.setMyid(myid);
	dto.setContent(content);
	dto.setNum(num);
	
	
	dao.insertAnsewr(dto);
	
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	
	
	
	%>
</body>
</html>