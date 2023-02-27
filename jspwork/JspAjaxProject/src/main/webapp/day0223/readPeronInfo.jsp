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
</head>
<body>

	<h2>jquery 의 ajax함수를 이용해서 person(xml)_db읽어오기</h2>
	<button type="button" class="btn btn-success" id="btn1">persontoxml읽기</button>
	
	<h2>jquery 의 ajax함수를 이용해서 info(json)_db읽어오기</h2>
	<button type="button" class="btn btn-success" id="btn2">infotojson읽기</button>
	
	<div id="show"></div>
	
	<script type="text/javascript">
	
	$("#btn1").click(function() {
		
		 $.ajax({
			 type: "get",
			 url:"persontoxml.jsp",
			 dataType:"xml",
			 success:function(res){
				
				 var s="";
				 $(res).find("person").each(function(i,ele){
					
					 var n=$(ele);
					
					 s+="<div class='alert alert-info' style='width:400px;'>";
					 s+="No: "+n.attr("num")+",";
					 s+="이름: "+n.find("name").text()+"<br>";
					 s+="나이: "+n.find("age").text()+"<br>";
					 s+="핸드폰: "+n.find("hp").text()+"<br>";
					 s+="</div>";
				 });
				
				 $("#show").html(s);
			 }
		 })
	});
	
	$("#btn2").click(function() {
		
		 $.ajax({
			
			 type: "get",
			 url:"infotojson.jsp",
			 dataType:"json",
			 success:function(res){
				
				 var s="";
				
				 $.each(res,function(i,item){
					
					 s+="<div class='alert alert-warning' style='width:300px;'>";
					 s+="index: "+i+"<br>";
					 s+="num :"+item.num+"<br>";
					 s+="이름: "+item.name+"<br>";
					 s+="핸드폰: "+item.hp+"<br>";
					 s+="나이: "+item.age+"<br>";
					 s+="<img src='"+item.photo+"' width='100'>";
					 s+="</div><br>";
				 });

				 $("#show").html(s);
			 }
		 });
	});
	
	</script>
</body>
</html>