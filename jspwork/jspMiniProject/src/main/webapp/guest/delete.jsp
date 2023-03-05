
<%@page import="java.io.File"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
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
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	GuestDao dao=new GuestDao();
	dao.deleteGuest(num);
	
	//GuestDto dto = dao.getData(num);
	
	//게시글 지우기 전 업로드 이미지 지우기
	String photoname = dao.getData(num).getPhotoname();
	
	//업로드 됐던 경로
	String uploadPath = getServletContext().getRealPath("/save");
	
	//파일생성
	File file = new File(uploadPath + "\\" + photoname);
	
	//파일삭제
	if (file.exists())
		file.delete();
	
	//db삭제
	dao.deleteGuest(num);
	
	//리스트로 이동
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	%>
</body>
</html>