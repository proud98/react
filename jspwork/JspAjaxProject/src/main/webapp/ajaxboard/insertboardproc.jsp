<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	//post방식이라 엔코딩
	request.setCharacterEncoding("utf-8");
	
	//name값 말고 parameter로 읽어 올 수 있음
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String avata=request.getParameter("avata");
	
	//dto선언
	AjaxBoardDto dto=new AjaxBoardDto();
	
	//dto에 담기
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setAvata(avata);
	
	//insert메서드 호출해서
	AjaxBoardDao dao=new AjaxBoardDao();
	
	//insert에 writer,subject,content,avata 담긴 dto 보내기
	dao.insertBoard(dto);
	%>