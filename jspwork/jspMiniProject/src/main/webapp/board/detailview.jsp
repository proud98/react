<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
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
	table{
	font-size: 13pt;
	
	}
</style>

	<script type="text/javascript">
		$(function(){
			
			//처음에 시작시 리스트 호출

			//insert
			$("#btnanswer").click(function(){
				
				//댓글부분에 넣을 num을 호출
				var num=$("#num").val();
				var nickname=$("#nickname").val();
				var content=$("#content").val();
				
				$.ajax({
		            
		            type:"post",
		            dataType:"html",
		            url:"smartanswer/insertanswer.jsp",
		            data:{"num":num,"nickname":nickname,"content":content},
		            success:function(res){
		               
		               list();
		               
		               
		               $("#nickname").val("");
		               $("#content").val("");
		            }
		            
		         });
			});
			
			
		});
		
		//list 사용자정의함수
		function list(){
			
		}
		
	</script>
	
</head>
<body>
	<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//dao선언
	SmartDao dao=new SmartDao();
	
	//조회수증가
	dao.updateReadCount(num);
	
	//dto가져오기
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
	
	<div style="margin: 30px; 30px;">
	
		<input type="hidden" id="num" value="<%=num%>"> 
		
		<table class="table rable-bordered">
		<caption><b><%=dto.getSubject() %></b></caption>
			
			<tr>
				<td>
				<b>작성자: <%=dto.getWriter() %></b><br>
				<span><%=sdf.format(dto.getWriteday())%>&nbsp;&nbsp; 조회:<%=dto.getReadcount() %></span>
				</td>
			</tr>
			
			<tr>
				<td><%=dto.getContent() %></td>
			</tr>
			
			<!-- 댓글 -->
     	 	<tr>
         		<td>
	            <b class="acount">댓글 <span>0</span></b>
	            <div class="alist">댓글목록</div>
            
	            <div class="aform form-inline">
	            
	              <input type="text" id="nickname" class="form-control" style="width: 100px;" placeholder="닉네임입력">
	              <input type="text" id="content" class="form-control" style="width: 300px;" placeholder="댓글입력">
	              <button type="button" id="btnanswer" class="btn btn-default">저장</button>
				</div>
         		</td>
      		</tr>
			
			<tr>
				<td align="right"> 
				<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
				<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=num %>&currentPage=<%=currentPage%>'">수정</button>
				<button type="button" class="btn btn-default" onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
				<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
				</td>
			</tr>
		</table>
	</div>
	
	<script type="text/javascript">
	
		function funcdel(num,currentPage){
			
			//alert(num+","+currentPage);
			
			var a=confirm("삭제 하려면 [확인]을 누르시오");
			
			if(a){
				location.href="board/deleteboard.jsp?num="+num+"&currentPage="+currentPage;
			}
			
		}
	</script>
</body>
</html>