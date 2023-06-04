<%@page import="java.util.Date"%>
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
<!--변수선언  -->
<c:set var="name" value="하랑" />
<c:set var="age" value="24" />
<c:set var="today" value="<%=new Date() %>" />

<!-- 변수출력 -->
<!-- c:out이 변수 출력이지만 생략가능 -->
<h2>이름: <c:out value="${name }"></c:out> </h2>
<h2>이름: ${name }</h2>
<h2>나이: ${age }</h2>
<h2>오늘날짜: ${today }</h2>

<pre>
<!-- pattern을 이용한 fmt날짜 형식 -->
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd a HH:mm"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEE"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEEE"/>
</pre>

<c:set var="money" value="660008"></c:set>	
<c:set var="num1" value="123.4567"></c:set>

<!-- jstl에서 숫자출력 양식 -->
<pre>
${money }
${num1 }

<!-- 3자리마다 컴마넣기 -->
<fmt:formatNumber value="${number }" type="number"/>

<!-- 3자리마다 컴마넣기, 화폐단위 -->
<fmt:formatNumber value="${number }" type="currency"/>

<!--pattern  -->
<fmt:formatNumber value="${num1 }" pattern="0.00"/>
<fmt:formatNumber value="1.2" pattern="0.00"/> <!--값이 없으면 00으로  -->
<fmt:formatNumber value="1.2" pattern="0.##"/> <!--값이 없으면 ##으로  -->
</pre>

</body>
</html>