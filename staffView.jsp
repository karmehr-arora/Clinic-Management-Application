<%@ page import="java.sql.*" %>
	<html>
		<head>
			<title>Clinic Master (Staff)</title>
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
								<a class="nav-link font-weight-bold fs-4 active" aria-current="page" href="./staffView.jsp">Staff</a>
							</li>
							<li class="nav-item flex-grow-1 text-center">
								<a class="nav-link font-weight-bold fs-4" href="./departments.jsp">Departments</a>
							</li>
							<li class="nav-item flex-grow-1 text-center">
								<a class="nav-link font-weight-bold fs-4" href="./appointment.jsp">Appointment</a>
							</li>
							<li class="nav-item flex-grow-1 text-center">
								<a class="nav-link font-weight-bold fs-4" href="./signupPage.jsp">Sign Out</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>	

			<div class="container d-flex justify-content-center align-items-center bg-primary-subtle card p-3 mt-5">
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
					<input type = "submit" class="btn btn-primary" value = "Add Staff to System">
				</form>
			</form>

			<%
		String db="clinicmaster"; 
		String user; // assumes database name is the same as username 
		  user = "root";
		String password = "root";
		try 
		{ 
			if(request.getParameter("name") != null && request.getParameter("age")!= null && request.getParameter("job") != null&& request.getParameter("salary") != null)
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				String sql = String.format("INSERT INTO staff(name, age, job, salary) VALUES('%s', %s, '%s',%s)",request.getParameter("name"),request.getParameter("age"),request.getParameter("job"),request.getParameter("salary"));
				stmt.executeUpdate(sql);		
				stmt.close();
				con.close();
			}

			else if(request.getParameter("staffID") != null)
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				String sql = String.format("DELETE FROM staff WHERE staffID ="+ request.getParameter("staffID"));
				stmt.executeUpdate(sql);		
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
			<h2>View/Edit Staff</h2>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Staff ID</th>
							<th scope="col">Name</th>
							<th scope="col">Age</th>
							<th scope="col">Job</th>
							<th scope="col">Salary</th>
						</tr>
					</thead>
					<tbody>
						<% 					
						try { 
							java.sql.Connection con; 
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT *  FROM staff");
							while (rs.next()) {
								out.println("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getInt(5) + "</td><td><form action = 'staffView.jsp' method = 'GET'><input type='submit' class = 'btn btn-danger' name = 'delete_user' value = 'Delete'/><input type='hidden' name = 'staffID' value = "+rs.getInt(1)+ "></form></td></tr>");
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
		</div>
		<br>
        <br>
		
		<div class="container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<form action = "staffView.jsp" method = "GET">
				<h2>Add Inventory</h2>
				<form class="form-container" action="addItemProcess.jsp" method="post">
					<div class="mb-3">
						<label for="name">Item Name</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Item" required>
					</div>
					<div class="mb-3">
						<label for="age">Item Quantity</label>
						<input type="text" class="form-control" id="quantity" name="quantity" placeholder="Enter Quantity" required>
					</div>
					<input type = "submit" class="btn btn-primary" value = "Add Item to System">
				</form>
			</form>
		<%
		try 
		{ 
			if(request.getParameter("name") != null && request.getParameter("quantity")!= null)
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				String sql = String.format("INSERT INTO inventory(name, quantity) VALUES('%s', %s)",request.getParameter("name"),request.getParameter("quantity"));
				stmt.executeUpdate(sql);		
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
			<h2>Search Inventory</h2>
			<form action ="staffView.jsp">
				<input type = "text" name = "Item Name" class = "form-control" id = "Item Name" placeholder = "Item Name" size = "50">
				<br>
				<input type = "submit" class = "btn btn-primary" value = "See Item">
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
						Statement stmt2 = con.createStatement();
						ResultSet rs2 = stmt2.executeQuery("SELECT * FROM inventory WHERE name LIKE '%" + request.getParameter("Item Name") + "%';");
						while (rs2.next()) {
							out.println("<tr><td>"+rs2.getInt(1) + "</td><td>" + rs2.getString(2) + "</td><td>" + rs2.getInt(3) + "</td>");
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
							out.println("<tr><td>" + rs3.getInt(1) + "</td><td>" + rs3.getString(2) + "</td><td>" + rs3.getInt(3) + "</td>");
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

		

	</body>
	</html>