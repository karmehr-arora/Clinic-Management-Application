<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Signup)</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
			  <a class="navbar-brand" href="loginPage.jsp">Clinic Master</a>
			  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				  <li class="nav-item">
					<!-- <a class="nav-link" href="./patientView.jsp">Patient</a> -->
				  </li>
				  <li class="nav-item">
					<!-- <a class="nav-link" href="./staffView.jsp">Staff</a> -->
				  </li>
				  <li class="nav-item">
					<!-- <a class="nav-link" href="./appointment.jsp">Appointment</a> -->
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

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2>Sign Up</h2>
                    <form method="post">
                        <div class="mb-3">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" required>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label">Email</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password (+8 Characters)</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="age" class="form-label">Age</label>
                            <input type="number" class="form-control" id="age" name="age" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Sign Up</button>
                    </form>
					<form class="form-container">
						<%  // Setting variables db, user, root, & password
							String db="clinicmaster"; 
							String user; // assumes database name is the same as username 
							user = "root"; // default database name
							String password = "!Nf4@$TrnK7uR3";
			
							// Checking to see if password & username are valid
							if(request.getParameter("username") != null && request.getParameter("password") != null) {
								try { 
									// Creating Connection
									java.sql.Connection connection; 
									Class.forName("com.mysql.jdbc.Driver");
									connection=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
									
									// saving user input
									String firstName = request.getParameter("firstName"), lastName = request.getParameter("lastName"), username = request.getParameter("username");
									String pass = request.getParameter("password"), age = request.getParameter("age"), address = request.getParameter("address");

									//Creating and executing sql statement
									String sql = "SELECT userID FROM login WHERE userID IN (SELECT '" + username + "' FROM login);";
									Statement stmt = connection.createStatement();
									ResultSet rs = stmt.executeQuery(sql);
			
									// saving user input and testing for validity
									String testUser = "", testPass = "";
									if (rs.isBeforeFirst() ) {    
										rs.next();
										testUser = rs.getString(1); //gets username
									} // checking user authentication
									boolean passLen = (pass.toString().length() >= 8);
									if(testUser.equals(username.toString())){
										out.println("Invalid Username <br> Username Already Exists");
									} else{
										if(!passLen){
											out.println("Password must be 8 or more characters");
										} else{
											int ageInt = Integer.parseInt(age);
											sql = "INSERT INTO login VALUES('" + username + "','" + pass + "'," + ageInt + ",'" + firstName + "','" + lastName + "','" + address + "'," + 1 + ")";
											stmt.executeUpdate(sql);	            	
											response.sendRedirect("loginPage.jsp");
										}
									}
									
									rs.close();
									stmt.close();
									connection.close();
								} catch(SQLException e) {
									out.println("SQLException caught: " + e.getMessage());
								}
							}
						%>
                </div>
            </div>
        </div>
		
	</body>
	</html>