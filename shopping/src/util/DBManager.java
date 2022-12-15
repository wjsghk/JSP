package util;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/myoracle");
			conn = ds.getConnection();	
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn,PreparedStatement pstmt,ResultSet rset){
		if(rset != null) {
			try {
				rset.close();
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		if(pstmt != null) {
			try {
				pstmt.close();
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		if(conn != null) {
			try {
				conn.close();
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void close(Connection conn,PreparedStatement pstmt){
		
		if(pstmt != null) {
			try {
				pstmt.close();
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		if(conn != null) {
			try {
				conn.close();
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	
	}
}
