<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
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

	<style type="text/css">
	
	</style>
	<%
	String shopnum=request.getParameter("shopnum");
	
	//로그인상태
	String loginok=(String)session.getAttribute("loginok");
	//로그인한 아이디
	String myid=(String)session.getAttribute("myid");
	
	//아이디에 해당하는 멤버의 시퀀스 번호
	MemberDao mdao=new MemberDao();
	String num=mdao.getNum(myid);
	
	//해당상품에 대한 데이터
	ShopDao sdao=new ShopDao();
	ShopDto dto=sdao.getShopData(shopnum);

	%>
</head>
<body>
	<form id="frm">
		<!--shopnum,num hidden으로   -->
		<input type="hidden" name="shopnum" value="<%=shopnum %>">
		<input type="hidden" name="num" value="<%=num %>">
		
		<table style="width: 800px;">
			<tr>
				<td style="width: 500px;">
				<img alt="" src="shopsave/<%=dto.getPhoto() %>" class="large img-thumbnail">
				</td>
				
				<td style="width: 300px;">
				<h2>카테고리: <%=dto.getCategory() %></h2>
				<h2>상품명: <%=dto.getSangpum() %></h2>
				<%
				NumberFormat nf=NumberFormat.getCurrencyInstance();
				%>
				<h2>가격: <%=nf.format(dto.getPrice()) %></h2>
				
				<!-- 갯수 선택 -->
				<h2>갯수: 
				<input type="number" min="1" max="10" value="1" step="1" name="cnt">
				</h2>
				
				<div style="margin-top: 100px; margin-left: 60px;">
				<button type="button" class="btn btn-default" style="width: 100px;" id="btncart">장바구니</button>
				<button type="button" class="btn btn-default" style="width: 100px;" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
				</div>
				
				</td>
			</tr>
		
		</table>
		
		<script type="text/javascript">
			
			$("#btncart").click(function(){
				
				//form태그 모든 값 가져오기(name)
				var formdata=$("#frm").serialize();
				alert(formdata);
				
				$.ajax({
					
					type:"post",
					dataType:"html",
					data:formdata,
					url:"shop/detailproc.jsp",
					success:function(){
						
						//alert("성공");
						
						var a=confirm("장바구니 저장 \n확인 버튼 클릭시 장바구니로 이동");
						
						if(a){
							
							location.href="index.jsp?main=shop/mycart.jsp";
						}
					}
					
					
				});
			});
		</script>
		
	</form>
	
</body>
</html>