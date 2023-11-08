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
		<form action="appointment.jsp" method="GET">
			<input type = "text" name = "patientID" placeholder = "Patient ID" size = "50">
			<br>
			<input type = "text" name = "serviceName" placeholder = "Service Name" size = "50">
			<br>
			<input type = "text" name = "serviceDescription" placeholder = "Service Description" size = "50">
			<br>
			<input type = "text" name = "staffID" placeholder = "Staff ID" size = "50">
			<br>
			<input type = "text" name = "room" placeholder = "Room" size = "50">
			<br>
			<input type = "date" name = "date" placeholder = "Choose Appointment Date" size = "50">
			<input type = "time" name = "time" placeholder = "Choose Appointment Time" size = "50">
			<br>
			<input type = "submit" value = "Book Appointment">
		</form>
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
			String sql = String.format("INSERT INTO appointments(time, date) VALUES('%s','%s')",request.getParameter("date"),request.getParameter("time"));
			//out.println(sql + "<br>");
            stmt.executeUpdate(sql);	
            
            sql = "SELECT appointmentID FROM appointments ORDER BY appointmentID DESC LIMIT 1";
            ResultSet rs = stmt.executeQuery(sql);
			rs.next();
            //out.println(rs.getString(1) + "<br>");
			String appointmentID = rs.getString(1);

			sql = String.format("INSERT INTO attends(appointmentID, staffID, patientID) VALUES(%s,%s,%s)",appointmentID, request.getParameter("patientID"),request.getParameter("staffID"));
			//out.println(sql + "<br>");
            stmt.executeUpdate(sql);	
			sql = String.format("INSERT INTO has(appointmentID, roomNumber) VALUES(%s,%s)",appointmentID, request.getParameter("room"));
			//out.println(sql + "<br>");
            stmt.executeUpdate(sql);	            	
			sql = String.format("INSERT INTO consistsof(appointmentID, serviceName, serviceDescription) VALUES(%s,'%s','%s')", appointmentID,request.getParameter("serviceName"), request.getParameter("serviceDescription"));
			//out.println(sql + "<br>");
            stmt.executeUpdate(sql);	 
			rs.close();           	
			stmt.close();
			con.close();
		} 
		catch(SQLException e) 
		{
			out.println("SQLException caught: " + e.getMessage());
		}
		%>
		<h2>View Appointment for specific patient</h2>
		<form>
			<input type = "text" name = "patientID" id = "paitientID" placeholder = "Patient ID" size = "50">
			<br>
			<input type = "submit" value = "See Appointments">
		</form>
		<table border="1">
			<tr>
				<td>Appointment ID</td>
				<td>Date</td>
				<td>Time</td>
			</tr>
			<% 
			try 
            { 
				java.sql.Connection con; 
                Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM appointments");
				while (rs.next()) {
					out.println("<tr><td>"+rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td></tr>");
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