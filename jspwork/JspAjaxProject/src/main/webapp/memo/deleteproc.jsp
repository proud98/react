<%@page import="memo.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    //dao 선언
    MemoDao dao=new MemoDao();
    
    //num 읽기
    String num=request.getParameter("num");
    
    //delete메서드 호출
    dao.deleteMemo(num); 
    
    //ajax라서 페이지 이동 따로 안해도 됨
    %>