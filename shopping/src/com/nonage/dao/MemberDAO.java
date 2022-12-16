package com.nonage.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBManager;
import com.nonage.dto.MemberVO;


public class MemberDAO {

	private MemberDAO() {
	
	}
	
	private static MemberDAO instance=new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}

	public int confirmID(String id) {
		int result = -1;
		String sql = "select * from member where id = ?";
		
		Connection connn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		 try {
		 connn = DBManager.getConnection();
		 pstmt = connn.prepareStatement(sql);
		 pstmt.setString(1, id);
		 rs = pstmt.executeQuery();
		 
		 if (rs.next()) { 
		 result = 1;
		 } else { 
		 result = -1;
		 }
		 } catch (Exception e) {
		 e.printStackTrace();
		 } finally {
		 DBManager.close(connn, pstmt, rs);
		 }
		 return result;
	}
	
	
}
