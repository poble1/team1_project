<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
			
<%
	request.setCharacterEncoding("euc-kr");
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/board_data";
String id = "root";
	String pass = "";
	int idx = Integer.parseInt(request.getParameter("idx"));

	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "DELETE from Board WHERE NUM=" + idx;	
		stmt.executeUpdate(sql);	 
%>
 		<script language=javascript>
  			self.window.alert("�ش� ���� �����Ͽ����ϴ�.");
  			location.href="content_img.jsp";
 		</script>
<%
		stmt.close();
		conn.close();
		
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>
