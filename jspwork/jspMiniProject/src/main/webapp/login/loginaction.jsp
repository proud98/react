<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave"); //체크 안하면 null, 하면 on
	
	MemberDao dao=new MemberDao();
	boolean b=dao.isIdPassCheck(id, pass);
	
	//아이디와 비번이 맞으면 3개의 세션을 저장하고 로그인메인으로 이동
	if(b){
		
		//세션유지시간 (생략시 30분)
		session.setMaxInactiveInterval(60*60*8);
		session.setAttribute("loginok", "yes"); //loginok가 ok인지 아닌지 
		session.setAttribute("myid", id); //불러온 id를 myid로 저장
		session.setAttribute("saveok", cbsave==null?null:"yes"); //cbsave가 null이 아니면 yes
		
		//로그인메인이동
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	}else{%>
		
		<script type="text/javascript">
		alert("아이디와 비번이 맞지 않습니다");
		history.back();
		</script>
		
	<%}
	%>
</body>
</html>