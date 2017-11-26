<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>mini_Insta</title>
 </head>
 <body>
 <%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/board_data";
	String id = "root";
	String pass = "";
	int total = 0;
	
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM board";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		
		String sqlList = "SELECT NUM, TITLE, IMG, HIT from Board order by NUM DESC";
		rs = stmt.executeQuery(sqlList);
%>
  
<%
	if(total==0) {
%>
<table background ="img/insta_main1.png" width="675" height="1025" />
 	<tr>
 		<td align="left" valign="top">
 			<input type=image src="img/insta_upload_button.png" style="margin-top:-7px;" OnClick="window.location='write.jsp'"></td>
 		<td align="right" valign="top">
  	 		<input type=image src="img/insta_delete_button.png" style="margin-top:5px; margin-right:11px"></td>
	</tr>
</table>
<%
	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String title = rs.getString(2);
			String img = rs.getString(3);
			//String time = rs.getString(4);
			int hit = rs.getInt(4);
		
%>
 <table background ="img/insta_main1.png" width="675" height="1025" />
 	<tr>
 		<td align="left" valign="top">
 			<input type=image src="img/insta_upload_button.png" style="margin-top:-7px;" OnClick="window.location='write.jsp'"></td>
 		<td align="right" valign="top">
  	 		<input type=image src="img/insta_delete_button.png" style="margin-top:5px; margin-right:11px" OnClick="window.location='delete.jsp?idx=<%=idx%>'"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<img src= "upload_img/cat1.jpg" width="674" height="772"></td>
	</tr>
	<tr>
		<td align="left" valign="top"><input type=image src="img/insta_like_button.png" style="margin-bottom:97px; margin-left:9px;" OnClick=hit++></td>
		<td align="right" valign="top"><font size="+1" face="¸¼Àº°íµñ" style="margin-right:100px;"><br><b><%=hit %></font>
		</td>
	</tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>

</body> 
</html>
