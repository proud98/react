<%@page import="memo.model.MemoDto"%>
<%@page import="memo.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  
   <%
    MemoDao dao=new MemoDao();
    
    request.setCharacterEncoding("utf-8");
    
    String writer=request.getParameter("uwriter");
    String content=request.getParameter("ucontent");
    String avata=request.getParameter("uavata");
    String num=request.getParameter("unum");
   
    MemoDto dto=new MemoDto();
    dto.setWriter(writer);
    dto.setContent(content);
    dto.setAvata(avata);
    dto.setNum(num);
    
    dao.updateMemo(dto);

    %>