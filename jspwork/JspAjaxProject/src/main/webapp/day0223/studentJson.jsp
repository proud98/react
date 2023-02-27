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
	
	String sql="select * from student order by num";
	
	String s="[";
	
	try{                            
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
		
		String num=rs.getString("num");
		String stuname=rs.getString("stuname");
		String stuphoto=rs.getString("stuphoto");
		String java=rs.getString("java");
		String ajax=rs.getString("ajax");
		
        s+="{";
        s+="\"num\":"+num+",\"stuname\":\""+stuname+"\", \"stuphoto\":\""+stuphoto+"\",\"java\":"+java+",\"ajax\":"+ajax;
        s+="},";

		}
		
		s=s.substring(0, s.length()-1); 
	
	}catch(SQLException e){
		
	}finally{
		db.dbClose(rs, pstmt, conn);
	}
	
	s+="]";
	%>
	
	<%=s%>