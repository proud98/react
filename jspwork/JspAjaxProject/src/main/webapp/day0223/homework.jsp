<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<style type="text/css">
		body{
			margin-left: 50px;
		}
	</style>
</head>
	
<body>

	<h3 style="color: gray;"><b>food - xml 읽기</b></h3>
	<button type="button" class="btn btn-info" id="btn1">food</button>
	
	<h3 style="color: gray;"><b>student - json 읽기</b></h3>
	<button type="button" class="btn btn-warning" id="btn2">student</button>
	
	<div id="show" style="margin-top: 20px; text-align: center;"></div>
	
	<script type="text/javascript">
	
	$("#btn1").click(function() {
		
		 $.ajax({
			 type: "get",
			 url:"foodXml.jsp",
			 dataType:"xml",
			 success:function(res){
				
				 var s="";
				 $(res).find("food").each(function(i,ele){
					
					 var n=$(ele);
					
					 s+="<div class='alert alert-info' style='width:300px;'>";
					 s+="번호: "+n.attr("num")+"<br>";
					 s+="음식이름: "+n.find("name").text()+"<br>";
					 s+="가격: "+n.find("price").text()+"원<br>";
					 s+="수량: "+n.find("cnt").text()+"<br>";
					 s+="<img src='"+n.find("photo").text()+"' width='100'>";
					 s+="</div>";
				 });
				
				 $("#show").html(s);
			 }
		 })
	});
	
	$("#btn2").click(function() {
		
		 $.ajax({
			
			 type: "get",
			 url:"studentJson.jsp",
			 dataType:"json",
			 success:function(res){
				
				 var s="";
				
				 $.each(res,function(i,item){
					
					 s+="<div class='alert alert-warning' style='width:300px;'>";
					 s+="index: "+i+"<br>";
					 s+="번호 :"+item.num+"<br>";
					 s+="이름: "+item.stuname+"<br>";
					 s+="java점수: "+item.java+"점<br>";
					 s+="ajax점수: "+item.ajax+"점<br>";
					 s+="<img src='"+item.stuphoto+"' width='100'>";
					 s+="</div><br>";
				 });
		
				 $("#show").html(s);
			 }
		 });
	});
	
	</script>
</body>
</html>