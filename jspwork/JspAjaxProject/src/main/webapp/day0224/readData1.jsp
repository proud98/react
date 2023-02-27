<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
      href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap"
      rel="stylesheet"
    />
<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
 	
 	<style type="text/css">
 		div.box{
 		
 		folat: left;
 		margin-left: 20px
 		
 		}
 	</style>   
    <script type="text/javascript">
 
    $(function(){
    	
    	$("#btn1").click(function(){
    		
    		$.ajax({
    			
    			type:"get",
    			url: "jsondata1.json",
    			dataType: "json",
    			success: function(res){
    				
    				var s="<h3 class='alert alert-danger'>Json데이터 출력</h3>";
    				
    				$.each(res,function(i,item){
    					
    					s+="<div class='alert alert-warning box'>";
    					s+=(i+1)+"번 째 데이터<br>";
    					s+="Name: "+item.name+"<br>"
    					s+="Hobby: ";
    					if(item.hobby==null){
    						s+="취미 없음";
    					}else{
    						
    						//취미는 배열,,, 배열 형태인 이치문으로 반복 배열안에 배열
    						$.each(item.hobby,function(i,h){
    							
    							s+="["+h+"]&nbsp;";
    						});
    					}
    					
    					s+="<br>";
    					s+="Age: "+item.age+"<br>";
    					s+="Kor: "+(item.score.kor==null?"미응시":item.score.kor+"점")+"<br>";
    					s+="Eng: "+(item.score.eng==null?"미응시":item.score.eng+"점")+"<br>";
    					s+="Mat: "+(item.score.mat==null?"미응시":item.score.mat+"점")+"<br>";
    					s+="</div>";
    				});
    				$("#show").html(s);
    			}
    		});
    		
    	});
    	
		$("#btn2").click(function(){
    		
			$.ajax({
				
				type: "get",
				url: "xmldata1.xml",
				dataType: "xml",
				success: function(res){
					
					var s="<h3 class='alert alert-info'>XML데이터출력</h3>";
					
					$(res).find("data").each(function(i,ele){
						
						var row=$(ele);
						
						s+="<div class='alert alert--warning box'>";
						s+="아이디: "+row.attr("id")+"<br>";
						s+="이름: "+row.attr("name")+"<br>";
						s+="제목: "+row.find("subject").text()+"<br>";
						var imgname=row.find("photo").text();
						s+="이미지명: "+imgname+"<br>";
						s+="<img src='"+imgname+"' style='max-width:150px;'>";
						s+="</div>";
					});
					$("#show").html(s);
				}
			})
    		
    	});
    	
    });
    </script>

<title>Insert title here</title>
</head>
<body>
	 <button type="button" id="btn1" class="btn btn-info">json 읽기</button>
	 <button type="button" id="btn2" class="btn btn-success">json 읽기</button>
	 <hr>
	 <div id="show" class="alert alert-default"></div>
</body>
</html>