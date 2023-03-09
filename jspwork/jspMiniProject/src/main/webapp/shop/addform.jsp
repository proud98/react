<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<div style="margin: 30px 30px;">
		<form action="shop/addaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 600px;">
			<caption><b>상품등록</b></caption>
				<tr>
					<td style="width: 150ox;"><b>카테고리</b></td>
					<td>
					<select style="width: 200px;" name="category" class="form-control" required="required">
						<option value="미니언" selected="selected">미니언</option>
						<option value="카카오">카카오</option>
						<option value="기타">기타</option>
						<option value="기타2">기타2</option>
						<option value="기타3">기타3</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td style="width: 150ox;"><b>상품명</b></td>
					<td>
					<input type="text" name="sangpum" class="form-control" style="width: 200px;" placeholder="상품명 입력" required="required">
					</td>
				</tr>
				
				<tr>
					<td style="width: 150ox;"><b>상품사진</b></td>
					<td>
					<input type="file" name="photo" style="width: 300px;" class="form-control">
					</td>
				</tr>
				
				<tr>
					<td style="width: 150ox;"><b>상품가격</b></td>
					<td>
					<input type="text" name="price" class="form-control" style="width: 120px;" placeholder="가격 입력" required="required">
					</td>
				</tr>
				
				<tr>
					<td style="width: 150ox;"><b>입고일</b></td>
					<%
					//현재날짜 구하기
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					String day=sdf.format(new Date());
					%>
					<td>
					<input type="date" name="ipgoday" required="required" value="<%=day%>">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<button type="submit" class="btn btn-default">상품저장</button>
					<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
					</td>
				</tr>
				
				
			
			</table>
		</form>
	
	</div>
</body>
</html>