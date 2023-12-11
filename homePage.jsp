<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Home)</title>
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

		<div class="container mt-5">
			<h1>Welcome to Clinic Master</h1>
			<p>This application is used by Staff members to handle the management of the hospital, including patients, other staff, and overall hospital management.</p>
		
			<div class="mt-4">
				<h1>Functionalities</h1>
			
				<div>
					<h3>Signup/Login/Signout Functions</h3>
					<ul>
						<li>Sign Up / Log in: Allow users to create their own personal account and login via their personal information</li>
						<li>Sign Out: Functionality that will bring the user back to the Signup / Login page</li>
					</ul>
				</div>

				<div>
					<h3>Patient Functions</h3>
					<ul>
						<li>Add/Remove Patients: Users will be able to Add/Delete Patient instances</li>
						<li>View/Edit Patients: Users will be able to View/Edit Patient instances in a tabular format</li>
						<li>Pay Billing Card: Users will be able to make Payments for patients via this page</li>
					</ul>
				</div>
			
				<div>
					<h3>Staff Functions</h3>
					<ul>
						<li>Add/Remove/View Staff: Users will be able to Add/Delete Staff instances and see all instances in a tabular format</li>
						<li>Add Inventory: Staff can add items directly into the system</li>
						<li>Search Inventory: Staff can view specific items in the system via their name</li>
						<li>View Inventory: Staff can view all the inventory available in the system in a tabular format</li>
					</ul>
				</div>

				<div>
					<h3>Department Functions</h3>
					<ul>
						<li>Add/Remove/Edit/View Rooms: Staff can manipulate room information.</li>
						<li>Add/Remove/Edit/View Services: Management can manipulate services.</li>
					</ul>
				</div>

				<div>
					<h3>Appointment Functions</h3>
					<ul>
						<li>Book Appointment: Allows Staff to create appointments for patients</li>
						<li>View Appointment for Specific Patient: Allows for searching of Patients via their Patient ID</li>
						<li>View/Delete Appointments: All Patient appointments shown in tabular format, deletion of appointments is possible </li>
					</ul>
				</div>
			</div>
	</body>
	</html>