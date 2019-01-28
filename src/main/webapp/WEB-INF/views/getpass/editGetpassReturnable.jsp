<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<body>

	<c:url var="getgroupIdByCatId" value="/getgroupIdByCatId"></c:url>
	<c:url var="getItemIdByGroupId" value="/getItemIdByGroupId"></c:url>

	<c:url var="editItemInEditGetpass" value="/editItemInEditGetpass"></c:url>
	<c:url var="addItemInEditGetpassReturnableList"
		value="/addItemInEditGetpassReturnableList"></c:url>
	<c:url var="deleteItemFromEditGetpass"
		value="/deleteItemFromEditGetpass"></c:url>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


	<div class="container" id="main-container">

		<!-- BEGIN Sidebar -->
		<div id="sidebar" class="navbar-collapse collapse">

			<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>

			<div id="sidebar-collapse" class="visible-lg">
				<i class="fa fa-angle-double-left"></i>
			</div>
			<!-- END Sidebar Collapse Button -->
		</div>
		<!-- END Sidebar -->

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			<!-- <div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i>Edit Gatepass Returnable
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Edit Gatepass Returnable
							</h3>

							<div class="box-tool">
								<a
									href="${pageContext.request.contextPath}/listOfGetpassReturnable">Returnable
									Gatepass List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">

							<form id="submitMaterialStore"
								action="${pageContext.request.contextPath}/submitEditGetpassReturnable"
								method="post">
								<div class="box-content">

									<div class="col-md-2">Gatepass Date*</div>
									<div class="col-md-3">
										<input id="gpDate" class="form-control date-picker"
											placeholder="Getpass Date" name="gpDate" type="text"
											value="${editGetpassHeader.gpDate}" required>


									</div>

									<div class="col-md-2">Gatepass No</div>
									<div class="col-md-3">
										<input class="form-control" id="gpNo" placeholder="Getpass No"
											type="text" name="gpNo" value="${editGetpassHeader.gpNo}" readonly/>
									</div>
								</div>
								<br>


								<div class="box-content">

									<div class="col-md-2">Select Gatepass Vendor</div>
									<div class="col-md-10">

										<select name="vendId" id="vendId" class="form-control chosen"
											  required>
											 
											<c:forEach items="${vendorList}" var="vendorList">
												<c:choose>
													<c:when
														test="${vendorList.vendorId==editGetpassHeader.gpVendor}">
														<option value="${vendorList.vendorId}" selected>${vendorList.vendorName} &nbsp;&nbsp; ${vendorList.vendorCode}</option>
													</c:when>
													<c:otherwise>
														<option value="${vendorList.vendorId}">${vendorList.vendorName} &nbsp;&nbsp; ${vendorList.vendorCode}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select> 
									</div>
									 
								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Return For*</div>
									<div class="col-md-3">
										<select name="returnFor" id="returnFor"
											class="form-control chosen" tabindex="6" required>
											<c:choose>
												<c:when test="${editGetpassHeader.forRepair==0}">
													<option value="0" selected>Repair</option>
													<option value="1">Replace</option>
													<option value="2"  >Job Work</option>
												</c:when>
												<c:when test="${editGetpassHeader.forRepair==1}">
													<option value="0">Repair</option>
													<option value="1" selected>Replace</option>
													<option value="2"  >Job Work</option>
												</c:when>
												<c:when test="${editGetpassHeader.forRepair==2}">
													<option value="0">Repair</option>
													<option value="1">Replace</option>
													<option value="2" selected>Job Work</option>
												</c:when>
												<c:otherwise>
													<option value="0">Repair</option>
													<option value="1">Replace</option>
													<option value="2"  >Job Work</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div>

									<div class="col-md-2">Stockable</div>
									<div class="col-md-3">
										<select name="stock" id="stock" class="form-control chosen"
											tabindex="6" required>
											<c:choose>
												<c:when test="${editGetpassHeader.isStockable==0}">
													<option value="0" selected>Yes</option>
													<option value="1">No</option>
												</c:when>
												<c:when test="${editGetpassHeader.isStockable==1}">
													<option value="0">Yes</option>
													<option value="1" selected>No</option>
												</c:when>
												<c:otherwise>
													<option value="0">Yes</option>
													<option value="1">No</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div>
								</div>
								<br>
								<div class="box-content">
									<div class="col-md-2">Sending for</div>
									<div class="col-md-3">
										<input type="text" name="sendingWith" id="sendingWith"
											placeholder="Sending for" class="form-control"
											value="${editGetpassHeader.sendingWith}" />

									</div>


									<div class="col-md-2">Remark</div>
									<div class="col-md-3">
										<input type="text" name="remark1" id="remark1"
											placeholder="Remark" class="form-control"
											value="${editGetpassHeader.remark1}" />

									</div>
								</div>

								<br>

								 
								<hr />
								<div class="box-content">

									<div class="col-md-2">Select Category*</div>
									<div class="col-md-3">
										<select class="form-control chosen"
											onchange="getgroupIdByCatId()" name="catId" id="catId">
											<option value="">Select Category</option>
											<c:forEach items="${catList}" var="catList">
												<c:choose>
													<c:when test="${catList.catId==editItem.catId}">
														<option value="${catList.catId}" selected>${catList.catDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${catList.catId}">${catList.catDesc}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>
										</select>

									</div>
									 
										<div class="col-md-2">Select Group*</div>
										<div class="col-md-3">
											<select class="form-control chosen"
												onchange="getItemIdByGroupId()" name="grpId" id="grpId">
												<c:forEach items="${getItemGroupList}"
													var="getItemGroupList">
													<c:choose>
														<c:when test="${getItemGroupList.grpId==editItem.grpId}">
															<option value="${getItemGroupList.grpId}" selected>${getItemGroupList.grpCode}</option>
														</c:when>
														<c:otherwise>
															<option value="${getItemGroupList.grpId}">${getItemGroupList.grpCode}</option>
														</c:otherwise>
													</c:choose>


												</c:forEach>

											</select>
										</div>
 

								</div>
								<br>
								<div class="box-content">

									<div class="col-md-2">Select Item</div>
									<div class="col-md-10">
										<select data-placeholder="Select Item Name"
											class="form-control chosen" name="itemId" tabindex="-1"
											id="itemId">
											<option value="">Select Item</option>

											<c:forEach items="${itemList}" var="itemList">

												<option value="${itemList.itemId}"><c:out
														value="${itemList.itemCode}"></c:out>
												</option>


											</c:forEach>
										</select>
									</div>

									<input type="hidden" name=editIndex id="editIndex" />
 
								</div>
								<br> 
								
								<div class="box-content">
								
								<div class="col-md-2">Description</div>
									<div class="col-md-10">
										<input type="text" name="remark" id="remark" placeholder="Description"
											class="form-control" />

									</div>
									  
								</div><br>
								
								<div class="box-content">
								
								<div class="col-md-2">Qty</div>
									<div class="col-md-3">
										<input type="text" name="qty" id="qty" placeholder="Qty"
											class="form-control" pattern="\d+" />

									</div>
									
									<div class="col-md-2">No of Days</div>
									<div class="col-md-3">
										<input class="form-control" id="noOfDays"
											placeholder="No of Days" type="text" name="noOfDays">
									</div>
									 
							 
								</div><br>
								
								<div class="box-content">

									<div class="col-md-2">Select UOM</div>
									<div class="col-md-10">
										<select  class="form-control chosen" name="uomId" 
											id="uomId">
											<option value="">Select UOM</option>

											<c:forEach items="${uomList}" var="uomList">

												<option value="${uomList.uomId}"><c:out
														value="${uomList.uom}"></c:out>
												</option>


											</c:forEach>
										</select>
									</div>
 
 
								</div>
								<br> 
								
								<br>
								
								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
									
									<c:choose>
										<c:when test="${editGetpassHeader.gpStatus==7 or editGetpassHeader.gpStatus==9}">
										<input type="button" class="btn btn-primary" value="Add Item"
											onclick="addItem()">
										</c:when>
										</c:choose>
										
									</div>
								</div><br>
								
								<div align="center" id="loader" style="display: none">

									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>



								<div class=" box-content">
									<div class="row">
										<div class="col-md-12 table-responsive">
											<table class="table table-bordered table-striped fill-head "
												style="width: 100%" id="table_grid">
												<thead>
													<tr>
														<th style="width:2%;">Sr.No.</th>
														<th class="col-md-5">Name</th>
														<th class="col-md-1">UOM</th>
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">No Of Days</th>
														<th class="col-md-1">Remark</th>
														<th class="col-md-1">Action</th>

													</tr>
												</thead>
												<tbody>

													<c:forEach
														items="${editGetpassHeader.getpassDetailItemNameList}"
														var="getpassDetailItemNameList" varStatus="count">
														<tr>
															<td><c:out value="${count.index+1}" /></td>

															<td><c:out
																	value="${getpassDetailItemNameList.itemCode}" /></td>
																	
															<td><c:out
																	value="${getpassDetailItemNameList.uomName}" /></td>

															<td><c:out
																	value="${getpassDetailItemNameList.gpQty}" /></td>

															<td><c:out
																	value="${getpassDetailItemNameList.gpNoDays}" /></td>
																	
															<td><c:out
																	value="${getpassDetailItemNameList.remark}" /></td>


															<td>
															
															<c:choose>
															<c:when test="${(editGetpassHeader.gpStatus==7 or editGetpassHeader.gpStatus==9) && (getpassDetailItemNameList.gpStatus==7 or getpassDetailItemNameList.gpStatus==9)}">
															<a href="#"><span
																	class='glyphicon glyphicon-edit'
																	onclick="edit(${count.index})" id="edit${count.index}"></span></a>
																<a href="#"><span class="glyphicon glyphicon-remove"
																	onclick="del(${count.index})" id="del${count.index}"></span></a>
															
															</c:when>
															<c:when test="${(getpassDetailItemNameList.gpStatus==3 or getpassDetailItemNameList.gpStatus==1 or getpassDetailItemNameList.gpStatus==2)}">
													  			 	
													  			 	Approved
													  			 	</c:when>
													  			 	
													  			 	<c:otherwise>
													  			 	Disapproved
													  			 	</c:otherwise>
															</c:choose>
															
															</td>

														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<c:choose>
										<c:when test="${editGetpassHeader.gpStatus==7 or editGetpassHeader.gpStatus==9}">
										<input type="submit" class="btn btn-primary" value="Submit">
										</c:when>
										</c:choose>

									</div>
								</div>
								<br> <br>




							</form>
						</div>
					</div>
				</div>
			</div>

			<footer>
				<p>2019 © MONGINIS</p>
			</footer>
		</div>

		<!-- END Main Content -->


		<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
			class="fa fa-chevron-up"></i></a>

		<!-- END Content -->
	</div>
	<!-- END Container -->

	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<!--page specific plugin scripts-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>


	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>





	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>

	<script type="text/javascript">
		function getgroupIdByCatId() {

			var catId = document.getElementById("catId").value;

			$.getJSON('${getgroupIdByCatId}', {

				catId : catId,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="">Select Category</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].grpId + '">'
							+ data[i].grpCode + '&nbsp;&nbsp;'+ data[i].grpDesc +'</option>';
				}
				html += '</option>';
				$('#grpId').html(html);
				$("#grpId").trigger("chosen:updated");
			});
		}

		function getItemIdByGroupId() {

			var grpId = document.getElementById("grpId").value;

			$.getJSON('${getItemIdByGroupId}', {

				grpId : grpId,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="">Select ItemGroup</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].itemId + '">'
							+ data[i].itemCode + '&nbsp;&nbsp;'+ data[i].itemDesc +'</option>';
				}
				html += '</option>';
				$('#itemId').html(html);
				$("#itemId").trigger("chosen:updated");
			});
		}
		function edit(key) {
			//alert(key);
			$('#loader').show();

			$
					.getJSON(
							'${editItemInEditGetpass}',

							{

								index : key,
								ajax : 'true'

							},
							function(data) {

								$('#loader').hide();
								document.getElementById("editIndex").value = key;
								document.getElementById("qty").value = data.gpQty;
								document.getElementById("catId").value = data.catId;
								document.getElementById("noOfDays").value = data.gpNoDays;
								$('#catId').trigger("chosen:updated");
								document.getElementById("uomId").value = data.uom;
								$('#uomId').trigger("chosen:updated");
								document.getElementById("remark").value = data.remark;

								$
										.getJSON(
												'${getgroupIdByCatId}',
												{

													catId : data.catId,
													ajax : 'true'
												},
												function(data1) {

													var html = '<option value="">Select Category</option>';

													var len = data1.length;
													for (var i = 0; i < len; i++) {
														if (data1[i].grpId == data.grpId) {
															html += '<option value="' + data1[i].grpId + '" selected>'
																	+ data1[i].grpCode
																	+ '&nbsp;&nbsp;'+ data1[i].grpDesc +'</option>';
														} else {
															html += '<option value="' + data1[i].grpId + '">'
																	+ data1[i].grpCode
																	+ '&nbsp;&nbsp;'+ data1[i].grpDesc +'</option>';
														}

													}
													html += '</option>';
													$('#grpId').html(html);
													$("#grpId").trigger("chosen:updated");

												});

								$
										.getJSON(
												'${getItemIdByGroupId}',
												{

													grpId : data.grpId,
													ajax : 'true'
												},
												function(data2) {

													var html = '<option value="">Select ItemGroup</option>';

													var len = data2.length;
													for (var i = 0; i < len; i++) {

														if (data2[i].itemId == data.gpItemId) {
															html += '<option value="' + data2[i].itemId + '" selected>'
																	+ data2[i].itemCode
																	+ '&nbsp;&nbsp;'+ data2[i].itemDesc +'</option>';
														} else {
															html += '<option value="' + data2[i].itemId + '">'
																	+ data2[i].itemCode
																	+ '&nbsp;&nbsp;'+ data2[i].itemDesc +'</option>';
														}
													}
													html += '</option>';
													$('#itemId').html(html);
													$("#itemId").trigger(
															"chosen:updated");
												});

							});
		}
	</script>
	<script type="text/javascript">
		function addItem() {

			var itemId = $("#itemId").val();
			var catId = $("#catId").val();
			var grpId = $("#grpId").val();
			var qty = $("#qty").val();
			var uomId = $("#uomId").val();
			var uomName = $("#uomId option:selected ").text();
			var noOfDays = $("#noOfDays").val();
			var remark = $("#remark").val();
			var editIndex = $("#editIndex").val();
			if(validation()==true){
			$('#loader').show();

			$
					.getJSON(
							'${addItemInEditGetpassReturnableList}',

							{

								itemId : itemId,
								qty : qty,
								catId : catId,
								grpId : grpId,
								uomId : uomId,
								uomName : uomName,
								noOfDays : noOfDays,
								editIndex : editIndex,
								remark : remark,
								ajax : 'true'

							},
							function(data) {

								$('#table_grid td').remove();
								$('#loader').hide();

								if (data == "") {
									alert("No records found !!");

								}

								$
										.each(
												data,
												function(key, itemList) {
													
													
													if(itemList.isUsed==1)
														{

													var tr = $('<tr></tr>');
													tr.append($('<td></td>')
															.html(key + 1));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.itemCode));
													tr
													.append($(
															'<td></td>')
															.html(
																	itemList.uomName));
													
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.gpQty));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.gpNoDays));
													tr
													.append($(
															'<td></td>')
															.html(
																	itemList.remark));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			'<span class="glyphicon glyphicon-edit" id="edit'
																					+ key
																					+ '" onclick="edit('
																					+ key
																					+ ');"> </span> <span class="glyphicon glyphicon-remove"  onclick="del('
																					+ key
																					+ ')" id="del'
																					+ key
																					+ '"></span>'));
													$('#table_grid tbody')
															.append(tr);
														}

												})

								document.getElementById("qty").value = "";
								document.getElementById("catId").value = "";
								$('#catId').trigger("chosen:updated");
								document.getElementById("grpId").value = "";
								$('#grpId').trigger("chosen:updated");
								document.getElementById("itemId").value = "";
								$('#itemId').trigger("chosen:updated");
								document.getElementById("editIndex").value = "";
								document.getElementById("remark").value = "";
								document.getElementById("noOfDays").value = "";
								document.getElementById("uomId").value = "";
								$('#uomId').trigger("chosen:updated");
								
							});
			}

		}
	</script>
	 
	<script type="text/javascript">
		function del(key) {

			var key = key;
			$('#loader').show();
			$
					.getJSON(
							'${deleteItemFromEditGetpass}',

							{

								index : key,
								ajax : 'true'

							},
							function(data) {

								$('#table_grid td').remove();
								$('#loader').hide();

								if (data == "") {
									alert("No records found !!");

								}

								$
										.each(
												data,
												function(key, itemList) {
													//alert(itemList.isUsed);
													if(itemList.isUsed==1)
													{

													var tr = $('<tr></tr>');
													tr.append($('<td ></td>')
															.html(key + 1));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.itemCode));
													
													tr
													.append($(
															'<td></td>')
															.html(
																	itemList.uomName));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.gpQty));
													tr
													.append($(
															'<td></td>')
															.html(
																	itemList.gpNoDays));
													tr
													.append($(
															'<td></td>')
															.html(
																	itemList.remark));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			'<span class="glyphicon glyphicon-edit" id="edit'
																					+ key
																					+ '" onclick="edit('
																					+ key
																					+ ');"> </span> <span class="glyphicon glyphicon-remove"  onclick="del('
																					+ key
																					+ ')" id="del'
																					+ key
																					+ '"></span>'));
													$('#table_grid tbody')
															.append(tr);
													}

												})

							});

		}
	</script>
<script type="text/javascript">
		function validation() {
			var itemId = $("#itemId").val();
			var catId = $("#catId").val();
			var grpId = $("#grpId").val();
			var qty = $("#qty").val();
			var noOfDays = $("#noOfDays").val();
			var uomId = $("#uomId").val();
			
			var isValid = true;
			if (catId == "" || catId == null) {
				isValid = false;
				alert("Please Select Category ");
			}
			
			else if (grpId == "" || grpId == null) {
				isValid = false;
				alert("Please Select Group ");
			}
			
			else if (itemId == "" || itemId == null) {
				isValid = false;
				alert("Please Select Item ");
			} 
			else if (isNaN(qty) || qty < 1 || qty == "") {
				isValid = false;
				alert("Please enter Quantity");
			}

			else if (isNaN(noOfDays) || noOfDays < 0 || noOfDays == "") {
				isValid = false;
				alert("Please enter No. Of Days");
			}
			else if (uomId == "" || uomId == null) {
				isValid = false;
				alert("Please Select UOM ");
			}

			return isValid;

		}
		function check() {

			var vendId = $("#vendId").val();

			if (vendId == "" || vendId == null) {
				alert("Select Vendor");
			}

		}
	</script>



</body>
</html>