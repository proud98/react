<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	//nums를 읽기
	String nums=request.getParameter("nums");
	
	// ,로 분리해서 []배열처럼 두기 
	//nums에서 구분기호 ,로 읽어서 분리한걸 num이라고 두기
	String [] num=nums.split(",");
	
	//배열의 갯수만큼 delete
	SmartDao dao=new SmartDao();
	
	for(String n:num){
		
		dao.deleteSmart(n);
	}
	
	//목록으로 이동
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
	%>