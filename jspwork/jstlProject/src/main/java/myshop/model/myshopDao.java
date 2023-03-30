package myshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import mysql.db.DbConnect;

public class myshopDao {
 
	DbConnect db=new DbConnect();
	
	//insert
	public void insertShop(myshopDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into myshop values(null,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//물음표 4개 바인딩
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//select
	public Vector<myshopDto> selectShop(){
		
		
		Vector<myshopDto> list=new Vector<>();
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from myshop order by num";
		
		Connection conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				myshopDto dto=new myshopDto();
				
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(Integer.parseInt(rs.getString("price")));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}return list;
		
		
	}
}
