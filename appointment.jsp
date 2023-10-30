<%@ page import="java.sql.*" %>
	<html>

	<head>
		<title>Clinic Master (Appointment)</title>
	</head>

	<body>
		<nav>
			<ul>
				<li><a href="./patientView.jsp">Patient</a></li>
				<li><a href="./staffView.jsp">Staff</a></li>
				<li><a href="./appointment.jsp">Appointment</a></li>
			</ul>
		</nav>
		<h1>Clinic Master (Appointment)</h1>
		<h2>Book Appointment</h2>
		<form>
			<input type = "text" name = "patientID" placeholder = "Patient ID" size = "50">
			<br>
			<input type = "text" name = "service" placeholder = "Service" size = "50">
			<br>
			<input type = "text" name = "staffID" placeholder = "Staff ID" size = "50">
			<br>
			<input type = "text" name = "room" placeholder = "Room" size = "50">
			<br>
			<input type = "datetime-local" name = "appointmentDate" placeholder = "Choose Appointment Date" size = "50">
			<br>
			<input type = "submit" value = "Book Appointment">
		</form>
		<h2>View Appointment for specific patient</h2>
		<form>
			<input type = "text" name = "patientID" id = "paitientID" placeholder = "Patient ID" size = "50">
			<br>
			<input type = "submit" value = "See Appointments">
		</form>
		<table border="1">
			<tr>
				<td>Appointment ID</td>
				<td>Doctor</td>
				<td>Date</td>
				<td>Time</td>
			</tr>
			<% 
			try 
            { 
                String db="clinicmaster"; 
                String user; // assumes database name is the same as username 
                user = "hello";
                String password = "Hello123!";
				java.sql.Connection con; 
                Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM appointments");
				while (rs.next()) {
					out.println("<tr><td>"+rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td></tr>");
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