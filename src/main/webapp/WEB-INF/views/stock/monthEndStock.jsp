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
								<i class="fa fa-table"></i>Pending Month End Stock
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addPurchaseOrder">
									Add PO</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						 <form id="submitForm" action="${pageContext.request.contextPath}/submitMonthEnd" onsubmit="return confirm('Do you really want to Do Month End?');" method="post">
								<div class="box-content">
								
								<div class="box-content">
							
								<div class="col-md-2">Pending Month End Name</div>
									<div class="col-md-3">
										<input id="monthName" class="form-control "
								 placeholder="monthName" value="${monthName}" name="monthName" type="text" readonly>


									</div>
									 
							</div><br>
								
								<div class="box-content">
							
								<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input id="fromDate" class="form-control "
								 placeholder="From Date" value="${fromDate}" name="fromDate" type="text" readonly>
 
									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date</div>
									<div class="col-md-3">
										<input id="toDate" class="form-control "
								 placeholder="To Date" value="${toDate}" name="toDate" type="text" readonly>


									</div>
								
				 
							</div><br><br>
							 
								
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
										<th class="col-md-2">Item Name</th>
										<th class="col-md-1" style="text-align: right">OP QTY</th>
										<th class="col-md-1" style="text-align: right">OP VALUE</th>
										<th class="col-md-1" style="text-align: right">OP LANDING VALUE</th>
										<th class="col-md-1" style="text-align: right">APPV QTY</th>
										<th class="col-md-1" style="text-align: right">APPV VALUE</th>
										<th class="col-md-1" style="text-align: right">APPV LANDING VALUE</th>
										<th class="col-md-1" style="text-align: right">ISSUE QTY</th>
										<th class="col-md-1" style="text-align: right">ISSUE VALUE</th> 
										<th class="col-md-1" style="text-align: right">ISSUE LANDING VALUE</th>
										<th class="col-md-1" style="text-align: right">RETURN QTY</th>
										<th class="col-md-1" style="text-align: right">RETURN VALUE</th> 
										<th class="col-md-1" style="text-align: right">RETURN LANDING VALUE</th>
										<th class="col-md-1" style="text-align: right">C/L QTY</th>
										<th class="col-md-1" style="text-align: right">C/L VALUE</th> 
										<th class="col-md-1" style="text-align: right">C/L LANDING VALUE</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${stockList}" var="stockList"
										varStatus="count">
										<tr>
											<td style="width:1%;"><c:out value="${count.index+1}" /></td>


											<td class="col-md-2"><c:out
													value="${stockList.itemCode}" /></td>
													
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.openingStock}" /> </td> 
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.opStockValue}" /> </td>
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.opLandingValue}" /> </td>  
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.approveQty}" /> </td>
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.approvedQtyValue}" /> </td>
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.approvedLandingValue}" /> </td>  
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.issueQty}" /> </td> 
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.issueQtyValue}" /> </td>
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.issueLandingValue}" /> </td>	
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.damageQty}" /> </td> 
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.damagValue}" /> </td> 
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.damageLandingValue}" /> </td> 
											<c:set var="closingStock" value="${stockList.openingStock+stockList.approveQty-stockList.issueQty-stockList.damageQty}" ></c:set>
											<c:set var="closingStockValue" value="${stockList.opStockValue+stockList.approvedQtyValue-stockList.issueQtyValue-stockList.damagValue}" ></c:set>
											<c:set var="closingStockLandingValue" value="${stockList.opLandingValue+stockList.approvedLandingValue-stockList.issueLandingValue-stockList.damageLandingValue}" ></c:set>	
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStock}"/></td>
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockValue}"/></td>
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockLandingValue}"/></td>
											
										</tr>
									</c:forEach>

								</tbody>

								</table>
  
					</div> 
					<c:choose>
						<c:when test="${isMonthEnd==1}">
						<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-info" value="Month End"> 
							</div>
						</div> 
						</c:when>
						<c:otherwise>
						<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-info" value="Month End" disabled> 
							</div>
						</div>
						
						</c:otherwise>
						
					</c:choose>
					 
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