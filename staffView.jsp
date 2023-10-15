<%@ page import="java.sql.*" %>
	<html>

	<head>
		<title>Clinic Master (Staff)</title>
	</head>

	<body>
		<h1>Clinic Master (Staff)</h1>
		<h2>Add Staff</h2>
		<form>
			<input type = "text" name = "name" id = "name" placeholder = "Name" size = "50">
			<br>
			<input type = "text" name = "age" id = "age" placeholder = "Age" size = "50">
			<br>
			<input type = "text" name = "job" id = "job" placeholder = "Job" size = "50">
			<br>
			<input type = "text" name = "salary" id = "salary" placeholder = "Salary" size = "50">
			<br>
			<input type = "submit" value = "Add Patient to System">
		</form>
		<h2>View/Edit Staff</h2>
		<table border="1">
			<tr>
				<td>Staff ID</td>
				<td>Name</td>
				<td>Age</td>
				<td>Job</td>
				<td>Salary</td>
			</tr>
			<% 
			String db="clinicmaster"; 
			String user; // assumes database name is the same as username 
			user=""; 
			String password=""; 
			try { 
				java.sql.Connection con; Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				out.println(db + " database successfully opened.<br/><br/>" ); out.println("Initial entries in table \"Student\": <br />");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM Student");
				while (rs.next()) {
					out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + "<br /><br />");
				}
				rs.close();
				stmt.close();
				con.close();
			} 
			catch(SQLException e) {
				out.println("SQLException caught: " + e.getMessage());
			}
			%>
	</body>

	</html>