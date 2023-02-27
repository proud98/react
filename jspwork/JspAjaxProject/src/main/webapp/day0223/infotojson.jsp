<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	DbConnect db=new DbConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from info order by num";
	
	String s="["; //배열로 가져오는거라서 [ 이거 열어줌 일단
	
	try{                            
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		
		String num=rs.getString("num");
		String name=rs.getString("name");
		String hp=rs.getString("hp");
		String age=rs.getString("age"); //db에서 int여도 가져올때 string으로 가져와도 됨
		String photo=rs.getString("photo");
		
		s+="{"; //배열 안에 값 넣을때 기호 {이거 일단 열어줌
		s+="\"num\":"+num+",\"name\":\""+name+"\",\"hp\":\""+hp;  
		// "num":num일케 출력 시켜야함 
		s+="\",\"age\":"+age+",\"photo\":\""+photo+"\"";
		s+="},";
	}
		
	//반복문에서 ,가 계속 반복되니까 마지막 , 제거
	s=s.substring(0, s.length()-1); //0번 부터 길이에서 1개 빼주면 됨 
	
	}catch(SQLException e){
		
	}finally{
		db.dbClose(rs, pstmt, conn);
	}
	
	s+="]";
	%>
	
	<%=s%>