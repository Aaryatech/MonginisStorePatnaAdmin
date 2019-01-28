<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getReturnableGatepass" value="/getReturnableGatepass"></c:url>
	<c:url var="getReturnableVenwise" value="/getReturnableVenwise"></c:url>
	<c:url var="getReturnableItemwise" value="/getReturnableItemwise"></c:url>
	<c:url var="getItemIdByCatId" value="/getItemIdByCatId"></c:url>



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

						<i class="fa fa-file-o"></i>Returnable Report List

					</h1>
				</div>
			</div>
			<br>
			<div class="box-content">
				<div class="col-md-2">Select Status</div>
				<div class="col-md-3">

					<select name="status" id="status" class="form-control chosen"
						tabindex="6" onchange="enableDiv(this.value)" required>
						<option value="1">Gatepass wise</option>
						<option value="2">Vendorwise</option>
						<option value="3">Itemwise</option>

					</select>

				</div>
			</div>
			<br> <br> <br>
			<!-- END Page Title -->

			<div class="row" id="tbody0">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Returnable Report List
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
											<th class="col-sm-1">Sr no.</th>
											<th class="col-md-1">GP No</th>
											<th class="col-md-1">Vendor Code</th>
											<th class="col-md-1">Vendor Name</th>
											<th class="col-md-1">Item Code</th>
											<th class="col-md-1">Item Name</th>
											<th class="col-md-1">GP Qty</th>
											<th class="col-md-1">Remaining Qty</th>
											<th class="col-md-1">Return Qty</th>
										</tr>
									</thead>
									<tbody>



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


			<div class="row" id="tbody1" style="display: none;">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Returnable Vendorwise Report List
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
									<input id="fromDate1" class="form-control date-picker"
										placeholder="From Date" value="${date}" name="fromDate1"
										type="text" required>


								</div>
								<div class="col-md-1"></div>
								<div class="col-md-2">To Date*</div>
								<div class="col-md-3">
									<input id="toDate1" class="form-control date-picker"
										placeholder="To Date" value="${date}" name="toDate1"
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

							</div>
							<br> <br>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
									<input type="button" class="btn btn-primary" value="Search "
										onclick="search1()">
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


							<div class="clearfix"></div>
							<div class="table-responsive" style="border: 0">
								<table class="table table-advance" id="table2">
									<thead>
										<tr class="bgpink">
											<th class="col-sm-1">Sr no.</th>
											<th class="col-md-1">GP No</th>
											<th class="col-md-1">Vendor Code</th>
											<th class="col-md-1">Vendor Name</th>
											<th class="col-md-1">GP Date</th>
											<th class="col-md-1">Item Code</th>
											<th class="col-md-1">Item Name</th>
											<th class="col-md-1">GP Qty</th>
											<th class="col-md-1">Remaining Qty</th>
											<th class="col-md-1">Return Qty</th>
										</tr>
									</thead>
									<tbody>



									</tbody>

								</table>
								<div class="form-group" id="range">



									<div class="col-sm-3  controls">
										<input type="button" id="expExcel1" class="btn btn-primary"
											disabled="disabled" value="EXPORT TO Excel"
											onclick="exportToExcel();">
									</div>
								</div>
								<button class="btn btn-primary" value="PDF" id="PDFButton1"
									disabled="disabled" onclick="genPdf1()">PDF</button>
							</div>
						</div>



					</div>

				</div>

			</div>


			<div class="row" id="tbody2" style="display: none;">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Returnable Itemwise Report List
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
									<input id="fromDate2" class="form-control date-picker"
										placeholder="From Date" value="${date}" name="fromDate2"
										type="text" required>


								</div>
								<div class="col-md-1"></div>
								<div class="col-md-2">To Date*</div>
								<div class="col-md-3">
									<input id="toDate2" class="form-control date-picker"
										placeholder="To Date" value="${date}" name="toDate2"
										type="text" required>


								</div>


							</div>

							<br> <br>
							<div class="box-content">

								<div class="col-md-2">Select Category*</div>
								<div class="col-md-3">
									<select class="form-control chosen"
										onchange="getItemsByCatId()" name="catId" id="catId">
										<option value="">Select Category</option>
										<c:forEach items="${catList}" var="catList">

											<option value="${catList.catId}">${catList.catDesc}</option>

										</c:forEach>
									</select>

								</div>
								<div class="col-md-1"></div>
								<div class="col-md-2">Select Item</div>
								<div class="col-md-3">
									<select data-placeholder="Select Item "
										class="form-control chosen" name="itemIdList[]" tabindex="-1"
										id="itemIdList" multiple="multiple">
										<option value="0">All Item</option>

										<c:forEach items="${itemList}" var="itemList">

											<option value="${itemList.itemId}"><c:out
													value="${itemList.itemDesc}"></c:out>
											</option>


										</c:forEach>
									</select>
								</div>
							</div>
							<br> <br>

							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
									<input type="button" class="btn btn-primary" value="Search "
										onclick="search2()">
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
								<table class="table table-advance" id="table3">
									<thead>
										<tr class="bgpink">
											<th class="col-sm-1">Sr no.</th>
											<th class="col-md-1">GP No</th>
											<th class="col-md-1">Item Code</th>
											<th class="col-md-1">Item Name</th>
											<th class="col-md-1">GP Date</th>
											<th class="col-md-1">Vendor Code</th>
											<th class="col-md-1">Vendor Name</th>

											<th class="col-md-1">GP Qty</th>
											<th class="col-md-1">Remaining Qty</th>
											<th class="col-md-1">Return Qty</th>
										</tr>
									</thead>
									<tbody>



									</tbody>

								</table>

								<div class="form-group" id="range">



									<div class="col-sm-3  controls">
										<input type="button" id="expExcel2" class="btn btn-primary"
											disabled="disabled" value="EXPORT TO Excel"
											onclick="exportToExcel2();">
									</div>
								</div>
								<button class="btn btn-primary" value="PDF" id="PDFButton2"
									disabled="disabled" onclick="genPdf2()">PDF</button>
							</div>
						</div>



					</div>

				</div>

			</div>
			<br> <br>

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

			$('#loader').show();

			$.getJSON('${getReturnableGatepass}',

			{

				fromDate : fromDate,
				toDate : toDate,

				ajax : 'true'

			}, function(data) {

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
					tr.append($('<td></td>').html(itemList.gpNo));
					tr.append($('<td></td>').html(itemList.vendorName));
					tr.append($('<td></td>').html(itemList.vendorCode));

					tr.append($('<td></td>').html(itemList.itemDesc));
					tr.append($('<td></td>').html(itemList.itemCode));

					tr.append($('<td></td>').html(itemList.gpQty));
					tr.append($('<td></td>').html(itemList.gpRemQty));
					tr.append($('<td></td>').html(itemList.gpRetQty));

					$('#table1 tbody').append(tr);
				})

			});
		}
	</script>
	<script type="text/javascript">
		function search1() {

			var fromDate1 = $("#fromDate1").val();
			var toDate1 = $("#toDate1").val();
			var vendorIdList = $("#vendorIdList").val();

			$('#loader').show();

			$.getJSON('${getReturnableVenwise}',

			{

				fromDate1 : fromDate1,
				toDate1 : toDate1,
				vendorIdList : vendorIdList,

				ajax : 'true'

			}, function(data) {

				$('#table2 td').remove();
				$('#loader').hide();
				document.getElementById("expExcel1").disabled = false;
				document.getElementById("PDFButton1").disabled = false;
				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel1").disabled = true;
					document.getElementById("PDFButton1").disabled = true;

				}

				$.each(data, function(key, itemList) {

					var tr = $('<tr></tr>');
					tr.append($('<td></td>').html(key + 1));
					tr.append($('<td></td>').html(itemList.gpNo));
					tr.append($('<td></td>').html(itemList.vendorCode));
					tr.append($('<td></td>').html(itemList.vendorName));

					tr.append($('<td></td>').html(itemList.gpDate));
					tr.append($('<td></td>').html(itemList.itemCode));
					tr.append($('<td></td>').html(itemList.itemDesc));

					tr.append($('<td></td>').html(itemList.gpQty));
					tr.append($('<td></td>').html(itemList.gpRemQty));
					tr.append($('<td></td>').html(itemList.gpRetQty));

					$('#table2 tbody').append(tr);
				})

			});
		}
	</script>
	<script type="text/javascript">
		function search2() {

			var fromDate2 = $("#fromDate2").val();
			var toDate2 = $("#toDate2").val();
			var itemIdList = $("#itemIdList").val();
			$('#loader').show();

			$.getJSON('${getReturnableItemwise}',

			{

				fromDate2 : fromDate2,
				toDate2 : toDate2,
				itemIdList : itemIdList,

				ajax : 'true'

			}, function(data) {

				$('#table3 td').remove();
				$('#loader').hide();
				document.getElementById("expExcel2").disabled = false;
				document.getElementById("PDFButton2").disabled = false;
				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel2").disabled = true;
					document.getElementById("PDFButton2").disabled = true;
				}

				$.each(data, function(key, itemList) {

					var tr = $('<tr></tr>');
					tr.append($('<td></td>').html(key + 1));
					tr.append($('<td></td>').html(itemList.gpNo));
					tr.append($('<td></td>').html(itemList.itemCode));
					tr.append($('<td></td>').html(itemList.itemDesc));
					tr.append($('<td></td>').html(itemList.vendorCode));
					tr.append($('<td></td>').html(itemList.vendorName));

					tr.append($('<td></td>').html(itemList.gpDate));

					tr.append($('<td></td>').html(itemList.gpQty));
					tr.append($('<td></td>').html(itemList.gpRemQty));
					tr.append($('<td></td>').html(itemList.gpRetQty));

					$('#table3 tbody').append(tr);
				})

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
		function exportToExcel1() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel1").disabled = true;
		}
	</script>

	<script type="text/javascript">
		function exportToExcel2() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel2").disabled = true;
		}
	</script>

	<script type="text/javascript">
		function genPdf() {
			alert("hiii");
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;

			window
					.open('${pageContext.request.contextPath}/showRetGatepassPdf/'
							+ fromDate + '/' + toDate);
			document.getElementById("expExcel").disabled = true;

		}
	</script>

	<script type="text/javascript">
		function genPdf1() {
			alert("Vendorwise Pdf");
			var fromDate = document.getElementById("fromDate1").value;
			var toDate = document.getElementById("toDate1").value;

			window
					.open('${pageContext.request.contextPath}/showRetVendorwisePdf/'
							+ fromDate + '/' + toDate);
			document.getElementById("expExcel1").disabled = true;

		}
	</script>

	<script type="text/javascript">
		function genPdf2() {
			alert("Itemwise Pdf");
			var fromDate = document.getElementById("fromDate2").value;
			var toDate = document.getElementById("toDate2").value;

			window
					.open('${pageContext.request.contextPath}/showRetItemwisePdf/'
							+ fromDate + '/' + toDate);
			document.getElementById("expExcel2").disabled = true;

		}

		function getItemsByCatId() {

			var catId = document.getElementById("catId").value;

			$.getJSON('${getItemIdByCatId}', {

				catId : catId,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="0">All Item</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].itemId + '">'
							+ data[i].itemDesc + '</option>';
				}
				html += '</option>';
				$('#itemIdList').html(html);
				$("#itemIdList").trigger("chosen:updated");
			});
		}
	</script>

	<script type="text/javascript">
		function enableDiv(status) {
			if (status == 1) {
				var x = document.getElementById("tbody0");
				x.style.display = "block";
				var y = document.getElementById("tbody1");
				y.style.display = "none";
				var z = document.getElementById("tbody2");
				z.style.display = "none";
			} else if (status == 2) {
				var x = document.getElementById("tbody0");
				x.style.display = "none";
				var y = document.getElementById("tbody1");
				y.style.display = "block";
				var z = document.getElementById("tbody2");
				z.style.display = "none";
			} else if (status == 3) {
				var x = document.getElementById("tbody0");
				x.style.display = "none";
				var y = document.getElementById("tbody1");
				y.style.display = "none";
				var z = document.getElementById("tbody2");
				z.style.display = "block";
			}
		}
	</script>

</body>
</html>