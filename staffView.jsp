<%@ page import="java.sql.*" %>
	<html>

	<head>
		<title>Clinic Master (Staff)</title>

		<style>
			nav ul {
				list-style: none;
				padding: 0;
				display: flex;
			}
	
			nav li {
				margin-right: 20px;
			}

			.horizontal-headers {
            	display: flex;
            	justify-content: space-between;
        	}

			.form-container {
            	margin-top: 20px;
        	}
		</style>
	</head>

	<body style="background-image: url('https://img.freepik.com/free-vector/healthcare-background-with-medical-symbols-hexagonal-frame_1017-26363.jpg'); background-size: cover; background-repeat: no-repeat;">
		<h1>Clinic Master (Staff)</h1>
		<nav>
			<ul>
				<li><a href="/CS157A-Team1/patientView.jsp">Patient</a></li>
				<li><a href="/CS157A-Team1/staffView.jsp">Staff</a></li>
				<li><a href="/CS157A-Team1/staffView.jsp">Services</a></li>
			</ul>
		</nav>
		<div class="horizontal-headers">
			<div>
				<h2>Add Staff</h2>
				<form class="form-container">
					<form>
						<input type = "text" name = "name" id = "name" placeholder = "Name" size = "50">
						<br>
						<input type = "text" name = "age" id = "age" placeholder = "Age" size = "50">
						<br>
						<input type = "text" name = "job" id = "job" placeholder = "Job" size = "50">
						<br>
						<input type = "text" name = "salary" id = "salary" placeholder = "Salary" size = "50">
						<br>
						<input type = "submit" value = "Add Patient to System">
					</form>
				</form>
			</div>
			<div>
				<h2>View/Edit Staff</h2>
				<form class="form-container">
					<table border="1">
						<tr>
							<td>Staff ID</td>
							<td>Name</td>
							<td>Age</td>
							<td>Job</td>
							<td>Salary</td>
						</tr>
						<% 
						String db="clinicmaster"; 
						String user; // assumes database name is the same as username 
						user="root"; 
						String password = "root";						try { 
							java.sql.Connection con; Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
							out.println(db + " database successfully opened.<br/><br/>" ); out.println("Initial entries in table \"Student\": <br />");
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
					</table>
				</form>
			</div>
			<div>
				<h2>Add Services</h2>
				<form class="form-container">
					<form>
						<input type = "text" name = "serviceName" id = "serviceName" placeholder = "Service Name" size = "50">
						<br>
						<input type = "text" name = "cost" id = "cost" placeholder = "Cost" size = "50">
						<br>
						<input type = "text" name = "serviceDepartment" id = "serviceDepartment" placeholder = "Service Department" size = "50">
						<br>
						<input type = "submit" value = "Add Service">
					</form>
				</form>
			</div>
		</div>

	</body>

	</html>