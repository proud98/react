<%@page import="myshop.model.myshopDto"%>
<%@page import="java.util.List"%>
<%@page import="myshop.model.myshopDao"%>
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
	myshopDao dao=new myshopDao();
	List<myshopDto> list=dao.selectShop();
	request.setAttribute("list", list);
	%>
	
	<div style="margin: 30px 30px;">
		<h3 class="alert alert-danger" style="width: 800px;">MyShop출력</h3>
		<br>
		
		<table class="table table-bordered" style="width: 800px;">
			<tr>
			<th width="50">No.</th>
			<th width="300">상품명</th>
			<th width="150">가격</th>
			<th width="150">입고일</th>
			<th width="200">등록일</th>
			</tr>
			
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
				<td>${i.count }</td>
				<td><img src="../image/${dto.photo }.jpg" style="width: 50px; height: 50px;">
				${dto.sangpum }</td>
				
				<td>
				<fmt:formatNumber value="${dto.price }" type="currency" />
				<br>
				<c:if test="${dto.price>=5000 }">
				<b style="color: red;">고가 제품입니다</b>
				</c:if>
				<c:if test="${dto.price<=4000 }">
				<b style="color: blue;">저가 제품입니다</b>
				</c:if>
				</td>
				
				<td>${dto.ipgoday }</td>
								
				<td>${dto.writeday }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
</body>
</html>