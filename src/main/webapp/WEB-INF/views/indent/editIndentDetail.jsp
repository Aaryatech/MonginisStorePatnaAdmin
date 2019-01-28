<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body>
	<%-- <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include> --%>

	<c:url var="getSubDeptListByDeptId" value="/getSubDeptListByDeptId" />
	<c:url var="getgroupListByCatId" value="/getgroupListByCatId" />

	<c:url var="getIndentDetail" value="/getIndentDetail" />

	<c:url var="itemListByGroupId" value="/itemListByGroupId" />
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
						<i class="fa fa-file-o"></i>Edit Indent Detail
					</h1>

				</div>
			</div>
			<!-- END Page Title -->
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Edit Indent Detail
							</h3>
							<div class="box-tool">
								<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
							</div>

						</div>


						<div class="box-content">
							<form action="editIndentProcess" method="post"
								class="form-horizontal" id="validation-form">

								<div class="form-group">

									<label class="col-sm-3 col-lg-2 control-label">Indent
										Date </label>
									<div class="col-sm-6 col-lg-4 controls">
										<c:out value="${indent.indMDate}"></c:out>
										<input type="hidden" value="${indent.indMId}" name="indentId">
									</div>
									<label class="col-sm-3 col-lg-2 control-label">Indent
										No.</label>
									<div class="col-sm-6 col-lg-4 controls">
										<c:out value="${indent.indMNo}"></c:out>
									</div>
								</div>
								<c:set var="indmtype" value="o"></c:set>
						</div>
					</div>

					<div class="clearfix"></div>
					<div id="table-scroll" class="table-scroll">

							<div class="table-wrap">

										<table id="table1" class="table table-advance">
								<thead>
									<tr class="bgpink">
										<th width="140" style="width: 30px" align="left">Sr No</th>
										<th width="138" align="left">Item</th>
										<th width="120" align="left">Indent Quantity</th>
										<th width="80" align="left">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${indDetailList}" var="indDetail" varStatus="count">

										<tr>
											<td align="left" style="text-align: center;"><c:out
													value="${count.index+1}" /></td>
											<td align="left" style="text-align: center;"><c:out
													value="${indDetail.indItemDesc}" /></td>
											<td align="left" style="text-align: center;"><c:out
													value="${indDetail.indQty}" /></td>
													<td align="left" style="text-align: center;"><c:out
													value="Update" /></td>

										</tr>
									</c:forEach>

								</tbody>
							</table>

						</div>

					</div>

					</form>
				</div>
			</div>
		</div>
		<footer>
				<p>2019 © MONGINIS</p>
			</footer>
	</div>

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
	<script type="text/javascript">
		function insertIndent() {
			//alert("inside Indent Insetr");
			var form = document.getElementById("validation-form");

			form.action = "${pageContext.request.contextPath}/saveIndent";
			form.submit();

		}
	</script>
	<script type="text/javascript">
		function showDept() {
			var mac_spec = document.getElementById("machine_specific").value;
			//alert("Machine Specific "+mac_spec);
			if (mac_spec == 1) {
				document.getElementById('deptDiv').style.display = "block";
			}
			if (mac_spec == 0) {
				document.getElementById('deptDiv').style.display = "none";
			}
		}
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$('#dept')
									.change(
											function() {

												$
														.getJSON(
																'${getSubDeptListByDeptId}',
																{
																	deptId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {

																	var len = data.length;

																	$(
																			'#sub_dept')
																			.find(
																					'option')
																			.remove()
																			.end()
																	// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
																	for (var i = 0; i < len; i++) {

																		$(
																				"#sub_dept")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										data[i].subDeptId)
																								.text(
																										data[i].deptDesc));
																	}

																	$(
																			"#sub_dept")
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

							$('#group')
									.change(
											function() {

												$
														.getJSON(
																'${itemListByGroupId}',
																{
																	grpId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {

																	var len = data.length;

																	$(
																			'#item_name')
																			.find(
																					'option')
																			.remove()
																			.end()
																	// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
																	for (var i = 0; i < len; i++) {

																		$(
																				"#item_name")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										data[i].itemId)
																								.text(
																										data[i].itemDesc));
																	}

																	$(
																			"#item_name")
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

							$('#ind_cat')
									.change(
											function() {

												$
														.getJSON(
																'${getgroupListByCatId}',
																{
																	catId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {

																	var len = data.length;

																	$('#group')
																			.find(
																					'option')
																			.remove()
																			.end()
																	// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
																	for (var i = 0; i < len; i++) {

																		$(
																				"#group")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										data[i].grpId)
																								.text(
																										data[i].grpDesc));
																	}

																	$("#group")
																			.trigger(
																					"chosen:updated");
																});
											});
						});
	</script>

	<script type="text/javascript">
		function insertIndentDetail() {
			alert
			var itemId = $('#item_name').val();
			var qty = $('#quantity').val();
			var remark = $('#remark').val();
			var schDay = $('#sch_days').val();
			var itemName = $("#item_name option:selected").html();

			var indentDate = $('#indent_date').val();
			$.getJSON('${getIndentDetail}', {
				itemId : itemId,
				qty : qty,
				remark : remark,
				itemName : itemName,
				schDay : schDay,
				indentDate : indentDate,
				ajax : 'true',

			}, function(data) {
				//alert(data);
				var len = data.length;
				$('#table1 td').remove();
				$.each(data, function(key, trans) {
					var tr = $('<tr></tr>');
					tr.append($('<td></td>').html(key + 1));
					tr.append($('<td></td>').html(trans.itemCode));
					tr.append($('<td></td>').html(trans.itemName));
					tr.append($('<td></td>').html(trans.qty));
					tr.append($('<td></td>').html(trans.uom));
					tr.append($('<td></td>').html(trans.schDays));
					tr.append($('<td></td>').html(trans.date));
					tr.append($('<td></td>').html(trans.curStock));

					$('#table1 tbody').append(tr);
				})
			});
		}
	</script>
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
	</script>
</body>
</html>

