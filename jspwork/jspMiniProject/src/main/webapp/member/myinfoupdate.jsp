<%@page import="data.dto.MemberDto"%>
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

	<script type="text/javascript">
		$(function(){
			
			//이메일
			$("#selEmail").change(function(){
				
				if($(this).val()=='-'){ //직접입력(-)이면
					$("#email2").val(''); //공란이고
				}else{ //그게 아니면
					$("#email2").val($(this).val()); //선택한 value값이 들어가야함 
				}
			});
		});
		
		//비밀번호 확인
		//비밀번호 다를때 액션 호출 안되게 해야 함 form에서 onsubmit="return passcheck(this)"
		function passcheck(f){
			
			if(f.pass.value!=f.pass2.value){
				alert("비밀번호가 서로 다릅니다");
				
				//입력 창들 다시 공란으로 해주고
				f.pass.value="";
				f.pass2.value="";
				
				return false; //비밀번호,비밀번호 확인이 다를 경우 action이 호출되지 않게
				
			}
			
		}
	</script>
	
</head>
<body>
	
	<%
	String num=request.getParameter("num");
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getData(num);
	%>
	<form action="member/myinfoupdateaction.jsp" method="post" class="form-inline" onsubmit="return passcheck(this)">
	 <input type="hidden" name="num" value="<%=num%>"> 
	 
		<table class="table table-bordered" style="width: 500px;">
		<caption><b>회원정보 수정</b></caption>
		
			<tr>
			<th width="100" bgcolor="#B4COD7">아이디</th>
				<td>
				<%=dto.getId() %>
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#B4COD7">비밀번호</th>
				<td>
				<input type="password" name="pass" class="form-control" required="required" style="width: 120px;" placeholder="비밀번호 입력">
				<input type="password" name="pass2" class="form-control" required="required" style="width: 120px;" placeholder="비밀번호 확인">
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#B4COD7">이름</th>
				<td>
				<input type="text" name="name" value="<%=dto.getName() %>" class="form-control" required="required" style="width: 120px;">
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#B4COD7">핸드폰</th>
				<td>
				<input type="text" name="hp" value="<%=dto.getHp() %>" class="form-control" required="required" style="width: 200px;">
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#B4COD7">주소</th>
				<td>
				<input type="text" name="addr" value="<%=dto.getAddr() %>" class="form-control" required="required" style="width: 400px;">
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#B4COD7">이메일</th>
				<td>
				<input type="text" name="email" id="email" class="form-control" required="required" style="width: 120px;">
				<b>@</b>
				<input type="text" name="email2" id="email2" class="form-control" required="required" style="width: 120px;">
				
				<select id="selEmail" class="form-control">
					<option value="-">직접 입력</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="daum.net">다음</option>
					<option value="nate.com">네이트</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-default" style="width: 100px;">저장</button>
				<button type="reset" class="btn btn-default" style="width: 100px;">초기화</button>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>