<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Patient)</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	<body>
		<nav>
			<ul>
				<li><a href="./patientView.jsp">Patient</a></li>
				<li><a href="./staffView.jsp">Staff</a></li>
				<li><a href="./appointment.jsp">Appointment</a></li>
			</ul>
		</nav>
		<h1>Clinic Master (Patient)</h1>
		<h2>Add Patient</h2>
		<div class="container d-flex justify-content-center align-items-center bg-primary-subtle w-50 h-50">
			<form action = "patientView.jsp" method = "GET">
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "name" placeholder = "Name" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "age" placeholder = "Age" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "address" placeholder = "Address" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "billingCard" placeholder = "Billing Card" size = "50">
				</div>
				<input type = "submit" class="btn btn-primary" value = "Add Patient to System">
			</form>
		</div>
		<%
		String db="clinicmaster"; 
		String user; // assumes database name is the same as username 
		  user = "hello";
		String password = "Hello123!";
		try 
		{ 
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
			Statement stmt = con.createStatement();
			String sql = String.format("INSERT INTO patient(name, age, address, billingCard, balance) VALUES('%s', %s, '%s',%s,%s)",request.getParameter("name"),request.getParameter("age"),request.getParameter("address"),request.getParameter("billingCard"),"0");
			stmt.executeUpdate(sql);		
			stmt.close();
			con.close();
		} 
		catch(SQLException e) 
		{
			out.println("SQLException caught: " + e.getMessage());
		}
		%>
		<h2>View/Edit Staff</h2>
		<table border="1">
			<tr>
				<td>Patient ID</td>
				<td>Name</td>
				<td>Age</td>
				<td>Address</td>
				<td>Billing Card</td>
				<td>Balance</td>
			</tr>		
			<% 
			try 
			{ 
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM patient");
				while (rs.next()) 
				{
					out.println("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getInt(5) + "</td><td>" + rs.getInt(6) + "</td></tr>");
				}
				rs.close();
				stmt.close();
				con.close();
			} 
			catch(SQLException e) 
			{
				out.println("SQLException caught: " + e.getMessage());
			}
			%>
		</table>
	</body>
	</html>