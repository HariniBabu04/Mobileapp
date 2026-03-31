<%@ include file="/WEB-INF/common/header.jsp" %>



	<div class="container-fluid">
		<div class="row">

			<%@ include file="/WEB-INF/common/sidebar-ngo.jsp" %>

			<!-- Content -->
			<div class="col-md-10 p-4">
				<h3>Search Food by Location</h3>

				<div class="card mt-3">
					<div class="card-body">

						<form>
							<div class="row">

								<div class="col-md-4">
									<label>City</label>
									<input type="text" class="form-control" placeholder="Enter city">
								</div>

								<div class="col-md-4">
									<label>Food Type</label>
									<select class="form-select">
										<option>All</option>
										<option>Veg</option>
										<option>Non-Veg</option>
									</select>
								</div>

								<div class="col-md-4">
									<label>Meal Type</label>
									<select class="form-select">
										<option>All</option>
										<option>Breakfast</option>
										<option>Lunch</option>
										<option>Dinner</option>
									</select>
								</div>

							</div>

							<button class="btn btn-primary mt-3">Search</button>
						</form>

					</div>
				</div>

				<table class="table table-bordered mt-4">
					<thead class="table-dark">
						<tr>
							<th>Donor</th>
							<th>Food</th>
							<th>Qty</th>
							<th>Location</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>Hotel ABC</td>
							<td>Meals</td>
							<td>50</td>
							<td>Chennai</td>
							<td><button class="btn btn-success btn-sm">Accept</button></td>
						</tr>

						<tr>
							<td>IT Company</td>
							<td>Sandwich</td>
							<td>30</td>
							<td>Coimbatore</td>
							<td><button class="btn btn-success btn-sm">Accept</button></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/common/footer.jsp" %>