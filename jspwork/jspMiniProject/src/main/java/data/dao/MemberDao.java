package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.db.DbConnect;

public class MemberDao {
	
	DbConnect db=new DbConnect();
	
	//id 중복체크 
	//int(0,1)나 boolean(true,false) 이랑 같음! 인자값으로는  id 넘기기
	public int isIdCheck(String id) {
		
		int isid=0; //일단은 없는걸로(0)
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from member where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			//해당 아이디가 존재하면 1을 반환하고 존재하지 않으면 0을 반환
			if(rs.next()) {
				
				isid=rs.getInt(1);
				/* if(rs.getInt(1)==1)
				 * isid=1;
				 * 지난번에는 이렇게 했음!! 
				 */	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return isid;
	}
	
	//id에 따른 name값 리턴
	public String getName(String id) {
		
		String name=null;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			//id만 조회하면 되니까 if문 사용
			if(rs.next())
				name=rs.getString("name");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	}
	
	//insert

}
