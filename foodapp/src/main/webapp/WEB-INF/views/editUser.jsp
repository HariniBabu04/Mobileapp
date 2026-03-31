<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Edit User</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Surplus Food Donation</a>
		</div>
	</nav>

	<div class="container mt-4">
		<h3 class="mb-4">Edit User</h3>

		<form id="editUserForm">
			<div class="mb-3">
				<label class="form-label">User Name</label>
				<input type="text" class="form-control" id="userName" value="John Doe" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Email</label>
				<input type="email" class="form-control" id="email" value="john@example.com" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Phone</label>
				<input type="text" class="form-control" id="phone" value="9876543210" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Role</label>
				<select class="form-select" id="role">
					<option>Donor</option>
					<option>NGO</option>
					<option>Volunteer</option>
					<option>Admin</option>
				</select>
			</div>
			<div class="mb-3">
				<label class="form-label">Organization</label>
				<input type="text" class="form-control" id="organization" value="-">
			</div>
			<div class="mb-3">
				<label class="form-label">Status</label>
				<select class="form-select" id="status">
					<option>Active</option>
					<option>Inactive</option>
					<option>Blocked</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Save Changes</button>
			<a href="manageUsers" class="btn btn-secondary">Cancel</a>
		</form>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		const form = document.getElementById('editUserForm');

		form.addEventListener('submit', function (e) {
			e.preventDefault();
			alert('Changes saved successfully!');
			setTimeout(() => {
				window.location.href = 'manageUsers';
			}, 1000);
		});
	</script>
</body>

</html>