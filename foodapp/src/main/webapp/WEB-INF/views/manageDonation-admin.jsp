<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/header.jsp" %>

	<%@ include file="/WEB-INF/common/sidebar-admin.jsp" %>

		<div class="container mt-4">
			<h3 class="mb-4">Manage Donations</h3>

			<div id="cancelAlert" class="alert alert-success alert-dismissible fade d-none" role="alert">
				Donation canceled successfully.
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>

			<div class="row mb-3">
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="Search by food name, donor, NGO"
						id="searchBox">
				</div>
				<div class="col-md-3">
					<select class="form-select" id="statusFilter">
						<option value="">Filter by Status</option>
						<option value="CREATED">Available</option>
						<option value="ACCEPTED">Accepted</option>
						<option value="PICKED">Picked Up</option>
						<option value="COMPLETED">Completed</option>
						<option value="EXPIRED">Expired</option>
					</select>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<thead class="table-light">
						<tr>
							<th>ID</th>
							<th>Food Name</th>
							<th>Donor</th>
							<th>NGO</th>
							<th>Quantity</th>
							<th>Expiry Time</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${donations}" var="d">
							<tr class="text-nowrap">
								<td>${d.donationId}</td>
								<td>${d.foodName}</td>
								<td>${d.donor.name}</td>
								<td>${d.ngo != null ? d.ngo.organizationName : '-'}</td>
								<td>${d.quantity}</td>
								<td>${d.expiryTime}</td>
								<td class="status-cell">
									<span class="badge ${d.status == 'CREATED' ? 'bg-primary' : (d.status == 'ACCEPTED' ? 'bg-success' : 'bg-danger')}">
										${d.status}
									</span>
								</td>
								<td>
									<button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
										data-bs-target="#viewModal${d.donationId}">View</button>
									<a href="editDonation?id=${d.donationId}" class="btn btn-sm btn-outline-warning">Edit</a>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${empty donations}">
							<tr>
								<td colspan="8" class="text-center text-muted">No donations found.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
			</div>
		</div>

		<div class="modal fade" id="viewModal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">View Donation</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<p><strong>Donation ID:</strong> D001</p>
						<p><strong>Food Name:</strong> Chicken Biriyani</p>
						<p><strong>Donor Name:</strong> John Doe</p>
						<p><strong>NGO Name:</strong> -</p>
						<p><strong>Quantity:</strong> 10 kg</p>
						<p><strong>Location:</strong> Taramani, Chennai</p>
						<p><strong>Posted Date:</strong> 2024-02-01</p>
						<p><strong>Expiry Time:</strong> 2024-02-05</p>
						<p><strong>Status:</strong> Available</p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="cancelModal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Cancel Donation</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						Are you sure you want to cancel this donation?
					</div>
					<div class="modal-footer">
						<button class="btn btn-danger" id="confirmCancel">Yes, Cancel</button>
						<button class="btn btn-secondary" data-bs-dismiss="modal">No</button>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/common/footer.jsp" %>