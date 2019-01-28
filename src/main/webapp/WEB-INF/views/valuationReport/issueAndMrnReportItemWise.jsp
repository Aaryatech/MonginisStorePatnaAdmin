<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getStockBetweenDateWithCatId" value="/getStockBetweenDateWithCatId"></c:url>
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

						<i class="fa fa-file-o"></i>Item Wise Detail

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Item Wise Detail
							</h3>
							<div class="box-tool">
								<%-- <a href="${pageContext.request.contextPath}/addPurchaseOrder">
									Add PO</a> --%> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						 <form id="submitPurchaseOrder" action="${pageContext.request.contextPath}/submitMonthEnd" method="post">
								<div class="box-content">
								
								 
								<%-- <div class="box-content">
							
								<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input id="fromDate" class="form-control date-picker"
								 placeholder="From Date"   name="fromDate" type="text"  >


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date</div>
									<div class="col-md-3">
										<input id="toDate" class="form-control date-picker"
								 placeholder="To Date"   name="toDate" type="text"  >


									</div>
								
				 
							</div><br>
							
							<div class="box-content">

									<div class="col-md-2">Select Category*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="catId" id="catId"
											required>
											<option value="">select</option>
											<c:forEach items="${categoryList}" var="categoryList"> 
														<option value="${categoryList.catId}">${categoryList.catDesc}</option> 
											</c:forEach>
										</select>

									</div>
									<div class="col-md-1"></div>
									  <div class="col-md-3"></div>
								</div><br><br>
							
							<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="button" class="btn btn-info" onclick="search()" value="Search"> 
							</div>
						</div> <br> --%>
							 
								
								<div class="row">
							<div class="col-md-12" style="text-align: center">
								  <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											 <input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" />&nbsp;
											 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" >
											&nbsp;
											  </c:when>
											  <c:otherwise>
											  
											  <input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" disabled/>&nbsp;
											 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" disabled>
											&nbsp;
											  
											  </c:otherwise>
											  </c:choose>
											  
											  
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
										<th class="col-md-4">ITEM NAME</th> 
										<th class="col-md-1"  style="text-align: right"0 >APPV QTY</th>
										 <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
										<th class="col-md-1"  style="text-align: right">APPV VALUE</th>
										<th class="col-md-1"  style="text-align: right">APPV LANDING VALUE</th>
										</c:when>
										</c:choose>
										<th class="col-md-1"  style="text-align: right">ISSUE QTY</th>
										 <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
										<th class="col-md-1"  style="text-align: right">ISSUE VALUE</th> 
										<th class="col-md-1"  style="text-align: right">ISSUE LANDING VALUE</th>
										</c:when>
										</c:choose>
										
									</tr>
								</thead>
								<tbody>
								<c:set var="sr" value="0"> </c:set>
								<c:forEach items="${list}" var="list" varStatus="count">
								<c:choose>
												 	<c:when test="${list.approveQty>0 or list.approvedQtyValue>0 
												 	or list.issueQty>0 or list.issueQtyValue>0}">
											<tr>
											 
												<td  ><c:out value="${sr+1}" /></td> 
												<c:set var="sr" value="${sr+1}" ></c:set>

												 <td  ><c:out value="${list.itemCode}" /></td> 
											<td class="col-md-1"  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${list.approveQty}" /></td>
													 <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											<td class="col-md-1"  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${list.approvedQtyValue}" /></td>
											<td class="col-md-1"  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${list.approvedLandingValue}" /> 
													</c:when>
													</c:choose>
													
											<td class="col-md-1"  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2"
													value="${list.issueQty}" /></td> 
													 <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											<td class="col-md-1"  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${list.issueQtyValue}" /></td>
											<td class="col-md-1"  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${list.issueLandingValue}" /> 
											 </c:when>
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
	function genPdf(){
		window.open('${pageContext.request.contextPath}/issueAndMrnItemWisePDF/');
	}
	function exportToExcel()
	{
		window.open("${pageContext.request.contextPath}/exportToExcel");
		document.getElementById("expExcel").disabled=true;
	}
	function search() {
		  
		
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		var catId = $("#catId").val();
		
		if(fromDate=="" || fromDate == null)
			alert("Select From Date");
		else if (toDate=="" || toDate == null)
			alert("Select To Date");
		 
		$('#loader').show();

		$
				.getJSON(
						'${getStockBetweenDateWithCatId}',

						{
							 
							fromDate : fromDate,
							toDate : toDate, 
							catId : catId,
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
										  	tr.append($('<td></td>').html(itemList.opStockValue)); 
										  	tr.append($('<td></td>').html(itemList.approveQty));
										  	tr.append($('<td></td>').html(itemList.approvedQtyValue));
										  	tr.append($('<td></td>').html(itemList.issueQty));
										  	tr.append($('<td></td>').html(itemList.issueQtyValue)); 
										  	tr.append($('<td></td>').html(itemList.damageQty));
										  	tr.append($('<td></td>').html(itemList.damagValue)); 
										  	tr.append($('<td></td>').html(itemList.openingStock+itemList.approveQty-itemList.issueQty+itemList.returnIssueQty-itemList.damageQty-itemList.gatepassQty+itemList.gatepassReturnQty));
											tr.append($('<td></td>').html(itemList.opStockValue+itemList.approvedQtyValue-itemList.issueQtyValue-itemList.damagValue)); 
										  	tr.append($('<td></td>').html("<a href='${pageContext.request.contextPath}/valueationReportDetail/"+itemList.itemId+"/"+itemList.openingStock+"' class='action_btn'> <abbr title='detailes'> <i class='fa fa-list' ></i></abbr>"));
										  	
										    $('#table1 tbody').append(tr); 
										})  
										
							 
						}); 
}
	</script>
	
	<script>
function myFunction() {
  var input, filter, table, tr, td ,td1, i;
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