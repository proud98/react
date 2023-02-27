<%@page import="memo.model.MemoDto"%>
<%@page import="memo.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    MemoDao dao=new MemoDao();
    
    //엔코딩
    request.setCharacterEncoding("utf-8");
    
    //데이터 읽기(writer, content, avata)
    String writer=request.getParameter("writer");
    String content=request.getParameter("content");
    String avata=request.getParameter("avata");
    
    //dto로 묶어주기
    MemoDto dto=new MemoDto();
    dto.setWriter(writer);
    dto.setContent(content);
    dto.setAvata(avata);
    
    //insert 호출
    dao.insertMemo(dto);
    
    //ajax 비동기 방식은 한 화면에서 insert만 불러와줌 이동은 안 함 !!!
    
    
    
    %>