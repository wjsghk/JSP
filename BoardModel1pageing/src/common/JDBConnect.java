package common;

import java.sql.*;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;	
	
	public JDBConnect() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,"musthave","1234");
		}catch(Exception e){
			e.printStackTrace();		
		}
	}
	
	public JDBConnect(String driver, String url, String id, String pwd) {
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url,id,pwd);
		}catch(Exception e){
			e.printStackTrace();		
		}
	}
	
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			con = DriverManager.getConnection(url,id,pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
