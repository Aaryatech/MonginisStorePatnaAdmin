<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 
 <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
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
	  		onloadSubDeptListByDeptId();
	 }
 
 </script>
	<c:url var="qtyValidationFromBatchInEdit" value="/qtyValidationFromBatchInEdit"></c:url>
	  <c:url var="getBatchByItemIdInIssueEdit" value="/getBatchByItemIdInIssueEdit"></c:url>
	 <c:url var="getItemIdByGroupId" value="/getItemIdByGroupId"></c:url>
	  <c:url var="getSubDeptList" value="/getSubDeptList"></c:url>
	  <c:url var="getItemIdByCatIdInIssue" value="/getItemIdByCatIdInIssue"></c:url>
<c:url var="addItmeInEditIssueList" value="/addItmeInEditIssueList"></c:url>
	<c:url var="editItemInEditIssueList" value="/editItemInEditIssueList"></c:url>
	<c:url var="deleteItemFromEditIssueList" value="/deleteItemFromEditIssueList"></c:url>

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
						<i class="fa fa-file-o"></i>Add Issue  
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Edit Issue  
							</h3>
							
							<div class="box-tool">
								  <a href="${pageContext.request.contextPath}/issueList">Issue List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>  
							</div>
							
						</div>
						
						
						<div class="box-content">

							<form id="submitMaterialStore" action="${pageContext.request.contextPath}/submitEditIssueReciept" 
							onsubmit="return confirm('Do you really want to Apply Changes In Issue ?');" method="post" >
							 
							
							<div class="box-content">
							
								<div class="col-md-2">Issue No*</div>
									<div class="col-md-3">
									
									<input id="issueNo" class="form-control"
								 placeholder="Issue No" value="${getIssueHeader.issueNo}" name="issueNo" type="text" readonly>
									<input type="hidden" id="type" name="type" value="${getIssueHeader.itemCategory}">
									</div>
									
									<%-- <div class="col-md-2" > Type</div>
									<div class="col-md-3">
									
										 
										<c:forEach items="${typeList}" var="typeList">
															<c:choose> 
																<c:when test="${getIssueHeader.itemCategory==typeList.typeId}">
																	${typeList.typeName}
																</c:when> 
															</c:choose>
														</c:forEach>
										
										 
									</div> --%>
								 
							</div><br>
							
							<div class="box-content">
							 
								<div class="col-md-2">Issue Date*</div>
									<div class="col-md-3">
										<input id="issueDate" class="form-control"
								 placeholder="Issue Date" value="${date}"  name="issueDate" type="date" readonly>
								 
						<input id="stockDateDDMMYYYY" value="${stockDateDDMMYYYY}" name="stockDateDDMMYYYY" type="hidden"  >

									</div>
								<div class="col-md-2" >Select Account Head</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="acc"  id="acc"  required>
											  
											<c:forEach items="${accountHeadList}" var="accountHeadList"> 
												<c:choose>
													<c:when test="${getIssueHeader.accHead==accountHeadList.accHeadId}">
													
													<option value="${accountHeadList.accHeadId}" selected><c:out value="${accountHeadList.accHeadDesc}"></c:out> </option>
													</c:when>
													<c:otherwise>
													<option value="${accountHeadList.accHeadId}"><c:out value="${accountHeadList.accHeadDesc}"></c:out> </option>
													</c:otherwise>
												</c:choose>
														 
											 </c:forEach>
											</select>
									</div>
				 
							</div><br>
							
							<div class="box-content">
								 
								 <div class="col-md-2" >Select Department</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="deptId" onchange="getSubDeptListByDeptId()" id="deptId"  required>
											<c:forEach items="${deparmentList}" var="deparmentList">  
											<c:choose>
												<c:when test="${getIssueHeader.deptId==deparmentList.deptId}">
												<option value="${deparmentList.deptId}" selected>${deparmentList.deptCode} &nbsp;&nbsp;&nbsp; ${deparmentList.deptDesc} </option>
												
												</c:when>
												<c:otherwise>
												<option value="${deparmentList.deptId}">${deparmentList.deptCode} &nbsp;&nbsp;&nbsp; ${deparmentList.deptDesc}</option>
												</c:otherwise>
											
											</c:choose>
											
														
											 </c:forEach>
											</select>
									</div>
									<input id="tempSubDeptId"  value="${getIssueHeader.subDeptId}"  name="tempSubDeptId" type="hidden" required>
									<div class="col-md-2" >Select Sub Department</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="subDeptId"  id="subDeptId"  required>
											 
											</select>
									</div>
									 
								</div><br> 
							<input id="issueSlipNo" value="${getIssueHeader.issueSlipNo}" name="issueSlipNo" type="hidden"  required> 
							<%-- <div class="box-content">
							
								<div class="col-md-2">Issue Slip No *</div>
									<div class="col-md-3">
										<input id=issueSlipNo class="form-control"
								 placeholder="Issue Slip No" value="${getIssueHeader.issueSlipNo}" name="issueSlipNo" type="text"  required> 
								 
								 </div>
								 </div><br> --%>
							  
							<hr/>
							
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
									<input type="hidden" name=editIndex id="editIndex"   />
									 
								</div><br> 
								
								<div class="box-content">
								 
									<div class="col-md-2" >Select Item</div>
									<div class="col-md-10">
										<select   class="form-control chosen" onchange="getBatchByItemId()" name="itemId"  id="itemId"  >
										 
											</select>
									</div>
									
								  
								</div><br> 
								
								<div class="box-content">
								 <input type="hidden" name="batchQty" id="batchQty" />
									<div class="col-md-2" >Select Batch </div>
									<div class="col-md-3">
										<select   class="form-control chosen" onchange="qtyValidation()" name="batchNo"  id="batchNo"  >
										 
											</select>
									</div>
									<div class="col-md-2">QTY</div>
									<div class="col-md-3">
										<input type="text" name="qty" id="qty"
											placeholder="Qty" class="form-control"
											 pattern="\d+"  />
												 
									</div>
									 
								</div><br>
							 
								 
							<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="button" class="btn btn-primary" value="Add Item" onclick="addItem()">  
									</div>
								</div><br><br>
							
								<div align="center" id="loader" style="display: none">

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
						class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
					<span class="l-6"></span>
				</div>
											
							
							
							<div class=" box-content">
					<div class="row">
						<div class="col-md-12 table-responsive">
							<table class="table table-bordered table-striped fill-head "
								style="width: 100%;font-size:14px;" id="table_grid">
								<thead>
									<tr>
										<th style="width: 2%">Sr.No.</th>
										<!-- <th>Group Name</th> -->
										<th>Item Name</th> 
										 
										<th class="col-md-1">QTY</th> 
										<th class="col-md-1">Action</th> 
									</tr>
								</thead>
								<tbody>
								
								<c:forEach items="${getIssueHeader.issueDetailList}"
														var="getIssueDetailList" varStatus="count">
														<tr>
															<td><c:out value="${count.index+1}" /></td>
<%-- 
															<td><c:out
																	value="${getIssueDetailList.grpCode}" /></td>
 --%>
															<td><c:out
																	value="${getIssueDetailList.itemCode}" /></td>

															 
																	
															<td align="right"><c:out
																	value="${getIssueDetailList.itemIssueQty}" /></td>

															<td><%-- <a href="#"><span
																	class='glyphicon glyphicon-edit'
																	onclick="edit(${count.index})" id="edit${count.index}"></span></a> --%>
																	<%-- <c:choose>
															<c:when test="${(getIssueDetailList.status==0 or getIssueDetailList.status==1) && (getIssueHeader.status==0 or getIssueHeader.status==1)}"> --%>
																<a href="#"><span class="glyphicon glyphicon-remove"
																	onclick="del(${count.index})" id="del${count.index}"></span></a>
																	<%-- </c:when>
																	<c:when test="${(getIssueDetailList.status==0 or getIssueDetailList.status==1) }">
																 Disapprove
																	</c:when>
																	<c:otherwise>
																	Approve 
																	</c:otherwise>
																	</c:choose> --%>
															</td>

														</tr>
													</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
								</div>
								
							<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
									<%-- <c:choose>
															<c:when test="${getIssueHeader.status==0 or getIssueHeader.status==1}"> --%>
										<input type="submit" class="btn btn-primary" value="Submit" onclick="check();">
										<%-- </c:when>
										</c:choose> --%>
<!-- 										<button type="button" class="btn">Cancel</button>
 -->									</div>
								</div><br><br>
						
							
							

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
		<script type="text/javascript">
		function qtyValidation() {

			var batchNo = document.getElementById("batchNo").value;

			$.getJSON('${qtyValidationFromBatchInEdit}', {

				batchNo : batchNo,
				ajax : 'true'
			}, function(data) {

				document.getElementById("batchQty").value = data.remainingQty;
			});
		}
		function getBatchByItemId() {

			var itemId = document.getElementById("itemId").value;
			var type = $("#type").val();
			var date = $("#issueDate").val();
			
			$.getJSON('${getBatchByItemIdInIssueEdit}', {

				itemId : itemId,
				date : date,
				type : type,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="">Select Batch </option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					 
						if(data[i].remainingQty>0){
						
						html += '<option value="' + data[i].mrnDetailId + '">'
						+ data[i].batchNo + ' &nbsp;&nbsp;&nbsp; '+ data[i].remainingQty+'</option>';
					}
				}
				html += '</option>';
				$('#batchNo').html(html);
				$("#batchNo").trigger("chosen:updated");
			});
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
		
		
		function onloadSubDeptListByDeptId() {

			var deptId = document.getElementById("deptId").value;
			var tempSubDeptId = document.getElementById("tempSubDeptId").value;
			
			$.getJSON('${getSubDeptList}', {

				deptId : deptId,
				ajax : 'true'
			}, function(data2) {

				var html = '<option value="">Select Sub Department</option>';

				var len = data2.length;
				for (var i = 0; i < len; i++) {
					
					if(data2[i].subDeptId==tempSubDeptId)
						{
						html += '<option value="' + data2[i].subDeptId + '" selected>'
						+ data2[i].subDeptCode + '&nbsp;&nbsp;&nbsp;'+data2[i].subDeptDesc+'</option>';
						}
					else
						{
						html += '<option value="' + data2[i].subDeptId + '">'
						+ data2[i].subDeptCode + '&nbsp;&nbsp;&nbsp;'+data2[i].subDeptDesc+'</option>';
						}
					
				}
				html += '</option>';
				$('#subDeptId').html(html);
				$("#subDeptId").trigger("chosen:updated");
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
							+ data[i].subDeptCode + '&nbsp;&nbsp;&nbsp;'+data[i].subDeptDesc+'</option>';
				}
				html += '</option>';
				$('#subDeptId').html(html);
				$("#subDeptId").trigger("chosen:updated");
			});
		}
		
		function addItem() {
			  
			//alert("af");
				var itemId = $("#itemId").val();
				var batchNo = $("#batchNo").val();
				var itemName = $("#itemId option:selected").text();
				var qty = parseFloat($("#qty").val());
				var groupId = $("#groupId").val();
				var groupName = $("#groupId option:selected").text();
				var deptId = $("#deptId").val();
				var deptName = $("#deptId option:selected").text();
				var subDeptId = $("#subDeptId").val();
				var subDeptName = $("#subDeptId option:selected").text();
				var acc = $("#acc").val();
				var accName = $("#acc option:selected").text();
				var editIndex = $("#editIndex").val();
				var batchQty = parseFloat($("#batchQty").val());
				
				if(validation()==true){	
					
					var valid = true;
					 
					if(editIndex=="" || editIndex ==null){ 
						 
						if(qty>batchQty){
							 
							valid = false;
					}
					}
					else{
						
						var previousQty = parseFloat($("#previousQty").val()); 
						if(qty>(batchQty+previousQty)){
							 
							document.getElementById("qty").value=previousQty;
							valid = false;
						}
						
					}
					
					if(valid == true)
					{
				$('#loader').show();

				$
						.getJSON(
								'${addItmeInEditIssueList}',

								{
									 
									itemId : itemId,
									batchNo : batchNo,
									qty : qty,
									groupId : groupId,
									deptId : deptId,
									subDeptId : subDeptId,
									editIndex : editIndex,
									acc : acc,
									itemName : itemName,
									groupName :groupName,
									deptName : deptName,
									subDeptName : subDeptName,
									accName : accName,
									ajax : 'true'

								},
								function(data) {

									$('#table_grid td').remove();
									$('#loader').hide();

									if (data == "") {
										alert("No records found !!");

									}
								 
  
								  $.each(
												data,
												function(key, itemList) {
												

													 if(itemList.delStatus==1)
													 {
													var tr = $('<tr></tr>'); 
												  	tr.append($('<td></td>').html(key+1)); 
												  	/* tr.append($('<td></td>').html(itemList.grpCode));  */
												  	tr.append($('<td></td>').html(itemList.itemCode)); 
												  	tr.append($('<td align="right"></td>').html(itemList.itemIssueQty));
												  	tr.append($('<td></td>').html('<a href="#"><span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span></a>'));
												  	/* tr.append($('<td></td>').html('<a href="#"><span class="glyphicon glyphicon-edit" id="edit'+key+'" onclick="edit('+key+');"> </span></a><a href="#"><span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span></a>'));
												     */
												  	$('#table_grid tbody').append(tr);
													 }
 
												})  
												
									document.getElementById("qty").value= "";
									document.getElementById("groupId").value= "";
									$('#groupId').trigger("chosen:updated");
									/* document.getElementById("deptId").value= ""; 
									$('#deptId').trigger("chosen:updated"); */
									document.getElementById("itemId").value= "";
									$('#itemId').trigger("chosen:updated");
									/* document.getElementById("subDeptId").value= "";
									$('#subDeptId').trigger("chosen:updated");
									document.getElementById("acc").value= "";
									$('#acc').trigger("chosen:updated"); */
									document.getElementById("batchNo").value= "";
									$('#batchNo').trigger("chosen:updated");
									document.getElementById("editIndex").value="";
								});
					}
					else{
						alert("Enter Valid Qty ");
						document.getElementById("qty").value="";
						document.getElementById("qty").focus();
					}
			 
		}
				
				
			
	}
		
		function edit(key)
		{
			//alert(key);
			$('#loader').show();

			$
					.getJSON(
							'${editItemInEditIssueList}',

							{
								 
								index : key, 
								ajax : 'true'

							},
							function(data) {

								 
								$('#loader').hide();
								document.getElementById("editIndex").value=key;
								document.getElementById("qty").value=data.itemIssueQty;
								document.getElementById("groupId").value=data.itemGroupId;
								$('#groupId').trigger("chosen:updated");
								document.getElementById("deptId").value=data.deptId;
								$('#deptId').trigger("chosen:updated");
								document.getElementById("acc").value=data.accHead;
								$('#acc').trigger("chosen:updated");
								
								$.getJSON('${getItemIdByGroupId}', {

									grpId : data.itemGroupId,
									ajax : 'true'
								}, function(data1) {

									var html = '<option value="">Select ItemGroup</option>';

									var len = data1.length;
									for (var i = 0; i < len; i++) {
										if(data1[i].itemId==data.itemId)
											{
											html += '<option value="' + data1[i].itemId + '" selected>'
											+ data1[i].itemCode + '</option>';
											}
										else
											{
											html += '<option value="' + data1[i].itemId + '">'
											+ data1[i].itemCode + '</option>';
											}
										
									}
									html += '</option>';
									$('#itemId').html(html);
									$("#itemId").trigger("chosen:updated");
								});
								
								$.getJSON('${getSubDeptList}', {

									deptId : data.deptId,
									ajax : 'true'
								}, function(data2) {

									var html = '<option value="">Select Sub Department</option>';

									var len = data2.length;
									for (var i = 0; i < len; i++) {
										
										if(data2[i].subDeptId==data.subDeptId)
											{
											html += '<option value="' + data2[i].subDeptId + '" selected>'
											+ data2[i].subDeptCode + '</option>';
											}
										else
											{
											html += '<option value="' + data2[i].subDeptId + '">'
											+ data2[i].subDeptCode + '</option>';
											}
										
									}
									html += '</option>';
									$('#subDeptId').html(html);
									$("#subDeptId").trigger("chosen:updated");
								});
								
								$.getJSON('${getBatchByItemIdInIssueEdit}', {

									itemId : data.itemId,
									ajax : 'true'
								}, function(data3) {

									var html = '<option value="">Select Batch </option>';

									var len = data3.length;
									for (var i = 0; i < len; i++) {
										if(data3[i].mrnDetailId==data.mrnDetailId)
											{
											html += '<option value="' + data3[i].mrnDetailId + '" selected>'
											+ data3[i].batchNo + '&nbsp;&nbsp;&nbsp;'+ data3[i].remainingQty+'</option>';
											}
										else
											{
											html += '<option value="' + data3[i].mrnDetailId + '">'
											+ data3[i].batchNo + '&nbsp;&nbsp;&nbsp;'+ data3[i].remainingQty+'</option>';
											}
										
									}
									html += '</option>';
									$('#batchNo').html(html);
									$("#batchNo").trigger("chosen:updated");
								});
								
							});
			 
		}
		
		 
		function del(key)
		{
			
			var key=key;
			$('#loader').show();
			$
			.getJSON(
					'${deleteItemFromEditIssueList}',

					{
						 
						index : key,
						ajax : 'true'

					},
					function(data) {
						
						$('#table_grid td').remove();
						$('#loader').hide();

						if (data == "") {
							alert("No records found !!");

						}
					 

					  $.each(
									data,
									function(key, itemList) {
									 if(itemList.delStatus==1)
										 {
										var tr = $('<tr></tr>'); 
									  	tr.append($('<td></td>').html(key+1)); 
									  	/* tr.append($('<td></td>').html(itemList.grpCode)); */ 
									  	tr.append($('<td></td>').html(itemList.itemCode)); 
									  	tr.append($('<td align="right"></td>').html(itemList.itemIssueQty));
									  	tr.append($('<td></td>').html('<a href="#"><span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span></a>'));
									  	/* tr.append($('<td></td>').html('<a href="#"><span class="glyphicon glyphicon-edit" id="edit'+key+'" onclick="edit('+key+');"> </span></a><a href="#"><span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span></a>'));
									     */
									     $('#table_grid tbody').append(tr);
										 }
									  	
									})
									
									document.getElementById("qty").value= "";
						document.getElementById("groupId").value= "";
						$('#groupId').trigger("chosen:updated");
						/* document.getElementById("deptId").value= ""; 
						$('#deptId').trigger("chosen:updated"); */
						document.getElementById("itemId").value= "";
						$('#itemId').trigger("chosen:updated");
						/* document.getElementById("subDeptId").value= "";
						$('#subDeptId').trigger("chosen:updated");
						document.getElementById("acc").value= "";
						$('#acc').trigger("chosen:updated"); */
						document.getElementById("batchNo").value= "";
						$('#batchNo').trigger("chosen:updated");
						document.getElementById("editIndex").value="";
						
					});
			
			
		}
	</script>
<script type="text/javascript">
function validation()
{
	var itemId = $("#itemId").val();
	var qty = $("#qty").val();
	var groupId = $("#groupId").val();
	var deptId = $("#deptId").val();
	var subDeptId = $("#subDeptId").val();
	var acc = $("#acc").val();
	var batchNo = $("#batchNo").val();
	
	var isValid = true;
	
	
	 if(groupId=="" || groupId==null)
	{
	isValid = false;
	alert("Please Select Group ");
	}
	
	 else if(itemId=="" || itemId==null)
	{
	isValid = false;
	alert("Please Select Item ");
	}
	 
	 else if(batchNo=="" || batchNo==null)
		{
		isValid = false;
		alert("Please Select Batch ");
		}
	 else if(isNaN(qty) || qty < 0 || qty=="")
		{
		isValid = false;
		alert("Please enter Quantity");
		}
	
	else if(deptId=="" || deptId==null)
	{
	isValid = false;
	alert("Please Select Department ");
	}
	
	else if(subDeptId=="" || subDeptId==null)
	{
	isValid = false;
	alert("Please Select Sub Department  ");
	}
	 
	else if(acc=="" || acc==null)
	{
	isValid = false;
	alert("Please Select Account Head  ");
	}
	
	  
return isValid;
	
}
function check()
{
	 
	var acc = $("#acc").val();
	var deptId = $("#deptId").val();
	var subDeptId = $("#subDeptId").val();
	
	 
	if(acc=="" || acc==null)
	{
	 
	alert("Please Select Account Head ");
	}
	 
	else if(deptId=="" || deptId==null)
	{
	 
	alert("Please Select Department ");
	}
	
	else if(subDeptId=="" || subDeptId==null)
	{
	 
	alert("Please Select Sub Department  ");
	}
	
	  
	
}
</script>
	
								
							
	
</body>
</html>