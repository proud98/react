<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
    //num 읽기
    String num=request.getParameter("num");
    
    //dao 선언
    MemberDao dao=new MemberDao();
    
    //delete메서드 호출
    dao.deleteMember(num);
    
    response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
    %>