<%@page import="data.dao.ShopDao"%>
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
	<%
	//프로젝트 경로
	String root=request.getContextPath();
	%>
	
	<style type="text/css">
	div.cart{
	cursor: pointer;
	}
	
	div.carticon{
	float: right;
	}
	
	div.count{
	color: white;
	width: 30px;
	height: 30px;
	float: right;
	border-radius: 100px;
	line-height: 30px;
	text-align: center;
	background: red;
	}
	</style>
	
	<script type="text/javascript">
	//카트 누르면 마이카트로 이동
	$(function(){
		
		$(".cart").click(function(){
			
			location.href="index.jsp?main=shop/mycart.jsp";
		})
		
	});
	
	
	</script>
</head>
<body>
	<a href="<%=root%>" style="color: black;">
	<img alt="" src="미니언/11.png">
	JSP&Jquery 미니프로젝트<br><br>
	</a>
	
	<div style="float: right; padding-right: 100px;">
		<%
		//로그인세션 얻기 
		String loginok=(String)session.getAttribute("loginok");
		
		//아이디 얻기 ('ㅇㅇㅇ님 로그인중' 이라고 뜨게 하려면)
		String myid=(String)session.getAttribute("myid");
		
		MemberDao dao=new MemberDao();
		String name=dao.getName(myid);
		
		if(loginok==null){%>
			
			<button type="button" class="btn btn-default" style="width: 100px;" onclick="location.href='index.jsp?main=login/loginmain.jsp'">Login</button>
		<%}else{%>
			<b style="font-size: 12pt;"><%=name %>님 로그인 중</b>
			<button type="button" class="btn btn-default" style="width: 100px;" onclick="location.href='login/logoutaction.jsp'">Logout</button>
		<%}
		%>
		
		<!-- 장바구니 수량 -->
		<div class="cart">
		<%
		//shopdao선언
		ShopDao sdao=new ShopDao();
		//카트갯수 얻어오기
		int cartSize=sdao.getCartList(myid).size();
		%>
			
			<span class="carticon glyphicon glyphicon-shopping-cart"></span>
			<div class="count"><%=cartSize %></div>
		</div>
	</div>
</body>
</html>