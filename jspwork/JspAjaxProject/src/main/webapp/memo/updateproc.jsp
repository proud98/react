<%@page import="memo.model.MemoDto"%>
<%@page import="memo.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  
   <%
    MemoDao dao=new MemoDao();
    
    request.setCharacterEncoding("utf-8");
    
    //데이터 읽기 +num을 추가
    //parametar로 받는건 updateform에서 u가 붙은 이름
    String writer=request.getParameter("uwriter");
    String content=request.getParameter("ucontent");
    String avata=request.getParameter("uavata");
    String num=request.getParameter("unum");
   
    //dto로 묶어주기
    MemoDto dto=new MemoDto();
    dto.setWriter(writer);
    dto.setContent(content);
    dto.setAvata(avata);
    dto.setNum(num);
    
    //update메서드 호출
    dao.updateMemo(dto);

    %>