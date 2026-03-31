<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/header.jsp" %>

<%@ include file="/WEB-INF/common/sidebar-admin.jsp" %>

			<!-- MAIN CONTENT -->
			<div class="col-md-10 p-4 bg-light">

				<h3 class="mb-4">Admin Dashboard</h3>

				<!-- SUMMARY CARDS -->
				<div class="row g-4">

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Total Users</h5>
								<h2 class="text-primary">${totalUsers}</h2>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Total Donations</h5>
								<h2 class="text-success">${totalDonations}</h2>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Active NGOs</h5>
								<h2 class="text-warning">Calculating...</h2>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow-sm">
							<div class="card-body text-center">
								<h5>Pending Requests</h5>
								<h2 class="text-danger">Calculating...</h2>
							</div>
						</div>
					</div>

				</div>

				<!-- RECENT DONATIONS TABLE -->
				<div class="card mt-5 shadow-sm">
					<div class="card-header bg-success text-white">
						Recent Donations
					</div>

					<div class="card-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead class="table-light">
								<tr>
									<th>ID</th>
									<th>Donor</th>
									<th>Food</th>
									<th>Quantity</th>
									<th>Status</th>
									<th>Expiry Time</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${recentDonations}" var="donation">
									<tr>
										<td>${donation.donationId}</td>
										<td>${donation.donor.name}</td>
										<td>${donation.foodName}</td>
										<td>${donation.quantity}</td>
										<td>
											<span class="badge ${donation.status == 'CREATED' ? 'bg-warning' : 'bg-success'}">
												${donation.status}
											</span>
										</td>
										<td>${donation.expiryTime}</td>
									</tr>
								</c:forEach>
								<c:if test="${empty recentDonations}">
									<tr>
										<td colspan="6" class="text-center text-muted">No donations found.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>

				<!-- RECENT ACTIVITY -->
				<div class="card mt-4 shadow-sm">
					<div class="card-header bg-dark text-white">
						Recent Activity
					</div>

					<div class="card-body">
						<ul>
							<li>New donor registered</li>
							<li>Donation accepted by NGO</li>
							<li>Food expired automatically</li>
							<li>Pickup completed successfully</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/common/footer.jsp" %>