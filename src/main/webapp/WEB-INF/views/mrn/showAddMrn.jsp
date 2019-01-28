<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

#overlay2 {
    position: fixed;
    display: none;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(101, 113, 119, 0.5);
    z-index: 2;
    cursor: pointer;
}
#text2 {
   position: absolute;
    top: 50%;
    left: 50%;
    font-size: 25px;
    color: white;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 20px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 100%;
	height: 100%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#overlay {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(101, 113, 119, 0.5);
	z-index: 2;
	cursor: pointer;
}

#text {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.bg-overlay {
	background: linear-gradient(rgba(0, 0, 0, .7), rgba(0, 0, 0, .7)),
		url("${pageContext.request.contextPath}/resources/images/smart.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	color: #fff;
	height: auto;
	width: auto;
	padding-top: 10px;
	padding-left: 20px;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body onload="callToInvoice()">
<div id="overlay2" >  <div id="text2"> Saving MRN....

</div></div>
	<%-- <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include> --%>

<c:url var="exportExcelforMrn" value="/exportExcelforMrn" />
	<c:url var="getPOHeaderList" value="/getPOHeaderList" />
	<c:url var="getPODetailList" value="/getPODetailList" />
	<c:url var="genrateNo" value="/genrateNo" />
	<c:url var="getTempPoDetail" value="/getTempPoDetail" />

	<c:url var="insertMrnProcess" value="/insertMrnProcess" />

	<c:url var="itemListByGroupId" value="/itemListByGroupId" />
	<c:url var="addMrnQty" value="/addMrnQty" />


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
						<i class="fa fa-file-o"></i>Add MRN
					</h1>

				</div>
			</div> --><br>
			<!-- END Page Title -->
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>MRN Header
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/getMrnHeaders">Back
									to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class="box-content">
							<div>
								<div class="box-content">
									<div>
										<form method="post" class="form-horizontal"
											id="validation-form">


											<div class="form-group">
												<div class="col-md-2">MRN Type</div>
												<div class="col-md-3">
													<select name="grn_type" id="grn_type"
														class="form-control chosen" placeholder="Grn Type"
														onchange="getInvoiceNo()" data-rule-required="true">
														<c:choose>

															<c:when test="${poType!=0}">
															
															<c:forEach items="${typeList}" var="typeList"> 
																<c:choose>
																	<c:when test="${poType==typeList.typeId}">
																		<option value="${typeList.typeId}" selected>${typeList.typeName}</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${typeList.typeId}" disabled>${typeList.typeName}</option>
																	</c:otherwise>
																
																</c:choose>
																 
																</c:forEach>
 
															</c:when>

															<c:otherwise>
																<option value="">Select Indent Type</option>
																<c:forEach items="${typeList}" var="typeList"> 
																<option value="${typeList.typeId}">${typeList.typeName}</option>
																</c:forEach>
															</c:otherwise>

														</c:choose>
													</select>
												</div>
												</div>
												

											<div class="form-group">

												<div class="col-md-2 ">MRN Date</div>

												<div class="col-md-3">
													<input class="form-control date-picker" id="grn_date"
														size="14" type="text" name="grn_date" value="${date}"
														onblur="getInvoiceNo()" required />
												</div>
												<div class="col-md-1 "></div>
												<div class="col-md-2">MRN No</div>
												<div class="col-md-3 controls">
													<input type="text" readonly name="grn_no" id="grn_no"
														class="form-control" placeholder="MRN No"
														data-rule-required="true" />
												</div>
											</div>
											
											<div class="form-group">
												<div class="col-md-2">Vendor</div>
												<div class="col-md-10">
													<select name="vendor_id" id="vendor_id"
														class="form-control chosen" placeholder="Vendor"
														data-rule-required="true">

														<option value=""><c:out value="SELECT VENDOR"/></option>
														<c:forEach items="${vendorList}" var="vendor"
															varStatus="count">
															<c:choose>
																<c:when test="${vendorId !=0 }">
																	<c:if test="${vendorId==vendor.vendorId}">
																		<option selected value="${vendor.vendorId}"><c:out value="${vendor.vendorName}"/></option>
																	</c:if>
																</c:when>
																<c:otherwise>
																	<option value="${vendor.vendorId}"><c:out value="${vendor.vendorName}"/></option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>

											</div><!--end of formgroup  -->
											
											<input type="hidden" name="gate_entry_no" id="gate_entry_no" value="1" data-rule-required="true" />
											<input  id="gate_entry_date"  type="hidden" name="gate_entry_date" value="${date}" required />
											<input type="hidden" name="chalan_no" id="chalan_no" value="1" data-rule-required="true" />
											<input id="chalan_date" type="hidden" name="chalan_date" value="${date}" required />
											
											<%-- <div class="form-group">
												<div class="col-md-2">Gate Entry No</div>

												<div class="col-md-3">
													<input type="text" name="gate_entry_no" id="gate_entry_no"
														class="form-control" placeholder="Gate Entry No"
														data-rule-required="true" />
												</div>
													<div class="col-md-1 "></div>
												<div class="col-md-2">Gate Entry Date</div>
												<div class="col-md-3">
													<input class="form-control date-picker"
														id="gate_entry_date" size="14" type="text"
														name="gate_entry_date" value="${date}" required />
												</div>
											</div> --%>
											<%-- <div class="form-group">
												<div class="col-md-2">Challan No</div>

												<div class="col-md-3">
													<input type="text" name="chalan_no" id="chalan_no"
														class="form-control" placeholder="Chalan No"
														data-rule-required="true" />
												</div>
<div class="col-md-1 "></div>
												<div class="col-md-2">Challan Date</div>
												<div class="col-md-3">
													<input class="form-control date-picker" id="chalan_date"
														size="14" type="text" name="chalan_date" value="${date}"
														required />
												</div>

											</div> --%>
											<div class="form-group">
												<div class="col-md-2">Bill/Chalan No</div>

												<div class="col-md-3">
													<input type="text" name="bill_no" id="bill_no"
														class="form-control" placeholder="Bill No"
														data-rule-required="true" />
												</div>
<div class="col-md-1 "></div>
												<div class="col-md-2">Bill/Chalan Date</div>
												<div class="col-md-3">
													<input class="form-control date-picker" id="bill_date"
														size="14" type="text" name="bill_date" value="${date}"
														required />
												</div>

											</div>
											
											<div class="form-group">
												<div class="col-md-2">Remark</div>

												<div class="col-md-10">
													<input type="text" name="lorry_remark" id="lorry_remark"
														class="form-control" placeholder="Lorry Remark" value="NA"
														data-rule-required="true" />
												</div> 
											</div>
											
											<div class="form-group">
												<div class="col-md-2">Select from PO List</div>
												<div class="col-md-3">

													<select name="po_list" id="po_list"
														class="form-control chosen" placeholder="Group"
														data-rule-required="true" multiple="multiple">
														
														<c:if test="${poId!=0}">
														<option selected value="${poId}">${poNo} &nbsp; ${errorMessage.message}</option>
														</c:if>
														
													</select>
												</div>
<div class="col-md-1 "></div>
												<div class="col-md-2">
													<input class="btn btn-info" id="getPoButton"
														onclick="getPoDetail()" size="16" type="button"
														name="getPoButton" value="Get PO Detail">
												</div>
												<div class="col-md-3"></div>
											</div>

											<div id="myModal" class="modal">

												<div class="modal-content" style="color: black;">
													<span class="close" id="close">&times;</span>
													<h3 style="text-align: center;">Enter Received
														Quantity</h3>
													<div class=" box-content">
														<div class="row">
															<div
																style="overflow: scroll; height: 70%; width: 100%; overflow: auto">
																<table width="100%" border="1" style="width: 100%; font-size: 14px;"
																	id="table_grid1">
																	<thead>
																		<tr>
																			<!-- <th class="col-md-1" style="text-align: center;">Select</th> -->
																			<th  width="2%" >Sr</th>
																		
																			<th class="col-md-1" >Item
																				</th>
																			<th class="col-md-1" >PO
																				QTY</th>
																			<!-- <th class="col-md-1" >Challan
																				QTY</th> -->
																			<th class="col-md-1" >Rec
																				QTY</th>
																			<th class="col-md-1" >Pend
																				QTY</th>
																			<th class="col-md-1" >PO
																				No</th>
																			<th class="col-md-1" >Status</th>
																		</tr>
																	</thead>
																	<tbody>

																	</tbody>
																</table>
															</div>
														</div>

													</div>
													<br>
													<div class="box-content">
														<div class="col-md-12" style="text-align: center">
															<input type=button class="btn btn-info"
																value="Submit" onclick="tempSubmit()">
																
																  <c:choose>
						<c:when test="${userInfo.id==1}">
						<input type="button" class="btn btn-info" value="Import Excel " onclick="exportExcel()">
						</c:when>
					</c:choose>  


														</div>
													</div>

												</div>

											</div>

											<button class="buttonload" id="loader"
												style="display: none; color: red;">
												<i class="fa fa-spinner fa-spin"></i>Loading
											</button>

											<div class=" box-content">
												<div class="row">
													<div
														style="overflow: scroll; height: 35%; width: 100%; overflow: auto">
														<table width="100%" border="0"
															class="table table-bordered table-striped fill-head "
															style="width: 100%;font-size: 14px;" id="table_grid2">
															<thead>
																<tr>
																	<th  style="text-align: center; width: 2%;">Sr</th>
																	<th class="col-md-1" >Item
																		</th>
																	<th class="col-md-1" >PO
																		QTY</th>
																	<th class="col-md-1" >Rec
																		QTY</th>
																	<th class="col-md-1" >Pend
																		QTY</th>
																	<th class="col-md-1" >PO
																		No</th>
																	<th class="col-md-1" >Status</th>
																</tr>
															</thead>

															<tbody>

															</tbody>

														</table>
													</div>
												</div>
											</div>
											
											<input type="hidden" name="transport" id="transport" data-rule-required="true" value="-" />
											<input type="hidden" name="lorry_no" id="lorry_no" data-rule-required="true" value="-" />
											<input id="lorry_date" type="hidden" name="lorry_date" value="${date}" required />

											<!-- <div class="form-group">
												<label class="col-md-2">Transport
												</label>

												<div class="col-md-3">
													<input type="text" name="transport" id="transport"
														class="form-control" placeholder="Transport"
														data-rule-required="true" value="-" />
												</div>
<div class="col-md-1 "></div>
												<label class="col-md-2">LR No
												</label>
												<div class="col-md-3">
													<input type="text" name="lorry_no" id="lorry_no"
														class="form-control" placeholder="Lorry No"
														data-rule-required="true" value="-" />
												</div>
											</div> -->

											<%-- <div class="form-group">
												<label class="col-md-2">LR
													Date </label>
												<div class="col-md-3">
													<input class="form-control date-picker" id="lorry_date"
														size="16" type="text" name="lorry_date" value="${date}"
														required />
												</div>
												  <div class="col-md-1 "></div>
												<label class="col-md-2">Remark
												</label>

												<div class="col-md-3">
													<input type="text" name="lorry_remark" id="lorry_remark"
														class="form-control" placeholder="Lorry Remark" value="NA"
														data-rule-required="true" />
												</div>  
											</div> --%>
											<div class="form-group">
												<div class="col-md-6"></div>
												<div class="col-md-3">
													<input type="button"
														style="text-align: center; align-content: center;"
														onclick="insertMrn()" class="btn btn-info" value="Submit">


												</div>
											</div>
										</form>
									</div>
								</div>

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
		</div>
		<!-- END Content -->
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
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/common.js"></script>

		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
		<!-- <script type="text/javascript">
		function getPoDetail() {
			//alert("inside Indent Insetr");

			//alert("called Button")
			var selectedPoIds = $("#po_list").val();
			alert(" Selected PO Id  " + selectedPoIds);

			$.getJSON('${getPODetailList}', {
				poIds : JSON.stringify(selectedPoIds),
				ajax : 'true',
			}, function(data) {
				alert(data);
				window.location.reload();

			});
			//	alert("Hi End  ");
		}
	</script> -->

		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$('#vendor_id')
										.change(
												function() {
													var grn_type = $(
															"#grn_type").val();
													//alert("Grn Type " +grn_type);
													$
															.getJSON(
																	'${getPOHeaderList}',
																	{
																		vendorId : $(
																				this)
																				.val(),
																		grn_type : grn_type,
																		ajax : 'true'
																	},
																	function(
																			data) {

																		var len = data.length;

																		$(
																				'#po_list')
																				.find(
																						'option')
																				.remove()
																				.end()
																		// $("#po_list").append($("<option></option>").attr( "value",-1).text("SELECT PO"));
																		for (var i = 0; i < len; i++) {

																			$(
																					"#po_list")
																					.append(
																							$(
																									"<option></option>")
																									.attr(
																											"value",
																											data[i].poId)
																									.text(
																											data[i].poNo +"   "+data[i].otherChargeBeforeRemark));
																		}

																		$(
																				"#po_list")
																				.trigger(
																						"chosen:updated");
																	});
												});
							});
		</script>


		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$('#grn_type')
										.change(
												function() {
													var vendorId = $(
															"#vendor_id").val();
													//alert("vendorId : " +vendorId);
													$
															.getJSON(
																	'${getPOHeaderList}',
																	{
																		grn_type : $(
																				this)
																				.val(),
																		vendorId : vendorId,
																		ajax : 'true'
																	},
																	function(
																			data) {

																		var len = data.length;

																		$(
																				'#po_list')
																				.find(
																						'option')
																				.remove()
																				.end()
																		// $("#po_list").append($("<option></option>").attr( "value",-1).text("SELECT PO"));
																		for (var i = 0; i < len; i++) {

																			$(
																					"#po_list")
																					.append(
																							$(
																									"<option></option>")
																									.attr(
																											"value",
																											data[i].poId)
																									.text(
																											data[i].poNo+"   "+data[i].otherChargeBeforeRemark));
																		}

																		$(
																				"#po_list")
																				.trigger(
																						"chosen:updated");
																	});
												});
							});
		</script>

		<script>
			// Get the modal
			var modal = document.getElementById('myModal');

			// Get the button that opens the modal
			var btn = document.getElementById("getPoButton");

			// Get the <span> element that closes the modal
			var span = document.getElementById("close");

			// When the user clicks the button, open the modal 
			btn.onclick = function() {
				modal.style.display = "block";
				getPoDetail(0, 0);
			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";

				}
			}

			function getPoDetail(qty, poDId) {
				//alert("inside Indent Insetr");

				//alert("called Button")
				var selectedPoIds = $("#po_list").val();

				//alert(" Selected PO Id  " + selectedPoIds);

				$
						.getJSON(
								'${getPODetailList}',
								{
									poIds : JSON.stringify(selectedPoIds),
									qty : qty,
									poDId : poDId,
									ajax : 'true',
								},
								function(data) {
									$('#table_grid1 td').remove();
									$('#loader').hide();

									if (data == "") {
										alert("No records found !!");

									}

									$
											.each(
													data,
													function(key, itemList) {
														//alert("data received "
														//+ data[0]);

														var tr = $('<tr></tr>');
														if (itemList.receivedQty > 0) {
															tr = $('<tr bgcolor=#ec9da5></tr>');

														}
														/* tr
																.append($(
																		'<td class="col-md-1" style="text-align: center;"></td>')
																		.html(
																				"<input type=checkbox style='text-align:center; width:40px' class=form-control name=checkBox"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=checkBox"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " oninput='checkMe(this.value)'  />")); */

														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				key + 1));
														/* tr
																.append($(
																		'<td class="col-sm-1" style="text-align: center;"></td>')
																		.html(
																				itemList.itemCode)); */
																				
																				
																				tr
																				.append($(
																						'<td class="col-md-1"  ></td>')
																						.html('<div title="'+itemList.itemName+'">'+itemList.itemCode+' ' +itemList.itemName+ '</div>'))
				
													/* 							
														tr
																.append($(
																		'<td class="col-md-4" style="text-align: left;"></td>')
																		.html(
																				itemList.itemName)); */
														tr
																.append($(
																		'<td class="col-md-1" align="right" ></td>')
																		.html(
																				itemList.itemQty));

														/* tr
																.append($(
																		'<td class="col-md-1"  ></td>')
																		.html(
																				"<input type=text style='text-align:right; width:110px' class=form-control name=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " onchange='(this.value,"
																						+ itemList.poDetailId
																						+ ","
																						+ itemList.pendingQty
																						+ ","
																						+ itemList.itemId
																						+ ")' value="
																						+ itemList.chalanQty
																						+ " />")); */

														tr
																.append($(
																		'<td class="col-md-1"  ></td>')
																		.html(
																				"<input type=hidden  name=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " onchange='(this.value,"
																						+ itemList.poDetailId
																						+ ","
																						+ itemList.pendingQty
																						+ ","
																						+ itemList.itemId
																						+ ")' value="
																						+ itemList.chalanQty
																						+ " /> <input type=text style='text-align:right; width:200px' class=form-control name=recQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=recQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " onchange='callMe(this.value,"
																						+ itemList.poDetailId
																						+ ","
																						+ itemList.pendingQty
																						+ ","
																						+ itemList.itemId
																						+ ")' value="
																						+ itemList.receivedQty
																						+ " />"));
														/* 		var pendQty=0;
																if(itemList.receivedQty==0){
																	
																	pendQty=itemList.pendingQty;
																}else{ */
														var pendQty = itemList.pendingQty
																- itemList.receivedQty;
														//}

														//tr.append($('<td></td>').html(itemList.itemQty));//textbox

														var status;
														if (itemList.status == 0) {
															status = "Pending";
														} else if (itemList.status == 1) {

															status = "Partial";
														} else {
															status = "Completed";
														}
														tr
																.append($(
																		'<td class="col-md-1" align="right" ></td>')
																		.html(
																				pendQty));
														tr
																.append($(
																		'<td class="col-md-1"  ></td>')
																		.html(
																				itemList.poNo));
														tr
																.append($(
																		'<td class="col-md-1"  ></td>')
																		.html(
																				status));
														$('#table_grid1 tbody')
																.append(tr);
													})
								});
			}
		</script>
		<!--  akshay call -->

		<script>
			function myFunction() {
				var input, filter, table, tr, td, i;
				input = document.getElementById("myInput");
				filter = input.value.toUpperCase();
				table = document.getElementById("table1");
				tr = table.getElementsByTagName("tr");
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[1];
					if (td) {
						if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
						}
					}
				}
			}
			function callMe(qty, poDId, pendingQty, itemId) {
				var qty = document.getElementById("recQty" + poDId + itemId).value;
				var chalanQty = document.getElementById("chalanQty" + poDId
						+ itemId).value;

				//alert("Qty  " +qty  +"chalan Qty  " +chalanQty);
				  if (parseInt(qty) > parseInt(pendingQty)) {
					document.getElementById("recQty" + poDId + itemId).value = 0;
					alert("Received Qty can not be greater than Pending Qty");

				} else { 

					/* if (chalanQty > 0) { */
						addMrnQty(qty, poDId, chalanQty);

					/* } else {
						document.getElementById("recQty" + poDId + itemId).value = 0;
						alert("Please Enter Valid Chalan Quantity");
					} */
					//getPoDetail(qty, poDId);

				 }

			}
			function checkMe(checking) {
				//alert("check " + checking);
			}
		</script>

		<script type="text/javascript">
			function tempSubmit() {
				//alert("inside Indent Insetr");
				$
						.getJSON(
								'${getTempPoDetail}',
								{

									ajax : 'true',
								},
								function(data) {
									$('#table_grid2 td').remove();
									$('#loader').hide();
									if (data == "") {
										alert("No records found !!");
									}
									var cnt = 0;
									$
											.each(
													data,
													function(key, itemList) {

														if (itemList.receivedQty > 0) {
															var tr = $('<tr></tr>');
															cnt = cnt + 1;
															/* tr
															.append($(
																	'<td></td>')
															.html("<input type=checkbox style='text-align:right; width:40px' class=form-control name=checkBox"+itemList.poDetailId+""+itemList.itemId+" id=checkBox"+itemList.poDetailId+""+itemList.itemId+" oninput='checkMe(this.value)'  />"));
																	cnt=			 */
															tr
																	.append($(
																			'<td style=" width=2%"></td>')
																			.html(
																					cnt));
															/* tr
																	.append($(
																			'<td class="col-sm-1" style="text-align: center;"></td>')
																			.html(
																					itemList.itemCode));
															 */

															tr
															.append($(
																	'<td class="col-md-2" ></td>')
																	.html('<div title="'+itemList.itemName+'">'+itemList.itemCode+' '+itemList.itemName+'</div>'))

														/* 	tr
																	.append($(
																			'<td class="col-md-4" style="text-align: left;"></td>')
																			.html(
																					itemList.itemName)); */
															tr
																	.append($(
																			'<td class="col-md-1" align="right"></td>')
																			.html(
																					itemList.itemQty));

															tr
																	.append($(
																			'<td class="col-md-1" ></td>')
																			.html(
																					"<input type=text style='text-align:right; width:150px' class=form-control name=recQty"
																							+ itemList.poDetailId
																							+ ""
																							+ itemList.itemId
																							+ " id=recQty"
																							+ itemList.poDetailId
																							+ ""
																							+ itemList.itemId
																							+ " onchange='callMe(this.value,"
																							+ itemList.poDetailId
																							+ ","
																							+ itemList.pendingQty
																							+ ","
																							+ itemList.itemId
																							+ ")' value="
																							+ itemList.receivedQty
																							+ " disabled />"));
															var pendQty = 0;
															if (itemList.receivedQty == 0) {

																pendQty = itemList.pendingQty;
															} else {
																pendQty = itemList.pendingQty
																		- itemList.receivedQty;
															}

															//tr.append($('<td></td>').html(itemList.itemQty));//textbox

															var status;
															if (itemList.status == 0) {
																status = "Pending";
															} else if (itemList.status == 1) {

																status = "Partial";
															} else {
																status = "Completed";
															}
															tr
																	.append($(
																			'<td class="col-md-1" align="right"></td>')
																			.html(
																					pendQty));
															tr
																	.append($(
																			'<td class="col-md-1" ></td>')
																			.html(
																					itemList.poNo));
															tr
																	.append($(
																			'<td class="col-md-1" ></td>')
																			.html(
																					status));
															$(
																	'#table_grid2 tbody')
																	.append(tr);
														}//end of if received Qty >0
														modal.style.display = "none";

													})
								});
			}
		</script>



		<script type="text/javascript">
			function insertMrn() {
				//alert("Hi ");
				//$('#loader').show();
				var grn_type = $("#grn_type").val();

				var vendor_id = $("#vendor_id").val();

				var grn_no = $("#grn_no").val();

				var grn_date = $("#grn_date").val();

				var gate_entry_no = $("#gate_entry_no").val();

				var gate_entry_date = $("#gate_entry_date").val();

				var chalan_no = $("#chalan_no").val();

				var chalan_date = $("#chalan_date").val();

				var bill_no = $("#bill_no").val();

				var bill_date = $("#bill_date").val();

				var po_list = $("#po_list").val();

				var lorry_date = $("#lorry_date").val();

				var lorry_no = $("#lorry_no").val();

				var lorry_remark = $("#lorry_remark").val();

				var transport = $("#transport").val();

				var isValid = true;
				if (grn_type == null || grn_type == "") {
					alert("Please Select MRN Type");
					isValid = false;
				}
				else if (vendor_id == null || vendor_id == "") {
					alert("Please Select Vendor Type");
					isValid = false;
				}

				else if (grn_no == null || grn_no == "") {
					alert("Please Select Grn No");
					isValid = false;
				}
				else if (grn_date == null || grn_date == "") {
					alert("Please Select MRN Date");
					isValid = false;
				}

				else if (gate_entry_no == null || gate_entry_no == "") {
					alert("Please Select Gate Entry No");
					isValid = false;
				}
				else if (gate_entry_date == null || gate_entry_date == "") {
					alert("Please Select Gate Entry Date");
					isValid = false;
				}

				else if (chalan_no == null || chalan_no == "") {
					alert("Please Select Chalan No");
					isValid = false;
				}

				else if (chalan_date == null || chalan_date == "") {
					alert("Please Select Chalan Date");
					isValid = false;
				}
				else if (bill_no == null || bill_no == "") {
					alert("Please Select Bill No");
					isValid = false;
				}

				else if (bill_date == null || bill_date == "") {
					alert("Please Select Bill Date");
					isValid = false;
				}

				else if (lorry_date == null || lorry_date == "") {
					alert("Please Select Lorry Date");
					isValid = false;
				}
				else if (lorry_no == null || lorry_no == "") {
					alert("Please Select Lorry No");
					isValid = false;
				}
				//lorry_remark,transport

				else if (lorry_remark == null || lorry_remark == "") {
					alert("Please Select Lorry Remark");
					isValid = false;
				}
				else if (transport == null || transport == "") {
					alert("Please Select Transport");
					isValid = false;
				}

				else if (isValid == true) {
					$('#loader').show();
					on();
					$
							.getJSON(
									'${insertMrnProcess}',
									{

										grn_type : grn_type,
										vendor_id : vendor_id,
										grn_no : grn_no,
										grn_date : grn_date,
										gate_entry_no : gate_entry_no,
										gate_entry_date : gate_entry_date,
										chalan_no : chalan_no,
										chalan_date : chalan_date,
										bill_no : bill_no,
										bill_date : bill_date,
										lorry_date : lorry_date,
										lorry_no : lorry_no,
										lorry_remark : lorry_remark,
										transport : transport,

										ajax : 'true',
									},
									function(data) {
										off();
										if (data != null) {
											document.getElementById('loader').style = "display:none";

											//alert("not null");

										}
										//document.getElementById('loader').style = "display:none";
										//alert("Res " +data);

										//window.location.reload();
										window
												.open(
														"${pageContext.request.contextPath}/getMrnHeaders",
														"_self");

										//window.open("${pageContext.request.contextPath}/showAddMrn","_self");

									});
					//	alert("Hi End  ");

				}
				//$('#loader').hide();
			}
		</script>
		<script type="text/javascript">
			function getInvoiceNo() {

				var date = $("#grn_date").val();
				var catId = $("#grn_type").val();

				$.getJSON('${genrateNo}', {

					catId : 1,
					docId : 1,
					date : date,
					typeId : catId,
					ajax : 'true',

				}, function(data) {

					document.getElementById("grn_no").value = data.message;

				});

			}
		</script>

		<script type="text/javascript">
			function addMrnQty(qty, poDId, chalanQty) {
				var selectedPoIds = $("#po_list").val();
				$
						.getJSON(
								'${addMrnQty}',
								{
									poIds : JSON.stringify(selectedPoIds),
									qty : qty,
									poDId : poDId,
									chalanQty : chalanQty,
									ajax : 'true',
								},
								function(data) {
									$('#table_grid1 td').remove();
									$('#loader').hide();

									if (data == "") {
										alert("No records found !!");

									}

									$
											.each(
													data,
													function(key, itemList) {
														//alert("data received "
														//+ data[0]);

														var tr = $('<tr></tr>');
														if (itemList.receivedQty > 0) {
															tr = $('<tr bgcolor=#ec9da5></tr>');

														}
														/* tr
																.append($(
																		'<td class="col-md-1" style="text-align: center;"></td>')
																		.html(
																				"<input type=checkbox style='text-align:center; width:40px' class=form-control name=checkBox"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=checkBox"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " oninput='checkMe(this.value)'  />")); */

														tr
																.append($(
																		'<td  style=" width:2%"></td>')
																		.html(
																				key + 1));

																						tr
																						.append($(
																								'<td class="col-md-1" ></td>')
																								.html('<div title="'+itemList.itemName+'">'+itemList.itemCode+' '+itemList.itemName+'</div>'))
						
														/* tr
																.append($(
																		'<td class="col-md-4" style="text-align: center;"></td>')
																		.html(
																				itemList.itemName)); */
														tr
																.append($(
																		'<td class="col-md-1" align="right"></td>')
																		.html(
																				itemList.itemQty));

														/* tr
																.append($(
																		'<td class="col-md-1" ></td>')
																		.html(
																				"<input type=text style='text-align:right; width:110px' class=form-control name=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " onchange='(this.value,"
																						+ itemList.poDetailId
																						+ ","
																						+ itemList.pendingQty
																						+ ","
																						+ itemList.itemId
																						+ ")' value="
																						+ itemList.chalanQty
																						+ " />")); */

														tr
																.append($(
																		'<td class="col-md-1" ></td>')
																		.html(
																				"<input type=hidden   name=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=chalanQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " onchange='(this.value,"
																						+ itemList.poDetailId
																						+ ","
																						+ itemList.pendingQty
																						+ ","
																						+ itemList.itemId
																						+ ")' value="
																						+ itemList.chalanQty
																						+ " /><input type=text style='text-align:right; width:200px' class=form-control name=recQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " id=recQty"
																						+ itemList.poDetailId
																						+ ""
																						+ itemList.itemId
																						+ " onchange='callMe(this.value,"
																						+ itemList.poDetailId
																						+ ","
																						+ itemList.pendingQty
																						+ ","
																						+ itemList.itemId
																						+ ")' value="
																						+ itemList.receivedQty
																						+ " />"));
														/* 		var pendQty=0;
																if(itemList.receivedQty==0){
																	
																	pendQty=itemList.pendingQty;
																}else{ */
														var pendQty = itemList.pendingQty
																- itemList.receivedQty;
														//}

														//tr.append($('<td></td>').html(itemList.itemQty));//textbox

														var status;
														if (itemList.status == 0) {
															status = "Pending";
														} else if (itemList.status == 1) {

															status = "Partial";
														} else {
															status = "Completed";
														}
														tr
																.append($(
																		'<td class="col-md-1" align="right"></td>')
																		.html(
																				pendQty));
														tr
																.append($(
																		'<td class="col-md-1" ></td>')
																		.html(
																				itemList.poNo));
														tr
																.append($(
																		'<td class="col-md-1" ></td>')
																		.html(
																				status));
														$('#table_grid1 tbody')
																.append(tr);
													})
								});
			}
		</script>
		
		<script type="text/javascript">
		function callToInvoice() {
			var poType=${poType};
			//alert(poType);
			if(poType!=0){
				getInvoiceNo();
			}
		}
		</script>
		<script>
function on() {
    document.getElementById("overlay2").style.display = "block";
}

function off() {
    document.getElementById("overlay2").style.display = "none";
}

function exportExcel()
{
	  
	  $
		.getJSON(
				'${exportExcelforMrn}',

				{
					 
					 
					ajax : 'true'

				},
				function(data) {
					 //alert("adf");
					  if (data == "") {
						alert("No records found !!");

					}
					 
					  addMrnQty(0, 0, 0);
				  /* $.each(
								data,
								function(key, itemList) {
								//alert(itemList.indDetailId);
									
									
									try {
										 
										    
										  /* document.getElementById("recQty"+itemList.indDetailId+itemList.itemId).value = itemList.qty;
										document.getElementById("chalanQty"+itemList.indDetailId+itemList.itemId).value =itemList.rate;   
										 
									}
									catch(err) {
									    
									}
								  	
								})   */
								
							 
					
				});
}

$(document).keypress(function (e) {
    if (e.which == 13) {
    	insertMrn();
    }
});
</script>
</body>
</html>

