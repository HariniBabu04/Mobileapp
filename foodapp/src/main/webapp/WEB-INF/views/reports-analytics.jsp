<%@ include file="/WEB-INF/common/header.jsp" %>

	<%@ include file="/WEB-INF/common/sidebar-admin.jsp" %>

		<div class="container mt-4">

			<!-- PAGE TITLE -->
			<h3 class="mb-4">Reports & Analytics</h3>

			<!-- SUMMARY CARDS -->
			<div class="row g-4">

				<div class="col-md-3">
					<div class="card shadow-sm border-0">
						<div class="card-body text-center">
							<h5>Total Donations</h5>
							<h2 class="text-success">120</h2>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card shadow-sm border-0">
						<div class="card-body text-center">
							<h5>Total Donors</h5>
							<h2 class="text-primary">45</h2>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card shadow-sm border-0">
						<div class="card-body text-center">
							<h5>Total NGOs</h5>
							<h2 class="text-warning">18</h2>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card shadow-sm border-0">
						<div class="card-body text-center">
							<h5>Food Saved (kg)</h5>
							<h2 class="text-danger">850</h2>
						</div>
					</div>
				</div>

			</div>

			<!-- CHARTS -->
			<div class="row mt-5">

				<!-- Donations Chart -->
				<div class="col-md-6">
					<div class="card shadow-sm">
						<div class="card-header bg-success text-white">
							Monthly Donations
						</div>
						<div class="card-body">
							<canvas id="donationChart"></canvas>
						</div>
					</div>
				</div>

				<!-- Status Chart -->
				<div class="col-md-6">
					<div class="card shadow-sm">
						<div class="card-header bg-primary text-white">
							Donation Status
						</div>
						<div class="card-body">
							<canvas id="statusChart"></canvas>
						</div>
					</div>
				</div>

			</div>

			<!-- TABLE REPORT -->
			<div class="card mt-5 shadow-sm">
				<div class="card-header bg-dark text-white">
					Recent Donations
				</div>

				<div class="card-body table-responsive">
					<table class="table table-bordered table-striped">
						<thead class="table-success">
							<tr>
								<th>ID</th>
								<th>Donor</th>
								<th>Food Type</th>
								<th>Quantity</th>
								<th>Status</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>ABC Hotel</td>
								<td>Rice</td>
								<td>50 kg</td>
								<td><span class="badge bg-warning">Pending</span></td>
								<td>10 Feb 2026</td>
							</tr>

							<tr>
								<td>2</td>
								<td>XYZ Company</td>
								<td>Biryani</td>
								<td>30 kg</td>
								<td><span class="badge bg-success">Picked</span></td>
								<td>9 Feb 2026</td>
							</tr>

							<tr>
								<td>3</td>
								<td>College Hostel</td>
								<td>Chapati</td>
								<td>20 kg</td>
								<td><span class="badge bg-danger">Expired</span></td>
								<td>8 Feb 2026</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>

		<%@ include file="/WEB-INF/common/footer.jsp" %>