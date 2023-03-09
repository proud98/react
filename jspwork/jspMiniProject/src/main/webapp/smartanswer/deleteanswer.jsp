<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	SmartAnswerDao dao=new SmartAnswerDao();
	
	String idx=request.getParameter("idx");
	
	dao.deleteSmartAnswer(idx);
	%>