<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	AnswerDao dao=new AnswerDao();
	
	request.setCharacterEncoding("utf-8");
	
	String content=request.getParameter("content");
	String idx=request.getParameter("idx");
	
	AnswerDto dto=new AnswerDto();
	dto.setContent(content);
	dto.setIdx(idx);
	
	dao.updateAnswer(dto);
	%>