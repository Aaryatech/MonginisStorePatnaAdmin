<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	 
<style>
#disableMe {
	pointer-events: none;
}

</style>
	<body>
	 
	<c:url var="gateEntryList" value="/gateEntryList"></c:url>
	<c:url var="withPoRef" value="/withPoRef"></c:url>
	<c:url var="withPoRefDate" value="/withPoRefDate"></c:url> 

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
						<i class="fa fa-file-o"></i>Item Value Report
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Item Ledger Report
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/stockBetweenDateWithCatId">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">

							<form id="completproduction"
								action="${pageContext.request.contextPath}/approvedBom"
								method="post">
								<div class="box-content">
									<div class="col-md-2">From Date:</div>

									<div class="col-md-2">
										${fromDate}
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date:</div> 
									<div class="col-md-2">
										${toDate}
									</div>
 
								</div>
								<br>

								<div class="box-content">
									<div class="col-md-2">Item :</div>

									<div class="col-md-10">
										${item.itemCode} &nbsp;&nbsp; ${item.itemDesc}
									</div>
									 
 
								</div>
								<br>

								<div class="box-content">
									<div class="col-md-2">Category:</div>

									<div class="col-md-2">
										${item.catDesc}
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Group Code:</div> 
									<div class="col-md-2">
										${item.grpCode}
									</div>
 
								</div>
								<br>
								
								<div class="box-content">
									<div class="col-md-2">Opening Stock:</div>

									<div class="col-md-2">
										<fmt:formatNumber var="stkQty" type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${openingStock}"/> 
										${stkQty}
										<c:set var="oppyQty" value="${openingStock}"></c:set>
									</div>
									<div class="col-md-1"></div>
								 
 
								</div>
								<br>




								<div class=" box-content">
									<div class="row">
										<div class="col-md-12 table-responsive">
											<table class="table table-bordered table-advance"
												style="width: 100%" id="table_grid">
												<thead>
													<tr>
														<th style="text-align: center">Sr.No.</th>
														<th style="text-align: center">DATE</th>
														<th style="text-align: center">TYPE</th>
														<th style="text-align: center">RECIEPT NO.</th>
														<th style="text-align: center">IN QTY</th>
														<th style="text-align: center">OUT QTY</th>
														<th style="text-align: center">BALANCE QTY</th>
 
													</tr>
												</thead>
												<tbody>
													<c:set var="srNo" value="0" />
													<c:set var="totalInQty" value="0" />
													<c:set var="totalOutQty" value="0" />
													 
													<c:forEach items="${itemValuationList}" var="itemValuationList"
														varStatus="count">

														<tr>
															<td style="text-align: center"><c:out value="${count.index+1}" /></td>
															<c:set var="srNo" value="${srNo+1}" />
															<td style="text-align: center"><c:out value="${itemValuationList.date}" /></td>
															<td style="text-align: left"><c:out value="${itemValuationList.typeName}" /></td>
															<td style="text-align: left"><c:out value="${itemValuationList.receptNo}" /></td>

															<c:choose>
																<c:when test="${itemValuationList.type==1}">
																	<td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${itemValuationList.qty}"/> </td>
																	<c:set var="oppyQty" value="${oppyQty+itemValuationList.qty}"></c:set>
																	<c:set var="totalInQty" value="${totalInQty+itemValuationList.qty}"></c:set>
																</c:when>
																<c:otherwise>
																	<td align="right"><c:out value="-" /></td>
																</c:otherwise>
															</c:choose>

															<c:choose>
																<c:when test="${itemValuationList.type==0}">
																	<td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${itemValuationList.qty}"/> </td>
																	<c:set var="oppyQty" value="${oppyQty-itemValuationList.qty}"></c:set>
																	<c:set var="totalOutQty" value="${totalOutQty+itemValuationList.qty}"></c:set>
																</c:when>
																<c:otherwise>
																	<td align="right"><c:out value="-" /></td>
																</c:otherwise>
															</c:choose>
															
															<td align="right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${oppyQty}"/></td>
															</tr>
													</c:forEach>
													
													<tr>
															<td colspan="4"> <c:out value="Total" /></td>
															 
															<td align="right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${totalInQty}"/></td>
															<td align="right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${totalOutQty}"/></td>
															<td align="right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${openingStock+totalInQty-totalOutQty}"/></td>

													</tr>


												</tbody>
											</table>
										</div>
									</div>
								</div>



								<c:choose>
									<c:when test="${billOfMaterialHeader.status==0}">
										<div align="center" class="form-group">
											<div
												class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">

												<input type="submit" class="btn btn-primary"
													value="Approved">
											</div>
										</div>
									</c:when>
									
									<c:when test="${billOfMaterialHeader.status==1}">
										<div align="center" class="form-group">
											<div
												class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">

												<%-- <a href="${pageContext.request.contextPath}/rejectiontoBms?reqId=${billOfMaterialHeader.reqId}"><input type="button" class="btn btn-primary"
													value="For The Rejection And Return"></a>  --%>
												<a href="${pageContext.request.contextPath}/approveRejected?reqId=${billOfMaterialHeader.reqId}"
													id="disableMe"><input type="button" class="btn btn-primary"
													value="Approve Rejected" disabled></a>

											</div>
										</div>


									</c:when>




									<c:when test="${billOfMaterialHeader.status ==2}">
										<div align="center" class="form-group">
											<div
												class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">

												<%-- <a href="${pageContext.request.contextPath}/rejectiontoBms?reqId=${billOfMaterialHeader.reqId}"><input type="button" class="btn btn-primary"
													value="For The Rejection And Return"></a> --%> 
												<a href="${pageContext.request.contextPath}/approveRejected?reqId=${billOfMaterialHeader.reqId}"><input type="button" class="btn btn-primary"
													value="Approve Rejected"></a>

											</div>
										</div>


									</c:when>



									<c:when test="${billOfMaterialHeader.status eq '3'}">
										<div align="center" class="form-group">
											<div
												class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">

												<%-- <a href="${pageContext.request.contextPath}/rejectiontoBms?reqId=${billOfMaterialHeader.reqId}"
													id="disableMe"><input type="button" class="btn btn-primary"
													value="For The Rejection And Return" disabled></a>  --%>
												<a href="${pageContext.request.contextPath}/approveRejected?reqId=${billOfMaterialHeader.reqId}"
													id="disableMe"><input type="button" class="btn btn-primary"
													value="Approve Rejected" disabled></a>

											</div>
										</div>


									</c:when>

								</c:choose>




								<div class="box-content">
								</div>
								<br>
								<br>
								<br>


							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END Main Content -->
		<footer>
		<p>2019 © MONGINIS</p>
		</footer>

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
</body>
</html>