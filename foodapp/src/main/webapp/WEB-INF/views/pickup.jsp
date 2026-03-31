<%@ include file="/WEB-INF/common/header.jsp" %>
	<div class="container-fluid">
		<div class="row">

			<%@ include file="/WEB-INF/common/sidebar-ngo.jsp" %>



				<div class="container my-4">
					<div class="card shadow">
						<div class="card-body">

							<h5 class="text-success mb-3">Donation Information</h5>
							<table class="table table-bordered">
								<tr><th>Donation ID</th><td id="donationId"></td></tr>
								<tr><th>Food Name</th><td id="foodName"></td></tr>
								<tr><th>Food Type</th><td id="foodType"></td></tr>
								<tr><th>Quantity</th><td id="quantity"></td></tr>
								<tr><th>Donor Name / Organization</th><td id="donorName"></td></tr>
								<tr><th>Pickup Location</th><td id="pickupLocation"></td></tr>
								<tr><th>Accepted Time</th><td id="acceptedTime"></td></tr>
								<tr><th>NGO Name</th><td id="ngoName"></td></tr>
							</table>

							<h5 class="text-success mt-4 mb-3">Pickup Verification</h5>
							<form class="row g-3" id="pickupForm">
								<div class="col-md-4">
									<label class="form-label">Actual Pickup Time</label>
									<input type="datetime-local" class="form-control" id="actualPickupTime">
								</div>
								<div class="col-md-4">
									<label class="form-label">Volunteer Name</label>
									<input type="text" class="form-control" id="volunteerName">
								</div>
								<div class="col-md-4">
									<label class="form-label">Vehicle Number</label>
									<input type="text" class="form-control" id="vehicleNumber">
								</div>
								<div class="col-md-4">
									<label class="form-label">Condition of Food</label>
									<select class="form-select" id="foodCondition">
										<option>Good</option>
										<option>Average</option>
										<option>Not Suitable</option>
									</select>
								</div>
								<div class="col-md-8">
									<label class="form-label">Remarks</label>
									<textarea class="form-control" rows="2" id="pickupRemarks"></textarea>
								</div>

								<h5 class="text-success mt-4 mb-3">OTP Verification</h5>
								<div class="col-md-4">
									<label class="form-label">Enter Pickup OTP</label>
									<input type="text" class="form-control" id="pickupOTP">
								</div>
								<div class="col-md-2 d-flex align-items-end">
									<button type="button" class="btn btn-primary w-100" id="verifyOTP">Verify
										OTP</button>
								</div>

								<div class="col-12 d-flex justify-content-end gap-2 mt-4">
									<button type="button" class="btn btn-success" id="confirmPickup">Confirm
										Pickup</button>
									<button type="button" class="btn btn-outline-danger"
										onclick="window.location.href='acceptDonation'">Cancel</button>
								</div>
							</form>

						</div>
					</div>
				</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/common/footer.jsp" %>