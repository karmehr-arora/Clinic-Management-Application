<%@ page import="java.sql.*" %>
	<html>
		<head>
			<title>Clinic Master (Staff)</title>
			<link href="css/bootstrap.min.css" rel="stylesheet"/>
		</head>
		<body>
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid">
					<a class="navbar-brand" href="homePage.jsp">Clinic Master</a>
				  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
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
						<a class="nav-link" href="./appointment.jsp">Appointment</a>
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
			
		<div class="container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<form action = "staffView.jsp" method = "GET">
				<h2>Add Staff</h2>
				<form class="form-container" action="addStaffProcess.jsp" method="post">
					<div class="mb-3">
						<label for="name">Name</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" required>
					</div>
					<div class="mb-3">
						<label for="age">Age</label>
						<input type="text" class="form-control" id="age" name="age" placeholder="Enter Age" required>
					</div>
					<div class="mb-3">
						<label for="job">Job</label>
						<input type="text" class="form-control" id="job" name="job" placeholder="Enter Job" required>
					</div>
					<div class="mb-3">
						<label for="salary">Salary</label>
						<input type="text" class="form-control" id="salary" name="salary" placeholder="Enter Salary" required>
					</div>
					<input type = "submit" class="btn btn-primary" value = "Add Staff">
				</form>
			</form>
        
		</div>
		<br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>View/Edit Staff</h2>
			<form class="form-container">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Staff ID</th>
							<th>Name</th>
							<th>Age</th>
							<th>Job</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
						<% 
						String db="clinicmaster"; 
						String user; // assumes database name is the same as username 
						user="root"; 
						String password = "root";						try { 
							java.sql.Connection con; Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
							out.println(db + " database successfully opened.<br/><br/>" ); out.println("Initial entries in table \"staff\": <br />");
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT *  FROM staff");
							while (rs.next()) {
								out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + " " + rs.getString(4) + " " + rs.getInt(5) + "<br /><br />");
							}
							rs.close();
							stmt.close();
							con.close();
						} 
						catch(SQLException e) {
							out.println("SQLException caught: " + e.getMessage());
						}
						%>
					</tbody>
				</table>
			</form>
		</div>
		<br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>Add Services</h2>
			<form class="form-container" action="addServicesProcess.jsp" method="post">
				<div class="mb-3">
					<label for="serviceName">Service Name</label>
					<input type="text" class="form-control" id="serviceName" name="serviceName" placeholder="Enter Service Name" required>
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
	</body>
	</html>