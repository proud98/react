<%@page import="data.dto.MemberDto"%>
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
	request.setCharacterEncoding("utf-8");
	
	String num=request.getParameter("num"); //num추가
    String name=request.getParameter("name");
    String pass=request.getParameter("pass");
    String hp=request.getParameter("hp");
    String addr=request.getParameter("addr");
    String email=request.getParameter("email")+"@"+request.getParameter("email2");
    
    //dto로 묶어주기
    MemberDto dto=new MemberDto();
    dto.setNum(num); //num추가
    dto.setName(name);
    dto.setPass(pass);
    dto.setHp(hp);
    dto.setAddr(addr);
    dto.setEmail(email);
    
    //dao선언
    MemberDao dao=new MemberDao();
    //update 메서드 호출
    dao.updateMyInfo(dto);
    
    //gaipsuccess페이지로 이동
    response.sendRedirect("../index.jsp?main=member/myinfo.jsp");
    //dao에서 id를 엄기면 name을 받아오기 때문에 id를 넘겨버림 
	%>
</body>
</html>