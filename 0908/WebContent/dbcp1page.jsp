<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 한페이지에서 DBCP로 구현</title>
</head>
<body>

<%
		Connection conn=null;
		PreparedStatement pstmt=null;
	try{
		Context initContext=new InitialContext();
		Context envContext=(Context)initContext.lookup("java:/comp/env");
		DataSource ds=(DataSource)envContext.lookup("jdbc/orcl");
		// programmer가 지향하는 "낮은 결합도"★★★ == program이 유연해진다!
		
		conn=ds.getConnection();
		String sql="INSERT INTO TEST VALUES(?,?)";
		if(request.getParameter("name")!=null){
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("name"));
			pstmt.setString(2, request.getParameter("email"));
			pstmt.executeUpdate();
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	
%>

<form method="post">
	<input type="text" name="name">
	<input type="text" name="email">
	<input type="submit" value="add!">
</form>

<hr>

<%	
	try{
		String sql="SELECT * FROM TEST";
		pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			out.println(rs.getString("name")+"님 이메일 주소는"+rs.getString("email")+"입니다.<br>");
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch(Exception e) {
		System.out.println(e);
	}
	// DB연결이 해제되면 커넥션객체를 직접 소멸xxx 커넥션들이 
%>



</body>
</html>