<%@ include file="/WEB-INF/common/header.jsp" %>
	

		<div class="container-fluid">
			<div class="row">

				<%@ include file="/WEB-INF/common/sidebar-donor.jsp" %>

					<!-- Main Content -->
					<div class="col-md-10 p-4">

						<!-- Header -->
						<div class="d-flex justify-content-between align-items-center mb-4">
							<h3>Welcome, Donor </h3>
							<button class="btn btn-primary">+ Add New Donation</button>
						</div>

						<!-- Summary Cards -->
						<div class="row mb-4">
							<div class="col-md-3">
								<div class="card text-center shadow-sm">
									<div class="card-body">
										<h5 class="card-title">Total Donations</h5>
										<p class="fs-4">12</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card text-center shadow-sm">
									<div class="card-body">
										<h5 class="card-title">Pending</h5>
										<p class="fs-4">5</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card text-center shadow-sm">
									<div class="card-body">
										<h5 class="card-title">Accepted</h5>
										<p class="fs-4">6</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card text-center shadow-sm">
									<div class="card-body">
										<h5 class="card-title">Expired</h5>
										<p class="fs-4">1</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Donation Table -->
						<div class="card shadow-sm">
							<div class="card-header bg-white">
								<h5 class="mb-0">My Donation History</h5>
							</div>
							<div class="card-body table-responsive">
								<table class="table table-bordered table-hover align-middle">
									<thead class="table-light">
										<tr>
											<th>S.No</th>
											<th>Food Type</th>
											<th>Quantity</th>
											<th>Expiry Time</th>
											<th>Location</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Cooked Rice</td>
											<td>20 Kg</td>
											<td>04 Feb 2026, 08:00 PM</td>
											<td>Chennai</td>
											<td>
												<span class="status-badge status-pending">Pending</span>
											</td>
											<td>
												<button class="btn btn-sm btn-warning">Edit</button>
												<button class="btn btn-sm btn-danger">Cancel</button>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Bread</td>
											<td>50 Packs</td>
											<td>04 Feb 2026, 06:00 PM</td>
											<td>Tambaram</td>
											<td>
												<span class="status-badge status-accepted">Accepted</span>
											</td>
											<td>
												<button class="btn btn-sm btn-secondary" disabled>Locked</button>
											</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Vegetable Curry</td>
											<td>15 Kg</td>
											<td>03 Feb 2026, 02:00 PM</td>
											<td>Velachery</td>
											<td>
												<span class="status-badge status-expired">Expired</span>
											</td>
											<td>
												<button class="btn btn-sm btn-secondary" disabled>Expired</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/common/footer.jsp" %>