<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<body onload="getInvoiceNo()">

<c:url var="getInvoiceNo" value="/getInvoiceNo"></c:url>
<c:url var="getItemIdByCatIdInIssue" value="/getItemIdByCatIdInIssue"></c:url>
	<c:url var="getMrnListByMrnId" value="/getMrnListByMrnId"></c:url>
	<c:url var="getMrnListByVendorIdForRejectionMemo" value="/getMrnListByVendorIdForRejectionMemo"></c:url>

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
						<i class="fa fa-file-o"></i>Add Rejection Memo
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Add Rejection Memo
							</h3>

							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfRejectionMemo">Rejection
									List </a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">

							<form id="submitMaterialStore"
								action="${pageContext.request.contextPath}/insertRejectionMemo"
								onsubmit="return confirm('Do you really want to submit the Rejection Memo ?');" method="post">

								<div class="box-content">

									<div class="col-md-2">Rejection Date*</div>
									<div class="col-md-3">
										<input id="rejectionDate" class="form-control date-picker"
											onchange="getInvoiceNo()" placeholder="Rejection Date" value="${date}" name="rejectionDate" type="text"
											required>


									</div>

									<div class="col-md-2">Rejection No</div>
									<div class="col-md-3">
										<input class="form-control" id="rejectionNo"
											placeholder="Rejection No" type="text" name="rejectionNo" readonly/>
									</div>
								</div>
								<br>
								
								<div class="box-content">
								
									<div class="col-md-2" >Select Category</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="groupId" onchange="getItemIdByGroupId()"  id="groupId"  >
											<option   value="">Select Category</option>
											
											<c:forEach items="${categoryList}" var="categoryList"> 
														<option value="${categoryList.catId}"> ${categoryList.catDesc} </option>
											 </c:forEach>
											</select>
									</div>
								  
								</div><br> 
								
								<div class="box-content"> 
								
									<div class="col-md-2" >Select Item</div>
									<div class="col-md-10">
										<select   class="form-control chosen" onchange="getMrnList()" name="itemId"  id="itemId"  required>
										 
											</select>
									</div> 
								</div><br> 
								
								<div class="box-content">

									<div class="col-md-2">Select Vendor</div>
									<div class="col-md-10">

										<select name="vendId" id="vendId" class="form-control chosen" onchange="getMrnList()" required>
											<option value="">Select Vendor</option>
											<c:forEach items="${vendorList}" var="vendorList">
												<c:choose>
													<c:when
														test="${vendorList.vendorId==getpassHeaderItemName.gpVendor}">
														<option value="${vendorList.vendorId}" selected>${vendorList.vendorCode} &nbsp;&nbsp; ${vendorList.vendorName}</option>
													</c:when>
													<c:otherwise>
														<option value="${vendorList.vendorId}">${vendorList.vendorCode} &nbsp;&nbsp; ${vendorList.vendorName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>

									</div>
									 
									</div>

									<br> 
									
									<div class="box-content">
 
									<div class="col-md-2">Select Mrn No</div>
									<div class="col-md-10">

										<select name="mrnId" id="mrnId" class="form-control chosen" onchange="search()" required>
											<c:forEach items="${mrnList}" var="mrnList" varStatus="count">
												<option value="${mrnList.mrnId}"><c:out
														value="${mrnList.mrnNo}" /></option>
											</c:forEach>
										</select>
									</div>
									</div>

									<br> 
									
									<div class="box-content">
								
									<div class="col-md-2" >Select</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="typeId"    id="typeId"  >
											 
														<option value="0" selected> Rejection </option>
											 			 <option value="1"> Damage </option>
											</select>
									</div>
								  
								</div><br> 

									<!-- <div class="box-content">

										<div class="col-md-2">Document Date*</div>
										<div class="col-md-3">
											<input id="docDate" class="form-control date-picker"
												placeholder="Document Date" name="docDate" type="text"
												required>


										</div>

										<div class="col-md-2">Document No*</div>
										<div class="col-md-3">
											<input class="form-control" id="docNo"
												placeholder="Document No" type="text" name="docNo" required/>
										</div>
									</div>
									<br> -->
									<div class="box-content">



										<div class="col-md-2">Remark</div>
										<div class="col-md-10">
											<input type="text" name="remark" id="remark"
												placeholder="Remark" class="form-control" />

										</div>
										<!-- <div class="col-md-2">Remark1</div>
										<div class="col-md-3">
											<input type="text" name="remark1" id="remark1"
												placeholder="Remark" class="form-control" />

										</div> -->
									</div>

									<br><br>
									<!-- <div class="form-group">
										<div
											class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
											<input type="button" class="btn btn-primary" value="Search"
												onclick="search()">
										</div>
									</div>
									<br> -->
								

								<div class=" box-content">
									<div class="row">
										<div class="col-md-12 table-responsive">
											<table class="table table-bordered table-striped fill-head "
												style="width: 100%;font-size: 14px;" id="table_grid" >
												<thead>
													<tr>
														<th style="width:2%;">Sr.No.</th>
														<th class="col-md-1">Batch No</th>
														<th class="col-md-5">Item Name</th>
														<th class="col-md-1">Remaining Qty</th>
														<th class="col-md-1">Return Qty</th>
 
													</tr>
												</thead>

												<tbody>
 
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="submit" class="btn btn-primary" value="Submit" onclick="check()">

									</div>
								</div>
								<br> <br>




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
	
	function getMrnList() {
		 
		var vendId = $("#vendId").val();
		var itemId = $("#itemId").val(); 
		
		if(vendId=="" || vendId==null){
			alert("Select Vendor ");
		}else if(itemId=="" || itemId==null){
			alert("Select Item ");
		}else{
			
		
		$.getJSON('${getMrnListByVendorIdForRejectionMemo}', {
	 
			vendId : vendId,
			itemId : itemId,
			ajax : 'true',

		}, function(data) { 
			
			var html = '<option value="">Select MRN</option>';

			var len = data.length;
			for (var i = 0; i < len; i++) {
				html += '<option value="' + data[i].mrnId + '">'
						+ data[i].mrnNo +'</option>';
			}
			html += '</option>';
			$('#mrnId').html(html);
			$("#mrnId").trigger("chosen:updated");
		
		});
		
		}

	}
		function search() {

			//alert("hi");
			var mrnId = $("#mrnId").val();
			var itemId = $("#itemId").val();
			$('#loader').show();

			$
					.getJSON(
							'${getMrnListByMrnId}',

							{
								mrnId : mrnId,
								itemId : itemId, 
								ajax : 'true'

							},
							function(data) {

								$('#table_grid td').remove();
								$('#loader').hide();

								//alert(data);
								if (data == "") {
									alert("No records found !!");

								}

								for (var i = 0; i < data.length; i++) {
									for (var j = 0; j < data[i].getMrnDetailRejList.length; j++) {

										var tr = $('<tr></tr>');
										tr.append($('<td></td>').html(j + 1));

										tr.append($('<td></td>').html(
												data[i].getMrnDetailRejList[j].batchNo));
										tr
												.append($('<td></td>')
														.html(
																data[i].getMrnDetailRejList[j].itemCode+' '+data[i].getMrnDetailRejList[j].itemName));

										tr
												.append($('<td align="right"></td>')
														.html(
																(data[i].getMrnDetailRejList[j].remainingQty).toFixed(2)));

										tr
												.append($('<td > <input style="text-align: right;" type="text" onchange="checkValue('+ data[i].getMrnDetailRejList[j].mrnDetailId+ ','+data[i].getMrnDetailRejList[j].remainingQty+')" id= memoQty'+ data[i].getMrnDetailRejList[j].mrnDetailId+ ' class="form-control" value="'+data[i].getMrnDetailRejList[j].rejectQty+'" name=memoQty'+ data[i].getMrnDetailRejList[j].mrnDetailId+ '></td>'));

										$('#table_grid tbody').append(tr);
									}

								}

							});
		}
		
		function checkValue(mrnDetailId,remQty) {
			 
			var memoQty = parseFloat($("#memoQty"+mrnDetailId).val()); 
  
			 if(memoQty<0 || memoQty=="" || memoQty==null || isNaN(memoQty)){
				 alert("Enter valid Qty");
				 document.getElementById("memoQty"+mrnDetailId).value = 0;
			 }else{
				 
				 if(memoQty>remQty){
					 
					 alert("Return Qty Is Greater Than Remaining Qty ");
					 document.getElementById("memoQty"+mrnDetailId).value = 0;
					 
				 }
			 }

		}
		function getInvoiceNo() {
			
			var date = $("#rejectionDate").val();  
			
			$.getJSON('${getInvoiceNo}', {

				catId:1,
				docId:9,
				date : date,
				typeId : 1,
				ajax : 'true',

			}, function(data) { 
			 
			document.getElementById("rejectionNo").value=data.code; 
			 
			});

		}
		function check()
		{
		
			
			var vendId = $("#vendId").val();
			var mrnId = $("#mrnId").val();  
			var itemId = $("#itemId").val();  
			
			if(itemId==null || itemId == "")
			{
			alert("Select Item ");
			}
			else if(vendId==null || vendId == "")
			{
			alert("Select Vendor");
			}
			else if(mrnId==null || mrnId == "")
			{
			alert("Select Mrn ");
			}
			 
			 
		}
		function getItemIdByGroupId() {

			var grpId = document.getElementById("groupId").value;

			$.getJSON('${getItemIdByCatIdInIssue}', {

				grpId : grpId,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="">Select Item</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].itemId + '">'
							+ data[i].itemCode + ' &nbsp; '+data[i].itemDesc+'</option>';
				}
				html += '</option>';
				$('#itemId').html(html);
				$("#itemId").trigger("chosen:updated");
			});
		}
	</script>



</body>
</html>