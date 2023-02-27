<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	String imageno=request.getParameter("imageno");
	String imagestu=request.getParameter("imagestu");
	String kor=request.getParameter("kor");
	String eng=request.getParameter("eng");
	String mat=request.getParameter("mat");
	
	int tot=Integer.parseInt(kor)+Integer.parseInt(eng)+Integer.parseInt(mat);
	double avg=tot/3.0;
	
	JSONObject ob=new JSONObject();
	ob.put("photo", "../미니언/"+imageno+".png");
	ob.put("student", imagestu);
	ob.put("kor", kor);
	ob.put("eng", eng);
	ob.put("mat", mat);
	ob.put("tot", tot);
	ob.put("avg", avg);
	%>
	
	<%=ob.toString()%>