<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<body onload="disabledDate()">
<script type="text/javascript">
	 function disabledDate () {
		 var c = document.getElementById("stockDateDDMMYYYY").value; 
			var toDateValue = c.split('-');
			 var dtToday = new Date();
			 dtToday.setFullYear(toDateValue[2],(toDateValue[1] - 1 ),toDateValue[0]); 
			  var month = dtToday.getMonth() + 1;     // getMonth() is zero-based
			  var day = dtToday.getDate();
			  var year = dtToday.getFullYear();
			  if(month < 10)
			      month = '0' + month.toString();
			  if(day < 10)
			      day = '0' + day.toString(); 
			  var maxDate = year + '-' + month + '-' + day;  
	  		$('#issueDate').attr('min', maxDate);
	  		getInvoiceNo();
	  
	 }
 
 </script>
<c:url var="genrateNo" value="/genrateNo" />
	<c:url var="getMrnListByMrnId" value="/getMrnListByMrnId"></c:url>
	<c:url var="getSubDeptList" value="/getSubDeptList"></c:url>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<c:url var="editMemoQty" value="/editMemoQty"></c:url>
<c:url var="qtyValidationFromBatch" value="/qtyValidationFromBatch"></c:url>

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
						<i class="fa fa-file-o"></i>Edit Rejection Memo
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								  BOM Detailed 
							</h3>

							<%-- <div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfRejectionMemo">Rejection
									List </a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
 --%>
						</div>


						<div class="box-content">

							<form id="submitForm"
								action="${pageContext.request.contextPath}/submitIssueByBomRequest"
								method="post">
								
								<c:set var="prod" value="PROD"></c:set>
														<c:set var="mix" value="MIX"></c:set>
															<c:choose>
															 	<c:when test="${billOfMaterialHeader.fromDeptName==prod}">
															 	<c:set var="depname" value="Production"></c:set>
															 	
															 	</c:when>
															 	<c:when test="${billOfMaterialHeader.fromDeptName==mix}">
															 	<c:set var="depname" value="Mixing"></c:set>
															 	
															 	</c:when>
															</c:choose>
															
								<div class="box-content">
							
								<div class="col-md-2">Issue No*</div>
									<div class="col-md-3">
									
									<input id="issueNo" class="form-control"
								 placeholder="Issue No" value="1" name="issueNo" type="text" readonly>
								 
									 
									</div>
									
									<div class="col-md-2">Issue Date*</div>
									<div class="col-md-3">
										<input id="issueDate" class="form-control"
								 placeholder="Issue Date"  name="issueDate" type="date" value="${date}" onchange="getInvoiceNo()"  required> 
								 
								 
						<input id="stockDateDDMMYYYY" value="${stockDateDDMMYYYY}" name="stockDateDDMMYYYY" type="hidden"  >
									</div>
									 
				 
							</div><br>

								<div class="box-content">

									<div class="col-md-2">Department:</div>
									<div class="col-md-3"> 
																	${depname} 
									</div>
 
								</div>
								<br>
								 
									<c:set var="status" value="-"></c:set>
									<div class="box-content">
									
									<div class="col-md-2">Production/Mixing Date:</div>
									<div class="col-md-3">
									${billOfMaterialHeader.productionDate}
 
									</div>
 
										<%-- <div class="col-md-2">Indent No:</div>
									<div class="col-md-3">
									${poHeaderForApprove.indNo}
 
									</div> --%>
									</div>
									<br>

									  <c:choose>
													<c:when test="${billOfMaterialHeader.status==0}">
													<c:set var = "status" value='Pending'/>
													</c:when>
													
													<c:when test="${billOfMaterialHeader.status==1}">
													  <c:set var = "status" value="Approved"/>
													
													</c:when>
													
													<c:when test="${billOfMaterialHeader.status==2}">
													  <c:set var = "status" value="Rejected"/>
													
													</c:when>
													<c:when test="${billOfMaterialHeader.status==3}">
													  <c:set var = "status" value="Approved Rejected"/>
													
													</c:when>
													 
													<c:when test="${billOfMaterialHeader.status==4}">
													  <c:set var = "status" value="Request closed"/>
													
													</c:when>
												</c:choose>
									 <div class="box-content">



										<div class="col-md-2">Status:</div>
										<div class="col-md-3">
										${status}
											 

										</div>
										 
									</div> 

									<br>
									
									<div class="box-content">
								 
								 <div class="col-md-2" >Select Department</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="deptId" onchange="getSubDeptListByDeptId()"  id="deptId"  required>
											<option   value="">Select Department</option>
											
											<c:forEach items="${deparmentList}" var="deparmentList"> 
														<option value="${deparmentList.deptId}">${deparmentList.deptCode} &nbsp;&nbsp;&nbsp; ${deparmentList.deptDesc} </option>
											 </c:forEach>
											</select>
									</div>
									
									<div class="col-md-2" >Select Sub Department</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="subDeptId"  id="subDeptId"  required>
											 
											</select>
									</div>
									 
								</div><br> 
									
									<br>
									
									<div class=" box-content">
					<div class="row">
						<div class="col-md-12 table-responsive">
							<table class="table table-bordered table-striped fill-head "
								style="width: 100%; font-size: 14px;" id="table_grid">
								<thead>
									<tr>
										<th style="width: 2%">Sr.No.</th> 
										<th>Item Name</th>  
										<th class="col-md-1"> Requested Qty</th> 
										<th class="col-md-1"> Remaining Qty</th> 
										<th class="col-md-4">Select Batch</th> 
										<th class="col-md-1">Issue Qty</th>
									 
									</tr>
								</thead>
								<tbody>
								
								<c:forEach items="${billOfMaterialHeader.billOfMaterialDetailed}" var="billOfMaterialDetailed"
																		varStatus="count">
																		<tr>
																		 
																			<td  ><c:out value="${count.index+1}" /></td>
				 
																			<td  ><c:out
																					value="${billOfMaterialDetailed.rmName}" /></td>
																			<td  align="right"><c:out
																					value="${billOfMaterialDetailed.rmReqQty}" /></td>
																			<td  align="right"><c:out
																					value="${billOfMaterialDetailed.rmReqQty-billOfMaterialDetailed.rmIssueQty}" /></td>
																		<td  >
																		
																		<input type="hidden" name="batchQty${billOfMaterialDetailed.reqDetailId}" id="batchQty${billOfMaterialDetailed.reqDetailId}" />
																		<select   class="form-control chosen" onchange="qtyValidation(${billOfMaterialDetailed.reqDetailId})" name="batchId${billOfMaterialDetailed.reqDetailId}"  id="batchId${billOfMaterialDetailed.reqDetailId}"  >
										 <option   value=""  >Select Batch</option> 
											<c:forEach items="${batchList}" var="batchList"> 
											<c:choose>
												<c:when test="${billOfMaterialDetailed.rmId==batchList.itemId && batchList.remainingQty>0}">
													<option value="${batchList.mrnDetailId}">${batchList.batchNo} &nbsp; ${batchList.remainingQty}</option>
												</c:when>
											</c:choose>
														
											 </c:forEach>
											 
											</select></td>
																		 <td  ><input style="text-align:right; width:150px" type="text"  name="issueQty${billOfMaterialDetailed.reqDetailId}" id="issueQty${billOfMaterialDetailed.reqDetailId}" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" onchange="checkQty(${billOfMaterialDetailed.reqDetailId},${billOfMaterialDetailed.rmReqQty-billOfMaterialDetailed.rmIssueQty})" ></td>
				 
																		</tr>
																	</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
								</div>
								
							 
														 
										<div class="row">
												<div class="col-md-12" style="text-align: center">
											 
													 <input type="submit" class="btn btn-info" value="Submit"  > 
						 
												</div>
										</div>
										 
 
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
	  
	<script type="text/javascript">
	function qtyValidation(reqDetailId) {

		var batchNo = document.getElementById("batchId"+reqDetailId).value;

		$.getJSON('${qtyValidationFromBatch}', {

			batchNo : batchNo,
			ajax : 'true'
		}, function(data) {
 
			document.getElementById("batchQty"+reqDetailId).value = data.remainingQty; 
			document.getElementById("issueQty"+reqDetailId).value = 0; 
		});
	}
	
	function checkQty(reqDetailId,remQty) {

		var batchQty = parseFloat(document.getElementById("batchQty"+reqDetailId).value);
		var issueQty = parseFloat(document.getElementById("issueQty"+reqDetailId).value);
		var batchId =  document.getElementById("batchId"+reqDetailId).value ;
		 
		 
		 if(batchId=="" || batchQty==null){
			 
			 alert("Select Batch ");
			 document.getElementById("issueQty"+reqDetailId).value = 0; 
			  
		 }
		 else{
			 
			 if(isNaN(issueQty) || issueQty < 0 || issueQty==""){
					alert("Enter Valid Qty ");
					document.getElementById("issueQty"+reqDetailId).value = 0; 
				}
				
				if(issueQty>batchQty || remQty<issueQty){
					alert("You Enter Greater Qty Than Batch Qty Or Remaining Qty");
					document.getElementById("issueQty"+reqDetailId).value = 0; 
				}
			 
		 }
		
	}
	
	$(function() {
		$('#submitForm').submit(
				function() {
					$("input[type='submit']", this).val("Please Wait...")
							.attr('disabled', 'disabled');
					
					return true;
				});
	});
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
	function getInvoiceNo() {

		var date = $("#issueDate").val();
		var toDateValue = date.split('-'); 
	 
		var min = toDateValue[2]+"-"+(toDateValue[1])+"-"+toDateValue[0];
		 
		$.getJSON('${genrateNo}', {

			catId:1,
			docId:2,
			date : min,
			typeId : 0,
			ajax : 'true',

		}, function(data) { 
			
		document.getElementById("issueNo").value=data.message;  
		document.getElementById("type").value=type; 
		getBatchByItemId();
		});

	}
	function getSubDeptListByDeptId() {

		var deptId = document.getElementById("deptId").value;

		$.getJSON('${getSubDeptList}', {

			deptId : deptId,
			ajax : 'true'
		}, function(data) {

			var html = '<option value="">Select Sub Department</option>';

			var len = data.length;
			for (var i = 0; i < len; i++) {
				html += '<option value="' + data[i].subDeptId + '">'
						+ data[i].subDeptCode +' &nbsp;&nbsp;&nbsp; '+data[i].subDeptDesc+'</option>';
			}
			html += '</option>';
			$('#subDeptId').html(html);
			$("#subDeptId").trigger("chosen:updated");
		});
	}
	</script>


</body>
</html>