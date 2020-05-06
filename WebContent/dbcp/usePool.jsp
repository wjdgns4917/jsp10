<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>usePool.jsp</title>
</head>
<body>
<h2>usePool.jsp</h2>
<%
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Context initCtx=new InitialContext();
	Context envCtx=(Context)initCtx.lookup("java:comp/env");
	DataSource ds=(DataSource)envCtx.lookup("jdbc/noticeOrcl");
	con=ds.getConnection();
	
	String sql="select seq,title,content from notices";
	pstmt=con.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String seq=rs.getString("seq");
		String title=rs.getString("title");
		String content=rs.getString("content");
%>
<%=seq+" " %><%=title+" " %><%=content+" " %> <br />

<%		
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>


</body>
</html>