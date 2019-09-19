<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>
<%
String db = "cs157a";// request.getParameter("cs157a"); //or root
String user = "root"; // assumes database name is the same as username

ResultSet rs;
try {
	//java.sql.Connection con;
	//Class.forName("org.gjt.mm.mysql.Driver");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, "MinnieLovesM3");
	out.println (db + " database successfully opened.");
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false","root","MinnieLovesM3");
		//here cs157a is database name, root is username and password
		Statement stmt=con.createStatement();
		rs=stmt.executeQuery("select * from cs157a.emp");
	while(rs.next())
		System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+ rs.getString(3));
	con.close();
	}catch(Exception e){ System.out.println(e);}
	
}
catch(SQLException e) {
	out.println("SQLException caught: " + e.getMessage());
}
%>
<table>
	<thead>
		<tr>
			<th> id </th>
			<th> name </th>
			<th> age </th>
		</tr>
	</thead>
	<tbody>
		<%
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false","root","MinnieLovesM3");
		Statement stmt=con.createStatement();
		rs=stmt.executeQuery("select * from cs157a.emp");
		while( rs.next() ) 
		{
		%>
		<tr>
			<td><%= rs.getInt("id") %> </td>
			<td><%= rs.getString("name") %> </td>
			<td><%= rs.getInt("age") %> </td>
		</tr>
		<%} %>
	</tbody>
	
</table>


</body>

</html>