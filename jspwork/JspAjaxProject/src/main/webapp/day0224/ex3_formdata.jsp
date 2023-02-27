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
</head>
<body>

	<div style="margin: 50px;">
	
		<b>사진선택: </b>
		<select id="selimage">
			<option value="10">학생1</option>
			<option value="11">학생2</option>
			<option value="12">학생3</option>
			<option value="13">학생4</option>
			<option value="14">학생5</option>
		</select>
		
		<br><br>
		자바점수: <input type="text" id="java">
		오라클점수: <input type="text" id="oracle">
		스프링점수: <input type="text" id="spring">
		
		<button type="button" id="btn1">데이터 전송</button>
		<br><br>
		<div id="result"></div>
	
	</div>
	
	<script type="text/javascript">
		$("#btn1").click(function(){
			
			var photono=$("#selimage").val();
			var photostu=$("#selimage option:selected").text(); // option:selected는 선택한 옵션에서 셀렉트 된 값의 텍스트
			
			//점수 input 가져오기
			var java=$("#java").val();
			var oracle=$("#oracle").val();
			var spring=$("#spring").val();
			
			var s="photono="+photono+"&photostu="+photostu+"&java="+java+"&oracle="+oracle+"&spring="+spring; //연결연산자 &으로 묶어주기
			
			$.ajax({
				
				type:"get",
				url:"ex3_receive.jsp",
				dataType:"json",
				data:s,
				success:function(res){
					
					//방법1
					// receive 파일의 ob.put하면서 key에 설정한 값으로 (res.key값)  
					var out="<img src='"+res.photo+"'><br>";
					out+="<h3>학생명: "+res.stu+"</h3>";
					out+="<h4>총 합계: "+res.tot+"</h4>";
					out+="<h4>평균: "+res.avg+"</h4>";
					
					$("#result").html(out);
					
					//방법2
					/* var p=res.photo;
					var s=res.stu;
					var t=res.tot;
					var a=res.avg;
					
					$("#result").html("<img src='"+p+"'><br><h2>학생명: "+s+"</h1><br><h3>총점: "+t+"</h3><br><h3>평균: "+a+"</h3>");*/
					
				}
			});
		});
	</script>
	
</body>
</html>