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

<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<body>
	
	<div style="margin-top: 50px;" align="center" >
		
		<b>선택</b>&nbsp;&nbsp;
		<select id="image">
			<option value="01">학생1</option>
			<option value="02">학생2</option>
			<option value="03">학생3</option>
			<option value="04">학생4</option>
			<option value="05">학생5</option>
			<option value="06">학생6</option>
		</select>
		
		<br><br>
		<b>국어 점수</b><input type="text" id="kor" class="form-control"  style="width:80px;"><br>
		<b>영어 점수</b><input type="text" id="eng" class="form-control" style="width:80px;"><br>
		<b>수학 점수</b><input type="text" id="mat" class="form-control" style="width:80px;"><br>
		
		<button type="button" id="btn" class="btn btn-info">전송</button>
		<br><br>
		<div id="result"></div>
		
	</div>
	
	<script type="text/javascript">
		$("#btn").click(function(){
			
			var imageno=$("#image").val();
			var imagestu=$("#image option:selected").text();
			
			var kor=$("#kor").val();
			var eng=$("#eng").val();
			var mat=$("#mat").val();
			
			var s="imageno="+imageno+"&imagestu="+imagestu+"&kor="+kor+"&eng="+eng+"&mat="+mat;
			
			$.ajax({
				
				type:"get",
				url:"read1.jsp",
				dataType:"json",
				data:s,
				success:function(res){
					
					var print="<img src='"+res.photo+"'><br>";
					print+="<h4><b>학생명: "+res.student+"</b></h4><br>";
					print+="<h4>국어점수: "+res.kor+"</h4>";
					print+="<h4>영어점수: "+res.eng+"</h4>";
					print+="<h4>수학점수: "+res.mat+"</h4><br>";
					print+="<h4>합계: "+res.tot+"</h4>";
					print+="<h4>평균: "+res.avg+"</h4>";
					
					$("#result").html(print);
					
				}
			});
			
		});
	
	</script>
</body>
</html>