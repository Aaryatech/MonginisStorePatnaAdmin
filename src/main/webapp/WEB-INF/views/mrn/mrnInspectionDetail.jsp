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
    background: linear-gradient(rgba(0,0,0,.7), rgba(0,0,0,.7)), url("${pageContext.request.contextPath}/resources/images/smart.jpeg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    color: #fff;
    height:auto;
    width:auto;
    padding-top: 10px;
    padding-left:20px;
}
</style>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	  

	<c:url var="geIntendDetailByIndId" value="/geIntendDetailByIndId"></c:url>
		<c:url var="updateRmQty0" value="/updateRmQty0"></c:url>
		<c:url var="getRmCategory" value="/getRmCategory" />
			<c:url var="getRmListByCatId" value="/getRmListByCatId" />
						<c:url var="getRmRateAndTax" value="/getRmRateAndTax" />

	<c:url var="calculatePurchaseHeaderValues" value="/calculatePurchaseHeaderValues" />


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
					<i class="fa fa-file-o"></i>MRN Inspection Detail
				</h1>
				<h4>Bill for franchises</h4>
			</div>
		</div> -->
		<!-- END Page Title -->

		<!-- BEGIN Breadcrumb -->
	<%-- 	<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a
					href="${pageContext.request.contextPath}/home">Home</a> <span
					class="divider"><i class="fa fa-angle-right"></i></span></li>
				<li class="active">Purchase Order</li>
			</ul>
		</div> --%>
		<!-- END Breadcrumb -->
		
		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>MRN Inspection Detail
				</h3>
				<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showMrnForInspection">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
				

			</div>

				<div class="box-content">
					 
		<div class="col-md-12">
			<form id="submitPurchaseOrder"
				action="${pageContext.request.contextPath}/submitMrnInspection"
				method="post">
			<div class="box-content">
				<div class="col-md-2">MRN No.  </div>
				<div class="col-md-3">${getMrnHeader.mrnNo}</div>
				<div class="col-md-2">MRN Date</div> 
				<div class="col-md-3">${getMrnHeader.mrnDate}</div>
				</div><br/>
				<div class="box-content">
				<div class="col-md-2" >Vendor Name</div>
									<div class="col-md-3">
										${getMrnHeader.vendorName}
									</div>
					 
			</div><br/>
			
			<div class="box-content">
				 
					<div class="col-md-2" >MRN Type</div>
									<div class="col-md-3">
										<c:choose>
											<c:when test="${getMrnHeader.mrnType==1}">
												Regular
											</c:when>
											<c:when test="${getMrnHeader.mrnType==2}">
												Job Work
											</c:when>
											<c:when test="${getMrnHeader.mrnType==3}">
								             General
											</c:when>
											<c:when test="${getMrnHeader.mrnType==4}">
												Other
											</c:when>
										
										</c:choose>
										
									</div>
				 
			</div><br/>
			
			<div class="box-content">
			<div class="col-md-2" >Bill No.</div>
					<div class="col-md-3">
									${getMrnHeader.billNo}
					</div>
						<div class="col-md-2" >Bill Date</div>
							<div class="col-md-2">
								${getMrnHeader.billDate}
							</div>
			<div class="col-md-2"><input type="button" class="btn btn-info" value="Get Item For MRN Inspection "  id="myBtn"></div>
		
							</div><br/>
	
								
				<div class=" box-content">
					<div class="row">
								<div style="overflow:scroll;height:35%;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%" id="table_grid2">
										<thead>
											<tr>
										<th>Sr.No.</th>
										<th>Item Code</th>
										<th>Item Name </th>
										<th>PO Qty</th>
										<th>MRN Qty</th> 
										<th>Approve QTY</th>
										<th>Reject QTY</th>
									
									</tr>
										</thead>
										<tbody>
										
										<c:forEach items="${getMrnDetailList}" var="getMrnDetail"
													varStatus="count">
													 
													<tr>
													  
														<td><c:out value="${count.index+1}" /></td>
  
																<td align="left"><c:out value="${getMrnDetail.itemCode}" /></td>
																<td align="left"><c:out value="${getMrnDetail.itemName}" /></td>
																<td align="right"><c:out value="${getMrnDetail.poQty}" /></td>
																<td align="right"><c:out value="${getMrnDetail.mrnQty}" /></td>
													  			<td align="right"><c:out value="${getMrnDetail.approveQty}" /></td>
													  			<td align="right"><c:out value="${getMrnDetail.rejectQty}" /></td>
													  			</tr>
												</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
		</div>
			<div class="row">
						<div class="col-md-12" style="text-align: center">
							<c:choose>
						<c:when test="${getMrnHeader.mrnStatus==2}">
						<input type="submit" class="btn btn-info" value="Already Inspection Done" disabled>
						</c:when>
						<c:otherwise>
						<input type="submit" class="btn btn-info" value="Submit">
						</c:otherwise>
							</c:choose>
							


						</div>
					</div>
				
			</form>
			
			 <form id="submitList"
				action="${pageContext.request.contextPath}/submitMrnInspectionList"
				method="post">
			<div id="myModal" class="modal">
					<input  type="hidden" value="0" name="mrnId" id="mrnId"    >
					
										      
					<div class="modal-content" style="color: black;">
						<span class="close" id="close">&times;</span>
						<h3 style="text-align: center;">Item From MRN</h3>
							<div class="box-content">
							<div class="row">
								<div style="overflow:scroll;height:70%;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%" id="table_grid1">
										<thead>
											<tr>
										<th align="left"><input type="checkbox" onClick="selectAll(this)" /> Select All</th>
											<th>Sr.No.</th>
										<th>Item Code</th>
										<th>Item Name </th>
										<th>PO Qty</th>
										<th>MRN Qty</th> 
										<th>Approve QTY</th>
										<th>Reject QTY</th>

									</tr>
										</thead>
										<tbody>
 	<c:forEach items="${getMrnHeader.getMrnDetailList}" var="getMrnDetail"
													varStatus="count">
													 
													<tr>					
													
													  <td><input type="checkbox" name="select_to_approve"
										id="select_to_approve" value="${getMrnDetail.mrnDetailId}" /></td>
														<td><c:out value="${count.index+1}" /></td>
  
																<td align="left"><c:out value="${getMrnDetail.itemCode}" /></td>
																<td align="left"><c:out value="${getMrnDetail.itemName}" /></td>
																<td align="right"><c:out value="${getMrnDetail.poQty}" /></td>
																<td align="right"><c:out value="${getMrnDetail.mrnQty}" /></td>
													  			<td align="right"><input style="text-align:right; width:100px" type="text" id="approveQty${getMrnDetail.mrnDetailId}"  name="approveQty${getMrnDetail.mrnDetailId}" value="${getMrnDetail.mrnQty}" min="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" onchange="changeApproveQty(this.value,${getMrnDetail.mrnDetailId},${getMrnDetail.mrnQty})" max="${getMrnDetail.mrnQty}" required></td>
													  			<td align="right"><input style="text-align:right; width:100px" type="text" id="rejectQty${getMrnDetail.mrnDetailId}" name="rejectQty${getMrnDetail.mrnDetailId}" value="${getMrnDetail.rejectQty}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" max="${getMrnDetail.mrnQty}" readonly></td>
													  			</tr>
												</c:forEach>
										</tbody>
									</table>
								</div>
							</div> 
							 
						</div><br>
						<div class="row">
						<div class="col-md-12" style="text-align: center">
							<input type="submit" class="btn btn-info" value="Submit" >


						</div>
					</div>
 
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
 
<!--   <script>
    /*
//  jquery equivalent
jQuery(document).ready(function() {
   jQuery(".main-table").clone(true).appendTo('#table-scroll .faux-table').addClass('clone');
   jQuery(".main-table.clone").clone(true).appendTo('#table-scroll .faux-table').addClass('clone2');
 });
*/
(function() {
  var fauxTable = document.getElementById("faux-table");
  var mainTable = document.getElementById("table_grid");
  var clonedElement = table_grid.cloneNode(true);
  var clonedElement2 = table_grid.cloneNode(true);
  clonedElement.id = "";
  clonedElement2.id = "";
  fauxTable.appendChild(clonedElement);
  fauxTable.appendChild(clonedElement2);
})();

</script> -->


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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-switch/static/js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/ckeditor/ckeditor.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
		
		
		
		<script type="text/javascript">
 
var specialKeys = new Array();
specialKeys.push(8); //Backspace
function IsNumeric(e) {
    var keyCode = e.which ? e.which : e.keyCode
    var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1 || keyCode==9);
   // document.getElementById("error").style.display = ret ? "none" : "inline";
    return ret;
}

function check()
{
	
	var transportation = $("#transportation").val();
	var pay_terms = $("#pay_terms").val();
	// alert(transportation);
	var freight = $("#freight").val();
	var insurance = $("#insurance").val();
	if(transportation==null)
	{
	alert("Select Transporter ");
	}
	else if(pay_terms==null)
	{
	alert("Select Payment ");
	}
	else if(freight==null)
		{
		alert("Enter Freight Amt");
		}
	else if(insurance==null)
	{
	alert("Enter Insurance Amt");
	}
}

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
   /*  itemByIntendId(); 
    getValue(); */
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


function itemByIntendId()
{
	
	var indId = $("#indId").val();
	$('#loader').show();
	$
	.getJSON(
			'${geIntendDetailByIndId}',

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
				 

			  $.each(
							data,
							function(key, itemList) {
							 
								var tr = $('<tr></tr>'); 
								tr.append($('<td></td>').html('<input type="checkbox" name="select_to_approve"'+
										'id="select_to_approve" value="'+itemList.indDId+'" >'));  
							  	tr.append($('<td></td>').html(key+1)); 
							  	tr.append($('<td></td>').html(itemList.itemCode)); 
							  	tr.append($('<td></td>').html(itemList.indItemUom));
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.indQty));
							  	tr.append($('<td ></td>').html('<input type="hidden"   id="indQty'+itemList.indDId+'" name="indQty'+itemList.indDId+'" value="'+itemList.indQty+'" >'+
							  			'<input style="text-align:right; width:100px" type="text" onkeyup="calculateBalaceQty('+itemList.indDId+')" id="poQty'+itemList.indDId+'" name="poQty'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'));
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" id="balanceQty'+itemList.indDId+'" name="balanceQty'+itemList.indDId+'" value="'+itemList.indQty+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>'));
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" id="rate'+itemList.indDId+'" name="rate'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'));
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" id="disc'+itemList.indDId+'" name="disc'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'));
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" id="indItemSchd'+itemList.indDId+'" name="indItemSchd'+itemList.indDId+'" value="'+itemList.indItemSchd+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'));
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" id="indRemark'+itemList.indDId+'" name="indRemark'+itemList.indDId+'" value="'+itemList.indRemark+'"  class="form-control" required>'));
							  	document.getElementById("indMId").value=itemList.indMId;
							  	 $('#table_grid1 tbody').append(tr);
							  	
							})
				
			});
	
	
}

  function getValue()
{
	
	 
	document.getElementById("vendIdTemp").value=document.getElementById("vendId").value;
	document.getElementById("quotationTemp").value=document.getElementById("quotation").value;
	document.getElementById("poTypeTemp").value=document.getElementById("poType").value;
	document.getElementById("quotationDateTemp").value=document.getElementById("quotationDate").value;
	document.getElementById("payIdTemp").value=document.getElementById("payId").value;
	document.getElementById("deliveryIdTemp").value=document.getElementById("deliveryId").value;
	document.getElementById("dispatchModeTemp").value=document.getElementById("dispatchMode").value;
	document.getElementById("poDateTemp").value=document.getElementById("poDate").value;
	
	 
} 
  function calculateBalaceQty(key)
  {
  	
  	  
  	var indQty = parseInt($("#indQty"+key).val());  
	 var poQty = parseInt($("#poQty"+key).val());  
	  
	    if(poQty>indQty)
		  {
		 	 document.getElementById("poQty"+key).value = 0;
		 	document.getElementById("balanceQty"+key).value = indQty;
		 	alert("You Enter Intend Qty");
		  }
	  else
		  {  
		  document.getElementById("balanceQty"+key).value = indQty-poQty;
		   }  
  	
  	 
  } 
  
  function calculation()
  {
	         
  	var packPer = $("#packPer").val();
  	var packValue = $("#packValue").val();
  	var insuPer = $("#insuPer").val();
  	var insuValue = $("#insuValue").val();
  	var freightPer = $("#freightPer").val();
  	var freightValue = $("#freightValue").val();
  	var otherPer = $("#otherPer").val();
  	var otherValue = $("#otherValue").val();
  	
  	$('#loader').show();
  	$
  	.getJSON(
  			'${calculatePurchaseHeaderValues}',

  			{
  				 
  				packPer : packPer,
  				packValue : packValue,
  				insuPer : insuPer,
  				insuValue : insuValue,
  				insuValue : insuValue,
  				freightPer : freightPer,
  				freightValue : freightValue,
  				otherPer : otherPer,
  				otherValue : otherValue,
  				ajax : 'true'

  			},
  			function(data) {
  				
  				$('#table_grid1 td').remove();
  				$('#loader').hide();

  				if (data == "") {
  					alert("No records found !!");

  				}
  				 
  				document.getElementById("packValue").value = data.poPackVal;
  				document.getElementById("insuValue").value = data.poInsuVal;
  				document.getElementById("freightValue").value = data.poFrtVal;
  				document.getElementById("otherValue").value = data.otherChargeAfter;
  				
  				document.getElementById("poBasicValue").value = data.poBasicValue;
  				document.getElementById("discValue").value = data.discValue;
  				document.getElementById("finalValue").value = data.poBasicValue-data.discValue+data.poPackVal+data.poInsuVal
  				+data.poFrtVal+data.otherChargeAfter;
  				
  				
  			});
  	
  	
  }
</script>
	<script type="text/javascript">
	function changeApproveQty(qty,mrnDetailId,mrnQty)
	{
		if(qty<=mrnQty)
		{
		   var actQty=mrnQty-qty;
		   document.getElementById('rejectQty'+mrnDetailId).value=actQty;
		}
		else
		{
			alert("Please Enter Valid Approve Qty")
			document.getElementById('approveQty'+mrnDetailId).value=mrnQty;
			document.getElementById('rejectQty'+mrnDetailId).value=0;
			
		}
		
	}
	</script>	
		
</body>
</html>