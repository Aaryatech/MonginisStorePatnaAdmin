<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getStockBetweenDateWithCatId" value="/getStockBetweenDateWithCatId"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>
	<c:url var="listForStockValuetioinGraph" value="/listForStockValuetioinGraph"></c:url>


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

						<i class="fa fa-file-o"></i>Stock Summary

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Stock Summary
							</h3>
							<div class="box-tool">
								<%-- <a href="${pageContext.request.contextPath}/addPurchaseOrder">
									Add PO</a>  --%><a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						 <form id="submitPurchaseOrder" action="${pageContext.request.contextPath}/stockValueationReportCategoryWise" method="get">
								<div class="box-content">
								
								 
								<div class="box-content">
							
								<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input id="fromDate" class="form-control date-picker"
								 placeholder="From Date"  value="${fromDate}" name="fromDate" type="text"  >


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date</div>
									<div class="col-md-3">
										<input id="toDate" class="form-control date-picker"
								 placeholder="To Date" value="${toDate}"  name="toDate" type="text"  >


									</div>
								
				 
							</div><br>
							
							<input id="typeId"  value="0"  name="typeId" type="hidden"  >
							<%-- 
							<div class="box-content">

									<div class="col-md-2">Select Type*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="typeId" id="typeId"
											required>
											<option value="0">All</option>
											<c:forEach items="${typeList}" var="typeList">
											<c:choose>
												<c:when test="${typeList.typeId==typeId}">
												<option value="${typeList.typeId}" selected>${typeList.typeName}</option> 
												</c:when>
												<c:otherwise>
												<option value="${typeList.typeId}">${typeList.typeName}</option> 
												</c:otherwise>
											</c:choose> 
													 
											</c:forEach>
										</select>

									</div>
									<div class="col-md-1"></div>
									  <div class="col-md-3"></div>
								</div><br> --%><br>
							
							<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-info"   value="Search"> 
								
								<c:choose>
												<c:when test="${fromDate!=null}">
									 
								 
											 
											 <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
												<input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" />&nbsp;
													 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" >
												</c:when>
												<c:otherwise>
												<input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" disabled/>&nbsp;
													 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" disabled>
												</c:otherwise>
												</c:choose>
												
											
											 
											
											&nbsp;
											    <input type="button" class="btn search_btn" onclick="showChart()"  value="Graph"> 
											 
											</c:when></c:choose>
											
							</div>
						</div> <br>
							 
								
								<div align="center" id="loader" style="display: none">

								<span>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>
							<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label> 
					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0" id="tbl">
						<table class="table table-advance" id="table1">  
									<thead>
									<tr class="bgpink">
										<th style="width:1%;" style="text-align: right">SR</th>
										<th class="col-md-4" style="text-align: left">CAT NAME</th>
										<th class="col-md-1" style="text-align: right">OP QTY</th>
										<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
										<th class="col-md-1" style="text-align: right">OP VALUE</th>
										<th class="col-md-1" style="text-align: right">OP LANDING VALUE</th>
										</c:when>
										</c:choose>
										<th class="col-md-1" style="text-align: right">APPV QTY</th>
										<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
										<th class="col-md-1" style="text-align: right">APPV VALUE</th>
										<th class="col-md-1" style="text-align: right">APPV LANDING VALUE</th>
										</c:when>
										</c:choose>
										<th class="col-md-1" style="text-align: right">ISSUE QTY</th>
										<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
										<th class="col-md-1" style="text-align: right">ISSUE VALUE</th> 
										<th class="col-md-1" style="text-align: right">ISSUE LANDING VALUE</th>
										</c:when>
										</c:choose>
										<th class="col-md-1" style="text-align: right">DAMAGE QTY</th>
										<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
										<th class="col-md-1" style="text-align: right">DAMAGE VALUE</th> 
										<th class="col-md-1" style="text-align: right">DAMAGE LANDING VALUE</th>
										</c:when>
										</c:choose>
										<th class="col-md-1" style="text-align: right">C/L QTY</th>
										<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
												
										<th class="col-md-1" style="text-align: right">C/L VALUE</th>
										<th class="col-md-1" style="text-align: right">C/L LANDING VALUE</th> 
										</c:when>
												</c:choose>
										<th class="col-md-1" style="text-align: right">Action</th>
									</tr>
								</thead>
								<tbody>
								<c:set var="sr" value="0"> </c:set>
								<c:set var="opQtyTotal" value="0" ></c:set>
								<c:set var="opValueTotal" value="0" ></c:set>
								<c:set var="opLandValueTotal" value="0" ></c:set>
								<c:set var="appvQtyTotal" value="0" ></c:set>
								<c:set var="appvValueTotal" value="0" ></c:set>
								<c:set var="appvLandValueTotal" value="0" ></c:set>
								<c:set var="issueQtyTotal" value="0" ></c:set>
								<c:set var="issueValueTotal" value="0" ></c:set>
								<c:set var="issueLandValueTotal" value="0" ></c:set>
								<c:set var="dmgQtyTotal" value="0" ></c:set>
								<c:set var="dmgValueTotal" value="0" ></c:set>
								<c:set var="dmgLandValueTotal" value="0" ></c:set>
								<c:set var="colsQtyTotal" value="0" ></c:set>
								<c:set var="colsValueTotal" value="0" ></c:set>
								<c:set var="colsLandValueTotal" value="0" ></c:set>
								  <c:forEach items="${categoryWiseReport}" var="categoryWiseReport" varStatus="count">
								 
								<c:choose>
												 	<c:when test="${categoryWiseReport.approveQty>0 or categoryWiseReport.approvedQtyValue>0 
												 	or categoryWiseReport.issueQty>0 or categoryWiseReport.issueQtyValue>0 or categoryWiseReport.damageQty>0 or categoryWiseReport.damageValue>0 
												 	or categoryWiseReport.openingStock>0 or categoryWiseReport.opStockValue>0 }">
											<tr>
											
												 
												<td  style="text-align: right"><c:out value="${sr+1}" /></td> 
												<c:set var="sr" value="${sr+1}" ></c:set>


												<td  style="text-align: left"><c:out value="${categoryWiseReport.catDesc}" /></td>
												 
												<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.openingStock}"/>  
												<c:set var="opQtyTotal" value="${categoryWiseReport.openingStock+opQtyTotal}" ></c:set>
												</td>
												
												 <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
												<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.opStockValue}"/> </td>
												<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${categoryWiseReport.opLandingValue}" /> 
												
												<c:set var="opValueTotal" value="${categoryWiseReport.opStockValue+opValueTotal}" ></c:set>
												<c:set var="opLandValueTotal" value="${categoryWiseReport.opLandingValue+opLandValueTotal}" ></c:set> </td>
												
													</c:when>
													</c:choose>
													
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.approveQty}"/>
											 <c:set var="appvQtyTotal" value="${categoryWiseReport.approveQty+appvQtyTotal}" ></c:set>
											 </td>
													<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.approvedQtyValue}"/> </td> 
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${categoryWiseReport.approvedLandingValue}" /> </td>
													<c:set var="appvValueTotal" value="${categoryWiseReport.approvedQtyValue+appvValueTotal}" ></c:set>
													<c:set var="appvLandValueTotal" value="${categoryWiseReport.approvedLandingValue+appvLandValueTotal}" ></c:set> 
													</c:when>
													</c:choose>
													
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.issueQty}"/> 
											<c:set var="issueQtyTotal" value="${categoryWiseReport.issueQty+issueQtyTotal}" ></c:set></td> 
													<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.issueQtyValue}"/> </td>
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.issueLandingValue}"/> </td>
													<c:set var="issueValueTotal" value="${categoryWiseReport.issueQtyValue+issueValueTotal}" ></c:set> 
													<c:set var="issueLandValueTotal" value="${categoryWiseReport.issueLandingValue+issueLandValueTotal}" ></c:set> 
													</c:when>
													</c:choose>
													
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.damageQty}"/> </td>
													<c:set var="dmgQtyTotal" value="${categoryWiseReport.damageQty+dmgQtyTotal}" ></c:set>
													<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.damageValue}"/> </td> 
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${categoryWiseReport.damageLandingValue}"/> </td> 
													<c:set var="dmgValueTotal" value="${categoryWiseReport.damageValue+dmgValueTotal}" ></c:set>
													<c:set var="dmgLandValueTotal" value="${categoryWiseReport.damageLandingValue+dmgLandValueTotal}" ></c:set>
													</c:when>
													</c:choose>
											 <c:set var="closingStock" value="${categoryWiseReport.openingStock+categoryWiseReport.approveQty-categoryWiseReport.issueQty-categoryWiseReport.damageQty}" ></c:set>
												<c:set var="closingStockValue" value="${categoryWiseReport.opStockValue+categoryWiseReport.approvedQtyValue
												-categoryWiseReport.issueQtyValue-categoryWiseReport.damageValue}" ></c:set>
												<c:set var="closingStockLandingValue" value="${categoryWiseReport.opLandingValue+categoryWiseReport.approvedLandingValue-categoryWiseReport.issueLandingValue-categoryWiseReport.damageLandingValue}" ></c:set>	
												
												<c:set var="colsQtyTotal" value="${closingStock+colsQtyTotal}" ></c:set>
												<c:set var="colsValueTotal" value="${closingStockValue+colsValueTotal}" ></c:set>
												<c:set var="colsLandValueTotal" value="${closingStockLandingValue+colsLandValueTotal}" ></c:set>
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStock}"/></td>
											<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockValue}"/></td>
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${closingStockLandingValue}"/></td>
											 </c:when>
											 </c:choose>
											 <td><a href="${pageContext.request.contextPath}/stockSummaryWithCatId/${categoryWiseReport.catId}/" class='action_btn'> <abbr title='detailes'> <i class='fa fa-list' ></i></abbr></a>
											</td>
											</tr>
											</c:when>
											</c:choose>
										</c:forEach> 
										
										  <tr>
											
												 
												<td  style="text-align: center;" colspan="2"> Total </td>
												<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${opQtyTotal}"/> </td>
												 
												 <c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
												<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${opValueTotal}"/> </td>
												<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${opLandValueTotal}" /> </td>
												 
													</c:when>
													</c:choose>
													
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${appvQtyTotal}"/>
											 
											 </td>
													<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${appvValueTotal}"/> </td> 
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${appvLandValueTotal}" /> </td>
													 
													</c:when>
													</c:choose>
													
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${issueQtyTotal}"/> 
											 </td> 
													<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${issueValueTotal}"/> </td>
											<td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${issueLandValueTotal}"/> </td> 
													</c:when>
													</c:choose>
													
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${dmgQtyTotal}"/> </td>
													 
													<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${dmgValueTotal}"/> </td> 
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${dmgLandValueTotal}"/> </td> 
													 
													</c:when>
													</c:choose>
											   
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${colsQtyTotal}"/></td>
											 
											<c:choose>
												<c:when test="${sessionScope.userInfo.deptId==1 or sessionScope.userInfo.deptId==2}">
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${colsValueTotal}"/></td>
											 <td class="col-md-1" style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${colsLandValueTotal}"/></td>
											 </c:when>
											 </c:choose>
											 <td>- </td>
											</tr>   
  
								</tbody>

								</table>
  
					</div> 
					
					<div id="chart" style="display: none"><br> <hr>
		<div id="chart_div" style="width:100%; height:500px" align="center"></div>
		
			<div   id="Piechart" style="width:50%; height:300; float: Left;" ></div>
			<div   id="PieAmtchart" style="width:50%; height:300; float: right;" ></div> 
			<div   id="PiechartIssue" style="width:50%; height:300; float: Left;" ></div>
			<div   id="PiechartDamage" style="width:50%; height:300; float: right;" ></div> 
				 <br> <br> <br> <br> <br> <br> <br>  <br> <br> <br> <br> <br> <br> <br> 
				</div>
					 
					 <br> <br> <br> <br> <br> <br> <br>  <br> <br> <br> <br> <br> <br> <br>
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	 
function showChart(){
		
		document.getElementById('chart').style.display = "block";
		   document.getElementById("tbl").style="display:none";
		 
				$.getJSON('${listForStockValuetioinGraph}',{
					
									 
									ajax : 'true',

								},
								function(data) {			
									//alert(data);
									 if (data == "") {
											alert("No records found !!");

									 }
									 var i=0;
									 //alert(data);
									 google.charts.load('current', {'packages':['corechart', 'bar']});
									 google.charts.setOnLoadCallback(drawStuff);
									 //alert(data);
									 function drawStuff() {
		 
									   var chartDiv = document.getElementById('chart_div');
									   document.getElementById("chart_div").style.border = "thin dotted red";
								       var dataTable = new google.visualization.DataTable();
								       
								       dataTable.addColumn('string', 'Department'); // Implicit domain column.
								     /*   dataTable.addColumn('number', 'Issue Qty');  */// Implicit data column.
								      // dataTable.addColumn({type:'string', role:'interval'});
								     //  dataTable.addColumn({type:'string', role:'interval'});
								       dataTable.addColumn('number', 'OP VALUE');
								       dataTable.addColumn('number', 'MRN Value');
								       dataTable.addColumn('number', 'ISSUE Value');
								       dataTable.addColumn('number', 'DAMAGE Value');
								       $.each(data,function(key, item) {

											//var tax=item.cgst + item.sgst;
											//var date= item.billDate+'\nTax : ' + item.tax_per + '%';
											 
										   dataTable.addRows([
											 
										             [item.catDesc, item.opStockValue,item.approvedQtyValue,item.issueQtyValue,item.damageValue, ]
										           
										           ]);
										  
										     }) 
								    
		 /* var materialOptions = {
		          width: 600,
		          height:450,
		          chart: {
		            title: 'STOCK VALUE',
		            subtitle: 'CATEGORY WISE'
		          },
		          series: {
		            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
		            1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
		          },
		          axes: {
		            y: {
		                distance: {label: 'Issue Quantity'}, // Left y-axis.
		              brightness: {side: 'right', label: 'VALUE'} // Right y-axis.
		            },
		            textStyle: {
	                     color: '#1a237e',
	                     fontSize: 5,
	                     bold: true,
	                     italic: true

	                  },
	                  titleTextStyle: {
	                     color: '#1a237e',
	                     fontSize: 5,
	                     bold: true,
	                     italic: true

	                  }

		          }
		          
		          
		        }; */
								       
								       var materialOptions = {
								    		    legend: {position:'top'},
								    		    hAxis: {
								    		        title: 'CATEGORY', 
								    		        titleTextStyle: {color: 'black'}, 
								    		        count: -1, 
								    		        viewWindowMode: 'pretty', 
								    		        slantedText: true
								    		    },  
								    		    vAxis: {
								    		        title: 'VALUE', 
								    		        titleTextStyle: {color: 'black'}, 
								    		        count: -1, 
								    		        format: '#'
								    		    },
								    		    /* colors: ['#F1CA3A'] */
								    		  };
								       var materialChart = new google.charts.Bar(chartDiv);
								       
								       function selectHandler() {
									          var selectedItem = materialChart.getSelection()[0];
									          if (selectedItem) {
									            var topping = dataTable.getValue(selectedItem.row, 0);
									           // alert('The user selected ' + selectedItem.row,0);
									            i=selectedItem.row,0;
									            itemSellBill(data[i].deptCode);
									           // google.charts.setOnLoadCallback(drawBarChart);
									          }
									        }
								       
								       function drawMaterialChart() {
								          // var materialChart = new google.charts.Bar(chartDiv);
								           google.visualization.events.addListener(materialChart, 'select', selectHandler);    
								           materialChart.draw(dataTable, google.charts.Bar.convertOptions(materialOptions));
								          // button.innerText = 'Change to Classic';
								          // button.onclick = drawClassicChart;
								         }
								        
								       function drawOpValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'CATEGORY');
											 dataTable.addColumn('number', 'OP VALUE');
									
											   $.each(data,function(key, item) {

												//	var amt=item.cash + item.card + item.other;

												   dataTable.addRows([

												             [item.catDesc, item.opStockValue,]

												           ]);
												   

												   }) 
										 var options = {'title':'CATEGORY OP VALUE',
							                       'width':550,
							                       'height':250};
											   document.getElementById("Piechart").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('Piechart'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawMrnValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'CATEGORY');
											 dataTable.addColumn('number', 'MRN VALUE');
									
											   $.each(data,function(key, item) {

												//	var amt=item.cash + item.card + item.other;

												   dataTable.addRows([

												             [item.catDesc, item.approvedQtyValue,]

												           ]);
												   

												   }) 
										 var options = {'title':'CATEGORY MRN VALUE',
							                       'width':550,
							                       'height':250};
											   document.getElementById("PieAmtchart").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PieAmtchart'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawIssueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'CATEGORY');
											 dataTable.addColumn('number', 'ISSUE VALUE');
									
											   $.each(data,function(key, item) {

												//	var amt=item.cash + item.card + item.other;

												   dataTable.addRows([

												             [item.catDesc, item.issueQtyValue,]

												           ]);
												   

												   }) 
										 var options = {'title':'CATEGORY ISSUE VALUE',
							                       'width':550,
							                       'height':250};
											   document.getElementById("PiechartIssue").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartIssue'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawDamageChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'CATEGORY');
											 dataTable.addColumn('number', 'DAMAGE VALUE');
									
											   $.each(data,function(key, item) {

												//	var amt=item.cash + item.card + item.other;

												   dataTable.addRows([

												             [item.catDesc, item.damageValue,]

												           ]);
												   

												   }) 
										 var options = {'title':'CATEGORY DAMAGE VALUE',
							                       'width':550,
							                       'height':250};
											   document.getElementById("PiechartDamage").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartDamage'));
									           
									        chart.draw(dataTable, options);
									      }
										 
								      /*  var chart = new google.visualization.ColumnChart(
								                document.getElementById('chart_div'));
								       chart.draw(dataTable,
								          {width: 800, height: 600, title: 'Tax Summary Chart'}); */
								       drawMaterialChart();
								          google.charts.setOnLoadCallback(drawDamageChart);
								          google.charts.setOnLoadCallback(drawIssueChart);
								          google.charts.setOnLoadCallback(drawOpValueChart);
								       google.charts.setOnLoadCallback(drawMrnValueChart);
									 };
									 
										
							  	});
			 
}
</script>
	<script type="text/javascript">
	function genPdf(){
		window.open('${pageContext.request.contextPath}/stockValuetionReportCategoryWisePDF/');
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