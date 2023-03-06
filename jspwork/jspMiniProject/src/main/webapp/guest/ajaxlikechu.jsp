<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	//num읽기
	String num=request.getParameter("num");
	
	//dao
	GuestDao dao=new GuestDao();
	
	//num에 해당하는 chu증가
	dao.updateChu(num); 
	
	//num에 해당하는 chu값을 json형식으로 반환
	int chu=dao.getData(num).getChu(); 
	
	JSONObject ob=new JSONObject();
	ob.put("chu", chu); //num에 해당하는 grtChu값을 "chu"라고 지정
	%>
	<%=ob.toString()%>