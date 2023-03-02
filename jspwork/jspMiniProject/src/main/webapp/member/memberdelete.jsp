<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	request.setCharacterEncoding("utf-8");
	
    //dao 선언
    MemberDao dao=new MemberDao();
    
    //num 읽기
    String num=request.getParameter("num");
    
    //delete메서드 호출
    dao.deleteMember(num);
    
    response.sendRedirect("../index.jsp?main=member/memberlist.jsp?num="+num);
    
    %>