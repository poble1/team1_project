<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("euc-kr");

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/board_data";
String id = "root";
	String pass = "";
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO Board(TITLE,MEMO) VALUES(?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, title);
		pstmt.setString(2, memo);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
		
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="content_img.jsp"; 

</script>
