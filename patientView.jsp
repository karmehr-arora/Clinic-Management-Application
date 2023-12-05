<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Patient)</title>
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
					<a class="nav-link active" aria-current="page" href="./patientView.jsp">Patient</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="./staffView.jsp">Staff</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="./departments.jsp">Departments</a>
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
			<form action = "patientView.jsp" method = "GET">
				<h2>Add Patient</h2>
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "name" placeholder = "Name" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "age" placeholder = "Age" size = "50" minlength = "1" maxlength="3">
				</div>
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "address" placeholder = "Address" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" class = "form-control" name = "billingCard" placeholder = "Billing Card" size = "50" minlength = "4" maxlength="4">
				</div>
				<input type = "submit" class="btn btn-primary" value = "Add Patient to System">
			</form>
		</div>
		<br>
		<%
		String db="clinicmaster"; 
		String user; // assumes database name is the same as username 
		  user = "root";
		String password = "root";
		try 
		{ 
			if(request.getParameter("name") != null && request.getParameter("age")!= null && request.getParameter("address") != null&& request.getParameter("billingCard") != null)
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
			else if(request.getParameter("patientID") != null)
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				String sql = String.format("DELETE FROM patient WHERE patientID ="+ request.getParameter("patientID"));
				stmt.executeUpdate(sql);		
				stmt.close();
				con.close();
			}
			else if(request.getParameter("patientIDPay") != null)
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				String sql = String.format("UPDATE patient SET balance = 0 WHERE patientID ="+ request.getParameter("patientIDPay"));
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
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>View/Edit Patient</h2>
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Patient ID</th>
					<th scope="col">Name</th>
					<th scope="col">Age</th>
					<th scope="col">Address</th>
					<th scope="col">Billing Card</th>
					<th scope="col">Balance</th>
					<th scope="col">Pay Balance</th>
					<th scope="col">Delete</th>
				</tr>
				</thead>
				<tbody>
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
						out.println("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getInt(5) + "</td><td>" + rs.getInt(6) + "</td><td><form action = 'patientView.jsp' method = 'GET'><input type='submit' class = 'btn btn-primary' name = 'pay_balance' value = 'Pay'/><input type='hidden' name = 'patientIDPay' value = "+rs.getInt(1)+ "></form></td><td><form action = 'patientView.jsp' method = 'GET'><input type='submit' class = 'btn btn-danger' name = 'delete_user' value = 'Delete'/><input type='hidden' name = 'patientID' value = "+rs.getInt(1)+ "></form></td></tr>");
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
				</tbody>
			</table>
		</div>
	</body>
	</html>