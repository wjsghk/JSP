<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<%@page import = "common.EmpConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	EmpConnect emp = new EmpConnect();
	
 	String updatesql = "update emp01 set deptno =? where deptno =?";
 	PreparedStatement psmt2 = emp.con.prepareStatement(updatesql);
 	psmt2.setInt(1,10); //1=> 첫번째 물음표
 	psmt2.setInt(2,30); //2=> 2번째 물음표
 	psmt2.executeUpdate();
	
// 	String deletesql = "delete from emp01 where deptno = ?";
// 	PreparedStatement psmt3 = emp.con.prepareStatement(deletesql);
// 	psmt3.setInt(1,10); //10인 deptno을 삭제하겠다.
// 	psmt3.executeUpdate();
	
	String sql = "select * from emp01";
	PreparedStatement psmt = emp.con.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
	
	while(rs.next()){
		int empno = rs.getInt(1);
		String ename =rs.getString(2);
		String job =rs.getString(3);
		int mgr = rs.getInt(4);
		String hiredate =rs.getString(5); //날짜는 String타입으로도 가능하다.
		int sal = rs.getInt(6);
		int comm = rs.getInt(7);
		int deptno = rs.getInt(8);
		
		out.println(String.format("%d %s %s %d %s %d %d %d",empno,ename,job,mgr,hiredate ,sal,comm,deptno )+"<br/>");
	}
		emp.close();
		
	
	%>
</body>
</html>