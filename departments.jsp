<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Departments)</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
			<a class="navbar-brand" href="homePage.jsp">Clinic Master</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">				<span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				  <li class="nav-item">
					<a class="nav-link" href="./patientView.jsp">Patient</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="./staffView.jsp">Staff</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link active" aria-current="page" href="./departments.jsp">Departments</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link"  href="./appointment.jsp">Appointment</a>
				  </li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="./loginPage.jsp">Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="./signupPage.jsp">Signup</a>
					</li>
				</ul>
				</div>
			</div>
		</nav>

        <div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
            <h2>Add Services</h2>
            <form class="form-container" action="addServicesProcess.jsp" method="post">
                <div class="mb-3">
                    <label for="serviceName">Service Name</label>
                    <input type="text" class="form-control" id="serviceName" name="serviceName" placeholder="Enter Service Name" required size = "50">
                </div>
                <div class="mb-3">
                    <label for="cost">Cost</label>
                    <input type="text" class="form-control" id="cost" name="cost" placeholder="Enter Cost" required>
                </div>
                <div class="mb-3">
                    <label for="serviceDepartment">Service Department</label>
                    <input type="text" class="form-control" id="serviceDepartment" name="serviceDepartment" placeholder="Enter Service Department" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Service</button>
            </form>
        </div>
        
		<br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>View Specific Service</h2>
			<form action ="departments.jsp">
				<input type = "text" name = "Service Name" class = "form-control" id = "Service Name" placeholder = "Service Name" size = "50">
				<input type = "submit" class = "btn btn-primary" value = "See Service">
			</form>
	
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Service Name</th>
					<th scope="col">Cost</th>
					<th scope="col">Service Department</th>
				</tr>
				</thead>
				<tbody>
					<% 
                    String db="clinicmaster"; 
                    String user; // assumes database name is the same as username 
                    user = "root";
                    String password = "root";
					try 
					{ 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery("Select * from services where serviceName LIKE '%" + request.getParameter("Service Name") + "%';");
						while (rs1.next()) {
							out.println("<tr><td>"+rs1.getString(1) + "</td><td>" + rs1.getInt(2) + "</td><td>" + rs1.getString(3) + "</td>");
						}
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
		<br>

        <br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>Services Provided</h2>
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Service Name</th>
					<th scope="col">Cost</th>
					<th scope="col">Service Department</th>
				</tr>
				</thead>
				<tbody>
					<% 
					try { 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery("SELECT * FROM services;");
						while (rs1.next()) {
							out.println("<tr><td>"+rs1.getString(1) + "</td><td>" + rs1.getInt(2) + "</td><td>" + rs1.getString(3) + "</td>");
						}
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
		<br>

        <!-- View Rooms -->
        
        <div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>Search for Rooms</h2>
			<form action ="departments.jsp">
				<input type = "text" name = "Room Type" class = "form-control" id = "Room Type" placeholder = "Room Type" size = "50">
				<input type = "submit" class = "btn btn-primary" value = "See Service">
			</form>
	
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Room Number</th>
					<th scope="col">Building</th>
					<th scope="col">Type</th>
                    <th scope="col">Beds Available</th>
				</thead>
				<tbody>
					<% 
					try 
					{ 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt2 = con.createStatement();
						ResultSet rs2 = stmt2.executeQuery("SELECT * FROM room WHERE type LIKE '%" + request.getParameter("Room Type") + "%';");
						while (rs2.next()) {
							out.println("<tr><td>"+rs2.getInt(1) + "</td><td>" + rs2.getInt(2) + "</td><td>" + rs2.getString(3) + "</td><td>" + rs2.getInt(4) + "</td>");
						}
						stmt2.close();
                        rs2.close();
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
		<br>

        <br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>Room Information</h2>
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Room Number</th>
					<th scope="col">Building</th>
					<th scope="col">Type</th>
                    <th scope="col">Beds Available</th>
				</tr>
				</thead>
				<tbody>
					<% 
					try { 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt2 = con.createStatement();
						ResultSet rs2 = stmt2.executeQuery("SELECT * FROM room;");
						while (rs2.next()) {
							out.println("<tr><td>"+rs2.getInt(1) + "</td><td>" + rs2.getInt(2) + "</td><td>" + rs2.getString(3) + "</td><td>" + rs2.getInt(4) + "</td>");
						}
						stmt2.close();
                        rs2.close();
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
		<br>


        <!-- View Inventory -->

        <div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>Search Inventory</h2>
			<form action ="departments.jsp">
				<input type = "text" name = "Item Name" class = "form-control" id = "Item Name" placeholder = "Item Name" size = "50">
				<input type = "submit" class = "btn btn-primary" value = "See Service">
			</form>
	
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Item ID</th>
					<th scope="col">Item Name</th>
					<th scope="col">Item Quantity</th>
				</tr>
				</thead>
				<tbody>
					<% 
					try 
					{ 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt3 = con.createStatement();
						ResultSet rs3 = stmt3.executeQuery("SELECT * FROM inventory WHERE name LIKE '%" + request.getParameter("Item Name") + "%';");
						while (rs3.next()) {
							out.println("<tr><td>"+rs3.getInt(1) + "</td><td>" + rs3.getString(2) + "</td><td>" + rs3.getInt(3) + "</td>");
						}
						stmt3.close();
                        rs3.close();
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
		<br>

        <br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>All Inventory</h2>
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Item ID</th>
					<th scope="col">Item Name</th>
					<th scope="col">Item Quantity</th>
				</tr>
				</thead>
				<tbody>
					<% 
					try { 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt3 = con.createStatement();
						ResultSet rs3 = stmt3.executeQuery("SELECT * FROM inventory;");
						while (rs3.next()) {
							out.println("<tr><td>"+rs3.getInt(1) + "</td><td>" + rs3.getString(2) + "</td><td>" + rs3.getInt(3) + "</td>");
						}
						stmt3.close();
                        rs3.close();
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
		<br>


	</body>
	</html>