<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/header.jsp" %>

<div class="container-fluid">
	<div class="row min-vh-100">

		
			<%@ include file="/WEB-INF/common/sidebar-donor.jsp" %>
		

		<!-- Main Content -->
		<div class="col-md-10 p-4">

			<h4 class="mb-4">Manage Donations</h4>

			<!-- Filters -->
			<div class="row mb-3">
				<div class="col-md-3">
					<select class="form-select" id="filterStatus">
						<option value="">All Status</option>
						<option value="CREATED">Created</option>
						<option value="ACCEPTED">Accepted</option>
						<option value="PICKED_UP">Picked Up</option>
						<option value="COMPLETED">Completed</option>
						<option value="EXPIRED">Expired</option>
					</select>
				</div>

				<div class="col-md-3">
					<select class="form-select" id="filterDate">
						<option value="">All Dates</option>
						<option value="today">Today</option>
						<option value="thisWeek">This Week</option>
					</select>
				</div>

				<div class="col-md-3">
					<select class="form-select" id="filterType">
						<option value="">All Food</option>
						<option value="veg">Veg Food</option>
						<option value="nonveg">Non Veg Food</option>
						<option value="packed">Packed Food</option>
						<option value="snack">Snacks</option>
						<option value="fruit">Fruits</option>
						<option value="beverage">Beverages</option>
					</select>
				</div>

				<div class="col-md-3">
					<input type="text" class="form-control"
						placeholder="Search by food or location" id="searchBox">
				</div>
			</div>

			<!-- Table -->
			<div class="card shadow-sm">
				<div class="card-body">

					<div class="table-responsive">
						<table class="table table-bordered table-hover">

							<thead class="table-success">
								<tr>
									<th>Donation ID</th>
									<th>Food Name</th>
									<th>Quantity</th>
									<th>Location</th>
									<th>Expiry Time</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach items="${donations}" var="donation">
									<tr>
										<td>${donation.donationId}</td>
										<td>${donation.foodName}</td>
										<td>${donation.quantity}</td>
										<td>${donation.pickupAddress}</td>
										<td>${donation.expiryTime}</td>
										<td>
											<span class="badge ${donation.status == 'CREATED' ? 'bg-warning' : 'bg-success'}">
												${donation.status}
											</span>
										</td>
										<td>
											<button class="btn btn-sm btn-outline-primary">View</button>
											<button class="btn btn-sm btn-outline-warning">Edit</button>
											<button class="btn btn-sm btn-outline-danger">Delete</button>
										</td>
									</tr>
								</c:forEach>

								<c:if test="${empty donations}">
									<tr class="no-data-row">
										<td colspan="7" class="text-center text-muted">
											No donations found.
										</td>
									</tr>
								</c:if>

							</tbody>

						</table>
					</div>

				</div>
			</div>

		</div>

	</div>
</div>

<%@ include file="/WEB-INF/common/footer.jsp" %>