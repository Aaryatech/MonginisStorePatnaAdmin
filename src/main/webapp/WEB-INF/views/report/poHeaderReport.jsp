<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getPoListReport" value="/getPoListReport"></c:url>
	<c:url var="getTypeListForPendingPo" value="/getTypeListForPendingPo"></c:url>


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

						<i class="fa fa-file-o"></i>PO Report List

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>PO Report List
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/"> </a> <a
									data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class="box-content">

							<div class="box-content">

								<div class="col-md-2">From Date*</div>
								<div class="col-md-3">
									<input id="fromDate" class="form-control date-picker"
										placeholder="From Date" value="${date}" name="fromDate"
										type="text" required>


								</div>
								<div class="col-md-1"></div>
								<div class="col-md-2">To Date*</div>
								<div class="col-md-3">
									<input id="toDate" class="form-control date-picker"
										placeholder="To Date" value="${date}" name="toDate"
										type="text" required>


								</div>


							</div>
							<br> <br>

							<div class="box-content">

								<div class="col-md-2">Select Vendor</div>
								<div class="col-md-3">

									<select name="vendorIdList[]" id="vendorIdList"
										class="form-control chosen" multiple="multiple"
										placeholder="Select Vendor">
										<option value="0">All Vendors</option>
										<c:forEach items="${vendorList}" var="vendorList">

											<option value="${vendorList.vendorId}">${vendorList.vendorName}</option>
										</c:forEach>
									</select>

								</div>
								<div class="col-md-1"></div>
								<div class="col-md-2">Select PO Type</div>
								<div class="col-md-3">

									<select name="poTypeList[]" id="poTypeList"
										class="form-control chosen" tabindex="6" multiple="multiple">
										<option value="0">All Type</option>
										<c:forEach items="${typeList}" var="typeList">

											<option value="${typeList.typeId}">${typeList.typeName}</option>
										</c:forEach>

									</select>

								</div>
							</div>
							<br>
							<div class="box-content">
								<div class="col-md-2">Select Status</div>
								<div class="col-md-3">

									<select name="poStatus[]" id="poStatus"
										class="form-control chosen" multiple="multiple" tabindex="6"
										required>
										<option value="-1">All</option>
										<option value="0">Pending</option>
										<option value="1">Partial Pending</option>
										<option value="2">Completed</option>

									</select>

								</div>
							</div>
							<br>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
									<input type="button" class="btn btn-primary" value="Search "
										onclick="search()">
								</div>



							</div>
							<br>

							<div align="center" id="loader" style="display: none">

								<span>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>

							<br /> <br />
							<div class="clearfix"></div>
							<div class="table-responsive" style="border: 0">
								<table class="table table-advance" id="table1">
									<thead>
										<tr class="bgpink">
											<th width="2%">Sr no.</th>
											<th class="col-md-1">PO Date</th>
											<th class="col-md-3">Vendor Name</th>
											<th class="col-md-1">Po No</th> 
											<th class="col-md-1">Po Total Value</th> 
											<th class="col-md-1">Po Status</th>
											<th class="col-md-1">Po Type</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="list" varStatus="count">
											<tr>
												<td class="col-md-1"><c:out value="${count.index+1}" /></td>


												<td class="col-md-1"><c:out value="${list.poDate}" /></td>

												<td class="col-md-1"><c:out value="${list.vendorName}" /></td>

												<td class="col-md-1"><c:out value="${list.poNo}" /></td>
												<td class="col-md-1"><c:out
														value="${list.poBasicValue}" /></td>
												<td class="col-md-1"><c:out value="${list.totalValue}" /></td>
												<td class="col-md-1"><c:out value="${list.poTaxValue}" /></td>

												<td class="col-md-1"><c:out value="${list.poStatus}" /></td>
												<td class="col-md-1"><c:out value="${list.poType}" /></td>




											</tr>
										</c:forEach>

									</tbody>

								</table>
								<div class="form-group" id="range">



									<div class="col-sm-3  controls">
										<input type="button" id="expExcel" class="btn btn-primary"
											disabled="disabled" value="EXPORT TO Excel"
											onclick="exportToExcel();">
									</div>
								</div>
								<button class="btn btn-primary" value="PDF" id="PDFButton"
									disabled="disabled" onclick="genPdf()">PDF</button>
							</div>
						</div>



					</div>

				</div>

			</div>
			<footer>
				<p>2019 © MONGINIS</p>
			</footer>
		</div>


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


	<script type="text/javascript">
		function search() {

			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();
			var vendorIdList = $("#vendorIdList").val();
			var poTypeList = $("#poTypeList").val();
			var poStatus = $("#poStatus").val();
			//alert("hii");
			//alert(vendorIdList);
			$('#loader').show();

			$.getJSON('${getPoListReport}',

			{

				fromDate : fromDate,
				toDate : toDate,
				vendorIdList : vendorIdList,
				poStatus : poStatus,
				poTypeList : poTypeList,

				ajax : 'true'

			}, function(data) {
				
				
				$.getJSON('${getTypeListForPendingPo}',

						{
 
							ajax : 'true'

						}, function(data1) {

				$('#table1 td').remove();
				$('#loader').hide();
				document.getElementById("expExcel").disabled = false;
				document.getElementById("PDFButton").disabled = false;
				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel").disabled = true;
					document.getElementById("PDFButton").disabled = true;

				}

				$.each(data, function(key, itemList) {

					var tr = $('<tr></tr>');
					tr.append($('<td></td>').html(key + 1));
					tr.append($('<td></td>').html(itemList.poDate));
					tr.append($('<td></td>').html(itemList.vendorName));
					tr.append($('<td></td>').html(itemList.poNo));
					tr.append($('<td align="right"></td>').html((itemList.poBasicValue-itemList.discValue+itemList.poTaxValue+itemList.poPackVal+itemList.poFrtVal+itemList.otherChargeAfter).toFixed(2))); 
					 
					 
					if (itemList.poStatus == 0) {
						modType = "Pending";

					} else if (itemList.poStatus == 1) {
						modType = "Partial Pending";
					} else if (itemList.poStatus == 2) {
						modType = "Completed";
					}
					tr.append($('<td></td>').html(modType));
					
					var modType1;
					for(var i=0;i<data1.length ; i++){
						
						if(data1[i].typeId==itemList.poType){
							modType1 = data1[i].typeName;
							break;
						}
						
					}

					 
					tr.append($('<td></td>').html(modType1));

					$('#table1 tbody').append(tr);
				})
				
						});

			});
		}
	</script>
	<script type="text/javascript">
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
	</script>

	<script type="text/javascript">
		function genPdf() {
			alert("hiii");
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;

			window.open('${pageContext.request.contextPath}/showPOPdf/'
					+ fromDate + '/' + toDate);
			document.getElementById("expExcel").disabled = true;

		}
	</script>

</body>
</html>