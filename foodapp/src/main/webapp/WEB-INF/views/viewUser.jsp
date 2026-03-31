<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>View User</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Surplus Food Donation</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="manageUsers">Back to Manage Users</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-4">
		<h3 class="mb-4">View User</h3>
		<div id="userDetails" class="border p-4 rounded bg-light">
		

			<p><strong>User ID:</strong> <span id="uid"></span></p>
			<p><strong>Name:</strong> <span id="uname"></span></p>
			<p><strong>Role:</strong> <span id="urole"></span></p>
			<p><strong>Email:</strong> <span id="uemail"></span></p>
			<p><strong>Phone:</strong> <span id="uphone"></span></p>
			<p><strong>Organization:</strong> <span id="uorg"></span></p>
			<p><strong>Registered On:</strong> <span id="ureg"></span></p>
			<p><strong>Status:</strong> <span id="ustatus"></span></p>

			
		</div>
	</div>

	<script>

	document.addEventListener("DOMContentLoaded", function(){

	const users = {
	"U001":{
	id:"U001",
	name:"John Doe",
	role:"Donor",
	email:"john@example.com",
	phone:"9876543210",
	organization:"-",
	registeredOn:"2024-01-10",
	status:"Active"
	},
	"U002":{
	id:"U002",
	name:"Lucas",
	role:"NGO",
	email:"lucas@example.com",
	phone:"6754396754",
	organization:"Helping Hands",
	registeredOn:"2023-08-12",
	status:"Active"
	}
	};

	const params = new URLSearchParams(window.location.search);
	const userId = params.get("id");

	if(userId && users[userId]){

	const user = users[userId];

	document.getElementById("uid").innerText = user.id;
	document.getElementById("uname").innerText = user.name;
	document.getElementById("urole").innerText = user.role;
	document.getElementById("uemail").innerText = user.email;
	document.getElementById("uphone").innerText = user.phone;
	document.getElementById("uorg").innerText = user.organization;
	document.getElementById("ureg").innerText = user.registeredOn;
	document.getElementById("ustatus").innerText = user.status;

	}

	});

	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>