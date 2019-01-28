<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getPoListByDate" value="/getPoListByDate"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>


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

						<i class="fa fa-file-o"></i>Pending Month End Stock

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Minimum Level And ROL Level Report
							</h3>
							<div class="box-tool">
								 <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						 <form id="submitPurchaseOrder" action="${pageContext.request.contextPath}/minAndRolQtyReport" method="get">
								<div class="box-content">
								
								<div class="box-content">

									<div class="col-md-2">Select *</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="selectedQty" id="selectedQty"
											required>
											  
												<c:choose>
													<c:when test="${1==selectedQty}">
													<option value=""  >Select</option>
													<option value="1"  selected>Min-Level</option>
													<option value="2"  >ROL</option> 
													</c:when>
													<c:when test="${2==selectedQty}">
													<option value=""  >Select</option>
													<option value="1"  >Min-Level</option>
													<option value="2"  selected>ROL</option> 
													</c:when>
													<c:otherwise>
													<option value=""  >Select</option>
													<option value="1"  >Min-Level</option>
													<option value="2"  >ROL</option> 
													</c:otherwise>
													 
												</c:choose>
														 
										 
										</select>

									</div>
									<div class="col-md-2">Select Category*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="catId" id="catId"
											required>
											<option value="0">All</option>
											<c:forEach items="${categoryList}" var="categoryList"> 
												<c:choose>
													<c:when test="${categoryList.catId==catId}">
													<option value="${categoryList.catId}" selected>${categoryList.catDesc}</option>
													</c:when>
													<c:otherwise>
													<option value="${categoryList.catId}">${categoryList.catDesc}</option>
													</c:otherwise>
												</c:choose>
														 
											</c:forEach>
										</select> 

									</div>
								</div><br>
								
								 <br>
								 <div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-info"   value="Submit"> 
							</div>
						</div> <br>
							 
								
							<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label>	 
					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">  
									<thead>
									<tr class="bgpink">
										<th style="width:1%;">Sr no.</th>
										<th>Item Name</th> 
										
										<c:choose>
													<c:when test="${1==selectedQty}">
													<th class="col-md-1">MIN</th> 
													</c:when>
													<c:when test="${2==selectedQty}"> 
													<th class="col-md-1">ROL</th>
													</c:when> 
													<c:otherwise>
													<th class="col-md-1">ROL</th>
													<th class="col-md-1">MIN</th> 
													</c:otherwise>
												</c:choose> 
										<th class="col-md-1">C/L QTY</th>
										<th class="col-md-1">C/L VALUE</th> 
									</tr>
								</thead>
								<tbody>
								
								<c:set var="index" value="0"></c:set>

									<c:forEach items="${stockList}" var="stockList"
										varStatus="count">
										
										<c:set var="closingStock" value="${stockList.openingStock+stockList.approveQty-stockList.issueQty+stockList.returnIssueQty-
													stockList.damageQty-stockList.gatepassQty+stockList.gatepassReturnQty}" ></c:set>
											<c:set var="closingStockValue" value="${stockList.opStockValue+stockList.approvedQtyValue-stockList.issueQtyValue-stockList.damagValue}" ></c:set>
											
											<c:choose>
													<c:when test="${1==selectedQty}">
													 
														 <c:choose>
														<c:when test="${stockList.itemMinLevel>closingStock}">
																<tr>
																	<td style="width:1%;"><c:out value="${index+1}" /></td>
 																	<c:set var="index" value="${index+1}"></c:set>
 																	<td><c:out
																			value="${stockList.itemCode}" /></td>
																	<td class="col-md-1"><c:out
																			value="${stockList.itemMinLevel}" /></td>
																	 
																	<td class="col-md-1"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStock}"/></td>
																	 <td class="col-md-1"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockValue}"/></td>
																	
																</tr>
														</c:when> 
													</c:choose> 
													 
													</c:when>
													<c:when test="${2==selectedQty}">
													 	<c:choose> 
														<c:when test="${stockList.itemRodLevel>closingStock}">
															<tr>
																	<td style="width:1%;"><c:out value="${index+1}" /></td>
 																	<c:set var="index" value="${index+1}"></c:set>
																	<td><c:out
																			value="${stockList.itemCode}" /></td>
 	
																	<td class="col-md-1"><c:out
																			value="${stockList.itemRodLevel}" /></td>
																	 
																	<td class="col-md-1"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStock}"/></td>
																	 <td class="col-md-1"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockValue}"/></td>
																	
																</tr>
														</c:when> 
													</c:choose> 
													</c:when> 
												</c:choose> 
										
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
		
		if(fromDate=="" || fromDate == null)
			alert("Select From Date");
		else if (toDate=="" || toDate == null)
			alert("Select To Date");
		 
		$('#loader').show();

		$
				.getJSON(
						'${getPoListByDate}',

						{
							 
							fromDate : fromDate,
							toDate : toDate, 
							ajax : 'true'

						},
						function(data) {

							$('#table1 td').remove();
							$('#loader').hide();

							if (data == "") {
								alert("No records found !!");

							}
						 

						  $.each(
										data,
										function(key, itemList) {
										

											var tr = $('<tr></tr>'); 
										  	tr.append($('<td></td>').html(key+1));
										  	tr.append($('<td></td>').html(itemList.poDate));
										  	tr.append($('<td></td>').html(itemList.poNo));  
										  	tr.append($('<td></td>').html(itemList.vendorName));
										  	tr.append($('<td></td>').html(itemList.indNo));
										  	tr.append($('<td></td>').html('<a href="${pageContext.request.contextPath}/editPurchaseOrder/'+itemList.poId+'"><abbr'+
													'title="Edit"><i class="fa fa-edit"></i></abbr></a> <a href="${pageContext.request.contextPath}/deletePurchaseOrder/'+itemList.poId+'"'+
													'onClick="return confirm("Are you sure want to delete this record");"><span class="glyphicon glyphicon-remove"></span></a>'));
										    $('#table1 tbody').append(tr); 
										})  
										
							 
						}); 
}
	</script>
<script>
function myFunction() {
  var input, filter, table, tr, td ,td1,td2, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1]; 
    if (td) {
    	
    	 if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      } 
    	      else {
    	        tr[i].style.display = "none";
    	      }
       
    }  
    
     
  }
}
 
</script>
</body>
</html>