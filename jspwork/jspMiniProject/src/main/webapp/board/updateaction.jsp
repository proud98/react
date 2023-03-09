<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	
	<%
	request.setCharacterEncoding("utf-8");
	
	SmartDto dto=new SmartDto();
	
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String subject=request.getParameter("subject");
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setSubject(subject);
	dto.setNum(num);
	
	SmartDao dao=new SmartDao();
	dao.updateSmart(dto);
	
	response.sendRedirect("../index.jsp?main=board/detailview.jsp?num="+num+"&currentPage="+currentPage);
	//글쓰기 작성후 내글로 페이지 이동하고 목록버튼 누르면 햔재페이지 목록으로 얻기
	%>
