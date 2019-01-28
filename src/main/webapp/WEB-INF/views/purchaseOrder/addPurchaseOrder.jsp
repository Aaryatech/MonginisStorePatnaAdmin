<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
	<style>
.tooltip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}
</style>
	 <style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 20px; /* Location of the box */
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
	width: 100%;
	height: 100%;
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
	  
	  <c:url var="exportExcelforPo" value="/exportExcelforPo" />
	  <c:url var="getIntendListByPoType" value="/getIntendListByPoType" />
    <c:url var="getInvoiceNo" value="/getInvoiceNo" />
	<c:url var="geIntendDetailByIndId" value="/geIntendDetailByIndId"></c:url>
	<c:url var="updateRmQty0" value="/updateRmQty0"></c:url>
	<c:url var="getRmCategory" value="/getRmCategory" />
	<c:url var="getRmListByCatId" value="/getRmListByCatId" />
	<c:url var="getRmRateAndTax" value="/getRmRateAndTax" />
<c:url var="getVendorListByIndentId" value="/getVendorListByIndentId" />
	<c:url var="calculatePurchaseHeaderValues" value="/calculatePurchaseHeaderValues" />
	<c:url var="getPreviousRecordOfPoItem" value="/getPreviousRecordOfPoItem" />


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
					<i class="fa fa-file-o"></i>Purchase Order
				</h1>
				<h4>Bill for franchises</h4>
			</div>
		</div> --> 
		<!-- END Page Title -->
 
		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Purchase Order
				</h3>
				<div class="box-tool">
				<a href="${pageContext.request.contextPath}/addPurchaseOrder">
									ADD PO  </a>
								<a href="${pageContext.request.contextPath}/listOfPurachaseOrder">
									PO List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

			</div>

				<div class=" box-content">
					 
		<div>
			<form id="submitForm"
				action="${pageContext.request.contextPath}/submitPurchaseOrder"
				  method="post">
			<div class="box-content">
			<div class="col-md-2" >PO Type</div>
									<div class="col-md-3">
									<c:choose>
										<c:when test="${isFromDashBoard==1}">
										<input type="hidden" id="poType" name="poType" value="${poTypeTemp}">
											<select name="poTyped" id="poTyped"   class="form-control chosen" onchange="getInvoiceNo()"   disabled>
												 
														<c:forEach items="${typeList}" var="typeList">
															<c:choose>
															
																<c:when test="${poTypeTemp==typeList.typeId}">
																	<option value="${typeList.typeId}" selected>${typeList.typeName}</option>
																</c:when>
																 
															</c:choose>
														</c:forEach>
													 
											</select>
										</c:when>
										<c:when test="${isGeneralPurchase==1}">
										<input type="hidden" id="poType" name="poType" value="${poTypeTemp}">
											<select name="poTyped" id="poTyped"   class="form-control chosen" onchange="getInvoiceNo()"   disabled>
												 
														<c:forEach items="${typeList}" var="typeList">
															<c:choose>
															
																<c:when test="${poTypeTemp==typeList.typeId}">
																	<option value="${typeList.typeId}" selected>${typeList.typeName}</option>
																</c:when>
																 
															</c:choose>
														</c:forEach>
													 
											</select>
										</c:when>
										<c:otherwise>
											<select name="poType" id="poType"   class="form-control chosen" onchange="getInvoiceNo()"   required>
												  <c:set var="poSelected" value="0"></c:set>
												  <c:forEach items="${typeList}" var="typeList">
												  <c:choose>
													<c:when test="${poTypeTemp==typeList.typeId}"> 
														<option value="${typeList.typeId}" selected>${typeList.typeName}</option>
														<c:set var="poSelected" value="1"></c:set> 
													</c:when>
												</c:choose>  
												</c:forEach>
												<c:choose>
													<c:when test="${poSelected==0}">
													 <option value="" >Select PO Type</option>
														<c:forEach items="${typeList}" var="typeList">
													  	<option value="${typeList.typeId}"  >${typeList.typeName}</option>
														</c:forEach>
													</c:when>
												</c:choose>
												 
											</select>
										
										</c:otherwise>
									</c:choose>
										
									</div>
				
				 
				</div><br/>
				
				<div class="box-content">
				
				<div class="col-md-2">PO No.  </div>
				<div class="col-md-3"><input type="text" id="poNo" name="poNo" value="${code}" readonly class="form-control" >
				</div>
						<div class="col-md-2">PO Date</div> 
						<div class="col-md-3">
						<input type="text" id="poDate" name="poDate" value="${date}" class="form-control date-picker" onblur="getInvoiceNo()" required>
							
						</div>
									 
									</div><br/>
									 
									<c:set var="indentDate" value="-"></c:set>
									<div class="box-content">
								<div class="col-md-2" >Select Indend No.</div>
									<div class="col-md-3">
									<c:choose>
										<c:when test="${isFromDashBoard==1}">
										<input type="hidden" id="indId" name="indId" value="${indId}">
											<select name="indIdd" id="indIdd" class="form-control chosen"   disabled>
									 
											 <c:forEach items="${intedList}" var="intedList" >
												 <c:choose>
												 	<c:when test="${intedList.indMId==indId}">
												 		<option value="${intedList.indMId}" selected> ${intedList.indMNo} &nbsp;&nbsp; ${intedList.indMDate}</option>
												 		
												 	</c:when>
												 	<%-- <c:otherwise>
												 		<option value="${intedList.indMId}"> ${intedList.indMNo} &nbsp;&nbsp; ${intedList.indMDate}</option>
												 	</c:otherwise> --%>
												 </c:choose>  
											</c:forEach>
										</select>
										
										</c:when>
										<c:otherwise>
											<select name="indId" id="indId" onchange="getVendorListByIndId()" class="form-control chosen"   required>
									 
											 <c:forEach items="${intedList}" var="intedList" >
												 <c:choose>
												 	<c:when test="${intedList.indMId==indId}">
												 		<option value="${intedList.indMId}" selected> ${intedList.indMNo} &nbsp;&nbsp; ${intedList.indMDate}</option>
												 		<c:set var="indentDate" value="${intedList.indMDate}"></c:set>
												 	</c:when>
												 	<%-- <c:otherwise>
												 		<option value="${intedList.indMId}"> ${intedList.indMNo} &nbsp;&nbsp; ${intedList.indMDate}</option>
												 	</c:otherwise> --%>
												 </c:choose>  
											</c:forEach>
										</select>
										
										</c:otherwise>
									</c:choose>
										
									</div>	
									<div class="col-md-2"></div>
									<div class="col-md-2"><input type="button" class="btn btn-info" value="Get Item From Indend "  id="myBtn"></div>
									<input type="hidden"  value="${indentDate}"  id="indentDateText" name="indentDateText">
									 
					</div>
			 		<br/>
									
				<div class="box-content">
				<div class="col-md-2" >Vendor Name</div>
									<div class="col-md-10">
									 
										<select name="vendId" id="vendId"   class="form-control chosen"   required> 
										 <c:set var="vendSelected" value="0"></c:set>
												<c:forEach items="${vendorList}" var="vendorList" >
												  <c:choose>
													<c:when test="${vendorList.vendorId==vendIdTemp}"> 
														<option value="${vendorList.vendorId}" selected>${vendorList.vendorName}&nbsp;&nbsp; ${vendorList.vendorCode}</option>
														<c:set var="vendSelected" value="1"></c:set> 
													</c:when>
												</c:choose>  
												</c:forEach>
												
												<c:choose>
													<c:when test="${vendSelected==0}">
													 <option value="" >Select Supplier</option>
														<c:forEach items="${vendorList}" var="vendorList" >
													  	<option value="${vendorList.vendorId}"  >${vendorList.vendorName}&nbsp;&nbsp; ${vendorList.vendorCode}</option>
														</c:forEach>
													</c:when>
												</c:choose>
											  
										</select>
										
										<input type="hidden" id="vendSelectedtext" name="vendSelectedtext" value="${vendSelected}">
									</div>
									
				 
			</div><br/>
			
			<div class="box-content">
				<div class="col-md-2" >Remark</div>
									<div class="col-md-10">
										<input type="text"   placeholder="Remark" value="${remarkTemp}" name="poRemark" id="poRemark" class="form-control" required>
									
									</div>
									
				 
			</div><br/>
			
			<c:choose>
				<c:when test="${isGeneralPurchase==1}">
										<div class="box-content">
										<div class="col-md-2">Bill No</div>
											<div class="col-md-3">
												<input type="text" placeholder="Bill No"   name="quotation" id="quotation" class="form-control" required>
											</div>
									
									<div class="col-md-2" >Bill Date</div>
									<div class="col-md-3">
										 <input type="text"   placeholder="Bill Date" value="${quotationDateTemp}" name="quotationDate" id="quotationDate" class="form-control date-picker" required>
									</div>
									</div><br/>
					</c:when>
					<c:otherwise>
										<div class="box-content">
									<div class="col-md-2">Vendor Quotation</div>
										<div class="col-md-3">
											<input type="text" placeholder="Enter Quotation No"  value="${quotationTemp}" name="quotation" id="quotation" class="form-control" required>
										</div>
									
									<div class="col-md-2" >Quotation Ref. Date</div>
									<div class="col-md-3">
										 <input type="text"   placeholder="Select Quotation Date" value="${quotationDateTemp}" name="quotationDate" id="quotationDate" class="form-control date-picker" required>
									</div>
									</div><br/>
										
					</c:otherwise>
			
			</c:choose>
			
									
								
			<div class="box-content">
				<div class="col-md-2" >Payment Terms</div>
									<div class="col-md-3">
										<select name="payId" id="payId"    class="form-control chosen"   required>
										<option value="">Select Pay Terms</option>
											 <c:forEach items="${paymentTermsList}" var="paymentTermsList" >
											 <c:choose>
											 	<c:when test="${paymentTermsList.pymtTermId==payIdTemp}">
											 		<option value="${paymentTermsList.pymtTermId}" selected><c:out value="${paymentTermsList.pymtDesc}"/></option> 
											 	</c:when>
											 	<c:otherwise>
											 		<option value="${paymentTermsList.pymtTermId}"><c:out value="${paymentTermsList.pymtDesc}"/></option> 
											 	</c:otherwise>
											 </c:choose>
							   
												</c:forEach>
						 
										</select>
									</div>
									
									 <div class="col-md-2" >Select Delivery</div>
									<div class="col-md-3">
										<select name="deliveryId" id="deliveryId"    class="form-control chosen"   required>
										<option value="" >Select </option>
											 <c:forEach items="${deliveryTermsList}" var="deliveryTermsList" >
											 <c:choose>
											 	<c:when test="${deliveryTermsList.deliveryTermId==deliveryIdTemp}">
											 	 <option value="${deliveryTermsList.deliveryTermId}" selected><c:out value="${deliveryTermsList.deliveryDesc}"/></option>
											 	</c:when>
											 	<c:otherwise>
											 	 <option value="${deliveryTermsList.deliveryTermId}"><c:out value="${deliveryTermsList.deliveryDesc}"/></option>
											 	</c:otherwise>
											 </c:choose>
							  
 											 </c:forEach>
						 
										</select>
									</div> 
				</div><br/>
								<div class="box-content">
								
									<div class="col-md-2" >Select Dispatch Mode</div>
									<div class="col-md-3">
									
										<select name="dispatchMode"  id="dispatchMode"   class="form-control chosen"   required>
										<option value="" >Select </option>
									 <c:forEach items="${dispatchModeList}" var="dispatchModeList" >
									 <c:choose>
									 	<c:when test="${dispatchModeList.dispModeId==dispatchModeTemp}">
									 		 <option value="${dispatchModeList.dispModeId}" selected><c:out value="${dispatchModeList.dispModeDesc}"/></option>
									 	</c:when>
									 	<c:otherwise>
									 	 	<option value="${dispatchModeList.dispModeId}"><c:out value="${dispatchModeList.dispModeDesc}"/></option>
									 	</c:otherwise>
									 </c:choose>
							  
 													 
												</c:forEach>
										 </select>
									</div>
									
									<div class="col-md-2">Order Validity</div>
										<div class="col-md-3">
											<input type="number" placeholder="Order Validity"  value="${orderValidityTemp}" name="orderValidity" id="orderValidity" class="form-control" required>
										</div>
								</div><br/>
								  	
									<hr/>
									
									  
			 
			 
				<div class=" box-content">
					<div class="row">
								<div style="overflow:scroll;height:35%;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%; font-size: 14px;" id="table_grid2"  >
										<thead>
											<tr>
										<th width="2%">SR</th>
										<th>Item Name </th>
										<th width="5%">Uom</th>
										<th width="6%">Ind Qty</th> 
										<th width="6%">PO Qty</th>
										<th width="6%">Bal QTY</th>
										<th width="6%">Rate</th>
										<!-- <th>Disc%</th> -->
										<th width="7%">Value</th>
										<th width="7%">CGST</th>
										<th width="7%">SGST</th>
										<th width="7%">IGST</th>
										<th class="col-md-1">Sch Date</th>
										 

									</tr>
										</thead>
										<tbody>
										
										<c:forEach items="${poDetailList}" var="poDetailList"
													varStatus="count">
													 
													<tr>
													  
														<td><c:out value="${count.index+1}" /></td>
  
																<td align="left"><c:out value="${poDetailList.itemCode}" /></td>
																<td align="left"><c:out value="${poDetailList.itemUom}" /></td>
																<td align="right"><c:out value="${poDetailList.indedQty}" /></td>
																<td align="right"><c:out value="${poDetailList.itemQty}" /></td>
													  			<td align="right"><c:out value="${poDetailList.balanceQty}" /></td>
													  			<td align="right"><c:out value="${poDetailList.itemRate}" /></td>
													  			<%-- <td align="right"><c:out value="${poDetailList.discPer}" /></td> --%>
													  			<td align="right"><c:out value="${poDetailList.basicValue}" /></td>
													  			<c:choose>
													  				<c:when test="${poDetailList.igst==0}">
													  					<td align="right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${poDetailList.taxValue/2}"/> (${poDetailList.cgst}%)
															  			<td align="right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${poDetailList.taxValue/2}"/> (${poDetailList.sgst}%)
															  			<td align="right"><fmt:formatNumber type="number" maxFractionDigits="2" value="0"/> (${poDetailList.igst}%)
													  				</c:when>
													  				<c:otherwise>
													  					<td align="right"><fmt:formatNumber type="number" maxFractionDigits="2" value="0"/> (${poDetailList.cgst}%)
															  			<td align="right"><fmt:formatNumber type="number" maxFractionDigits="2" value="0"/> (${poDetailList.sgst}%)
															  			<td align="right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${poDetailList.taxValue}"/> (${poDetailList.igst}%)
													  				
													  				</c:otherwise>
													  			</c:choose>
													  			
													  			<td align="left" ><c:out value="${poDetailList.schDate}" /></td>
													  			
																</tr>
												</c:forEach>
 
										</tbody>
									</table>
								</div>
							</div>
 
		</div>
		 			 <br/>
		 			 <hr/>
		 			 <div class="box-content">
								 
									<div class="col-md-2">Basic value</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px"  type="text" value="${poHeader.poBasicValue}" pattern="[+-]?([0-9]*[.])?[0-9]+" 
											name="poBasicValue" id="poBasicValue" class="form-control" readonly>
										</div>
									<div class="col-md-2"><!-- Disc Value --></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="hidden" value="${poHeader.discValue}"   name="discValue" id="discValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>
										</div>
									  
							
							</div><br>
		 			 <div class="box-content"> 
		 			 
									<div class="col-md-2">Packing Charges %</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text" value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" name="packPer" id="packPer" class="form-control" required>
										</div>
									<div class="col-md-2">Packing Charges Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text"  name="packValue" id="packValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="packRemark" id="packRemark" class="form-control" value="NA"  >
										</div>
							
							
							</div><br>
							<div class="box-content">
									<div class="col-md-2">Insurance Charges %</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text" value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" name="insuPer" id="insuPer" class="form-control" required>
										</div>
									<div class="col-md-2">Insurance Charges Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" name="insuValue" id="insuValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="insuRemark" id="insuRemark" class="form-control" value="NA"  >
										</div>
							
							</div><br>
						
						<div class="box-content"> 
							 
						 	<div class="col-md-2">Freight Charges %</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text" value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" name="freightPer" id="freightPer" class="form-control" required>
										</div>
									<div class="col-md-2">Freight Charges Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" name="freightValue" id="freightValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="freghtRemark" id="freghtRemark" class="form-control" value="NA"  >
										</div>
							 </div><br>
						   
							<div class="box-content">
								 
									<div class="col-md-2"> </div>
										<div class="col-md-2">
										<%-- <select name="taxPer" id="taxPer"  onchange="calculation()"  class="form-control chosen"  required>
										 
											 <c:forEach items="${taxFormList}" var="taxFormList" >
											 
											 	 <option value="${taxFormList.taxId}"><c:out value="${taxFormList.taxPer}"/></option>
											 	  
 											 </c:forEach>
						 
										</select> --%>
											 </div>
									<div class="col-md-2">Tax Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" name="taxValue" id="taxValue" class="form-control"
										value="${poHeader.poTaxValue}" pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>
										</div>
									<div class="col-md-2"> </div>
										<div class="col-md-2">
											<input   type="hidden" name="taxRemark" id="taxRemark" class="form-control" value="NA"  >
										</div>
							
							</div><br>
							
							<div class="box-content">
								 
									<div class="col-md-2">Other Charges %</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" name="otherPer" id="otherPer" class="form-control" required>
										</div>
									<div class="col-md-2">Other Charges Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" name="otherValue" id="otherValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="otherRemark" id="otherRemark" class="form-control" value="NA"  >
										</div>
							
							</div><br>
							    
							 <div class="box-content">
								 
									<div class="col-md-2"></div>
										<div class="col-md-2">
											 </div>
									 
									 <div class="col-md-2">Final Value</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" value="<fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${poHeader.poBasicValue-poHeader.discValue+poHeader.poTaxValue}"/>"   name="finalValue" id="finalValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>
										</div>
							
							</div><br>
							   
							 <br>
			
			<div class="row">
						<div class="col-md-12" style="text-align: center">
						 
						 <c:choose>
							<c:when test="${poDetailList.size()>0}"> 
								<input type="submit" class="btn btn-info" value="Submit" onclick="check()"  >
							</c:when>
							<c:otherwise>
								<input type="submit" class="btn btn-info" value="Submit" onclick="check()" disabled>
							</c:otherwise>
						</c:choose>  
							 
						</div>
					</div>
				
			</form>
			
			 <form id="submitList"
				action="${pageContext.request.contextPath}/submitList"
				method="post">
			<div id="myModal" class="modal">
					<input   type="hidden" value="0" name="indMId" id="indMId"    >
					<input   type="hidden" value="0" name="vendIdTemp" id="vendIdTemp"    >
					<input   type="hidden" value="-" name="quotationTemp" id="quotationTemp"    >
					<input   type="hidden" value="0" name="poTypeTemp" id="poTypeTemp"    >
					<input   type="hidden" value="0" name="quotationDateTemp" id="quotationDateTemp"    >
					<input   type="hidden" value="0" name="payIdTemp" id="payIdTemp"    >
					<input   type="hidden" value="0" name="deliveryIdTemp" id="deliveryIdTemp"    >
					<input   type="hidden" value="0" name="dispatchModeTemp" id="dispatchModeTemp"    >
					<input   type="hidden" value="0" name="poDateTemp" id="poDateTemp"    >
					<input   type="hidden" value="${code}" name="poNoTemp" id="poNoTemp"    >
					<input   type="hidden" value="1" name="orderValidityTemp" id="orderValidityTemp"    >
					<input   type="hidden" value="${isFromDashBoard}" name="isFromDashBoard" id="isFromDashBoard"    >
					<input   type="hidden" value="${isGeneralPurchase}" name="isGeneralPurchase" id="isGeneralPurchase"    >
						<input   type="hidden"   name="remarkTemp" id="remarkTemp"    >
										      
					<div class="modal-content" style="color: black;">
						<span class="close" id="close">&times;</span>
						<h3 style="text-align: center;">Select Item From Indend</h3>
							<div class=" box-content">
							<div class="row">
								<div style="overflow:scroll;height:70%;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%;font-size: 14px;" id="table_grid1">
										<thead>
											<tr>
										<th align="left" width="1%"><input type="checkbox" id="allCheck" onClick="selectAll(this)" onchange="requiredAll()"/>All</th>
										<th width="2%">SR</th>
										<th class="col-md-5">Item Name </th>
										<th class="col-md-1">Uom</th>
										<th class="col-md-1">Ind Qty</th> 
										<th class="col-md-1">PO Qty</th>
										<th class="col-md-1">Bal Qty</th>
										<th class="col-md-1">Rate</th>
										<!-- <th>Disc%</th> -->
										<!-- <th>Sch Days</th> -->
										<th class="col-md-1">Sch Date</th>
										<th class="col-md-1">Remark</th>

									</tr>
										</thead>
										<tbody>
 
										</tbody>
									</table>
								</div>
							</div> 
							 
						</div><br>
						<div class="row">
						<div class="col-md-12" style="text-align: center">
						
							<input type="submit" class="btn btn-info" value="Submit" onclick="checkIndId()">
					<c:choose>
						<c:when test="${userInfo.id==1}">
						<input type="button" class="btn btn-info" value="Import Excel " onclick="exportExcel()">
						</c:when>
					</c:choose>
					
						</div>
					</div>
 
					</div>

				</div>
				 
				</form>
				
				<div id="poPreviousRecord" class="modal">
					 
					<div class="modal-content" style="color: black;">
						<span class="close" id="close2">&times;</span>
						<h5 style="text-align: center;" id="itmeNameHeadeing">Previous Record</h5>
							 
							 <div class=" box-content">
							<div class="row">
							<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label>
								<div style="overflow:scroll;height:70%;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%;font-size: 14px;" id="table_grid3">
										<thead>
											<tr>
										 <th>SR</th>
										<th>PO NO</th>
										<th>PO Date</th>
										<th class="col-md-5">Vendor name</th> 
										<th>Item Rate</th>
										<th>Item Qty</th> 
									</tr>
										</thead>
										<tbody>
 
										</tbody>
									</table>
								</div>
							</div> 
							 
						</div><br>
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
		
		$(function() {
			$('#submitForm').submit(
					function() {
						 
						var poDate = $("#poDate").val().split('-'); 
						var indentDateText = $("#indentDateText").val().split('-'); 
						 
						 var firstDate=new Date();
						 firstDate.setFullYear(poDate[2],(poDate[1] - 1 ),poDate[0]);

						 var secondDate=new Date();
						 secondDate.setFullYear(indentDateText[2],(indentDateText[1] - 1 ),indentDateText[0]); 
						 
						if(firstDate>=secondDate){
							 
							var x=confirm("Do you really want to submit the Purchase Order ?");
							if(x==true)
							{
								$("input[type='submit']", this).val("Please Wait...")
								.attr('disabled', 'disabled'); 
								return true;
							}else{
								
								return false;
							}
						}else{
							 
							alert("You Select Befor Date Than Indent Date...");
							return false;
						}
						 
					});
		});
		
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
	 	   
	var vendId = $("#vendId").val();
	var poType = $("#poType").val(); 
	var payId = $("#payId").val();
	var deliveryId = $("#deliveryId").val();
	var dispatchMode = $("#dispatchMode").val();
	
	if(vendId==null || vendId == "")
	{
	alert("Select Vendor");
	}
	else if(poType==null || poType == "")
	{
	alert("Select PO Type ");
	}
	else if(payId==null || payId == "")
	{
		alert("Select Payment Term");
	}
	else if(deliveryId==null || deliveryId == "")
	{
	alert("Select Delivery");
	}
	else if(dispatchMode==null || dispatchMode == "")
	{
	alert("Select Dispatch Mode");
	}
}

</script>

<script>
// Get the modal
var modal = document.getElementById('myModal');
var poPreviousRecord = document.getElementById('poPreviousRecord');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
 var span = document.getElementById("close");
 var span2 = document.getElementById("close2");
// When the user clicks the button, open the modal 
btn.onclick = function() {
	 
	var indId = $("#indId").val();
	var poType = $("#poType").val();
	var vendId = $("#vendId").val();
	if(poType=="" || poType==null) {
	 alert("select Po Type ");
	 
	}
	else if(indId=="" || indId==null) {
		 alert("select Intend ");
		 
		}
	else if(vendId=="" || vendId==null) {
		 alert("select Supplier ");
		 
		}
	else{
		modal.style.display = "block";
	    itemByIntendId(); 
	    getValue();
	}
    
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none"; 
}

span2.onclick = function() {
	poPreviousRecord.style.display = "none"; 
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        
    } 
    else if (event.target == poPreviousRecord) {
    	poPreviousRecord.style.display = "none";
        
    }
}

function previeousRecord(itemId,value)
{
	
	 
	 document.getElementById("itmeNameHeadeing").innerHTML = value;
	  
	  $
		.getJSON(
				'${getPreviousRecordOfPoItem}',

				{
					 
					itemId : itemId,
					ajax : 'true'

				},
				function(data) {
					
					$('#table_grid3 td').remove(); 

					if (data == "") {
						alert("No records found !!");

					}
					 

				  $.each(
								data,
								function(key, itemList) {
								
									var tr = $('<tr></tr>'); 
									 
								  	tr.append($('<td></td>').html(key+1)); 
								  	tr.append($('<td></td>').html(itemList.poNo)); 
								  	tr.append($('<td></td>').html(itemList.poDate)); 
								  	tr.append($('<td></td>').html(itemList.vendorName)); 
								  	tr.append($('<td></td>').html(itemList.itemRate)); 
								  	tr.append($('<td></td>').html(itemList.itemQty)); 
								  	 $('#table_grid3 tbody').append(tr);
								  	
								})
								
								poPreviousRecord.style.display = "block";
					
				});
}

function exportExcel()
{
	  
	  $
		.getJSON(
				'${exportExcelforPo}',

				{
					 
					 
					ajax : 'true'

				},
				function(data) {
					 //alert("adf");
					  if (data == "") {
						alert("No records found !!");

					}
					 

				  $.each(
								data,
								function(key, itemList) {
								//alert(itemList.indDetailId);
									
									
									try {
										 
										 var balanceQty = parseFloat($("#balanceQty"+itemList.indDetailId).val());
										 if(balanceQty!=0 && itemList.qty<=balanceQty){
										document.getElementById("select_to_approve"+itemList.indDetailId).checked = true;
										 document.getElementById("poQty"+itemList.indDetailId).value = itemList.qty;
										document.getElementById("balanceQty"+itemList.indDetailId).value = balanceQty-itemList.qty;
										document.getElementById("rate"+itemList.indDetailId).value = itemList.rate;
										document.getElementById("indRemark"+itemList.indDetailId).value = "-";
										 }
									}
									catch(err) {
									    
									}
								  	
								})  
								
							 
					
				});
}

function itemByIntendId()
{
	
	var indId = $("#indId").val();
	var poType = $("#poType").val();
	var vendId = $("#vendId").val();
	var flag = 1;
	
	if(poType=="" || poType==null) {
	 alert("select Po Type ");
	 flag=0;
	}
	else if(vendId=="" || vendId==null) {
		 alert("select Supplier ");
		 flag=0;
		}
	else if(indId=="" || indId==null) {
		 alert("select Intend ");
		 flag=0;
		}
	
	if(flag==1){
	
	$('#loader').show();
	$
	.getJSON(
			'${geIntendDetailByIndId}',

			{
				 
				indId : indId,
				vendId : vendId,
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
								if(itemList.poQty>0)
						  		{
									tr.append($('<td></td>').html('<input type="checkbox" name="select_to_approve"'+
											'id="select_to_approve'+itemList.indDId+'" onchange="requiredField('+itemList.indDId+')" value="'+itemList.indDId+'" checked>'));
						  		}
								else
									{
									tr.append($('<td></td>').html('<input type="checkbox" name="select_to_approve"'+
											'id="select_to_approve'+itemList.indDId+'" onchange="requiredField('+itemList.indDId+')" value="'+itemList.indDId+'" >'));
									}
								 
							  	  tr.append($('<td></td>').html(key+1)); 
							  	var res = itemList.itemCode.split("-");
							  	//tr.append($('<td></td>').html(res[0]));  
							   
							  	tr.append($('<td></td>').html('<a onclick="previeousRecord('+itemList.itemId+',\'' + itemList.itemCode + '\')"><div title="'+itemList.itemCode+'">'+itemList.itemCode+'</div></a>'));
							  	
							  	
							  	tr.append($('<td></td>').html(itemList.indItemUom));
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.indQty));
							  	 
							  	if(itemList.poQty>0)
							  		{
							  		tr.append($('<td ></td>').html('<input type="hidden"   id="indQty'+itemList.indDId+'" name="indQty'+itemList.indDId+'" value="'+itemList.indFyr+'" >'+
								  			'<input style="text-align:right; width:120px" type="text" onkeyup="calculateBalaceQty('+itemList.indDId+')" id="poQty'+itemList.indDId+'" name="poQty'+itemList.indDId+'" value="'+itemList.poQty+'" onchange="checkQty('+itemList.indDId+')"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  required>'));
							  		tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="text" id="balanceQty'+itemList.indDId+'" name="balanceQty'+itemList.indDId+'" value="'+(itemList.indFyr-itemList.poQty)+'" onchange="checkQty('+itemList.indDId+')" class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>'));
								  	tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="text" id="rate'+itemList.indDId+'" name="rate'+itemList.indDId+'" value="'+itemList.rate+'" onchange="checkQty('+itemList.indDId+')"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  required>'));
								  	/* tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" id="disc'+itemList.indDId+'" name="disc'+itemList.indDId+'" value="'+itemList.disc+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  required>')); */
							  		}
							  	else
							  		{
							  	 
							  		tr.append($('<td ></td>').html('<input type="hidden"   id="indQty'+itemList.indDId+'" name="indQty'+itemList.indDId+'" value="'+itemList.indFyr+'" >'+
								  			'<input style="text-align:right; width:120px" type="text" onkeyup="calculateBalaceQty('+itemList.indDId+')" id="poQty'+itemList.indDId+'" name="poQty'+itemList.indDId+'" onchange="checkQty('+itemList.indDId+')"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >'));
							  		tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="text" id="balanceQty'+itemList.indDId+'" name="balanceQty'+itemList.indDId+'" value="'+itemList.indFyr+'" onchange="checkQty('+itemList.indDId+')" class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>'));
								  	tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="text" id="rate'+itemList.indDId+'" name="rate'+itemList.indDId+'" value="'+itemList.rate+'" onchange="checkQty('+itemList.indDId+')"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"   >'));
								  	/* tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" id="disc'+itemList.indDId+'" name="disc'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"   >')); */
							  		}
							  	
							  	var schDate = itemList.indItemSchddt.split("-");
							  	
							  	var f =  schDate[2]+'-'+(schDate[1])+'-'+schDate[0];
							  	
							  	tr.append($('<td></td>').html(f));
							  	//tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="hidden" id="indItemSchd'+itemList.indDId+'" name="indItemSchd'+itemList.indDId+'" value="'+itemList.indItemSchd+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'));
							  	if(itemList.indRemark==null || itemList.indRemark==""){
							  		 
							  		tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="hidden" id="disc'+itemList.indDId+'" name="disc'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"   ><input style="text-align:right; width:100px" type="hidden" id="indItemSchd'+itemList.indDId+'" name="indItemSchd'+itemList.indDId+'" value="'+itemList.indItemSchd+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'+
								  			'<input style="text-align:left; width:120px" type="text" id="indRemark'+itemList.indDId+'" name="indRemark'+itemList.indDId+'" value="-"  class="form-control"  >'));
							  	}
							  	else{
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="hidden" id="disc'+itemList.indDId+'" name="disc'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"   ><input style="text-align:right; width:100px" type="hidden" id="indItemSchd'+itemList.indDId+'" name="indItemSchd'+itemList.indDId+'" value="'+itemList.indItemSchd+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'+
							  			'<input style="text-align:left; width:120px" type="text" id="indRemark'+itemList.indDId+'" name="indRemark'+itemList.indDId+'" value="'+itemList.indRemark+'"  class="form-control"  >'));
							  	}
							  	document.getElementById("indMId").value=itemList.indMId;
							  	 $('#table_grid1 tbody').append(tr);
							  	
							})
				
			});
	
	}
}

function checkQty(key)
{
	var poQty = parseFloat($("#poQty"+key).val());  
	 var rate = parseFloat($("#rate"+key).val()); 
	if(poQty==0)
	{
		document.getElementById("poQty"+key).value=""; 
		alert("Enter Greater Than 0 ");
		document.getElementById("select_to_approve"+key).checked=false; 
		  requiredField(key);
	} 
	else if(rate==0)
	{
		document.getElementById("rate"+key).value="";
		alert("Enter Greater Than 0 ");
	} 
	
	 
} 

function requiredAll()
{
	var checkboxes = document.getElementsByName('select_to_approve'); 
	
	
	if(document.getElementById("allCheck").checked == true)
	{
		 for (var i=0; i<checkboxes.length; i++) {
			 document.getElementById("select_to_approve"+checkboxes[i].value).checked == true;
		       
		    	  document.getElementById("poQty"+checkboxes[i].value).required=true; 
		  		document.getElementById("rate"+checkboxes[i].value).required=true;
		  		document.getElementById("disc"+checkboxes[i].value).required=true;
		  		document.getElementById("indRemark"+checkboxes[i].value).required=true;
		  }
	}
	else
	{
		for (var i=0; i<checkboxes.length; i++) {
			 document.getElementById("select_to_approve"+checkboxes[i].value).checked == false;
		       
		    	  document.getElementById("poQty"+checkboxes[i].value).required=false; 
		  		document.getElementById("rate"+checkboxes[i].value).required=false;
		  		document.getElementById("disc"+checkboxes[i].value).required=false;
		  		document.getElementById("indRemark"+checkboxes[i].value).required=false;
		      
		  }
	}
	   
	 
} 

function requiredField(key)
{
	
	if(document.getElementById("select_to_approve"+key).checked == true)
	{
		document.getElementById("poQty"+key).required=true; 
		document.getElementById("rate"+key).required=true;
		document.getElementById("disc"+key).required=true;
		document.getElementById("indRemark"+key).required=true;
	} 
	else
	{
		document.getElementById("poQty"+key).required=false; 
		document.getElementById("rate"+key).required=false;
		document.getElementById("disc"+key).required=false;
		document.getElementById("indRemark"+key).required=false;
	}
	
	 
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
	document.getElementById("remarkTemp").value=document.getElementById("poRemark").value;
	document.getElementById("orderValidityTemp").value=document.getElementById("orderValidity").value;
	
	
} 
  function calculateBalaceQty(key)
  {
  	
  	  
  	var indQty = parseFloat($("#indQty"+key).val());  
	 var poQty = parseFloat($("#poQty"+key).val());  
	  
	    if(poQty>indQty)
		  {
		 	 document.getElementById("poQty"+key).value = 0;
		 	document.getElementById("balanceQty"+key).value = indQty;
		 	alert("Your Enter PO QTY Greater Than Balance QTY");
		 	document.getElementById("select_to_approve"+key).checked=false; 
			  requiredField(key);
		  }
	  else
		  {  
		  document.getElementById("balanceQty"+key).value = indQty-poQty;
		  document.getElementById("select_to_approve"+key).checked=true; 
		  requiredField(key);
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
  	/* var taxPer = $("#taxPer option:selected").text();
  	var taxId = $("#taxPer").val(); */
  	
  	if(packPer=="" || packPer==null) {
  		document.getElementById("packPer").value =0;
  		packPer=0;
  		}
	if(packValue=="" || packValue==null) {
  		document.getElementById("packValue").value =0;
  		packValue=0;
  		}
	if(insuPer=="" || insuPer==null) {
  		document.getElementById("insuPer").value =0;
  		insuPer=0;
  		}
	if(insuValue=="" || insuValue==null) {
  		document.getElementById("packPer").value =0;
  		insuValue=0;
  		}
	if(freightPer=="" || freightPer==null) {
  		document.getElementById("freightPer").value =0;
  		freightPer=0;
  		}
	if(freightValue=="" || freightValue==null) {
  		document.getElementById("freightValue").value =0;
  		freightValue=0;
  		}
	if(otherPer=="" || otherPer==null) {
  		document.getElementById("otherPer").value =0;
  		otherPer=0;
  		}
	if(otherValue=="" || otherValue==null) {
  		document.getElementById("otherValue").value =0;
  		otherValue=0;
  		}
  	 
  	
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
  				
  				$('#table_grid2 td').remove();
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
  				document.getElementById("taxValue").value = data.poTaxValue;
  				document.getElementById("finalValue").value = (data.poBasicValue-data.discValue+data.poPackVal+data.poInsuVal
  				+data.poFrtVal+data.poTaxValue+data.otherChargeAfter).toFixed(2);
  				
  				
  				$.each(
						data.poDetailList,
						function(key, itemList) {
							var tr = $('<tr></tr>'); 
						  	  tr.append($('<td></td>').html(key+1)); 
						  	tr.append($('<td></td>').html(itemList.itemCode));
						  	tr.append($('<td></td>').html(itemList.itemUom));
						  	tr.append($('<td align="right"></td>').html((itemList.indedQty).toFixed(2)));
						  	tr.append($('<td align="right"></td>').html((itemList.itemQty).toFixed(2)));
						  	tr.append($('<td align="right"></td>').html((itemList.balanceQty).toFixed(2)));
						  	tr.append($('<td align="right"></td>').html((itemList.itemRate).toFixed(2)));
						  	tr.append($('<td align="right"></td>').html((itemList.basicValue).toFixed(2)));
						  	if(itemList.igst==0){
						  		tr.append($('<td align="right"></td>').html((itemList.taxValue/2).toFixed(2)+' ('+ itemList.cgst+')%'));
							  	tr.append($('<td align="right"></td>').html((itemList.taxValue/2).toFixed(2)+' ('+ itemList.sgst+')%'));
							  	tr.append($('<td align="right"></td>').html((0).toFixed(2)+' ('+ itemList.igst+')%'));
						  	}else{
						  		tr.append($('<td align="right"></td>').html((0).toFixed(2)+' ('+ itemList.cgst+')%'));
							  	tr.append($('<td align="right"></td>').html((0).toFixed(2)+' ('+ itemList.sgst+')%'));
							  	tr.append($('<td align="right"></td>').html((itemList.taxValue).toFixed(2)+' ('+ itemList.igst+')%'));
						  	}
						   
						  	tr.append($('<td></td>').html(itemList.schDate));
						  
						  	 $('#table_grid2 tbody').append(tr);
						  	
						})
						 
  				
  			});
  	
  	
  }
</script>
<script type="text/javascript">

function getInvoiceNo() {
	
	var date = $("#poDate").val(); 
	var poType = $("#poType").val();  
	var vendSelectedtext = $("#vendSelectedtext").val();
	
	$.getJSON('${getInvoiceNo}', {

		catId:1,
		docId:2,
		date : date,
		typeId : poType,
		ajax : 'true',

	}, function(data) { 
		if(vendSelectedtext==0){
			getIntendListByPoType();
		}
		
	document.getElementById("poNo").value=data.code;
	document.getElementById("poNoTemp").value=data.code;
	
	
	});

}

function getIntendListByPoType() {
	 
	var poType = $("#poType").val(); 

	$.getJSON('${getIntendListByPoType}', {
 
		poType : poType,
		ajax : 'true',

	}, function(data) { 
		
		var html = '<option value="">Select Indend</option>';

		var len = data.length;
		for (var i = 0; i < len; i++) {
			html += '<option value="' + data[i].indMId + '">'
					+ data[i].indMNo +'&nbsp;&nbsp;&nbsp;'+data[i].indMDate+'</option>';
		}
		html += '</option>';
		$('#indId').html(html);
		$("#indId").trigger("chosen:updated");
	
	});

}

function getVendorListByIndId() {
	 
	var indId = $("#indId").val(); 

	$.getJSON('${getVendorListByIndentId}', {
 
		indId : indId,
		ajax : 'true',

	}, function(data) { 
		
		var html = '<option value="">Select Vendor</option>';

		var len = data.length;
		for (var i = 0; i < len; i++) {
			html += '<option value="' + data[i].vendorId + '">'
					+ data[i].vendorCode +' &nbsp; '+data[i].vendorName+'</option>';
		}
		html += '</option>';
		$('#vendId').html(html);
		$("#vendId").trigger("chosen:updated");
	
	});

}

</script>

<script>
function myFunction() {
  var input, filter, table, tr, td ,td1,td2, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table_grid3");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    td1 = tr[i].getElementsByTagName("td")[1];
    if (td ) {
    	
    	 if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      }
    	 else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
 	        tr[i].style.display = "";
	      }else {
    	        tr[i].style.display = "none";
    	      }
       
    }  
    
     
  }
}
 
</script>
		
</body>
</html>