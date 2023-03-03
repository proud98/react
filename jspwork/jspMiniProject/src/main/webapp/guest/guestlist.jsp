<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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
	<style type="text/css">
	span.day{
	float: right;
	font-size: 11pt;
	color: gray;
	}
	</style>
<title>Insert title here</title>
	<%
	GuestDao dao=new GuestDao();
	
	//페이징처리
		int totalCount; //총 데이터 수
		int totalPage; //총 페이지 수
		int startPage; //각 블럭의 시작 페이지
		int endPage; //각 블럭의 끝 페이지
		int start; //각 페이지의 시작번호
		int perPage=3; //한 페이지에 보여질 글의 갯수 (5개)
		int perBlock=5; //보여질 블럭의 갯수 (5개)
		int currentPage; //현재 페이지
		//int no;
		
		//총 갯수 가져오기
		totalCount=dao.getTotalCount();
		
		//현재 페이지 번호 읽기 (단 null일 경우 1페이지로 두기)
		if(request.getParameter("currentPage")==null)
		    currentPage=1; //현재 페이지가 없으면(null)이면 1로 두고
		  else //그게 아니면 걍 현재 페이지
		    currentPage=Integer.parseInt(request.getParameter("currentPage")); 
		     
		//총 페이지 갯수
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//각 블럭의 시작 페이지 
		//ex) 현재 페이지가 3이면 start 페이지는 1가 보여지고 end 페이지는 5가 보여짐 
		//ex) 현재 페이지가 6이면 start 페이지는 6이고 end 페이지는 10
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		    
	    //ex) 총 페이지가 8이면 두 번쨰 블럭은 6부터 10이고 end 페이지는 8로 수정해주는 예외
		if(endPage>totalPage)
		   endPage=totalPage;
	    
	    //각 페이지에서 불러 올 시작번호
	    //ex) 현재 페이지가 만약 1이면 스타트 페이지는 1
	    start=(currentPage-1)*perPage; 
	    
	    //메서드 불러오기
	    //각 페이지에서 필요한 게시글들 가져오면 됨
	    //start 페이지에 대한 정의가 다 내려진 후 가져오기가 가능 함 
	    List<GuestDto> list=dao.getList(start, perPage);
	    
	    //int no : 각 글 앞에 붙여줄 번호
	    //현재 페이지에서 1씩 감소 하면서 번호 넣어주기 
	    //no=totalCount-(currentPage-1)*perPage;
	    
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    		
		%>
</head>
<body>
	<%
	//로그인상태 확인 후 입력폼 나타내기
	String loginok=(String)session.getAttribute("loginok");
	
	//id
	String myid=(String)session.getAttribute("myid");
	%>
	
	<% //로그인이 되어 있으면
	if(loginok!=null){%>
		
		<jsp:include page="addform.jsp"/>
		<hr align="left" width="800">
	<%}
	%>
	
	<div>
		<b>총 <%=totalCount %>개의 방명록 글이 있습니다</b>
		<%
		MemberDao mdao=new MemberDao();
		
		for(GuestDto dto:list){
			
			//이름 얻기
			String name=mdao.getName(dto.getMyid());
			%>
			<table class="table" style="width: 600px;">
				<tr>
					<td>
					<b><span class="glyphicon glyphicon-user"></span> <%=name %>(<%=dto.getMyid() %>)</b>
					<!-- name과 id 얻어오기 -->
					
					<%
					//로그인 한 아이디와 글을 쓴 아이디가 같을 경우에만 수정삭제가 보이게 하기(자기글만)
					if(loginok!=null && dto.getMyid().equals(myid)){%>
						
						&nbsp;&nbsp;&nbsp;
						<a href="index.jsp?main=guest/update.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>" style="color: black;">수정</a>
						<a>|</a>
						<a href="guest/delete.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: black;">삭제</a>
						<!-- num값을 넘기면서 &currentPage=으로 currentPage(현제페이지값)도 같이 넘기기 -->
						<!-- 수정삭제후 현제 페이지에 머물게 해줌 -->
					<%}
					%>
					<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					</td>
				</tr>
				
				<tr>
					<td>
					<!-- 이미지가 null이 아닌 경우만 이미지출력 -->
					<%
					if(dto.getPhotoname()!=null){%>
						
						<a href="save/<%=dto.getPhotoname() %>" target="_blank">
						<img alt="" src="save/<%=dto.getPhotoname() %>" align="left" style="width: 100px;">
						<!-- 요거 클릭시 이미지 크게보기 -->
						</a>
					<%}
					%>
					
					<%=dto.getContent().replace("\n","<br>") %>
					<!-- \n을 <br>로 인식해서 줄내림 해주겠다 -->
					</td>
				</tr>
			
			</table>
		<%}
		%>
	</div>
	
	<!-- 페이징처리 -->
		<div style="width: 500px; text-align: center; class="container">
		<ul class="pagination">
			<%
			
			//이전
			if(startPage>1){
				%>
				<li>
					<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
				</li>
			<%}
			
			
			for(int pp=startPage;pp<=endPage;pp++){
				
				if(pp==currentPage){
					%>
					<li class="active">
						<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<% } else{
					%>
					<li>
						<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<%}
				
			}
			
			//다음
			if(endPage<totalPage){
				%>
				<li>
					<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
				</li>
			<%}
			%>
		</ul>
	</div>
	
	
</body>
</html>
	
	
</body>
</html>