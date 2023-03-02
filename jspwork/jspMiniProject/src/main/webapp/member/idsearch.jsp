<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    String id=request.getParameter("id");
    MemberDao dao=new MemberDao();
    
    int count=dao.isIdCheck(id); //0아님 1로 얻음
    
    JSONObject ob=new JSONObject();
    ob.put("count", count); //ajax 함수에서 key값 count 받을 예정 
    %>
    
    <%=ob.toString()%>