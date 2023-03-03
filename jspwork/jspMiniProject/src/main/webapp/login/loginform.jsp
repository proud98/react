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
	//세션값 얻기
	String saveok=(String)session.getAttribute("saveok"); //saveok라고 저장되어 있는 세션값을 가져와서 saveok라고 해줌
	
	String myid="";
	
	//만약 체크가 되어 있으면 (saveok가 null이면)
	if(saveok!=null){
		myid=(String)session.getAttribute("myid");
		//myid라고 저장되어 있는 세션값을 가져옴 
	}
	
	%>
</head>
<body>
	<div style="margin-left: 130px;">
		<form action="login/loginaction.jsp" method="post">
			<table class="table table-bordered" style="width: 300px;">
			<caption><b>세션로그인</b></caption>
				<tr>
					<td colspan="2" align="center">
					<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked" %>>아이디저장
					<!-- saveok가 null이면 체크가 안되어있고 null이 아니면 체크 -->
					</td>
				</tr>
				
				<tr>
				<th width="100">아이디</th>
					<td>
					<input type="text" name="id" value="<%=myid %>" class="form-control" required="required" style="width: 120px;">
					</td>
				</tr>
				
				<tr>
				<th width="100">비밀번호</th>
					<td>
					<input type="password" name="pass" class="form-control" required="required" style="width: 120px;">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<button type="submit" class="btn btn-default" style="width: 120px ">로그인</button>
					</td>
				</tr>
				
				
			
			</table>
		
		</form>
	
	</div>
</body>
</html>