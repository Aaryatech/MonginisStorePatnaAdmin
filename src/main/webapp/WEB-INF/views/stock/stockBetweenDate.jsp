<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getStockBetweenDate" value="/getStockBetweenDate"></c:url>
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

						<i class="fa fa-file-o"></i>Stock Between Date

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Stock Between Date
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addPurchaseOrder">
									Add PO</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						 <form id="submitPurchaseOrder" action="${pageContext.request.contextPath}/stockBetweenDate" method="get">
								<div class="box-content">
								
								 
								<div class="box-content">
							
								<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input id="fromDate" class="form-control date-picker"
								 placeholder="From Date" value="${fromDate}"  name="fromDate" type="text"  >


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date</div>
									<div class="col-md-3">
										<input id="toDate" class="form-control date-picker"
								 placeholder="To Date"  value="${toDate}" name="toDate" type="text"  >


									</div>
								
				 
							</div><br>
							
							<div class="box-content">

									<div class="col-md-2">Select *</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="selectedQty" id="selectedQty"
											required>
											  
												<c:choose>
													<c:when test="${1==selectedQty}">
													<option value="1" selected>Stock Summary</option>
													<option value="2"  >Op Stock</option>
													<option value="3"  >Cl Stock</option>
													</c:when>
													<c:when test="${2==selectedQty}">
													<option value="1"  >Stock Summary</option>
													<option value="2" selected>Op Stock</option>
													<option value="3"  >Cl Stock</option>
													</c:when>
													<c:when test="${3==selectedQty}">
													<option value="1"  >Stock Summary</option>
													<option value="2"  >Op Stock</option>
													<option value="3" selected>Cl Stock</option>
													</c:when>
													 
												</c:choose>
														 
										 
										</select>

									</div>
									<div class="col-md-1"></div>
									  <div class="col-md-3"></div>
								</div><br><br>
							<br>
							
							<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-primary"  value="Submit"> 
								 <input type="button" value="PDF" class="btn btn-primary" onclick="genPdf()" /> 
								<input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" >
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
										<th >Item Name</th>
										
										<c:choose>  
												<c:when test="${2==selectedQty}">
													<th class="col-md-1" style="text-align: right">OP QTY</th> 
													<th class="col-md-1" style="text-align: right">OP VALUE</th>
													<th class="col-md-1" style="text-align: right">OP LANDING VALUE</th>
												</c:when>
												<c:when test="${3==selectedQty}">
													<th class="col-md-1" style="text-align: right">C/L QTY</th>
													<th class="col-md-1" style="text-align: right">C/L VALUE</th>
													<th class="col-md-1" style="text-align: right">C/L LANDING VALUE</th>
												</c:when> 
												<c:otherwise>
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
												</c:otherwise>
										</c:choose>
										
										
									</tr>
								</thead>
								<tbody>
									<c:set var="sr" value="0"> </c:set>
									  <c:forEach items="${stockList}" var="stockList"
										varStatus="count">
										<c:choose>
												 	<c:when test="${stockList.approveQty>0 or stockList.approvedQtyValue>0 
												 	or stockList.issueQty>0 or stockList.issueQtyValue>0 or stockList.damageQty>0 or stockList.damagValue>0 
												 	or stockList.openingStock>0 or stockList.opStockValue>0}">
										<tr>
											<td  ><c:out value="${sr+1}" /></td> 
												<c:set var="sr" value="${sr+1}" ></c:set>


											
													
													<c:choose>  
														<c:when test="${2==selectedQty}">
														<td><c:out value="${stockList.itemCode}" /></td>
															<td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.openingStock}" /> </td> 
															<td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.opStockValue}" /> </td>
															<td  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${stockList.opLandingValue}" /> </td> 
														</c:when>
														<c:when test="${3==selectedQty}">
														<td><c:out value="${stockList.itemCode}" /></td>
															<c:set var="closingStock" value="${stockList.openingStock+stockList.approveQty-stockList.issueQty+stockList.returnIssueQty-
																	stockList.damageQty-stockList.gatepassQty+stockList.gatepassReturnQty}" ></c:set>
															<c:set var="closingStockValue" value="${stockList.opStockValue+stockList.approvedQtyValue-stockList.issueQtyValue-stockList.damagValue}" ></c:set>
															<c:set var="closingStockLandingValue" value="${stockList.opLandingValue+stockList.approvedLandingValue-stockList.issueLandingValue-stockList.damageLandingValue}" ></c:set>	
															
															<td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStock}"/></td>
															 <td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockValue}"/></td> 
															 <td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockLandingValue}"/></td> 
														</c:when> 
														<c:otherwise>
														<td class="col-md-2" ><c:out value="${stockList.itemCode}" /></td>
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
															
														</c:otherwise>
													</c:choose>
												 
											
										</tr>
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
						'${getStockBetweenDate}',

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
						 

						  $.each( data,
										function(key, itemList) {
											  
											var tr = $('<tr></tr>'); 
										  	tr.append($('<td></td>').html(key+1));
										  	tr.append($('<td></td>').html(itemList.itemCode));
										  	tr.append($('<td></td>').html(itemList.openingStock));  
										  	tr.append($('<td></td>').html(itemList.approveQty));
										  	tr.append($('<td></td>').html(itemList.issueQty));
										  	tr.append($('<td></td>').html(itemList.returnIssueQty));
										  	tr.append($('<td></td>').html(itemList.damageQty));
										  	tr.append($('<td></td>').html(itemList.gatepassQty));
										  	tr.append($('<td></td>').html(itemList.gatepassReturnQty));
										  	tr.append($('<td></td>').html(itemList.openingStock+itemList.approveQty-itemList.issueQty+itemList.returnIssueQty-itemList.damageQty-itemList.gatepassQty+itemList.gatepassReturnQty));
										  	 
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
function genPdf(){
	window.open('${pageContext.request.contextPath}/stockBetweenDateReportItemWisePDF/');
}
function exportToExcel()
{
	window.open("${pageContext.request.contextPath}/exportToExcel");
	document.getElementById("expExcel").disabled=true;
}
</script>

</body>
</html>