<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<body>


	<c:url var="getMrnListByMrnId" value="/getMrnListByMrnId"></c:url>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<c:url var="editMemoQty" value="/editMemoQty"></c:url>

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
			<div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i>Edit Rejection Memo
					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Edit Rejection Memo
							</h3>

							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfRejectionMemo">Rejection
									List </a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">

							<form id="submitMaterialStore"
								action="${pageContext.request.contextPath}/submitEditRejectionMemo"
								method="post">

								<div class="box-content">

									<div class="col-md-2">Rejection Date:</div>
									<div class="col-md-3">
									${editRejection.rejectionDate}
										<%-- <input id="rejectionDate" class="form-control date-picker"
											placeholder="Rejection Date" name="rejectionDate" type="text" value="${editRejection.rejectionDate}"
											required> --%>


									</div>

									<div class="col-md-2">Rejection No:</div>
									<div class="col-md-3">
									${editRejection.rejectionNo}
										<%-- <input class="form-control" id="rejectionNo"
											placeholder="Rejection No" type="text" name="rejectionNo"   value="${editRejection.rejectionNo}"/> --%>
									</div>
								</div>
								<br>
								<div class="box-content">

									<div class="col-md-2">Select Vendor:</div>
									<div class="col-md-10">
									${editRejection.vendorName}

										<%-- <select name="vendId" id="vendId" class="form-control chosen"
											tabindex="6" required>
											<option value="">Select Vendor</option>
											<c:forEach items="${vendorList}" var="vendorList">
												<c:choose>
													<c:when
														test="${vendorList.vendorId==editRejection.vendorId}">
														<option value="${vendorList.vendorId}" selected>${vendorList.vendorName}</option>
													</c:when>
													<c:otherwise>
														<option value="${vendorList.vendorId}">${vendorList.vendorName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select> --%>

									</div>
									  <%-- <div class="col-md-2">Select Mrn No:</div>
									<div class="col-md-3">
									${editRejection.mrnNo}

										<select name="mrnId[]" id="mrnId" class="form-control chosen"
											placeholder="Mrn No" data-rule-required="true"
											readonly>
											<c:forEach items="${mrnList}" var="mrnList">
												<c:choose>
													<c:when
														test="${mrnList.mrnId==editRejection.mrnId}">
														<option value="${mrnList.mrnId}" selected>${mrnList.mrnNo}</option>
													</c:when>
													<c:otherwise>
														<option value="${mrnList.mrnId}">${mrnList.mrnNo}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>   --%>
									</div>
									<br>  
									
									<div class="box-content">

										<div class="col-md-2">Select Mrn No:</div>
									<div class="col-md-10">
									${editRejection.mrnNo}
 
									</div>
									</div>
									<br>

									<div class="box-content">

										<div class="col-md-2">Document Date:</div>
										<div class="col-md-3">
										${editRejection.dcoDate}
											<%-- <input id="docDate" class="form-control date-picker"
												placeholder="Document Date" name="docDate" type="text" value="${editRejection.dcoDate}"
												required> --%>


										</div>

										<div class="col-md-2">Document No:</div>
										<div class="col-md-3">
										${editRejection.dcoId}
											<%-- <input class="form-control" id="docNo"
												placeholder="Document No" type="text" name="docNo"  value="${editRejection.dcoId}"/> --%>
										</div>
									</div>
									<br>
									<div class="box-content">



										<div class="col-md-2">Remark:</div>
										<div class="col-md-3">
										${editRejection.rejectionRemark}
											<%-- <input type="text" name="remark" id="remark"
												placeholder="Remark" class="form-control"  value="${editRejection.rejectionRemark}"/> --%>

										</div>
										<div class="col-md-2">Remark1:</div>
										<div class="col-md-3">
										${editRejection.rejectionRemark}
											<%-- <input type="text" name="remark1" id="remark1"
												placeholder="Remark" class="form-control" value="${editRejection.rejectionRemark1}"/> --%>

										</div>
									</div>

									<br>
									
									<br>
								

								<div class=" box-content">
									<div class="row">
										<div class="col-md-12 table-responsive">
											<table class="table table-bordered table-striped fill-head "
												style="width: 100%" id="table_grid">
												<thead>
													<tr>
														<th style="width:2%;">Sr.No.</th>
														<th>Item Name</th>
														<th class="col-md-2">Rejection Qty</th>
														<th class="col-md-2">Memo Qty</th>




													</tr>
												</thead>

												<tbody>

													<c:forEach items="${editRejectionDetailList}" var="editRejectionDetailList"
														varStatus="count">
														<tr>
															<td  ><c:out value="${count.index+1}" /></td>


															<td  ><c:out
																	value="${editRejectionDetailList.itemCode}" /></td>

															<td  ><input class="form-control"
																id="gpQty${count.index}" placeholder="Qty" type="text"
																name="gpQty${count.index}"
																value="${editRejectionDetailList.rejectionQty}" Readonly /></td>

															<td  ><input class="form-control"
																id="memoQty${editRejectionDetailList.rejDetailId}" placeholder=" memo Qty" onchange="editMemoQty(this.value,${editRejectionDetailList.rejDetailId})"
																type="text" name="memoQty${count.index}" value="${editRejectionDetailList.memoQty}"></td>




															
														</tr>
													</c:forEach>


												</tbody>
											</table>
										</div>
									</div>
								</div>

								<!-- <div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="submit" class="btn btn-primary" value="Submit">

									</div>
								</div>
								<br> <br> -->




							</form>
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
		function search() {

			alert("hi");
			var mrnId = $("#mrnId").val();
			$('#loader').show();

			$
					.getJSON(
							'${getMrnListByMrnId}',

							{
								mrnId : mrnId,

								ajax : 'true'

							},
							function(data) {

								$('#table_grid td').remove();
								$('#loader').hide();

								alert(data);
								if (data == "") {
									alert("No records found !!");

								}

								for (var i = 0; i < data.length; i++) {
									for (var j = 0; j < data[i].getMrnDetailList.length; j++) {

										var tr = $('<tr></tr>');
										tr.append($('<td></td>').html(j + 1));
										tr
												.append($('<td></td>')
														.html(
																data[i].getMrnDetailList[j].itemCode));

										tr
												.append($('<td></td>')
														.html(
																data[i].getMrnDetailList[j].rejectQty));

										tr
												.append($('<td > <input type=number  id= memoQty'+
												  data[i].getMrnDetailList[j].mrnId+ ' name=memoQty'+ data[i].getMrnDetailList[j].mrnId+ '></td>'));

										$('#table_grid tbody').append(tr);
									}

								}

							});
		}
	</script>
	
	<script type="text/javascript">
	function editMemoQty(memoQty,rejDetailId){
	

		 $.getJSON('${editMemoQty}',{

			 rejDetailId : rejDetailId,
			 memoQty : memoQty,
		    	ajax : 'true',

		    }, function(data) {
				
			    $("#loader").hide();

			});
		
	}
	</script>


</body>
</html>