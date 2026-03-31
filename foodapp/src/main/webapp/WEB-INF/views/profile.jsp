<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Profile Page</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="bg-light">

	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Surplus Food Donation</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto align-items-center">
					<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
					<li class="nav-item">
						<a class="nav-link" href="#"><i class="bi bi-person-circle" style="font-size: 1.5rem;"></i></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<h1 class="text-center mt-4 mb-4">My Profile</h1>

	<div class="d-flex justify-content-center">
		<form id="profileForm" class="w-75 bg-white p-4 shadow rounded">

			<div class="text-center mb-4">
				<div class="position-relative d-inline-block">
					<img id="profileImage" src="https://via.placeholder.com/150"
						class="rounded-circle border border-3 border-success" width="150" height="150">

					<button type="button" class="btn btn-success btn-sm rounded-circle position-absolute bottom-0 end-0"
						onclick="document.getElementById('photoInput').click()">
						<i class="bi bi-camera-fill"></i>
					</button>

					<input type="file" id="photoInput" accept="image/*" hidden>
				</div>

				<h5 class="mt-3 mb-0">John Doe</h5>
				<small class="text-muted">Donor</small>
			</div>

			<h5 class="mb-3">Basic Information</h5>

			<div class="mb-3">
				<label class="form-label">Full Name</label>
				<input type="text" class="form-control editable" value="John Doe" readonly>
			</div>

			<div class="mb-3">
				<label class="form-label">Email</label>
				<input type="email" class="form-control editable" value="john@example.com" readonly>
			</div>

			<div class="mb-3">
				<label class="form-label">Phone Number</label>
				<input type="text" class="form-control editable" value="9876543210" readonly>
			</div>

			<div class="mb-3">
				<label class="form-label">Address</label>
				<input type="text" class="form-control editable" value="New York, USA" readonly>
			</div>

			<h5 class="mb-3 mt-4">Account Information</h5>

			<div class="mb-3">
				<label class="form-label">Username</label>
				<input type="text" class="form-control" value="johndoe123" readonly>
			</div>

			<div class="mb-3">
				<label class="form-label">Registration Date</label>
				<input type="text" class="form-control" value="01 January 2024" readonly>
			</div>

			<div class="mb-3">
				<label class="form-label">Account Status</label>
				<input type="text" class="form-control text-success fw-semibold" value="Active" readonly>
			</div>

			<div class="d-flex justify-content-center gap-3 mt-4">
				<button type="button" id="editBtn" class="btn btn-outline-success w-25">Edit</button>
				<button type="submit" id="saveBtn" class="btn btn-success w-25 d-none">Save</button>
				<button type="button" id="cancelBtn" class="btn btn-secondary w-25 d-none">Cancel</button>
			</div>

		</form>
	</div>

	<script>
		const editBtn = document.getElementById("editBtn");
		const saveBtn = document.getElementById("saveBtn");
		const cancelBtn = document.getElementById("cancelBtn");
		const editableFields = document.querySelectorAll(".editable");

		let originalValues = [];

		editBtn.addEventListener("click", function () {
			originalValues = [];
			editableFields.forEach((field, index) => {
				originalValues[index] = field.value;
				field.removeAttribute("readonly");
			});
			editBtn.classList.add("d-none");
			saveBtn.classList.remove("d-none");
			cancelBtn.classList.remove("d-none");
		});

		cancelBtn.addEventListener("click", function () {
			editableFields.forEach((field, index) => {
				field.value = originalValues[index];
				field.setAttribute("readonly", true);
			});
			editBtn.classList.remove("d-none");
			saveBtn.classList.add("d-none");
			cancelBtn.classList.add("d-none");
		});

		document.getElementById("profileForm").addEventListener("submit", function (e) {
			e.preventDefault();
			editableFields.forEach(field => field.setAttribute("readonly", true));
			editBtn.classList.remove("d-none");
			saveBtn.classList.add("d-none");
			cancelBtn.classList.add("d-none");
		});

		document.getElementById('photoInput').addEventListener('change', function (event) {
			const reader = new FileReader();
			reader.onload = function () {
				document.getElementById('profileImage').src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		});
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>