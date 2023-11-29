<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Appointment)</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
			  <a class="navbar-brand" href="#">Clinic Master</a>
			  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				  <li class="nav-item">
					<a class="nav-link" href="#">Home</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="./patientView.jsp">Patient</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="./staffView.jsp">Staff</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link active" aria-current="page" href="./appointment.jsp">Appointment</a>
				  </li>
				</ul>
				<span class="navbar-text">
				  Appointment Page
				</span>
			  </div>
			</div>
		</nav>
		<div class="container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<form action = "appointment.jsp" method = "GET">
				<h2>Book Appointment</h2>
				<div class="mb-3">
					<input type = "text" name = "patientID" class = "form-control" placeholder = "Patient ID" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" name = "serviceName" class = "form-control" placeholder = "Service Name" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" name = "serviceDescription" class = "form-control" placeholder = "Service Description" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" name = "staffID" class = "form-control" placeholder = "Staff ID" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" name = "room" class = "form-control" placeholder = "Room" size = "50">
				</div>
				<div class="mb-3">
					<input type = "date" name = "date" class = "form-control" placeholder = "Choose Appointment Date" size = "50">
				</div>
				<div class="mb-3">
					<input type = "time" name = "time" class = "form-control" placeholder = "Choose Appointment Time" size = "50">
				</div>
				<input type = "submit" class="btn btn-primary" value = "Book Appointment">
			</form>
        <%
		String db="clinicmaster"; 
		String user; // assumes database name is the same as username 
		user = "hello";
		String password = "Hello123!";
		try 
		{ 
			if(request.getParameter("date") != null)
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
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
		} 
		catch(SQLException e) 
		{
			out.println("SQLException caught: " + e.getMessage());
		}
		%>
		</div>
		<br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>View Appointment for specific patient</h2>
			<form>
				<input type = "text" name = "patientID" class = "form-control" id = "paitientID" placeholder = "Patient ID" size = "50">
				<input type = "submit" class = "btn btn-primary" value = "See Appointments">
			</form>
	
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Appointment ID</th>
					<th scope="col">Patient ID</th>
					<th scope="col">Staff ID</th>
					<th scope="col">Service Name</th>
					<th scope="col">Service Description</th>
					<th scope="col">Room</th>
					<th scope="col">Date</th>
					<th scope="col">Time</th>
				</tr>
				</thead>
				<tbody>
					<% 
					try 
					{ 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery("SELECT * FROM appointments");
						while (rs1.next()) {
							Statement stmt2 = con.createStatement();
							ResultSet rs2 = stmt2.executeQuery("SELECT patientID, staffID FROM attends WHERE appointmentID=" + rs1.getInt(1));
							rs2.next();
							out.println(rs.getInt(1));
							out.println("<tr><td>"+rs1.getInt(1) + "</td><td>" + rs1.getString(2) + "</td><td>" + rs1.getString(3) + "</td><td>" + rs2.getInt(0) + "</td><td>" + rs2.getInt(1) + "</td></tr>");
							
						}
						rs1.close();
						stmt1.close();
						con.close();
					} 
					catch(SQLException e) 
					{
						out.println("SQLException caught: " + e.getMessage());
					}
					%>
				</tbody>
			</table>
		</div>
	</body>
	</html>