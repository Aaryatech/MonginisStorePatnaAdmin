<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<body>


	<c:url var="addItmeInEditEnquiryList" value="/addItmeInEditEnquiryList"></c:url>
	<c:url var="editItemInEditEnquiry" value="/editItemInEditEnquiry"></c:url>
	<c:url var="deleteItemFromEditEnquiry"
		value="/deleteItemFromEditEnquiry"></c:url>

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
						<i class="fa fa-file-o"></i>Edit Quotation
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Edit Quotation
							</h3>

							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfEnquiry">Quotation
									List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">

							<form id="submitMaterialStore"
								action="${pageContext.request.contextPath}/submitEditEnquiry"
								onsubmit="return confirm('Do you really want to Apply Changes In Enquiry ?');" method="post">

 
								
								<div class="box-content">

									<div class="col-md-2">Quotation No</div>
									<div class="col-md-3">
										<input class="form-control" id="enq_no"
											placeholder="Quotation Number" value="${editEnquiry.enqNo}" type="text" name="enqNo"
											Readonly />
									</div>
									
									<div class="col-md-2">Quotation Date*</div>
									<div class="col-md-3">
										<input id="enqDate" class="form-control date-picker"
											placeholder="Quotation Date" value="${editEnquiry.enqDate}"
											name="enqDate" type="text" required>


									</div> 

								</div>
								<br>

								<div class="box-content">
 
									<div class="col-md-2">Quotation Remark</div>
									<div class="col-md-10">
										<input class="form-control" id="enqRemark" size="16"
											placeholder="Quotation Remark" value="${editEnquiry.enqRemark}"
											type="text" name="enqRemark" />
									</div>


								</div>
								<br>


								<hr />

								<div class="box-content">

									<div class="col-md-2">Select Item</div>
									<div class="col-md-10">
										<select data-placeholder="Select RM Name"
											class="form-control chosen" name="itemId" tabindex="-1"
											id="itemId">
											<option value="">Select Item</option>

											<c:forEach items="${itemList}" var="itemList">

												<option value="${itemList.itemId}">${itemList.itemCode} &nbsp;&nbsp;${itemList.itemDesc}
												</option>


											</c:forEach>
										</select>
									</div>

									<input type="hidden" name=editIndex id="editIndex" />
 
								</div>
								<br>
								
								<div class="box-content">
								
								<div class="col-md-2">Item Remark</div>
									<div class="col-md-10">
										<input class="form-control" id="itemRemark" size="16"
											placeholder="Item Remark" type="text" name="itemRemark" />
									</div>
  

								</div>
								<br>
								
								<div class="box-content"> 
								
								<div class="col-md-2">Qty</div>
									<div class="col-md-3">
										<input type="text" name="qty" id="qty" placeholder="Qty"
											class="form-control" pattern="\d+" />

									</div>
									
									<div class="col-md-2">Item Date*</div>
									<div class="col-md-3">
										<input id="enqItemDate" class="form-control date-picker"
											placeholder="Item Date" name="enqItemDate" type="text">


									</div>
									
									
									

								</div>
								<br>
								<br>
								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="button" class="btn btn-primary" value="Add Item"
											onclick="addItem()">
									</div>
								</div>
								<br>
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


								<div class=" box-content">
									<div class="row">
										<div class="col-md-12 table-responsive">
											<table class="table table-bordered table-striped fill-head "
												style="width: 100%" id="table_grid">
												<thead>
													<tr>
														<th style="width:2%;">Sr.No.</th>
														<th class="col-md-5">Name</th>
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">Item Date</th>
														<th class="col-md-1">Action</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${editEnquiry.quatationDetailList}"
														var="enquiryDetailList" varStatus="count">
														<tr>
															<td><c:out value="${count.index+1}" /></td>

															<td><c:out
																	value="${enquiryDetailList.itemCode}" /></td>

															<td><c:out
																	value="${enquiryDetailList.enqQty}" /></td>

															<td><c:out
																	value="${enquiryDetailList.enqDetailDate}" /></td>

															<td><a href="#"><span
																	class='glyphicon glyphicon-edit'
																	onclick="edit(${count.index})" id="edit${count.index}"></span></a>
																<a href="#"><span class="glyphicon glyphicon-remove"
																	onclick="del(${count.index})" id="del${count.index}"></span></a>
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
										<input type="submit" class="btn btn-primary" value="Submit"
											onclick="check();">
										<!-- 										<button type="button" class="btn">Cancel</button>
 -->
									</div>
								</div>
								<br>
								<br>




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
		
		
		function addItem() {
			  
			
				var itemId = $("#itemId").val();
				var qty = $("#qty").val();
				var enqItemDate = $("#enqItemDate").val();
				var itemRemark = $("#itemRemark").val();
				var editIndex = $("#editIndex").val();
				
				if(validation()==true){	
					
				
				$('#loader').show();

				$
						.getJSON(
								'${addItmeInEditEnquiryList}',

								{
									 
									itemId : itemId,
									qty : qty,
									enqItemDate : enqItemDate,
									itemRemark : itemRemark,
									editIndex : editIndex,
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
												  	tr.append($('<td></td>').html(itemList.itemCode)); 
												  	tr.append($('<td></td>').html(itemList.enqQty));
												  	tr.append($('<td></td>').html(itemList.enqDetailDate));
												  	tr.append($('<td></td>').html('<a href="#"><span class="glyphicon glyphicon-edit" onclick="edit('+key+')" id="edit'+key+'"></span></a>'+ 
					                                         '<a href="#"><span class="glyphicon glyphicon-remove" onclick="del('+key+')" id="del'+key+'"></span></a>'));
												    $('#table_grid tbody').append(tr);
													 }
 
												})  
												
									document.getElementById("qty").value= "";
									document.getElementById("enqItemDate").value= "";
									document.getElementById("itemRemark").value= ""; 
									document.getElementById("itemId").value= "";
									$('#itemId').trigger("chosen:updated");
									document.getElementById("editIndex").value="";
								});

			 
		}
				
				
			
	}
		
		function edit(key)
		{
			//alert(key);
			$('#loader').show();

			$
					.getJSON(
							'${editItemInEditEnquiry}',

							{
								 
								index : key, 
								ajax : 'true'

							},
							function(data) {

								 
								$('#loader').hide();
								 
								document.getElementById("qty").value=data.enqQty;
								document.getElementById("enqItemDate").value=data.enqDetailDate;
								document.getElementById("itemRemark").value=data.enqRemark;  
								document.getElementById("itemId").value=data.itemId;
								$('#itemId').trigger("chosen:updated");
								document.getElementById("editIndex").value=key;
								
							});
		}
		
		 
		function del(key)
		{
			
			var key=key;
			$('#loader').show();
			$
			.getJSON(
					'${deleteItemFromEditEnquiry}',

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
					 

					  $.each( data,
									function(key, itemList) {
									 if(itemList.delStatus==1)
										 {
										var tr = $('<tr></tr>'); 
									  	tr.append($('<td></td>').html(key+1)); 
									  	tr.append($('<td></td>').html(itemList.itemCode)); 
									  	tr.append($('<td></td>').html(itemList.enqQty));
									  	tr.append($('<td></td>').html(itemList.enqDetailDate));
									  	tr.append($('<td></td>').html('<a href="#"><span class="glyphicon glyphicon-edit" onclick="edit('+key+')" id="edit'+key+'"></span></a>'+ 
		                                         '<a href="#"><span class="glyphicon glyphicon-remove" onclick="del('+key+')" id="del'+key+'"></span></a>'));
									    $('#table_grid tbody').append(tr);
										 }
									  	
									})
						
					});
			
			
		}
	</script>
	<script type="text/javascript">
function validation()
{
	var itemId = $("#itemId").val();
	var qty = $("#qty").val();
	var enqItemDate = $("#enqItemDate").val();
	 
	var isValid = true;
	if(itemId=="" || itemId==null)
	{
	isValid = false;
	alert("Please Select Item ");
	}
	
	else if(isNaN(qty) || qty < 1 || qty=="")
	{
	isValid = false;
	alert("Please enter Quantity");
	}
	
	else if(enqItemDate=="" || enqItemDate==null)
	{
	isValid = false;
	alert("Please enter Item Date");
	}
	
return isValid;
	
}
/* function check()
{
	
	var vendId = $("#vendId").val();
	 
	if(vendId=="" || vendId==null)
		{
		alert("Select Vendor");
		}
	 
} */
</script>




</body>
</html>