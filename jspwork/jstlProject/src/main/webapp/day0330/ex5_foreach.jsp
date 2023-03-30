<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<%
	
	List<String> list=new ArrayList<>();
	
	list.add("red");
	list.add("yellow");
	list.add("gray");
	list.add("pink");
	list.add("blue");
	list.add("orange");
	list.add("green");
	
	request.setAttribute("list", list);
	request.setAttribute("total", list.size());
	
	//세션에 저장
	session.setAttribute("id", "angel");
	%>
	
	<h3>1~10까지 출력</h3>
	<c:forEach var="a" begin="1" end="10">
		<!-- 1부터 10까지 뽑을건데 그 변수를 a라고 지정 -->
		${a }&nbsp;
	</c:forEach>
	
	<h3>0~20까지 3의 배수 출력</h3>
	<c:forEach var="a" begin="0" end="30" step="3">
		${a }&nbsp;
	</c:forEach>
	
	<hr>
	
	<!-- requestScope는 생략가능 -->
	<h3>list에는 총 ${requestScope.total }개의 색상이 들어있습니다</h3>
	<h3>list에는 총 ${total }개의 색상이 들어있습니다</h3>
	<!-- sessionScope는 가급적 생략 안 함 -->
	<h3>세션 아이디 출력</h3>
	<h3>현재 로그인한 아이디는 ${sessionScope.id }입니다</h3>
	<h3>현재 로그인한 아이디는 ${id }입니다</h3>
	
	<hr>
	
	<h3>list 전체를 체이블로 출력</h3>
	<table class="table table-bordered" style="width: 300px;">
		<tr>
		<th>번호</th>
		<th>인덱스</th>
		<th>색상</th>
		</tr>
		
		<!-- 색상 배열을 불러올때 item사용 불러와서 s라고 변수 지정 -->
		<!-- varStatus는 상태변수!! 배열의 인덱스 번호가 될 수도 있고 1부터 출력되는 걍 번호가 될 수도 있음-->
		<c:forEach var="s" items="${list }" varStatus="i"> <!-- begin="2" end="4"를 같이 넣어주면 인덱스번호가 2~4까지 인 애들만 출력 -->
			<tr>
				<td>${i.count }</td> <!-- 무조건 1부터 출력...번호임! -->
				<td>${i.index }</td> <!-- 리스트의 실제 인덱스 값이 출력 -->
				<td style="color: ${s};">${s }</td>
			</tr>
		
		</c:forEach>
	</table>
</body>
</html>