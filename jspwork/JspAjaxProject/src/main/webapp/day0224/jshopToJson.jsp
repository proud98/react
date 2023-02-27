<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%
	DbConnect db=new DbConnect();
	Connection conn=db.getConnection();
	Statement stmt=null;
	ResultSet rs=null;
	
	String sql="select * from jshop order by num";
	
	try{
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		
		//while문 안에서 각각의 객체 가져 올 것 임 
		JSONArray arr=new JSONArray(); //생성만 해두고
		
		while(rs.next()){
			
			String num=rs.getString("num");
			String sangpum=rs.getString("sangpum");
			String color=rs.getString("color");
			String price=rs.getString("price");
			String imagename=rs.getString("imagename");
			
			JSONObject ob=new JSONObject();
			//key 값에 대한 value값 담기
			ob.put("num", num);
			ob.put("sangpum", sangpum);
			ob.put("color", color);
			ob.put("price", price);
			ob.put("imagename", imagename);
			
			//배열에 담기
			arr.add(ob);
			
		}%>
			<%=arr.toString() %>
			
	<%}catch(SQLException e){
		
	}
	
	
	%>