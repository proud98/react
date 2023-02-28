<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	//dao선언
	AjaxBoardDao dao=new AjaxBoardDao();
    
	//num 가져오기
    String num=request.getParameter("num");
    
	//dto
    AjaxBoardDto dto=dao.getData(num);
	
	//날짜타입 문자열 지정
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    //dto를 json반환
    JSONObject ob=new JSONObject();
    
    ob.put("num", dto.getNum());
    ob.put("writer", dto.getWriter());
	ob.put("subject", dto.getSubject());
	ob.put("content", dto.getContent());
	ob.put("avata", dto.getAvata());
	ob.put("writeday", sdf.format(dto.getWriteday()));
	%>
	
	<%=ob.toString()%>