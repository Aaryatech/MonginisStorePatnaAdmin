<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	height: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#overlay {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(101, 113, 119, 0.5);
	z-index: 2;
	cursor: pointer;
}

#text {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.bg-overlay {
	background: linear-gradient(rgba(0, 0, 0, .7), rgba(0, 0, 0, .7)),
		url("${pageContext.request.contextPath}/resources/images/smart.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	color: #fff;
	height: auto;
	width: auto;
	padding-top: 10px;
	padding-left: 20px;
}
</style>
<body>


	<c:url var="addItmeInEnquiryList" value="/addItmeInEnquiryList"></c:url>
	<c:url var="editItemInAddEnquiry" value="/editItemInAddEnquiry"></c:url>
	<c:url var="deleteItemFromEditEnquiryFromIndend" value="/deleteItemFromEditEnquiryFromIndend"></c:url>
	<c:url var="geIntendDetailByIndIdForEditEnquiry" value="/geIntendDetailByIndIdForEditEnquiry"></c:url>
	<c:url var="getInvoiceNo" value="/getInvoiceNo" />
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
			<div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i>Edit Enquiry From Indent
					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Edit Enquiry From Indent
							</h3>

							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfEnq">Enquiry
									List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>


						<div class="box-content">

							<form id="submitMaterialStore"
								action="${pageContext.request.contextPath}/submitEditEnq"
								method="post">


								<div class="box-content">

									<div class="col-md-2">Select Vendor</div>
									<div class="col-md-10">

										<select name="vendId" id="vendId" class="form-control chosen"
											>
											<c:forEach items="${vendorList}" var="vendorList">
												<c:choose>
													<c:when test="${vendorList.vendorId==editEnquiry.vendId}">
														<option value="${vendorList.vendorId}" selected>${vendorList.vendorName}</option>
													</c:when>
													<c:otherwise>
														<option value="${vendorList.vendorId}">${vendorList.vendorName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>

									</div>
 
								</div>
								<br>
								
								<div class="box-content">

									<div class="col-md-2">Enquiry No</div>
									<div class="col-md-3">
										<input class="form-control" id="enq_no"
											placeholder="Enquiry Number" type="text" name="enqNo"
											value="${editEnquiry.enqNo}" Readonly />
									</div>
									
									<div class="col-md-2">Enquiry Date*</div>
									<div class="col-md-3">
										<input id="enqDate" class="form-control date-picker"
											placeholder="Enquiry Date" name="enqDate" type="text"
											  value="${editEnquiry.enqDate}"
											required>
									</div>

								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Enquiry Remark</div>
									<div class="col-md-10">
									<input class="form-control" id="enqRemark" size="16"
											placeholder="Enquiry Remark" value="${editEnquiry.enqRemark}"
											type="text" name="enqRemark" />
										 
									</div>

								</div>
								<br> <br>
								
								<div class="box-content">
									<div class="col-md-2">Intend No.</div>

									<div class="col-md-3">
										<input class="form-control" id="indNo" placeholder="Intend No"
											type="text" name="indNo" value="${editEnquiry.indNo}"
											Readonly /> <input type="hidden"
											value="${editEnquiry.indId}" name="indId" id="indId"
											class="form-control">
									</div>


									<div class="col-md-1"></div>
									<div class="col-md-2">
										<input type="button" class="btn btn-info"
											value="Get Item From Intend " id="myBtn">
									</div>
								</div>

								<br> <br>

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
														<th class="col-md-5">Item Name</th> 
														<th class="col-md-1">Enq QTY</th>
														<th class="col-md-1">Date</th>
														<th class="col-md-1">Action</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${detailList}" var="detailList"
														varStatus="count">
														
														<c:choose>
															<c:when test="${detailList.delStatus==1}">
															<tr>

															<td  ><c:out value="${count.index+1}" /></td>

															<td ><c:out value="${detailList.itemCode}" /></td> 
															<td ><c:out
																	value="${detailList.enqQty}" /></td>

															<td ><c:out
																	value="${detailList.enqDetailDate}" /></td>
															<td> 
																<a href="#"><span class="glyphicon glyphicon-remove"
																	onclick="del(${count.index})" id="del${count.index}"></span></a>
															</td>

														</tr>
															</c:when>
														</c:choose>

														
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="submit" class="btn btn-primary" value="Submit"
											id="btn">

										<!-- 										<button type="button" class="btn">Cancel</button>
 -->
									</div>
								</div>
								<br> <br>




							</form>
							<!-- //------------------------------------------------------------------------------ -->
							<form id="submitList"
								action="${pageContext.request.contextPath}/submitEditEnqList"
								method="post">
								<div id="myModal" class="modal">
									<input type="hidden" value="0" name="indMId" id="indMId">
									<input type="hidden" value="0" name="vendIdTemp" id="vendIdTemp">
									<input type="hidden" value="0" name="enqDateTemp"
										id="enqDateTemp"> <input type="hidden" value="0"
										name="enqRemarkTemp" id="enqRemarkTemp">


									<div class="modal-content" style="color: black;">
										<span class="close" id="close">&times;</span>
										<h3 style="text-align: center;">Select Item From Intend</h3>
										<div class=" box-content">
											<div class="row">
												<div
													style="overflow: scroll; height: 70%; width: 100%; overflow: auto">
													<table width="100%" border="0"
														class="table table-bordered table-striped fill-head "
														style="width: 100%" id="table_grid1">
														<thead>
															<tr>
																<th align="left"><input type="checkbox"
																	id="allCheck" onClick="selectAll(this)"
																	onchange="requiredAll()" /> Select All</th>
																<th>Sr.No.</th>
																<th>Item Name</th>
																<th>UOM</th>
																<th>Intend QTY</th>
																<th>Enq QTY</th>
																<th>Remark</th>

															</tr>
														</thead>
														<tbody>

														</tbody>
													</table>
												</div>
											</div>

										</div>
										<br>
										<div class="row">
											<div class="col-md-12" style="text-align: center">
												<input type="submit" class="btn btn-info" value="Submit"
													onclick="checkIndId()">


											</div>
										</div>

									</div>

								</div>
							</form>
							<!-- //------------------------------------------------------------------------------ -->
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
		
	</script>



	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementById("close");

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
			itemByIntendId();
			getValue();
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";

			}
		}

		function itemByIntendId() {

			var indId = $("#indId").val();
			//alert(indId);
			$('#loader').show();
			$
					.getJSON(
							'${geIntendDetailByIndIdForEditEnquiry}',

							{

								indId : indId,
								ajax : 'true'

							},
							function(data) {

								$('#table_grid1 td').remove();
								$('#loader').hide();

								if (data == "") {
									alert("No records found !!");

								}

								$
										.each(
												data,
												function(key, itemList) {

													var tr = $('<tr></tr>');
													tr
															.append($(
																	'<td></td>')
																	.html(
																			'<input type="checkbox" name="select_to_approve"'
																					+ 'id="select_to_approve'
																					+ itemList.indDId
																					+ '" onchange="requiredField('
																					+ itemList.indDId
																					+ ')" value="'
																					+ itemList.indDId
																					+ '" >'));
													tr.append($('<td></td>')
															.html(key + 1));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.itemCode));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.indItemUom));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			itemList.indQty));
													tr
															.append($(
																	'<td ></td>')
																	.html(
																			'<input type="hidden"   id="indQty'+itemList.indDId+'" name="indQty'+itemList.indDId+'" value="'+itemList.indFyr+'" >'
																					+ '<input style="text-align:right; width:100px" type="text" onkeyup="autoChecked('
																					+ itemList.indDId
																					+ ')" id="enqQty'
																					+ itemList.indDId
																					+ '" name="enqQty'
																					+ itemList.indDId
																					+ '" onchange="checkQty('
																					+ itemList.indDId
																					+ ')"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >'));

													tr
															.append($(
																	'<td ></td>')
																	.html(
																			'<input style="text-align:right; width:200px" type="text" id="indRemark'+itemList.indDId+'" name="indRemark'+itemList.indDId+'" value="'+itemList.indRemark+'"  class="form-control" required>'));
													/*   	document.getElementById("indMId").value=itemList.indMId; */
													$('#table_grid1 tbody')
															.append(tr);

												})

							});

		}
		function del(key)
		{
			
			var key=key;
			$('#loader').show();
			$
			.getJSON(
					'${deleteItemFromEditEnquiryFromIndend}',

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
									  	tr.append($('<td></td>').html(' <a href="#"><span class="glyphicon glyphicon-remove" onclick="del('+key+')" id="del'+key+'"></span></a>'));
									    $('#table_grid tbody').append(tr);
										 }
									  	
									})
						
					});
			
			
		}
		
		function requiredAll()
		{
			var checkboxes = document.getElementsByName('select_to_approve'); 
			
			
			if(document.getElementById("allCheck").checked == true)
			{
				 for (var i=0; i<checkboxes.length; i++) {
					 document.getElementById("select_to_approve"+checkboxes[i].value).checked == true;
				       
				    	  document.getElementById("enqQty"+checkboxes[i].value).required=true;  
				    	  document.getElementById("indRemark"+checkboxes[i].value).required=true; 
				  }
			}
			else
			{
				for (var i=0; i<checkboxes.length; i++) {
					 document.getElementById("select_to_approve"+checkboxes[i].value).checked == false;
				       
				    	  document.getElementById("enqQty"+checkboxes[i].value).required=false; 
				    	  document.getElementById("indRemark"+checkboxes[i].value).required=true; 
				      
				  }
			}
			   
			 
		} 

		function requiredField(key)
		{
			
			if(document.getElementById("select_to_approve"+key).checked == true)
			{
				document.getElementById("enqQty"+key).required=true;  
				document.getElementById("indRemark"+key).required=true;  
			} 
			else
			{
				document.getElementById("enqQty"+key).required=false;  
				document.getElementById("indRemark"+key).required=false;  
			}
			
			 
		} 
		
		function autoChecked(key)
		  {
		  	
		  	  
		  	var enqQty = parseFloat($("#enqQty"+key).val());   
		  	
			    if(enqQty<=0 || enqQty==null || enqQty=="")
				  {
				 	 document.getElementById("enqQty"+key).value = ""; 
				 	alert("Enter Enquiry Qty Greater than 0 ");
				 	document.getElementById("select_to_approve"+key).checked=false; 
					  requiredField(key);
				  }
			  else
				  {   
				  document.getElementById("select_to_approve"+key).checked=true; 
				  requiredField(key);
				   }  
		  	
		  	 
		  } 
		
		function getValue() {

			document.getElementById("vendIdTemp").value = document
					.getElementById("vendId").value;

			document.getElementById("enqDateTemp").value = document
					.getElementById("enqDate").value;

			document.getElementById("enqRemarkTemp").value = document
					.getElementById("enqRemark").value;

			document.getElementById("indIdTemp").value = document
					.getElementById("indId").value;

		}
	</script>

	<script type="text/javascript">
		function getInvoiceNo() {

			var date = $("#enqDate").val();

			$.getJSON('${getInvoiceNo}', {

				catId : 1,
				docId : 8,
				date : date,
				ajax : 'true',

			}, function(data) {

				document.getElementById("enq_no").value = data.code;

			});

		}
	</script>

</body>
</html>