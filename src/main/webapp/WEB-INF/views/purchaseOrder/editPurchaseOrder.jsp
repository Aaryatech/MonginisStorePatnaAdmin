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
	  

	<c:url var="geIntendDetailByIndIdInEditPo" value="/geIntendDetailByIndIdInEditPo"></c:url>
		<c:url var="changeItemRate" value="/changeItemRate"></c:url>
		<c:url var="getRmCategory" value="/getRmCategory" />
			<c:url var="getRmListByCatId" value="/getRmListByCatId" />
						<c:url var="getRmRateAndTax" value="/getRmRateAndTax" />

	<c:url var="calculatePurchaseHeaderValuesInEdit" value="/calculatePurchaseHeaderValuesInEdit" />

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
					<i class="fa fa-file-o"></i> Edit Purchase Order
				</h1>
				<h4>Bill for franchises</h4>
			</div>
		</div> -->
		 
		<!-- BEGIN Main Content -->
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i> Edit Purchase Order
				</h3>
				
				<div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfPurachaseOrder">
									PO List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

			</div>

				<div class=" box-content">
					 
		<div >
			<form id="submitPurchaseOrder"
				action="${pageContext.request.contextPath}/submitEditPurchaseOrder"
				onsubmit="return confirm('Do you really want to Apply Changes In purchase Order ?');" method="post">
				<div class="box-content">
			<div class="col-md-2" >PO Type</div>
									<div class="col-md-3">
									<input type="hidden" id="poType" name="poType" value="${getPoHeader.poType}">
										<select name="poTypes" id="poTypes"   class="form-control chosen"  disabled>
										<c:forEach items="${typeList}" var="typeList">
															<c:choose> 
																<c:when test="${getPoHeader.poType==typeList.typeId}">
																	<option value="${typeList.typeId}" selected>${typeList.typeName}</option>
																</c:when> 
															</c:choose>
														</c:forEach>
										
										</select>
									</div>
									
									 
									</div><br/>
									
			<div class="box-content">
				<div class="col-md-2">PO No.  </div>
				<div class="col-md-3"><input type="text" id="poNo" name="poNo" value="${getPoHeader.poNo}" class="form-control" readonly>
				</div>
				<div class="col-md-2">PO Date</div> 
				<div class="col-md-3">
				<input type="text" id="poDate" name="poDate" value="${getPoHeader.poDate}" class="form-control date-picker" required>
					
				</div>
				</div><br/>
				<div class="box-content">
				<div class="col-md-2" >Vendor Name</div>
									<div class="col-md-10">
										<select name="vendId" id="vendId"   class="form-control chosen"  required>
										 
											 <c:forEach items="${vendorList}" var="vendorList" >
											<c:choose>
									 			<c:when test="${vendorList.vendorId==getPoHeader.vendId}">
							  						<option value="${vendorList.vendorId}" selected> ${vendorList.vendorCode} &nbsp; ${vendorList.vendorName} </option>
 												</c:when>
 												<%-- <c:otherwise>
 													<option value="${vendorList.vendorId}"  >${vendorList.vendorName}&nbsp;&nbsp; ${vendorList.vendorCode}</option>
 												</c:otherwise> --%>
 												</c:choose>	 
												</c:forEach>
						

										</select>
									</div>
									 
			</div><br/>
			
			<div class="box-content">
				<div class="col-md-2" >Remark</div>
									<div class="col-md-10">
										<input type="text"   placeholder="Remark" value="${getPoHeader.poRemark}" name="poRemark" id="poRemark" class="form-control" required>
									
									</div>
									
				 
			</div><br/>
			
								<c:choose> 
										<c:when test="${autoMrn==1}"> 
											<div class="box-content"> 
												<div class="col-md-2">Bill No</div>
													<div class="col-md-3">
														<input type="text" placeholder="Bill No"  value="${getPoHeader.vendQuation}" name="quotation" id="quotation" class="form-control"  required>
													</div>
				
												<div class="col-md-2" >Bill Date</div>
												<div class="col-md-3">
													 <input type="text"   placeholder="Bill Date" value="${getPoHeader.vendQuationDate}" name="quotationDate" id="quotationDate" class="form-control date-picker" required>
												</div>
				 
											</div><br/> 		 
										</c:when> 
										<c:otherwise>
											<div class="box-content"> 
												<div class="col-md-2">Vendor Quotation</div>
													<div class="col-md-3">
														<input type="text" placeholder="Enter Quotation No"  value="${getPoHeader.vendQuation}" name="quotation" id="quotation" class="form-control"  required>
													</div>
				
												<div class="col-md-2" >Quotation Ref. Date</div>
												<div class="col-md-3">
													 <input type="text"   placeholder="Select Quotation Date" value="${getPoHeader.vendQuationDate}" name="quotationDate" id="quotationDate" class="form-control date-picker" required>
												</div>
				 
											</div><br/>
										
										</c:otherwise>
										
								</c:choose>
			
			
			 			
			<div class="box-content">
				<div class="col-md-2" >Payment Terms</div>
									<div class="col-md-3">
										<select name="payId" id="payId"    class="form-control chosen"  required>
									 
											 <c:forEach items="${paymentTermsList}" var="paymentTermsList" >
											 <c:choose>
											 	<c:when test="${paymentTermsList.pymtTermId==getPoHeader.paymentTermId}">
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
										<select name="deliveryId" id="deliveryId"    class="form-control chosen"  required>
										 
											 <c:forEach items="${deliveryTermsList}" var="deliveryTermsList" >
											 <c:choose>
											 	<c:when test="${deliveryTermsList.deliveryTermId==getPoHeader.deliveryId}">
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
									
										<select name="dispatchMode"  id="dispatchMode"   class="form-control chosen"  required>
										 
									 <c:forEach items="${dispatchModeList}" var="dispatchModeList" >
									 <c:choose>
									 	<c:when test="${dispatchModeList.dispModeId==getPoHeader.dispatchId}">
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
											<input type="number" placeholder="Order Validity"  value="${getPoHeader.approvStatus}" name="orderValidity" id="orderValidity" class="form-control" required>
										</div>
										
								</div><br/>
								 
								
			
				
					<div class="box-content">
								<div class="col-md-2" >Indend No.</div>
									<div class="col-md-3">
									<input type="text"   placeholder="Indend No" value="${getPoHeader.indNo}" name="indNo" id="indNo" class="form-control"  readonly>
									<input type="hidden"  value="${getPoHeader.indId}" name="indId" id="indId" class="form-control"   >
									 	 
									</div>	
									<div class="col-md-1"></div>
									<c:choose>
															<c:when test="${getPoHeader.poStatus==9 or getPoHeader.poStatus==7}">
									  <div class="col-md-2"><input type="button" class="btn btn-info" value="Get Item From Indend "  id="myBtn"></div>
									  </c:when>
									  
									  </c:choose>
									 
					</div>
			 		<br/>
									
									<hr/>
									
									  
			 
			 
				<div class=" box-content">
					<div class="row">
								<div style="overflow:scroll;height:35%;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%; font-size: 14px;" id="table_grid2">
										<thead>
											<tr>
											<th width="2%"> SR </th>
										<th  > Item Name </th>
										<th width="5%"> Uom </th>
										<th width="6%"> Ind Qty </th> 
										<th width="6%"> PO Qty </th>
										<th width="6%"> Bal QTY </th>
										<th width="6%"> Rate </th>
										<th class="col-md-1"> Sch Date </th>
										<th width="7%"> Value </th>
										<!-- <th> Disc% </th> -->
										<!-- <th> Sch Days </th> --> 
										<th width="3%"> Action </th>
									</tr>
										</thead>
										<tbody>
										
										<c:forEach items="${getPoHeader.poDetailList}" var="poDetailList"
													varStatus="count">
													 
													<tr>
													  
																<td> <c:out value="${count.index+1}" /> </td>
  
																<td class="col-md-4"> <c:out value="${poDetailList.itemCode}" /> </td>
																<td align="left"> <c:out value="${poDetailList.itemUom}" /> 
																<input type="hidden" id="existingItemQty${count.index}" name="existingItemQty${count.index}" value="${poDetailList.itemQty}" >
																<input type="hidden" id="existingBalanceQty${count.index}" name="existingBalanceQty${count.index}" value="${poDetailList.balanceQty}" ></td>
																<td align="right"> <input type="hidden" id="indQty${count.index}" name="indQty${count.index}" value="${poDetailList.indedQty}" ><c:out value="${poDetailList.indedQty}" /> </td>
																
													  			 <c:choose>
													  			 	<c:when test="${(poDetailList.status==7 or poDetailList.status==9) && (getPoHeader.poStatus==9 or getPoHeader.poStatus==7)}">
																			<td align="right"><font size="2"><input style="text-align:right; width:95px" type="text" onchange="calculateBalaceQty(${count.index})"  id="poQty${count.index}" name="poQty${count.index}" value="${poDetailList.itemQty}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required></font> </td>
													  				  			 	
													  			 	</c:when>
													  			 	<c:otherwise>
													  			 			<td align="right"><font size="2"><input style="text-align:right; width:95px" type="text" onchange="calculateBalaceQty(${count.index})"  id="poQty${count.index}" name="poQty${count.index}" value="${poDetailList.itemQty}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly></font> </td>
													  			 
													  			 	</c:otherwise>
													  			 </c:choose>
													  			<td align="right"> <input style="text-align:right; width:95px" type="text" id="balanceQty${count.index}" 
													  			name="balanceQty${count.index}" value="${poDetailList.balanceQty}" class="form-control" 
													  			 pattern="[+-]?([0-9]*[.])?[0-9]+" readonly> </td>
													  			 
													  			  <c:choose>
													  			 	<c:when test="${(poDetailList.status==7 or poDetailList.status==9) && (getPoHeader.poStatus==9 or getPoHeader.poStatus==7)}">
															  			 	<td align="right"><input style="text-align:right; width:95px" onchange="changeItemRate(${count.index})" type="text" id="rate${count.index}" name="rate${count.index}" value="${poDetailList.itemRate}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required></td>
															  			 	<td ><c:out value="${poDetailList.schDate}" /> </td>
															  			 	<td align="right" id="value${count.index}"><c:out value="${poDetailList.basicValue}" /> </td>
															  				 <input style="text-align:right; width:70px" onchange="changeItemRate(${count.index})" type="hidden" id="disc${count.index}" name="disc${count.index}" value="${poDetailList.discPer}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required> 
															  				<!-- <td align="right"> --><input style="text-align:right; width:50px" type="hidden" id="indItemSchd${count.index}" name="indItemSchd${count.index}" value="${poDetailList.schDays}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required><!-- </td> -->
													  						 <input style="text-align:right; width:50px" type="hidden" id="indRemark${count.index}" name="indRemark${count.index}" value="${poDetailList.schRemark}"  class="form-control" required> 
													  			
															  		</c:when>
															  		<c:otherwise>
															  				<td align="right"><input style="text-align:right; width:95px" onchange="changeItemRate(${count.index})" type="text" id="rate${count.index}" name="rate${count.index}" value="${poDetailList.itemRate}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly></td>
															  				<td  ><c:out value="${poDetailList.schDate}" /> </td>
															  				<td align="right" id="value${count.index}"><c:out value="${poDetailList.basicValue}" /> </td>
															  				 <input style="text-align:right; width:70px" onchange="changeItemRate(${count.index})" type="hidden" id="disc${count.index}" name="disc${count.index}" value="${poDetailList.discPer}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly> 
															  				<!-- <td align="right"> --><input style="text-align:right; width:50px" type="hidden" id="indItemSchd${count.index}" name="indItemSchd${count.index}" value="${poDetailList.schDays}"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly><!-- </td> -->
													  						 <input style="text-align:right; width:50px" type="hidden" id="indRemark${count.index}" name="indRemark${count.index}" value="${poDetailList.schRemark}"  class="form-control" readonly> 
													  			 
															  		</c:otherwise>
													  			 </c:choose>
													  			 
													  			
													  			
													  			 
													  			 <td> 
													  			 <c:choose>
													  			 	<c:when test="${(poDetailList.status==7 or poDetailList.status==9) && (getPoHeader.poStatus==9 or getPoHeader.poStatus==7)}">
													  			 	<a href="${pageContext.request.contextPath}/deletePoItemInEditPo/${poDetailList.poDetailId}"
													onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a> 
													  			 	</c:when>
													  			 	<c:when test="${(poDetailList.status==0 or poDetailList.status==1 or poDetailList.status==2)}">
													  			 	
													  			 	Approved
													  			 	</c:when>
													  			 	<c:otherwise>
													  			 	
													  			 	Disapproved
													  			 	</c:otherwise>
													  			 </c:choose>
														 </td>
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
											<input style="text-align:right; width:150px"  type="text" value="${getPoHeader.poBasicValue}" pattern="[+-]?([0-9]*[.])?[0-9]+" 
											name="poBasicValue" id="poBasicValue" class="form-control" readonly>
										</div>
									<div class="col-md-2">Disc Value</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" value="${getPoHeader.discValue}"   name="discValue" id="discValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>
										</div>
								 
							
							</div><br>
							
		 			 <div class="box-content"> 
		 			 
									<div class="col-md-2">Packing Charges %</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text" value="${getPoHeader.poPackPer}" pattern="[+-]?([0-9]*[.])?[0-9]+" name="packPer" id="packPer" class="form-control" required>
										</div>
									<div class="col-md-2">Packing Charges Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text"  name="packValue" id="packValue" class="form-control"
										value="${getPoHeader.poPackVal}" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="packRemark" id="packRemark" class="form-control" value="${getPoHeader.poPackRemark}"  >
										</div>
							
							
							</div><br>
							<div class="box-content">
									<div class="col-md-2">Insurance Charges %</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text" value="${getPoHeader.poInsuPer}" pattern="[+-]?([0-9]*[.])?[0-9]+" name="insuPer" id="insuPer" class="form-control" required>
										</div>
									<div class="col-md-2">Insurance Charges Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" name="insuValue" id="insuValue" class="form-control"
										value="${getPoHeader.poInsuVal}" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="insuRemark" id="insuRemark" class="form-control" value="${getPoHeader.poInsuRemark}"  >
										</div>
							
							</div><br>
						
						<div class="box-content"> 
							 
						 	<div class="col-md-2">Freight Charges %</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" onchange="calculation()" type="text" value="${getPoHeader.poFrtPer}" pattern="[+-]?([0-9]*[.])?[0-9]+" name="freightPer" id="freightPer" class="form-control" required>
										</div>
									<div class="col-md-2">Freight Charges Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" name="freightValue" id="freightValue" class="form-control"
										value="${getPoHeader.poFrtVal}" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="freghtRemark" id="freghtRemark" class="form-control" value="${getPoHeader.poFrtRemark}"  >
										</div>
							 </div><br>
						   
							<div class="box-content">
								 
									<div class="col-md-2"> </div>
										<div class="col-md-2">
										<%-- <select name="taxPer" id="taxPer"  onchange="calculation()"  class="form-control chosen"  required>
										 
											 <c:forEach items="${taxFormList}" var="taxFormList" >
											  <c:choose>
									 	<c:when test="${taxFormList.taxId==getPoHeader.poTaxId}">
									 		 <option value="${taxFormList.taxId}" selected><c:out value="${taxFormList.taxPer}"/></option>
									 	</c:when>
									 	<c:otherwise>
									 	 	<option value="${taxFormList.taxId}"><c:out value="${taxFormList.taxPer}"/></option>
									 	</c:otherwise>
									 </c:choose>
											 	  
 											 </c:forEach>
						 
										</select> --%>
											 </div>
									<div class="col-md-2">Tax Value <i class="fa fa-inr" style="font-size:13px"></i></div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" onchange="calculation()" name="taxValue" id="taxValue" class="form-control"
										value="${getPoHeader.poTaxValue}" pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>
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
										value="${getPoHeader.otherChargeAfter}" pattern="[+-]?([0-9]*[.])?[0-9]+" required>
										</div>
									<div class="col-md-2">Remark</div>
										<div class="col-md-2">
											<input   type="text" name="otherRemark" id="otherRemark" class="form-control" value="${getPoHeader.otherChargeAfterRemark}"  >
										</div>
							
							</div><br>
							    
							 <div class="box-content">
								 
									<div class="col-md-2"></div>
										<div class="col-md-2">
											
										</div>
									 
									 <div class="col-md-2">Final Value</div>
										<div class="col-md-2">
											<input style="text-align:right; width:150px" type="text" value="<fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${getPoHeader.poBasicValue-getPoHeader.discValue
											+getPoHeader.poPackVal+getPoHeader.poInsuVal+getPoHeader.poFrtVal+getPoHeader.poTaxValue+getPoHeader.otherChargeAfter}"/>"   name="finalValue" id="finalValue" class="form-control"
										value="0" pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>
										</div>
							
							</div><br>
							   
							 <br>
			
			<div class="row">
						<div class="col-md-12" style="text-align: center">
						<c:choose>
															<c:when test="${getPoHeader.poStatus==9 or getPoHeader.poStatus==7}">
															<input type="submit" class="btn btn-info" value="Submit" onclick="check()" >
															</c:when>
															</c:choose>
						<%-- <c:choose>
							<c:when test="${getPoHeader.poStatus==2}">
								<input type="submit" class="btn btn-info" value="Submit" onclick="check()" disabled>
							
							</c:when>
							<c:otherwise>
								<input type="submit" class="btn btn-info" value="Submit" onclick="check()" >
							</c:otherwise>
						</c:choose> --%>
							


						</div>
					</div>
				
			</form>
			
			 <form id="submitList"
				action="${pageContext.request.contextPath}/submitPoDetailListInPoEditList"
				method="post">
			<div id="myModal" class="modal">
					      
					<div class="modal-content" style="color: black;">
						<span class="close" id="close">&times;</span>
						<h3 style="text-align: center;">Select Item From Indend</h3>
							<div class=" box-content">
							<div class="row">
								<div style="overflow:scroll;height:70%;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%; font-size: 14px;" id="table_grid1">
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
    modal.style.display = "block";
    itemByIntendId(); 
    getValue();
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
        
    } else if (event.target == poPreviousRecord) {
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

function itemByIntendId()
{
	
	var indId = $("#indId").val();
	var vendId = $("#vendId").val();
	$('#loader').show();
	$
	.getJSON(
			'${geIntendDetailByIndIdInEditPo}',

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
								tr.append($('<td></td>').html('<input type="checkbox" name="select_to_approve"'+
										'id="select_to_approve'+itemList.indDId+'" onchange="requiredField('+itemList.indDId+')" value="'+itemList.indDId+'" >'));  
								 
							  	tr.append($('<td></td>').html(key+1)); 
							  	var res = itemList.itemCode.split("-");
							  	//tr.append($('<td></td>').html(res[0]));  
							  	
							  	tr.append($('<td></td>').html('<a onclick="previeousRecord('+itemList.itemId+',\'' + itemList.itemCode + '\')"><div title="'+itemList.itemCode+'">'+itemList.itemCode+'</div></a>'));
							  	
							  	tr.append($('<td></td>').html(itemList.indItemUom));
							  	tr.append($('<td style="text-align:right;"></td>').html(itemList.indQty));
							   
							  	tr.append($('<td ></td>').html('<input type="hidden"   id="indQtyAdd'+itemList.indDId+'" name="indQtyAdd'+itemList.indDId+'" value="'+itemList.indFyr+'" >'+
							  			'<input style="text-align:right; width:120px" type="text" onkeyup="calculateBalaceQtyAdd('+itemList.indDId+')" id="poQtyAdd'+itemList.indDId+'" name="poQtyAdd'+itemList.indDId+'" onchange="checkQty('+itemList.indDId+')"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >'));
							  	 
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="text" id="balanceQtyAdd'+itemList.indDId+'" name="balanceQtyAdd'+itemList.indDId+'" value="'+itemList.indFyr+'" class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" readonly>'));
							  	 
							  	tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="text" id="rateAdd'+itemList.indDId+'" name="rateAdd'+itemList.indDId+'" value="'+itemList.rate+'" onchange="checkQty('+itemList.indDId+')"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >'));
							   
							  	/* tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="hidden" id="discAdd'+itemList.indDId+'" name="discAdd'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >')); */
							  	 
							  	//tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="hidden" id="indItemSchdAdd'+itemList.indDId+'" name="indItemSchdAdd'+itemList.indDId+'" value="'+itemList.indItemSchd+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required>'));
							  	 
							  	var schDate = itemList.indItemSchddt.split("-"); 
							  	var f =  schDate[2]+'-'+(schDate[1])+'-'+schDate[0]; 
							  	tr.append($('<td></td>').html(f));
							  	
							  	if(itemList.indRemark==null || itemList.indRemark==""){
							  		
							  		tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="hidden" id="discAdd'+itemList.indDId+'" name="discAdd'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  ><input style="text-align:right; width:100px" type="hidden" id="indItemSchdAdd'+itemList.indDId+'" name="indItemSchdAdd'+itemList.indDId+'" value="'+itemList.indItemSchd+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required><input style="text-align:right; width:120px" type="text" id="indRemarkAdd'+itemList.indDId+'" name="indRemarkAdd'+itemList.indDId+'" value="-"  class="form-control"  >'));
									  
							  	}
							  	else{
							  		tr.append($('<td ></td>').html('<input style="text-align:right; width:120px" type="hidden" id="discAdd'+itemList.indDId+'" name="discAdd'+itemList.indDId+'" value="0"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  ><input style="text-align:right; width:100px" type="hidden" id="indItemSchdAdd'+itemList.indDId+'" name="indItemSchdAdd'+itemList.indDId+'" value="'+itemList.indItemSchd+'"  class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+" required><input style="text-align:right; width:120px" type="text" id="indRemarkAdd'+itemList.indDId+'" name="indRemarkAdd'+itemList.indDId+'" value="'+itemList.indRemark+'"  class="form-control"  >'));
									  
							  	}
							  	
							  	 $('#table_grid1 tbody').append(tr);
							  	
							})
				
			});
	
	
}

function checkQty(key)
{
	var poQty = parseFloat($("#poQtyAdd"+key).val());  
	 var rate = parseFloat($("#rateAdd"+key).val()); 
	if(poQty==0)
	{
		document.getElementById("poQtyAdd"+key).value=""; 
		alert("Enter Greater Than 0 ");
	} 
	else if(rate==0)
	{
		document.getElementById("rateAdd"+key).value="";
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
		       
		    	  document.getElementById("poQtyAdd"+checkboxes[i].value).required=true; 
		  		document.getElementById("rateAdd"+checkboxes[i].value).required=true;
		  		document.getElementById("discAdd"+checkboxes[i].value).required=true;
		  		document.getElementById("indRemarkAdd"+checkboxes[i].value).required=true;
		      
		  }
	}
	else
	{
		for (var i=0; i<checkboxes.length; i++) {
			 document.getElementById("select_to_approve"+checkboxes[i].value).checked == false;
		       
		    	  document.getElementById("poQtyAdd"+checkboxes[i].value).required=false; 
		  		document.getElementById("rateAdd"+checkboxes[i].value).required=false;
		  		document.getElementById("discAdd"+checkboxes[i].value).required=false;
		  		document.getElementById("indRemarkAdd"+checkboxes[i].value).required=false;
		      
		  }
	}
	   
	 
} 

function requiredField(key)
{
	 
	if(document.getElementById("select_to_approve"+key).checked == true)
	{
		document.getElementById("poQtyAdd"+key).required=true; 
		document.getElementById("rateAdd"+key).required=true;
		document.getElementById("discAdd"+key).required=true;
		document.getElementById("indRemarkAdd"+key).required=true;
	} 
	else
	{
		document.getElementById("poQtyAdd"+key).required=false; 
		document.getElementById("rateAdd"+key).required=false;
		document.getElementById("discAdd"+key).required=false;
		document.getElementById("indRemarkAdd"+key).required=false;
	}
	
	 
} 

function calculateBalaceQtyAdd(key)
{
	 
	  var indQty = parseFloat($("#indQtyAdd"+key).val());  
		 var poQty = parseFloat($("#poQtyAdd"+key).val());  
		  
		 
		    if(poQty>indQty)
			  {
			 	 document.getElementById("poQtyAdd"+key).value = "";
			 	document.getElementById("balanceQtyAdd"+key).value = indQty;
			 	alert("Your Enter PO QTY Greater Than Balance QTY");
			 	document.getElementById("select_to_approve"+key).checked=false; 
				  requiredField(key);
			  }
		  else
			  {  
			  document.getElementById("balanceQtyAdd"+key).value = indQty-poQty;
			  document.getElementById("select_to_approve"+key).checked=true; 
			  requiredField(key);
			   }
		    
	   if(poQty<1 || poQty=="")
		   {
		   	alert("Enter Valid Qty ");
		   	document.getElementById("select_to_approve"+key).checked=false; 
			  requiredField(key);
		   }
	 
} 

function changeItemRate(key)
{
	
	var rate = $("#rate"+key).val();
  	var disc = $("#disc"+key).val();
  	var poQty = $("#poQty"+key).val();
  	var balanceQty = $("#balanceQty"+key).val();
  	
	$('#loader').show();
	$
	.getJSON(
			'${changeItemRate}',

			{
				 
				rate : rate,
				disc : disc,
				key : key,
				poQty : poQty,
				balanceQty : balanceQty,
				ajax : 'true'

			},
			function(data) {
				
				 
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
  				document.getElementById("value"+key).innerText=rate*poQty;
				
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
  	 
	 var poQty = parseFloat($("#poQty"+key).val());  
	 var existingItemQty = parseFloat($("#existingItemQty"+key).val()); 
	 var existingBalanceQty = parseFloat($("#existingBalanceQty"+key).val()); 
	  
	    if((existingItemQty+existingBalanceQty)<poQty)
		  {
		 	 document.getElementById("poQty"+key).value = existingItemQty;
		 	document.getElementById("balanceQty"+key).value = existingBalanceQty; 
		 	alert("You Dont Have Qty ");
		 	changeItemRate(key);
		  }
	  else
		  {  
		  document.getElementById("balanceQty"+key).value = existingBalanceQty+existingItemQty-poQty; 
		  changeItemRate(key);
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
  			'${calculatePurchaseHeaderValuesInEdit}',

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
  				document.getElementById("taxValue").value = data.poTaxValue;
  				document.getElementById("finalValue").value = (data.poBasicValue-data.discValue+data.poPackVal+data.poInsuVal
  				+data.poFrtVal+data.poTaxValue+data.otherChargeAfter).toFixed(2);
  				
  				
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