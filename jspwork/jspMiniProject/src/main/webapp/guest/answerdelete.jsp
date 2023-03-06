<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	AnswerDao dao=new AnswerDao();
	
	String idx=request.getParameter("idx");
	
	dao.deleteAnswer(idx);
	%>