<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Signup)</title>
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

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2>Sign Up</h2>
                    <form action="processSignup.jsp" method="post">
                        <div class="mb-3">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" required>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
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
						<%  
							// Setting variables db, user, root, & password
							String db="clinicmaster"; 
							String user; // assumes database name is the same as username 
							user = "root"; // default database name
							String password = "!Nf4@$TrnK7uR3";
			
							// Checking to see if password & username are valid
							if(request.getParameter("username") != null && request.getParameter("password") != null) {
								try { 
									java.sql.Connection connection; 
									Class.forName("com.mysql.jdbc.Driver");
									connection=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
									// out.println(db + " database successfully opened.<br/><br/>" ); 
									// out.println("Initial entries in table \"staff\": <br />");
									String sql = "SELECT * FROM login WHERE '" + request.getParameter("username") + "' IN (SELECT UserID FROM login) AND '" + request.getParameter("password") + "' IN (SELECT password FROM login);";
									Statement stmt = connection.createStatement();
									ResultSet rs = stmt.executeQuery(sql);
			
									String testUser = "1", testPass = "2";
									rs.next();
									testUser = rs.getString(1);
									testPass = rs.getString(2);
									out.println(testUser + "<br/><br/>" + testPass);
									if(testUser.equals(request.getParameter("username")) && testPass.equals(request.getParameter("password"))){
										out.println("nice");
									} else{
										out.println("Invalid Username or Password <br/><br/> Please try again<br/><br/>");
										//out.println(request.getParameter("username") + "<br/><br/>" + request.getParameter("password"));
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