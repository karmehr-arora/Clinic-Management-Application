<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Home)</title>
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
			<h1>Welcome to Clinic Master</h1>
			<p>This application is used by staff to handle the management of the hospital, including patients, other staff, and overall hospital management.</p>
		
			<div class="mt-4">
				<h2>Functionalities</h2>
		
				<div>
					<h3>Patient Functions</h3>
					<ul>
						<li>Add/Remove Patient: Users will be able to manipulate patients' data, including name, address, phone number, billing information, etc.</li>
						<li>Browse Patients: Users can browse through patients using an informational table.</li>
						<li>Book Patient Appointment/Service: Users can book appointments, specifying service, patient, staff, date/time, and room.</li>
						<li>Browse Appointments: Users can browse appointments by patient ID or view all appointments at once.</li>
						<li>Cancel Patient Appointment: Users can delete appointments and remove associated costs from the patient's balance.</li>
						<li>Patient Billing & Payment: Users can facilitate patient payments, with the balance adjusting based on appointments.</li>
					</ul>
				</div>
		
				<div>
					<h3>Department Functions</h3>
					<ul>
						<li>Add/Remove/Edit/View Rooms: Staff can manipulate room information.</li>
						<li>Add/Remove/Edit/View Services: Management can manipulate services.</li>
						<li>Add/Remove/Edit/View Inventory: Staff can manipulate inventory.</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
	</html>