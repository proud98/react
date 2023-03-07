<%@page import="data.dto.SmartDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>
	
	<style type="text/css">
	a:link,a:visited{
		text-decoration: none;
		color: black;
	}
	
	table{
	font-size: 13pt;
	
	}
	</style>
	
	<script type="text/javascript">
	$(function(){
		
		//전체체크(alldelcheck) 클릭시 체크값 얻어서 모든 체크값에 전달
		$(".alldelcheck").click(function(){
			
		var chk=$(this).is(":checked"); //is(":checked")로 전체 체크값 얻기 true,false만 반환
		
		//전체체크(alldelcheck) 값을 체크(alldel)에 전달
		$(".alldel").prop("checked", chk);
		});
		
		//체크 된 것 삭제 
		$("#btndel").click(function(){
			
			//최소 1개는 선택되어야지 삭제되게 해야 함
			var len=$(".alldel:checked").length; //체크 된 수(길이)를 len이라고 지정
			
			if(len==0){
				alert("최소 한 개 이상의 글을 선택해 주세요");
			}else{
				
				var a=confirm(len+"개의 글을 삭제하시겠습니까?");
				
				//체크된 글의 value(num)값 얻기 
				var n=""; //n이 기본값
				//each함수로 각각의 값을 얻을 것 임
				$(".alldel:checked").each(function(idx){
					
					//기본값인 n에 누적
					n+=$(this).val()+",";
					
				});
				
				//마지막 컴마는 제거 
				n=n.substring(0, n.length-1); //0번지부터 마지막번지(,는 제거)
				
				//삭제파일로 전송
				location.href="board/alldelete.jsp?nums="+n; //nums는 값이 누적되고 마지막 컴마가 제거된 n
			}
		});
		
		
	});
	</script>
	
	<%
   SmartDao dao=new SmartDao();
   
   int totalCount;
   int totalPage;//총페이지수
   int startPage;//각블럭의 시작페이지
   int endPage;//각블럭의 끝페이지
   int start; //각페이지의 시작번호
   int perPage=5; //한페이지에 보여질 글의 갯수
   int perBlock=5; //한블럭당 보여지는 페이지개수
   int currentPage; //현재페이지
   int no;
   
   //총개수
   totalCount=dao.getTotalCount();
   //현재페이지번호 읽기(단 null 일때는 1페이지로 설정)
   if(request.getParameter("currentPage")==null)
      currentPage=1;
   else
   currentPage=Integer.parseInt(request.getParameter("currentPage"));
   
   //총 페이지 갯수
   totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
   
   //각블럭의 시작페이지..현재페이지가 3(s:1,e:5) 6(s:6 e:10)
   startPage=(currentPage-1)/perBlock*perBlock+1;
   endPage=startPage+perBlock-1;
   
   //총페이지가 8. (6~10...endpage를 8로 수정해주어야 한다)
   if(endPage>totalPage)
      endPage=totalPage;
   
   //각페이지에서 불러올 시작번호
   start=(currentPage-1)*perPage;
   //각페이지에서 필요한 게시글 가져오기
   List<SmartDto> list=dao.getList(start, perPage);
   
   no=totalCount-(currentPage-1)*perPage;
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
   %>
</head>
	
<body>

   <div>
   <b style="font-size: 14pt;">총 <%=totalCount %>개의 글이 있습니다</b>
   <br><br>
   
   <table class="table table-bordered">
   <caption><b>스마트 게시판 목록</b></caption>
   	<tr>
   	<th width="80">번호</th>
   	<th width="400">제목</th>
   	<th width="120">작성자</th>
   	<th width="150">작성일</th>
   	<th width="60">조회</th>
   	</tr>
   	
   	<%
   	if(totalCount==0){%>
   		<tr>
   			<td colspan="5" align="center">
   			<h2>등록 된 게시글이 없습니다</h2>
   			</td>
   		</tr>
   	<%}else{
   		for(SmartDto dto:list){%>
   			<tr>
   				<td>
   				<input type="checkbox" class="alldel" value="<%=dto.getNum()%>">
   				&nbsp;&nbsp;
   				<%=no-- %>
   				</td>
   				<td>
   				<a href="index.jsp?main=board/detailview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"><%=dto.getSubject() %></a>
   				</td>
   				<td align="center"><%=dto.getWriter() %></td>
   				<td><%=sdf.format(dto.getWriteday()) %></td>
   				<td><%=dto.getReadcount() %></td>
   			</tr>
   		<%}
   	}
   	%>
   	
   	<tr>
   		<td colspan="5">
   		<input type="checkbox" class="alldelcheck">전체선택
   		<span style="float: right;">
   		
   		<button type="button" class="btn btn-default" id="btndel" >
   		<span class="glyphicon glyphicon-trash">삭제</span>
   		</button>
   		&nbsp;
   		<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=board/smartform.jsp'">
   		<span class="glyphicon glyphicon-pencil">글쓰기</span>
   		</button>
   		
   		</span>
   		</td>
   	</tr>
   
   
   </table>
   </div>
     
  
  <!-- 페이징처리 -->
		<div style="width: 500px; text-align: center;" class="container">
		<ul class="pagination">
			<%
			
			//이전
			if(startPage>1){
				%>
				<li>
					<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
				</li>
			<%}
			
			
			for(int pp=startPage;pp<=endPage;pp++){
				
				if(pp==currentPage){
					%>
					<li class="active">
						<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<% } else{
					%>
					<li>
						<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<%}
				
			}
			
			//다음
			if(endPage<totalPage){
				%>
				<li>
					<a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
				</li>
			<%}
			%>
		</ul>
	</div>
     
</body>
</html>