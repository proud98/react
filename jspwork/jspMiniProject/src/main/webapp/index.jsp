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
	<style type="text/css">
	div.layout{
	border: 0px solid gray;
	position: absolute;
	font-family:'Gamja Flower';
	}
	
	div.title{
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 25px;
	text-align: center;
	}
	
	div.menu{
	width: 100%;
	height: 80px;
	font-size: 25px;
	top: 140px;
	text-align: center;
	}
	
	div.info{
	width: 180px;
	height: 170px;
	font-size: 15pt;
	top: 280px;
	border: 1px solid gray;
	border-radius: 20px;
	left: 80px;
	padding: 20px 10px;
	}
	
	div.main{
	width: 1200px;
	height: 800px;
	font: 12pt;
	top: 280px;
	left: 400px;
	padding-left: 100px;
	}
	</style>
	
	<%
	//메인페이지
	String mainPage="layout/main.jsp";
	
	//url을 통해서 main값 얻어서 메인페이지에 출력하기 
	//메인페이지가 있는지 없는지로 나눠주기
	if(request.getParameter("main")!=null){
		mainPage=request.getParameter("main");
	}
	
	//프로젝트 경로 구하기
	String root=request.getContextPath();
	%>
</head>
<body>
	<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
	</div>
	
	<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
	</div>
	
	<div class="layout info">
	<jsp:include page="layout/info.jsp"/>
	</div>
	
	<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
	</div>
</body>
</html>