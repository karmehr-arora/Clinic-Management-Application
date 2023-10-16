<%@ page import="java.sql.*" %>
	<html>

	<head>
		<title>Clinic Master (Patient)</title>
	</head>

	<body>
		<nav>
			<ul>
				<li><a href="/CS157A-Team1/patientView.jsp">Patient</a></li>
				<li><a href="/CS157A-Team1/staffView.jsp">Staff</a></li>
			</ul>
		</nav>
		<h1>Clinic Master (Patient)</h1>
		<h2>Add Patient</h2>
		<form>
			<input type = "text" name = "name" id = "name" placeholder = "Name" size = "50">
			<br>
			<input type = "text" name = "age" id = "age" placeholder = "Age" size = "50">
			<br>
			<input type = "text" name = "address" id = "address" placeholder = "Address" size = "50">
			<br>
			<input type = "text" name = "billingCard" id = "billingCard" placeholder = "Billing Card" size = "50">
			<br>
			<input type = "submit" value = "Add Patient to System">
		</form>
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
		</table>
		<h2>Book Appointment</h2>
		<form>
			<input type = "text" name = "patientID" id = "paitientID" placeholder = "Patient ID" size = "50">
			<br>
			<input type = "text" name = "service" id = "service" placeholder = "Service" size = "50">
			<br>
			<input type = "text" name = "staffID" id = "staffID" placeholder = "Staff ID" size = "50">
			<br>
			<input type = "text" name = "room" id = "room" placeholder = "Room" size = "50">
			<br>
			<input type = "datetime-local" name = "appointmentDate" id = "appointmentDate" placeholder = "Choose Appointment Date" size = "50">
			<br>
			<input type = "submit" value = "Check Availability">
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
		</table>


	</body>

	</html>