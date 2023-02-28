<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    //dao 선언
    AjaxBoardDao dao=new AjaxBoardDao();
    
    //num 읽기
    String num=request.getParameter("num");
    
    //delete메서드 호출
    dao.deleteBoard(num);
    %>