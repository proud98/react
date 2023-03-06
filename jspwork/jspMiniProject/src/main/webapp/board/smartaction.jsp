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
	
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setSubject(subject);
	
	SmartDao dao=new SmartDao();
	dao.insertSmart(dto);
	
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
	%>
