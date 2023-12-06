<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Login)</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
                <a class="navbar-brand" href="signupPage.jsp">Clinic Master</a>
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
                    <h2>Login</h2>
                    <form method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Email</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password (+8 Characters)</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
					<form class="form-container">
						<%  // Setting variables db, user, root, & password
							String db="clinicmaster"; 
							String user; // assumes database name is the same as username 
							user = "root"; // default database name
							String password = "root";
			
							// Checking to see if password & username are valid
							if(request.getParameter("username") != null && request.getParameter("password") != null) {
								try { 
									// Creating Connection
									java.sql.Connection connection; 
									Class.forName("com.mysql.jdbc.Driver");
									connection=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
									
									//Creating and executing sql statement
									String sql = "SELECT * FROM login WHERE userID IN (SELECT '" + request.getParameter("username") + "' FROM login) AND password IN (SELECT '" + request.getParameter("password") + "' FROM login);";
									Statement stmt = connection.createStatement();
									ResultSet rs = stmt.executeQuery(sql);
			
									// saving user input and testing for validity
									String testUser = "", testPass = "";
									if (rs.isBeforeFirst() ) {    
										rs.next();
										testUser = rs.getString(1);
										testPass = rs.getString(2);
									} // checking user authentication
									boolean passLen = (request.getParameter("password").toString().length() >= 8);
									if(testUser.equals(request.getParameter("username")) && testPass.equals(request.getParameter("password")) && passLen){
										response.sendRedirect("homePage.jsp");
									} else{
										out.println("Invalid Username or Password");
									}
									rs.close();
									stmt.close();
									connection.close();
								} catch(SQLException e) {
									out.println("SQLException caught: " + e.getMessage());
								}
							}
							%>
					</form>
                </div>
            </div>
        </div>
	</div>
	</body>
	</html>