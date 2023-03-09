<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
	
	<style type="text/css">
	img.photo{
	width: 200px;
	height: 230px;
	margin-bottom: 10px;
	
	}

	</style>

	<script type="text/javascript">
		//$("#tabs").tabs();
		
		//a태그에 심어둔 godetail로 상품 클릭하면 detail페이지로 넘어가게
		$(function(){
			$("a.godetail").click(function(){
				
				var shopnum=$(this).attr("shopnum");
				//alert(shopnum);
				
				//디테일 페이지로 이동
				location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
			});
		});

	</script>
</head>
<body>
	<%
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllSangpum();
	%>
	<!-- 
	<div id="tabs">
		<a href="#
">전체</a>
		<a href="#tabs-2">미니언</a>
		<a href="#tabs-3">카카오</a>
		<a href="#tabs-4">기타</a>
		<a href="#tabs-5">기타2</a>
		<a href="#tabs-6">기타3</a>
	</div>
	 -->
<div class="container">

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#tabs-1">전체목록</a></li>
    <li><a data-toggle="tab" href="#tabs-2">미니언</a></li>
    <li><a data-toggle="tab" href="#tabs-3">카카오</a></li>
    <li><a data-toggle="tab" href="#tabs-4">기타</a></li>
    <li><a data-toggle="tab" href="#tabs-5">기타2</a></li>
    <li><a data-toggle="tab" href="#tabs-6">기타3</a></li>
  </ul>

<div class="tab-content">
	 <div id="tabs-1"  class="tab-pane fade in active">
	 	<p>
	 	<table class="table table-bordered">
	 	<caption><b>전체상품</b></caption>
	 		<tr>
	 		<%
	 		NumberFormat nf=NumberFormat.getCurrencyInstance();

	 		int i=0;
	 		
	 		for(ShopDto dto:list){
	 			
	 			//이미지
	 			String photo=dto.getPhoto();	
	 			
	 			//그냥 랜던으로 20~30까지 난수 발생해서 할인하기
	 			int sale=(int)(Math.random()*11)+20; //중간 숫자에 1을 더해줌
	 		%>
	 			<td>
	 			<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
	 			<img src="shopsave/<%=photo %>" class="photo"><br>
	 			<%=dto.getSangpum() %>
	 			<b style="color: red; font-size: 1.3em;"><%=sale %>%</b>
	 			
	 			<span style="float: right;">
	 				<div style="color: gray; font-size: 13px;">
	 				<%
	 				int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	 				%>
	 				<strike><%=nf.format(price) %></strike>
	 				</div>
	 				
	 				<div style="color: black; font-size: 16px;">
	 				<%=nf.format(dto.getPrice()) %>
	 				</div>
	 			
	 			</span>
	 			</a>
	 			</td>
	 			
	 			<%
	 			if((i+1)%4==0){%>
	 				</tr>
	 				<tr>
	 			<%}
	 			i++;
	 			
	 			}
	 		%>
	 		</tr>
	 	</table>
	 </p>
	 </div>
	 
	 <div id="tabs-2" class="tab-pane fade">
	 	<p>
	 	<table class="table table-bordered">
	 	<caption><b>미니언</b></caption>
	 		<tr>
	 		<%
	 		nf=NumberFormat.getCurrencyInstance();

	 		i=0;
	 		
	 		for(ShopDto dto:list){
	 			
	 			if(dto.getCategory().equals("미니언")){
	 				
	 			//이미지
	 			String photo=dto.getPhoto();	
	 			
	 			//그냥 랜던으로 20~30까지 난수 발생해서 할인하기
	 			int sale=(int)(Math.random()*11)+20; //중간 숫자에 1을 더해줌
	 		%>
	 			<td>
	 			<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
	 			<img src="shopsave/<%=photo %>" class="photo"><br>
	 			<%=dto.getSangpum() %>
	 			<b style="color: red; font-size: 1.3em;"><%=sale %>%</b>
	 			
	 			<span style="float: right;">
	 				<div style="color: gray; font-size: 13px;">
	 				<%
	 				int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	 				%>
	 				<strike><%=nf.format(price) %></strike>
	 				</div>
	 				
	 				<div style="color: black; font-size: 16px;">
	 				<%=nf.format(dto.getPrice()) %>
	 				</div>
	 			
	 			</span>
	 			</a>
	 			</td>
	 			
	 			<%
	 			if((i+1)%4==0){%>
	 				</tr>
	 				<tr>
	 			<%}
	 			i++;
	 			
	 			}
	 		}
	 		%>
	 		</tr>
	 	</table>
	 </p>
	 </div>
	 
	 <div id="tabs-3" class="tab-pane fade">
	 	<p>
	 	<table class="table table-bordered">
	 	<caption><b>카카오</b></caption>
	 		<tr>
	 		<%
	 		nf=NumberFormat.getCurrencyInstance();

	 		i=0;
	 		
	 		for(ShopDto dto:list){
	 			
	 			if(dto.getCategory().equals("카카오")){
	 				
	 			
	 			//이미지
	 			String photo=dto.getPhoto();	
	 			
	 			//그냥 랜던으로 20~30까지 난수 발생해서 할인하기
	 			int sale=(int)(Math.random()*11)+20; //중간 숫자에 1을 더해줌
	 		%>
	 			<td>
	 			<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
	 			<img src="shopsave/<%=photo %>" class="photo"><br>
	 			<%=dto.getSangpum() %>
	 			<b style="color: red; font-size: 1.3em;"><%=sale %>%</b>
	 			
	 			<span style="float: right;">
	 				<div style="color: gray; font-size: 13px;">
	 				<%
	 				int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	 				%>
	 				<strike><%=nf.format(price) %></strike>
	 				</div>
	 				
	 				<div style="color: black; font-size: 16px;">
	 					<%=nf.format(dto.getPrice()) %>
	 				</div>
	 			
	 			</span>
	 			</a>
	 			</td>
	 			
	 			<%
	 			if((i+1)%4==0){%>
	 				</tr>
	 				<tr>
	 			<%}
	 			i++;
	 			
	 			}
	 		}
	 		%>
	 		</tr>
	 	</table>
	 	</p>
	 </div>
	 
	 <div id="tabs-4" class="tab-pane fade">
	 	<p>
	 	<table class="table table-bordered">
	 	<caption><b>기타</b></caption>
	 		<tr>
	 		<%
	 		nf=NumberFormat.getCurrencyInstance();

	 		i=0;
	 		
	 		for(ShopDto dto:list){
	 			
	 			if(dto.getCategory().equals("기타")){
	 				
	 			
	 			//이미지
	 			String photo=dto.getPhoto();	
	 			
	 			//그냥 랜던으로 20~30까지 난수 발생해서 할인하기
	 			int sale=(int)(Math.random()*11)+20; //중간 숫자에 1을 더해줌
	 		%>
	 			<td>
	 			<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
	 			<img src="shopsave/<%=photo %>" class="photo"><br>
	 			<%=dto.getSangpum() %>
	 			<b style="color: red; font-size: 1.3em;"><%=sale %>%</b>
	 			
	 			<span style="float: right;">
	 				<div style="color: gray; font-size: 13px;">
	 				<%
	 				int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	 				%>
	 				<strike><%=nf.format(price) %></strike>
	 				</div>
	 				
	 				<div style="color: black; font-size: 16px;">
	 				<%=nf.format(dto.getPrice()) %>
	 				</div>
	 			
	 			</span>
	 			</a>
	 			</td>
	 			
	 			<%
	 			if((i+1)%4==0){%>
	 				</tr>
	 				<tr>
	 			<%}
	 			i++;
	 			
	 			}
	 		}
	 		%>
	 		</tr>
	 	</table>
	 	</p>
	 </div>
	 
	 <div id="tabs-5" class="tab-pane fade">
	 	<p>
	 	<table class="table table-bordered">
	 	<caption><b>기타2</b></caption>
	 		<tr>
	 		<%
	 		nf=NumberFormat.getCurrencyInstance();

	 		i=0;
	 		
	 		for(ShopDto dto:list){
	 			
	 			if(dto.getCategory().equals("기타2")){
	 				
	 			
	 			//이미지
	 			String photo=dto.getPhoto();	
	 			
	 			//그냥 랜던으로 20~30까지 난수 발생해서 할인하기
	 			int sale=(int)(Math.random()*11)+20; //중간 숫자에 1을 더해줌
	 		%>
	 			<td>
	 			<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
	 			<img src="shopsave/<%=photo %>" class="photo"><br>
	 			<%=dto.getSangpum() %>
	 			<b style="color: red; font-size: 1.3em;"><%=sale %>%</b>
	 			
	 			<span style="float: right;">
	 				<div style="color: gray; font-size: 13px;">
	 				<%
	 				int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	 				%>
	 				<strike><%=nf.format(price) %></strike>
	 				</div>
	 				
	 				<div style="color: black; font-size: 16px;">
	 				<%=nf.format(dto.getPrice()) %>
	 				</div>
	 			
	 			</span>
	 			</a>
	 			</td>
	 			
	 			<%
	 			if((i+1)%4==0){%>
	 				</tr>
	 				<tr>
	 			<%}
	 			i++;
	 			
	 			}
	 		}
	 		%>
	 		</tr>
	 	</table>
	 	</p>
	 </div>
	 
	 <div id="tabs-6" class="tab-pane fade">
	 	<p>
	 	<table class="table table-bordered">
	 	<caption><b>기타3</b></caption>
	 		<tr>
	 		<%
	 		nf=NumberFormat.getCurrencyInstance();

	 		i=0;
	 		
	 		for(ShopDto dto:list){
	 			
	 			if(dto.getCategory().equals("기타3")){
	 				

	 			//이미지
	 			String photo=dto.getPhoto();	
	 			
	 			//그냥 랜던으로 20~30까지 난수 발생해서 할인하기
	 			int sale=(int)(Math.random()*11)+20; //중간 숫자에 1을 더해줌
	 		%>
	 			<td>
	 			<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
	 			<img src="shopsave/<%=photo %>" class="photo"><br>
	 			<%=dto.getSangpum() %>
	 			<b style="color: red; font-size: 1.3em;"><%=sale %>%</b>
	 			
	 			<span style="float: right;">
	 				<div style="color: gray; font-size: 13px;">
	 				<%
	 				int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	 				%>
	 				<strike><%=nf.format(price) %></strike>
	 				</div>
	 				
	 				<div style="color: black; font-size: 16px;">
	 				<%=nf.format(dto.getPrice()) %>
	 				</div>
	 			
	 			</span>
	 			</a>
	 			</td>
	 			
	 			<%
	 			if((i+1)%4==0){%>
	 				</tr>
	 				<tr>
	 			<%}
	 			i++;
	 			
	 			}
	 		}
	 		%>
	 		</tr>
	 	</table>
	 	</p>
	 </div>
</div>	 
</div>	 
</body>
</html>