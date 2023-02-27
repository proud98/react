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
	<img alt="" src="../image/f19.png">
	<br>
	<button type="button" class="btn btn-info" id="btn1">data1.xml읽기</button>
	<button type="button" class="btn btn-success" id="btn2">data1.json읽기</button>
	<br>
	<div id="result">결과</div>
	
	<script type="text/javascript">
	
		$("#btn1").click(function (){
			
			$("#result").empty();
			
			//xml읽기
			$.ajax({
				type: "get", //타입은 get 
				url: "data1.xml", //읽을 파일 주소( 같은 파일 안에 있어서 ../ 굳이 안써줌)
				dataType: "xml", //읽을 파일의 형태
				success: function(data){
					
					var s="City: "+$(data).find("name").attr("city")+"<br>"; //상위값 말고 하위값 찾을 때는 attr 속성으로 찾기
					s+="Name: "+$(data).find("name").text()+"<br>";
					s+="Age: "+$(data).find("age").text()+"<br>";
					
					//result에 누적해온 s 출력 출력
					$("#result").append(s); 
				},
				
				//읽기 실패시 alert창 띄워주기
				statusCode:{
					404:function(){
						alert("xml 파일을 찾을 수 없어요");
					},
					500:function(){
						alert("서버오류! 코드 다시 보세요");
					}
				}
			});
			
		});
		
		//json읽기
		$("#btn2").click(function(){
			
			$("#result").empty(); //전 결과물은 지워주기
			
			$.ajax({
				
				type: "get",
				url: "data1.json",
				dataType: "json",
				success: function(data){
					
					var s=""; //누적할 s 변수 선언
					s+="이름: "+data.name+"<br>";
					s+="주소: "+data.addr+"<br>";
					s+="점수: "+data.score+"<br>"; 
					
					//result에 누적해온 s 출력 출력
					$("#result").append(s);
					
				}
			});
			
		});
	</script>
	
</body>
</html>