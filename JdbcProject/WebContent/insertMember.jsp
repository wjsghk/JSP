<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertMember</title>
</head>
<body>
<!-- 	<h2>회원 추가 테스트(executeUpdate()서울)</h2> -->
	<%
// 	JDBConnect jdbc = new JDBConnect();
// 	String sql = "insert into member values(?,?,?,sysdate)";////동적커리문
// 	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
// 	psmt.setString(1,"test1");
// 	psmt.setString(2,"1111");
// 	psmt.setString(3,"회원1");
	
// 	int result = psmt.executeUpdate();
// 	if(result !=0){
// 		out.print("쿼리문 실행 완료");
// 	}else{
// 		out.print("쿼리문 실행 실패");
// 	}
// 	psmt.executeUpdate();////쿼리문 실행
// 	out.print("쿼리문 실행 완료");
	
// 	psmt.close();
// 	jdbc.close();////=> 실행을 하게되면 디벨로퍼에 member테이블에 추가된다. 실행을 할 떄마다 증가한다.
	%>
	<h2>회원 추가 테스트(executeQuery()서울)</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	String sql = "select * from member";  //정적쿼리문
	Statement stmt =jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql); 
	
	while(rs.next()){
		String id = rs.getString("id"); //rs.getString(1) 이렇게 써도 된다.
		String pw = rs.getString("pass");
		String name = rs.getString("name");
		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s",id,pw,name,regidate)+"<br/>");
	}
	
	// 변수명 rs->psmt->stmt->con 순서대로 닫혀준다

	jdbc.close();
	%>
</body>
</html>