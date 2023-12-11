<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Departments)</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-warning border border-dark">
			<div class="container-fluid">
				<a class="navbar-brand font-weight-bold fs-4" href="homePage.jsp">Clinic Master</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="navbar-nav w-100 d-flex justify-content-between">
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4" href="./patientView.jsp">Patient</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4" href="./staffView.jsp">Staff</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4 active" aria-current="page" href="./departments.jsp">Departments</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4" href="./appointment.jsp">Appointment</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4" href="./signupPage.jsp">SignOut</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

        <div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3 mt-5">
            <h2>Add Services</h2>
				<form class="form-container" action="departments.jsp" method="post">
					<div class="mb-3">
						<label for="serviceName" class="form-label">Service Name</label>
                    	<input type="text" class="form-control" id="serviceName" name="serviceName" placeholder="Enter Service Name" size = "50" required >
					</div>
					<div class="mb-3">
						<label for="cost" class="form-label">Cost</label>
                    	<input type="number" class="form-control" id="cost" name="cost" placeholder="Enter Cost" required>
					</div>
					<div class="mb-3">
						<label for="serviceDepartment" class="form-label">Service Department</label>
                    <input type="text" class="form-control" id="serviceDepartment" name="serviceDepartment" placeholder="Enter Service Department" required>

					</div>
					<button type="submit" class="btn btn-primary">Add Service</button>
				</form>
            </form>
			<form class="form-container">
				<%	
					// Setting variables db, user, root, & password
					String db="clinicmaster"; 
					String user; // assumes database name is the same as username 
					user = "root";
					String password = "root";

					try{ //creating sql connection
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 

						// saving user inputs
						String serviceName = request.getParameter("serviceName"), serviceDepartment = request.getParameter("serviceDepartment");
						Integer cost;
						try {
							cost = Integer.parseInt(request.getParameter("cost"));
						} catch (NumberFormatException e) {
							cost = -1;
						}
						// out.print("cost: " + cost);

						// creating sql insert statement
						String sql = "INSERT INTO services VALUES('" + serviceName + "', " + cost + ", '" + serviceDepartment + "');";
						Statement stmt1 = con.createStatement();
						if(!(serviceName == null || cost == -1 || serviceDepartment == null) ){
							stmt1.executeUpdate(sql);
						}
						stmt1.close();
						con.close();
					} 
					catch(SQLException e) {
						out.println("SQLException caught: " + e.getMessage());
					}
				%>
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
					try { 
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
					} catch(SQLException e) {
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

        <!-- View & Add to Rooms -->
        <div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
            <h2>Add Rooms</h2>
				<form class="form-container" action="departments.jsp" method="post">
					<div class="mb-3">
						<label for="Room Number" class="form-label">Room Number</label>
                    	<input type="number" class="form-control" id="Room Number" name="Room Number" placeholder="Enter Room Number" size = "50" required >
					</div>
					<div class="mb-3">
						<label for="Building" class="form-label">Building</label>
                    	<input type="number" class="form-control" id="Building" name="Building" placeholder="Enter Building Number" required>
					</div>
					<div class="mb-3">
						<label for="type" class="form-label">Room Type</label>
                    	<input type="text" class="form-control" id="type" name="type" placeholder="Enter Room Type" required>
					</div>
					<div class="mb-3">
						<label for="Beds Available" class="form-label">Beds Available</label>
                    	<input type="number" class="form-control" id="Beds Available" name="Beds Available" placeholder="Enter Beds Available" required>
					</div>
					<button type="submit" class="btn btn-primary">Add Service</button>
				</form>
            </form>
			<form class="form-container">
				<%
					try{ //creating sql connection
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 

						// saving user inputs
						String roomType = request.getParameter("type");
						String roomNumber = request.getParameter("Room Number"), Building = request.getParameter("Building"), bedsAvailable = request.getParameter("Beds Available");
						Integer rmNumber = -1, bd = -1, ba = -1;
						try {
							rmNumber = Integer.parseInt(roomNumber);
							bd = Integer.parseInt(Building);
							ba = Integer.parseInt(bedsAvailable);
						} catch (NumberFormatException e) {
							rmNumber = -1;
						}
						// creating sql insert statement
						String sql = "INSERT INTO room VALUES(" + rmNumber + ", " + bd + ", '" + roomType + "', " + ba + ");";
						Statement stmt1 = con.createStatement();
						if(!(roomType == null || rmNumber == -1 || bd == -1 || ba == -1) ){
							stmt1.executeUpdate(sql);
						}
						stmt1.close();
						con.close();
					} 
					catch(SQLException e) {
						out.println("SQLException caught: " + e.getMessage());
					}
				%>
			</form>
        </div>
		<br>

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