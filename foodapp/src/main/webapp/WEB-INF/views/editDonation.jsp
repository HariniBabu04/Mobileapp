<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Edit Donation</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Surplus Food Donation</a>
			<div class="ms-auto">
				<a href="manageDonation-admin" class="btn btn-light btn-sm">Back</a>
			</div>
		</div>
	</nav>

	<div class="container mt-4">
		<h3 class="mb-4">Edit Donation</h3>

		<div class="card">
			<div class="card-body">
				<form>
					<div class="row mb-3">
						<div class="col-md-6">
							<label class="form-label">Food Name</label>
							<input type="text" class="form-control" value="Chicken Biriyani">
						</div>
						<div class="col-md-6">
							<label class="form-label">Donor Name</label>
							<input type="text" class="form-control" value="John Doe">
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-md-6">
							<label class="form-label">NGO Name</label>
							<input type="text" class="form-control" value="-">
						</div>
						<div class="col-md-6">
							<label class="form-label">Quantity</label>
							<input type="text" class="form-control" value="10 kg">
						</div>
					</div>

					<div class="mb-3">
						<label class="form-label">Location</label>
						<input type="text" class="form-control" value="Taramani, Chennai">
					</div>

					<div class="mb-3">
						<label class="form-label">Status</label>
						<select class="form-select">
							<option selected>Available</option>
							<option>Accepted</option>
							<option>Picked Up</option>
							<option>Completed</option>
							<option>Expired</option>
							<option>Cancelled</option>
						</select>
					</div>

					<div class="text-end">
						<button type="button" class="btn btn-success"
							onclick="window.location.href='manageDonation-admin'">Update Donation</button>
						<a href="manageDonation-admin" class="btn btn-secondary">Cancel</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>