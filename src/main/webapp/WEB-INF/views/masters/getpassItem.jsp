<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>


	<c:url var="getgroupIdByCatId" value="/getgroupIdByCatId"></c:url>
	<c:url var="getSubGroupIdByGroupId" value="/getSubGroupIdByGroupId"></c:url>
	<c:url var="exhibitorMobileNo" value="/exhibitorMobileNo"></c:url>

	<c:url var="isMobileNoExist" value="/isMobileNoExist"></c:url>


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

						<i class="fa fa-file-o"></i> Add Get pass Item

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>
								<c:choose>
									<c:when test="${edit==1}">Edit Exhibitor</c:when>
									<c:otherwise>Add Getpass Item</c:otherwise>
								</c:choose>
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/getpassItemList">
									Getpass Item List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertGetpassItem"
								method="post">

								<div class="box-content">

									<div class="col-md-2">Item Name*</div>
									<div class="col-md-3">
										<input id="itemName" class="form-control"
											placeholder="Item Name" value="${editItem.itemName}"
											style="text-align: left;" name="itemName" type="text"
											required> <input id="gpItemId" class="form-control"
											name="gpItemId" value="${editItem.gpItemId}" type="hidden">

									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Item Description*</div>
									<div class="col-md-3">
										<input id="itemDesc" class="form-control"
											placeholder="Item Description" value="${editItem.itemDesc}"
											style="text-align: left;" name="itemDesc" type="text"
											required>
									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Item Cost*</div>
									<div class="col-md-3">
										<input id="itemCost" class="form-control"
											placeholder="Item Cost" value="${editItem.itemCost}"
											style="text-align: left;" name="itemCost" type="text"
											required>

									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Warranty Date*</div>
									<div class="col-md-3">
										<input id="warrantyDate" class="form-control date-picker"
											placeholder="Warranty Date" value="${ date}"
											name="warrantyDate" type="text" required>


									</div>

								</div>
								<br> <br>
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">


										<input type="submit" class="btn btn-info" value="Submit"
											id="submit">

									</div>
								</div>
							</form>


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
		</div>
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
		function passwordValidation() {

			var pass = document.getElementById("password").value;
			var pass1 = document.getElementById("rePassword").value;

			if (pass != "" && pass1 != "") {
				if (pass != pass1) {
					alert("Password Not Matched ");
					document.getElementById("submit").disabled = true;
				} else {
					document.getElementById("submit").disabled = false;

				}

			}
		}

		function check() {

			var companyTypeId = document.getElementById("companyTypeId").value;
			var location = document.getElementById("location").value;

			if (companyTypeId == "" || companyTypeId == null) {
				alert("Select Company Type");
			} else if (location == "" || location == null) {
				alert("Select Location");
			}
		}
	</script>

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
							+ data[i].grpCode + '</option>';
				}
				html += '</option>';
				$('#grpId').html(html);
				$("#grpId").trigger("chosen:updated");
			});
		}

		function getSubGroupIdByGroupId() {

			var grpId = document.getElementById("grpId").value;

			$.getJSON('${getSubGroupIdByGroupId}', {

				grpId : grpId,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="">Select Sub-Category</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].subgrpId + '">'
							+ data[i].subgrpDesc + '</option>';
				}
				html += '</option>';
				$('#subGrpId').html(html);
				$("#subGrpId").trigger("chosen:updated");
			});
		}
	</script>


</body>
</html>