<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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
	<h2>foreach문, fortoken문</h2>
	
	<c:forEach var="a" begin="1" end="20">
	[${a }]&nbsp;
	</c:forEach>
	
	<br>
	
	<c:forEach var="a" begin="1" end="10" step="2"> <!-- 2씩 뛰어넘어서 봅기 -->
	[${a }]&nbsp;
	</c:forEach>
	
	<br>
	
	<%
	String [] mycolor={"red","pink","gray","yelloew","green"};
	%>
	
	<c:set var="mycolor" value="<%=mycolor %>"/>
	
	<table class="table table-boardered" style="width: 300px;">
	<caption>전체출력</caption>
		<tr>
		<th>인덱스</th>
		<th>카운트</th>
		<th>컬러</th>
		</tr>
		
		<c:forEach var="a" items="${mycolor }" varStatus="i">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td bgcolor="${a }">${a }</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	
	<c:set var="msg" value="장미, 프리지아, 백합, 제라늄, 국화"/>
	${msg }<br>
	
	<h2>msg값을 컴마로 분리해서 출력</h2>
	<!-- delims은 나눠 줄 구분기호 items는 ${msg } 리스트를 출력   -->
	<c:forTokens var="s" items="${msg }" delims="," varStatus="i">
		<h3>${i.count }:${s }</h3>
	</c:forTokens>
	
</body>
</html>