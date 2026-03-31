<%@ include file="/WEB-INF/common/header.jsp" %>
	<div class="container-fluid">
		<div class="row">

			<%@ include file="/WEB-INF/common/sidebar-ngo.jsp" %>

				<div class="container my-4">
					<div class="card shadow">
						<div class="card-body">

							<h5 class="text-success mb-3">Accept Food Donation</h5>

							<form class="row g-3" action="/acceptDonation" method="post">

								<div class="col-12">
									<h6 class="text-secondary">Food Information</h6>
								</div>

								<div class="col-md-6">
									<label class="form-label">Food Name</label>
									<input type="text" class="form-control" id="foodName">
								</div>

								<div class="col-md-6">
									<label class="form-label">Food Type</label>
									<input type="text" class="form-control" id="foodType">
								</div>

								<div class="col-md-4">
									<label class="form-label">Category</label>
									<input type="text" class="form-control" id="category">
								</div>

								<div class="col-md-4">
									<label class="form-label">Quantity</label>
									<input type="text" class="form-control" id="quantity">
								</div>

								<div class="col-md-4">
									<label class="form-label">Expiry Time</label>
									<input type="text" class="form-control" id="expiry">
								</div>

								<div class="col-12 mt-3">
									<h6 class="text-secondary">Location Information</h6>
								</div>

								<div class="col-12">
									<label class="form-label">Pickup Address</label>
									<div class="input-group">
										<input type="text" class="form-control" id="location">
										<button type="button" class="btn btn-outline-secondary" onclick="openMap()"><i
												class="bi bi-geo-alt-fill"></i></button>
									</div>
								</div>

								<div class="col-12 mt-3">
									<h6 class="text-secondary">Donor Information</h6>
								</div>

								<div class="col-md-6">
									<label class="form-label">Donor / Organization Name</label>
									<input type="text" class="form-control" id="donor">
								</div>

								<div class="col-md-6">
									<label class="form-label">Contact Number</label>
									<input type="text" class="form-control" id="donorContact">
								</div>
								<div class="col-md-12">
									<label class="form-label">Special Instructions / Notes</label>
									<textarea class="form-control" rows="2"></textarea>
								</div>

								<div class="col-12 mt-3">
									<h6 class="text-secondary">NGO / Volunteer Information</h6>
								</div>

								<div class="col-md-4">
									<label class="form-label">NGO Name</label>
									<input type="text" class="form-control" value="Helping Hands NGO" readonly>
								</div>

								<div class="col-md-4">
									<label class="form-label">Volunteer Name</label>
									<input type="text" class="form-control" value="Arun Kumar" readonly>
								</div>

								<div class="col-md-4">
									<label class="form-label">Contact Number</label>
									<input type="text" class="form-control" value="9876543210" readonly>
								</div>

								<div class="col-12 mt-3">
									<h6 class="text-secondary">Pickup Planning</h6>
								</div>

								<div class="col-md-4">
									<label class="form-label">Expected Pickup Time</label>
									<input type="datetime-local" class="form-control">
								</div>

								<div class="col-md-4">
									<label class="form-label">Number of Volunteers</label>
									<input type="number" class="form-control">
								</div>

								<div class="col-md-4">
									<label class="form-label">Vehicle Type</label>
									<select class="form-select">
										<option>Bike</option>
										<option>Van</option>
										<option>Truck</option>
									</select>
								</div>

								<div class="col-md-12">
									<label class="form-label">Remarks</label>
									<textarea class="form-control" rows="2"></textarea>
								</div>

								<div class="col-12 d-flex justify-content-end gap-2 mt-4">
									<button type="submit" class="btn btn-success">Accept Donation</button>
									<button type="button" class="btn btn-outline-danger"
										onclick="window.location.href='viewDonation'">Cancel </button>
								</div>

							</form>

						</div>
					</div>
				</div>
				</div>
				</div>

				
	<%@ include file="/WEB-INF/common/footer.jsp" %>