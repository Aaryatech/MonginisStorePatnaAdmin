<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<body>


	<c:url var="getQuantity" value="/getQuantity"></c:url>

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
						<i class="fa fa-file-o"></i>Edit Gatepass Return
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Edit Gatepass Return
							</h3>

							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfGetpassReturn">Return
									Gatepass List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">

							<form id="submitMaterialStore"
								action="${pageContext.request.contextPath}/submitEditGetpassReturn"
								method="post">


								<div class="box-content">

									<div class="col-md-2">Select Gatepass Vendor</div>
									<div class="col-md-3">
 
										<c:forEach items="${vendorList}" var="vendorList">
										
												<c:choose>
													<c:when test="${vendorList.vendorId==editReturnList.vendorId}">
														<input class="form-control" id="vendName" placeholder="Getpass No"
											type="text" name="vendName" value="${vendorList.vendorName}" readonly/>
													</c:when>
													 
												</c:choose>
												 
											</c:forEach>

									</div>
									<div class="col-md-2">Gatepass No</div>
									<div class="col-md-3">
										<input class="form-control" id="gpNo" placeholder="Getpass No"
											type="text" name="gpNo" value="${editReturnList.gpNo}"
											readonly />
									</div>
									<input type="hidden" name="returnId" id="returnId"
										value="${editReturnList.returnId}" />

								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Return Date*</div>
									<div class="col-md-3">
										<input id="date" class="form-control date-picker"
											placeholder="Return Date" name="date" type="text"
											value="${editReturnList.gpReturnDate}" required>


									</div>

									<div class="col-md-2">Return No</div>
									<div class="col-md-3">
										<input class="form-control" id="returnNo"
											placeholder="Return No" type="text" name="returnNo"
											value="${editReturnList.returnNo}" Readonly />
									</div>
								</div>
								<br>
								<div class="box-content">



									<div class="col-md-2">Remark</div>
									<div class="col-md-3">
										<input type="text" name="remark" id="remark"
											placeholder="Remark" class="form-control"
											value="${editReturnList.gpRemark}" />

									</div>
								</div>

								<br>
								<div align="center" id="loader" style="display: none">

									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>

								<br /> <br />

								<div class=" box-content">
									<div class="row">
										<div class="col-md-12 table-responsive">
											<table class="table table-bordered table-striped fill-head "
												style="width: 100%" id="table_grid">
												<thead>
													<tr>
														<th style="width:2%;">Sr.No.</th> 
														<th class="col-md-5">Item Name</th>
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">Remaining Qty</th>
														<th class="col-md-1">Return Qty</th>
														<th class="col-md-1">Remark</th>


													</tr>
												</thead>

												<tbody>

													<c:forEach items="${list}" var="list" varStatus="count">
														<tr>
															<td><c:out value="${count.index+1}" /></td> 
															
															<td><c:out value="${list.itemCode}" /></td>
															
															<td>
															
															<input class="form-control"
																id="gpQty${count.index}" placeholder="Qty" type="text"
																name="gpQty${count.index}" value="${list.gpQty}"
																Readonly /></td>

															<td>
															<input id="existingRemQty${count.index}" type="hidden" name="existingRemQty${count.index}"
														value="${list.balanceQty}"   />
															<input class="form-control"
																id="remQty${count.index}" placeholder=" Rem Qty"
																type="text" name="remQty${count.index}"
																value="${list.balanceQty}" Readonly /></td>
 
															<td>
															<input id="existingReturnQty${count.index}" type="hidden" name="existingReturnQty${count.index}"
														value="${list.returnQty}"   />
															<input class="form-control"
																id="retQty${count.index}" placeholder="Return Qty"
																type="text" name="retQty${count.index}"
																onchange="check(${count.index})"
																value="${list.returnQty}"></td>

															<td><input class="form-control"
																id="remarkDetail${count.index}" placeholder="Remark" type="text"
																name="remarkDetail${count.index}" value="${list.remark}"></td>
														</tr>
													</c:forEach>


												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="submit" class="btn btn-primary"
											value="Save Changes">

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



	<script>
		function check(key) {

			var existingRemQty = parseFloat($('#existingRemQty'+key).val());
			var existingReturnQty = parseFloat($('#existingReturnQty'+key).val());
			
			var retQty = parseFloat($('#retQty'+key).val());
			var remQty = parseFloat($('#remQty'+key).val());

			if((existingRemQty+existingReturnQty) >= retQty){
				 
				document.getElementById("remQty"+key).value = existingRemQty+existingReturnQty-retQty;
			}else
				{
				alert("Please Enter Valid Quanity");
				document.getElementById("remQty"+key).value = existingRemQty;
				document.getElementById("retQty"+key).value = existingReturnQty;
				}

		}
	</script>


</body>
</html>