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

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
  <!--부트스트랩 사용시 모달창 같이 움직임이 있는 경우 bootstrap.min.js도 같이 복사해줘야함!!!! -->

<title>Insert title here</title>
<style type="text/css">
	table{
	font-size: 13pt;
	
	}
	
	div.alist{
	margin-left: 20px;
	}
	
	div.alist span.aday{
	
	}
</style>

	<script type="text/javascript">
		$(function(){
			
			//댓글부분에 넣을 num을 호출(전역변수로 쓸 것)
			var num=$("#num").val();
			
			//처음에 시작시 리스트 호출
			list();

			//댓글 insert
			$("#btnanswer").click(function(){

				var nickname=$("#nickname").val();
				var content=$("#content").val();
				
				$.ajax({
		            
		            type:"post",
		            dataType:"html",
		            url:"smartanswer/insertanswer.jsp",
		            data:{"num":num,"nickname":nickname,"content":content},
		            success:function(res){
		               
		            	//기존 입력값 지우기
		            	$("#nickname").val("");
			        	$("#content").val("");
			            
			        	//리스트 호출
		            	list();
		             
		            }
		            
		         });
			});
			
			//댓글삭제 (댓글 입력으로 생기는 이벤트이므로 on이벤트 사용)
			$(document).on("click",".adel",function(){
				
				var idx=$(this).attr("idx");
				//alert(idx);
				
				$.ajax({
					
					type: "get",
					dataType:"html",
					url:"smartanswer/deleteanswer.jsp",
					data:{"idx":idx},
					success:function(res){
						
						location.reload();
					}
				});
				
			});
			
			//수정폼 모달로 띄우가
			$(document).on("click",".amod",function(){
				
				idx=$(this).attr("idx"); //수정 할 때도 idx값 필요해서 var지워서 전역변수로 해주기
				//alert(idx);
				
				
				
				$.ajax({
					
					type:"get",
					url:"smartanswer/jsonupdateform.jsp",
					dataType:"json",
					data:{"idx":idx},
					success:function(res){
						
						//성공 했으면 모달창에 입력한 수정내용(unickname,ucontent)을 댓글창에 들어가게 하기
						$("#unickname").val(res.nickname);
						$("#ucontent").val(res.content); //res를 통해 가져 ㅇ content
						
					}
				});
				
				$("#myModal").modal();
				
			});
			
			//수정 역시 댓글 입력으로 생긴거라 onclick 이벤트로 하기
			$(document).on("click","#btnupdate",function(){
				
				var nickname=$("#unickname").val();
				var content=$("#ucontent").val();
				
				//alert(nickname+","+content);
				
				$.ajax({
					
					typs:"get",
					url:"smartanswer/updateanswer.jsp",
					dataType:"html",
					data:{"idx":idx,"nickname":nickname,"content":content}, //insert와 다른건 idx로 하기
					success:function(){
						
						list(); //성공 했을 땐 리스트 호출
					}
				});
				
			});
			
			
			
		});
		
		//list 사용자정의함수
		function list(){
			
			console.log("list num="+$("#num").val());
			
			$.ajax({
				
				type:"get",
				url:"smartanswer/listanswer.jsp",
				dataType:"json",
				data:{"num":$("#num").val()},//$("#num").val()을 num값으로 받아옴
				success:function(res){
					
					//댓글 갯수 출력
					$("b.acount>span").text(res.length);
					
					var s="";
					
					$.each(res,function(idx,item){
						
						s+="<div>"+item.nickname+":"+item.content;;
						s+="<span class='aday'>"+item.writeday+"</span>";
						s+="<button type='button' idx="+item.idx+" class='adel btn btn-default btn-xs'>삭제</button>";
						s+="<button type='button' idx="+item.idx+" class='amod btn btn-default btn-xs'>수정</button>";
						s+="</div>";
					});
					
					$("div.alist").html(s);
				}
			});
			
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
	            <b class="acount">댓글&nbsp;<span style="color: red;">0</span></b>
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
	
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	      
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">댓글수정</h4>
	        </div>
	        
	        <div class="modal-body">
		        <b>닉네임: </b>
		        <input type="text" id=unickname style="width: 100px;">
		        <b>댓글: </b>
		        <input type="text" id=ucontent style="width: 100px;">
	        </div>
	        
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate">수정</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>	
	
</body>
</html>