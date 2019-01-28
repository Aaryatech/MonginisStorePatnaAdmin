<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body>
	<%-- <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include> --%>

<c:url var="addItemFromItemListInIndent" value="/addItemFromItemListInIndent" />
<c:url var="getItemFroItemListBelowROL" value="/getItemFroItemListBelowROL" />
	<c:url var="getSubDeptListByDeptId" value="/getSubDeptListByDeptId" />
	<c:url var="getgroupListByCatId" value="/getgroupListByCatId" />
<c:url var="exportExcelforIndent" value="/exportExcelforIndent" /> 
	<c:url var="getIndentDetail" value="/getIndentDetail" />
	<c:url var="getInvoiceNo" value="/getInvoiceNo" />
<c:url var="getlimitationValue" value="/getlimitationValue" />
	<c:url var="itemListByGroupId" value="/itemListByGroupId" />
	<c:url var="getIndentValueLimit" value="/getIndentValueLimit" />
	<c:url var="getIndentPendingValueLimit" value="/getIndentPendingValueLimit" />
	<c:url var="getLastRate" value="/getLastRate" />
	<c:url var="getMoqQtyForValidation" value="/getMoqQtyForValidation" />
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
			
			<!-- END Page Title -->
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Add Indent
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/getIndents">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> 
							</div>

						</div>


						<div class="box-content">
							<form method="post" class="form-horizontal" id="validation-form">

								<div class="box-content"> 
								
								<label class="col-md-2">Indent
										Type</label>
									<div class="col-md-3">
										<select name="indent_type" onchange="getInvoiceNo()" id="indent_type"
											data-rule-required="true" class="form-control chosen"  data-rule-required="true">
											<option value="">Select Indent Type</option>
											<c:forEach items="${typeList}" var="typeList"> 
											<c:choose>
												<c:when test="${typeList.typeId==indentTypeTemp}">
												<option value="${typeList.typeId}" selected>${typeList.typeName}</option>
												</c:when>
												<c:otherwise>
												<option value="${typeList.typeId}"  >${typeList.typeName}</option>
												</c:otherwise>
											</c:choose>
															
														</c:forEach>
										</select>
									</div>
									<div class="col-md-1"></div>
									<label class="col-md-2">Indent
										Category </label>
									<div class="col-md-3">
									<c:choose>
										<c:when test="${isSubmit==1}">
											 
											<input type="hidden" name="catId" id="catId" value="${catIdTemp}"/>
											<select id="ind_cat" name="ind_cat"
												class="form-control chosen" placeholder="Indent Category" onchange="getInvoiceNo()"
												 disabled>
												<option value="">Select Indent Category</option>
												<c:forEach items="${categoryList}" var="cat"
													varStatus="count">
													<c:choose>
														<c:when test="${catIdTemp==cat.catId}">
														<option value="${cat.catId}" selected><c:out value="${cat.catDesc}"/></option>
														</c:when>
														<c:otherwise>
														<option value="${cat.catId}"  ><c:out value="${cat.catDesc}"/></option>
														</c:otherwise>
													</c:choose>
													
												</c:forEach>
											</select> 
										</c:when>
										<c:otherwise>
											<input type="hidden" name="catId" id="catId" value="0"/>
											<select id="ind_cat" name="ind_cat"
												class="form-control chosen" placeholder="Indent Category" onchange="getInvoiceNo()"
												data-rule-required="true">
												<option value="">Select Indent Category</option>
												<c:forEach items="${categoryList}" var="cat"
													varStatus="count">
													<option value="${cat.catId}"><c:out value="${cat.catDesc}"/></option>
												</c:forEach>
											</select> 
										</c:otherwise>
									</c:choose>
										
									</div>
									

								</div>
								<br><br>

								<div class="box-content"> 
									<label class="col-md-2">Indent
										No.</label>
									<div class="col-md-3">
										<input type="text" name="indent_no" id="indent_no"
											class="form-control" placeholder="Indent No" value="${indentNoTemp}" readonly="readonly"
											 />
									</div>
									<div class="col-md-1"></div>
									<label class="col-md-2">Date</label>
									<div class="col-md-3">
										<input class="form-control date-picker" id="indent_date" onblur="getInvoiceNo()"
											  type="text" name="indent_date" value="${date}"
											required data-rule-required="true" />
									</div>
									
								</div>
<br><br>
									<input   id="machine_specific"  type="hidden" name="machine_specific" value="1" />
										<input   id="acc_head"  type="hidden" name="acc_head" value="1" />
										
								<div class="box-content"> 
								
									<label class="col-md-2">Remark</label>
									<div class="col-md-10">
										<input type="text" name="indHeaderRemark" id="indHeaderRemark" placeholder="Remark" class="form-control"  value="${indHeaderRemarkTemp}" required />
									</div> 
								</div><br><br>
								<%-- <div class="box-content">


									<div class="col-md-2">Account
										Head</div>
									<div class="col-md-3">
										<select name="acc_head" id="acc_head"
											class="form-control chosen" placeholder="Account Head"
											data-rule-required="true">
											<option value="">Select Account Head</option>
											<c:forEach items="${accountHeadList}" var="accHead"
												varStatus="count">
												<c:choose>
													<c:when test="${accHead.accHeadId==accHeadTemp}" >
													<option value="${accHead.accHeadId}" selected><c:out value="${accHead.accHeadDesc}"/></option>
													</c:when>
													<c:otherwise>
													<option value="${accHead.accHeadId}"><c:out value="${accHead.accHeadDesc}"/></option>
													</c:otherwise>
												</c:choose>
												
											</c:forEach>
										</select>
									</div>
<div class="col-md-1"></div>
									  <label class="col-md-2">Machine
										Specific</label>  
										
										
									  <div class="col-md-3">
										<select name="machine_specificd" id="machine_specificd"
											onchange="showDept()" class="form-control chosen"
											placeholder="Is Machine Specific"   disabled>
											<option  value="0">No</option>
											<option value="1" selected>Yes</option>
										</select>
									</div>  
								</div><br>
								<br> --%>
								
								<!-- <div class="box-content">
									<label class="col-md-2">For
										Development </label>

									<div class="col-md-3">
										<select name="is_dev" id="is_dev" class="form-control"
											placeholder="Is Dev" data-rule-required="true">
											<option value="0">No</option>
											<option value="1">Yes</option>

										</select>
									</div>
<div class="col-md-1"></div>
									<label class="col-md-2">For
										Monthly </label>
									<div class="col-md-3">
										<select name="is_monthly" id="is_monthly" class="form-control"
											  data-rule-required="true">
											<option value="0">No</option>
											<option value="1">Yes</option>
										</select>
									</div>
								</div>
								<br><br>  -->
								<input   id="is_dev"  type="hidden" name="is_dev" value="0" />
								<input   id="is_monthly"  type="hidden" name="is_monthly" value="0" />
								<input   id="dept"  type="hidden" name="dept" value="0" />
								<input   id="sub_dept"  type="hidden" name="sub_dept" value="0" />
								
								  <%-- <div class="box-content"> <!-- style="display: none" id="deptDiv" -->
									<label class="col-md-2">Department
									</label>

									<div class="col-md-3">
										<select name="dept" id="dept" class="form-control chosen"
											  required>
											<option value="">Select Department</option>
											<c:forEach items="${deparmentList}" var="dept"
												varStatus="count">
												<option value="${dept.deptId}"> ${dept.deptCode} &nbsp;&nbsp; ${dept.deptDesc}</option>
											</c:forEach>
										</select>
									</div>
<div class="col-md-1"></div>
									<label class="col-md-2">Sub
										Department </label>
									<div class="col-md-3">
										<select name="sub_dept" id="sub_dept"
											class="form-control chosen"  
											required>

										</select>
									</div>

								</div><br> --%>  
							
								
								<hr />
								  <!-- <div class="box-content">
								
								<div class="col-md-2">MRN Limit : 
									</div>
									
									<div class="col-md-2"  style="font-weight: bold; font-size: 15px;" id="mrnLimit"> 
									</div>
									<input type="hidden" name="mrnLimitText" id="mrnLimitText" />
									
									<div class="col-md-2">Total MRN : 
									</div>
									<div  class="col-md-2" style="font-weight: bold; font-size: 15px;" id="totalmrn">
 
									</div>
									<input type="hidden" name="totalmrnText" id="totalmrnText" />
									   
									
									<div class="col-md-2">Approved Indent Value : 
									</div>
									
									<div class="col-md-2"  style="font-weight: bold; font-size: 15px;" id="approvedIndentValue">
 
									</div>
									
									 <input type="hidden" name="approvedIndentValueText" id="approvedIndentValueText" />
								</div> -->  
								 <!--  <div class="box-content">
									 
									
									<div class="col-md-2"> 
									</div>
									
									<div class="col-md-2" >
 
									</div>
									
									
									<div class="col-md-2">Total Indent Value : 
									</div>
									
									<div class="col-md-2"  style="font-weight: bold; font-size: 15px;" id="totalIndentValue">
 
									</div>
									<input type="hidden" name="totalIndentValueText" id="totalIndentValueText" />
									
									<div class="col-md-2">Non-Approved Indent Value : 
									</div>
									
									<div class="col-md-2"  style="font-weight: bold; font-size: 15px;" id="totalIndentPendingValue">
 
									</div>
									 <input type="hidden" name="totalIndentPendingValueText" id="totalIndentPendingValueText" />
								</div>  -->
								 <input   id="group"  type="hidden" name="group" value="0" />
								 
								<span style="text-align: left; font-weight: bold;font-size: 20px;">Add Item</span>
								
								<%-- <div class="box-content">
									<label class="col-md-2">Group </label>
									<div class="col-sm-6 col-lg-10 controls">

										<select name="group" id="group" class="form-control" >
										  <option value=""><c:out value="select Group"/></option>  
										<c:forEach items="${itemGrpList}" var="itemGrpList" >
											 
													<option value="${itemGrpList.grpId}"><c:out value="${itemGrpList.grpDesc}"/></option>
												  
											</c:forEach>
										</select>
									</div>
									<!-- <label class="col-sm-3 col-lg-2 control-label">Quantity</label>
									<div class="col-sm-6 col-lg-4 controls">
										<input type="text" name="quantity" id="quantity"
											class="form-control" placeholder="Quantity"
											data-rule-required="true" />
									</div> -->
								</div>
								<br/>  --%>

								<div class="box-content">
									<label class="col-md-2">Item
										Name </label>
									<div class="col-sm-6 col-lg-10 controls">

										<select id="item_name" name="item_name"
										onchange="getMoqQty()"	class="form-control chosen" placeholder="Item Name" >
											
											<option value=""><c:out value="select Item"/></option>  
										<c:forEach items="${itemList}" var="itemList" >
											 
													<option value="${itemList.itemId}">${itemList.itemCode} &nbsp; ${itemList.itemDesc}
												  
											</c:forEach>

										</select>
									</div>
								</div>
								<br/> <br>
								<div class="box-content">
									<label class="col-md-2">Quantity</label>
									<div class="col-sm-6 col-lg-2 controls">
										<input type="text" name="quantity" id="quantity"
											class="form-control" placeholder="Quantity"
											  data-rule-number="true" />
									</div>
								 
									<label class="col-md-2">Schedule
										Date</label>
									<div class="col-sm-3 col-lg-2 controls">
										<input type="text" name="sch_days" id="sch_days"
											class="form-control date-picker" placeholder="Schedule Date"
											   />
									</div>
									<label class="col-md-2">Remark</label>
									<div class="col-sm-6 col-lg-2 controls">

										<input type="text" name="remark" id="remark"
											class="form-control" placeholder="Remark"
											  />
									</div>
 
								</div><br/><br/>
								<div class="box-content">
								
								<label class="col-md-2"> MOQ Qty</label>
									<div class="col-sm-6 col-lg-2 controls">
									
									<input type="text" name="moqQtyByItemId" id="moqQtyByItemId"
											class="form-control" placeholder="MOQ Qty"
											  readonly/>
 
									</div>
									
									
									<label class="col-md-2"> Bal To Be Rec</label>
									<div class="col-sm-6 col-lg-2 controls">
									
									<input type="text" name="itemPendingMrnQty" id="itemPendingMrnQty"
											class="form-control" placeholder="Bal To Be Rec"
											  readonly/>
 
									</div>
									
									<label class="col-md-2">Avg Issue Qty</label>
									<div class="col-sm-6 col-lg-2 controls">
									
									<input type="text" name="itemAvgIssueQty" id="itemAvgIssueQty"
											class="form-control" placeholder="Avg Issue Qty"
											  readonly/>
 
									</div>
								</div>
								<br/>
								<br><br><br>
								
								
								<div class="row">
						<div class="col-md-12" style="text-align: center">
						<input type="button" onclick="insertIndentDetail()"
											class="btn btn-info" value="Add Item">
											<%-- <c:choose>
						<c:when test="${userInfo.id==1}"> --%>
						<input type="button" class="btn btn-info" value="Get Item From Below ROL/MIN Level" id="myBtn" >
						<%-- </c:when>
					</c:choose> --%>
							 
						</div>
					</div>
								<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label>
								<div class="clearfix"></div>
								<div id="table-scroll" class="table-scroll">

									<!-- <div id="faux-table" class="faux-table" aria="hidden">
										<table id="table2" class="main-table">
											<thead>
												<tr class="bgpink">
													<th width="140" style="width: 30px" align="left">Sr No</th>
													<th width="138" align="left">Code</th>
													<th width="120" align="left">Name</th>
													<th width="100" align="left">Qty</th>
													<th width="60" align="left">UOM</th>
													<th width="100" align="left">Days</th>
													<th width="120" align="left">Date</th>
													<th width="80" align="left">Current Stock</th>
												</tr>
											</thead>
										</table>

									</div> -->
									<div class="table-wrap">

										<table id="table1" class="table table-advance" style="font-size: 14px">
											<thead>
												<tr class="bgpink">
													<th width="2%" >Sr</th>
													<th class="col-md-1" >Item
														Code</th>
													<th class="col-md-3" >Item
														Desc</th>
													<th class="col-md-1" >UOM</th>
													<th class="col-md-1" >Cur
														Stk</th>

													<th class="col-md-1" >Indent
														Qty</th>
													<th class="col-md-1" >Bal To Be Rec</th>
													<th class="col-md-1" >Issue Avg</th>
													 <th class="col-md-1" >MOQ</th>
													<th class="col-md-1" >Sch
														Date</th>
														 
														<th class="col-md-1" >Action
														</th>
												</tr>
											</thead>
											<tbody>
											
											<c:forEach items="${tempIndentList}" var="tempIndentList"
													varStatus="count">
													 
													<tr>
													  
														<td><c:out value="${count.index+1}" /></td>
  
																<td  ><c:out value="${tempIndentList.itemCode}" /></td>
																<td  ><c:out value="${tempIndentList.itemName}" /></td>
																<td  ><c:out value="${tempIndentList.uom}" /></td>
																<td  ><c:out value="${tempIndentList.curStock}" /></td>
													  			<td  ><c:out value="${tempIndentList.qty}" /></td> 
													  			<td  ><c:out value="${tempIndentList.poPending}" /></td> 
													  			<td  ><c:out value="${tempIndentList.avgIssueQty}" /></td> 
													  			<td  ><c:out value="${tempIndentList.moqQty}" /></td> 
													  			<td  ><c:out value="${tempIndentList.date}" /></td> 
													  			<td  ><a href='#' class='action_btn' onclick="deleteIndentItem(${tempIndentList.itemId},${count.index})"><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a></td> 
																</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12" style="text-align: center">
									
									<c:choose>
										<c:when test="${tempIndentList.size()>0}">
										<input type="button" onclick="insertIndent()" id="submitt" class="btn btn-info" value="Submit"  >
										</c:when>
										<c:otherwise>
										<input type="button" onclick="insertIndent()" id="submitt" class="btn btn-info" value="Submit" disabled>
										</c:otherwise>
									</c:choose>
									
									 <c:choose>
						<c:when test="${userInfo.id==1}">
						<input type="button" class="btn btn-info" value="Import Excel " onclick="exportExcel()">
						</c:when>
					</c:choose>  

								
									</div>
									</div>
							</form>
							
							 <form id="submitList"
				action="${pageContext.request.contextPath}/addItemFromItemListInIndent"
				method="post">
			<div id="myModal" class="modal">
			     
					<input   type="hidden" value="0" name="catIdTemp" id="catIdTemp"    >
					<input   type="hidden" value="0" name="accHeadTemp" id="accHeadTemp"    >
					<input   type="hidden" value="-" name="indHeaderRemarkTemp" id="indHeaderRemarkTemp"    >
					<input   type="hidden" value="0" name="indentDateTemp" id="indentDateTemp"    >
					<input   type="hidden" value="0" name="indentTypeTemp" id="indentTypeTemp"    > 
					<input   type="hidden" value="0" name="indentNoTemp" id="indentNoTemp"    > 
					<div class="modal-content" style="color: black;">
						<span class="close" id="close">&times;</span>
						<input type="radio" onchange="changeTable(1);" id="minMaxRol1" name="minMaxRol" value="1" checked> MINIMUM LEVEL
							<input type="radio" onchange="changeTable(2);" id="minMaxRol2" name="minMaxRol" value="2"> MAXIMUM LEVEL
							<input type="radio" onchange="changeTable(3);" id="minMaxRol3" name="minMaxRol" value="3"> ROL LEVEL
							
							<div class=" box-content">
							<div class="row" id="itemTable1" style="display: block;">
								<div style="overflow:scroll;height:80%;width:100%;overflow:auto;  ">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%;font-size:14px;" id="table_grid1">
										<thead>
											<tr>
										<th width="2%" align="left"><input type="checkbox" id="allCheck1" onClick="selectAll(this)"  />All</th>
										<th width="3%">SR</th>
										<th>Item Name </th>
										<th width="10%">UOM</th>
										<th width="10%">Qty</th>
										<th width="10%">Delv Date</th>
										<th width="7%">Bal To Be Rec</th>
										<th width="7%">MOQ</th>
										<th width="7%">MIN Level</th> 
										<th width="7%"> Actual Stock</th> 
										<th width="7%">Issue Avg</th> 

									</tr>
										</thead>
										<tbody>
 
										</tbody>
									</table>
								</div>
							</div> 
							
							<div class="row" id="itemTable2" style="display: none;">
								<div style="overflow:scroll;height:80%;width:100%;overflow:auto; ">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%;font-size:14px;" id="table_grid2">
										<thead>
											<tr>
										<th width="2%" align="left"><input type="checkbox" id="allCheck2" onClick="selectAll(this)"  />All</th>
										<th width="3%">SR</th>
										<th>Item Name </th>
										<th width="10%">UOM</th> 
										<th width="10%">Qty</th>
										<th width="10%">Delv Date</th>
										<th width="7%">Bal To Be Rec</th>
										<th width="7%">MOQ</th>
										<th width="7%"> MAX Level</th> 
										<th width="7%"> Actual Stock</th> 
										<th width="7%">Issue Avg</th> 

									</tr>
										</thead>
										<tbody>
 
										</tbody>
									</table>
								</div>
							</div> 
							
							<div class="row" id="itemTable3" style="display: none;">
								<div style="overflow:scroll;height:80%;width:100%;overflow:auto; ">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%;font-size:14px;" id="table_grid3">
										<thead>
											<tr>
										<th width="2%" align="left"><input type="checkbox" id="allCheck3" onClick="selectAll(this)"  />All</th>
										<th  width="3%">SR</th>
										<th>Item Name </th>
										<th width="10%">UOM</th> 
										<th width="10%">Qty</th>
										<th width="10%">Delv Date</th>
										<th width="7%">Bal To Be Rec</th>
										<th width="7%">MOQ</th>
										<th width="7%"> ROL Level</th>
										<th width="7%"> Actual Stock</th> 
										<th width="7%">Issue Avg</th>

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
						
							<input type="submit" class="btn btn-info" value="Submit" onclick="getValue()">
					<%--  <c:choose>
						<c:when test="${userInfo.id==1}">
						<input type="button" class="btn btn-info" value="Import Excel " onclick="exportExcel()">
						</c:when>
					</c:choose>   --%>
					
						</div>
					</div>
 
					</div>

				</div>
				 
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/common.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	<script type="text/javascript">
function insertIndent(){
	//alert("inside Indent Insetr");
 var form = document.getElementById("validation-form");
 var indentDate=$('#indent_date').val();
 var indNo	=$('#indent_no').val();
 var indentType	=$('#indent_type').val();
 var accHead	=$('#acc_head').val();
 var dept	=$('#dept').val();
 var subDept	=$('#sub_dept').val();
 
 //alert(indentDate);
 if(indentDate=="" || indentDate==null){
	 	alert("Please Select Valid Indent Date");
 }else  if(indNo=="" || indNo==null){
	 	alert("Please provide Indent No");
 }
 else  if(indentType=="" || indentType==null){
	 	alert("Select PoType ");
}
 else  if(accHead=="" || accHead==null){
	 	alert("Select Account Head  ");
}
 else  if(dept=="" || dept==null){
	 	alert("Select Department  ");
}
 else  if(subDept=="" || subDept==null){
	 	alert("Select Sub Department  ");
}
 else{
	 
	 if(confirm("Do you really want Submit Indent ?")){
		 form.action ="${pageContext.request.contextPath}/saveIndent";
		    form.submit();
	 }
	  	
 }
}
</script>
	<script type="text/javascript">
	function showDept() {
		var mac_spec = document.getElementById("machine_specific").value;
//alert("Machine Specific "+mac_spec);
if(mac_spec==1){
document.getElementById('deptDiv').style.display = "block";
} 
if(mac_spec==0){
	document.getElementById('deptDiv').style.display = "none";
}
	}
	</script>
	<script type="text/javascript">
$(document).ready(function() {
	
    $('#dept').change(
            function() {
            	
                $.getJSON('${getSubDeptListByDeptId}', {
                    deptId : $(this).val(),
                    ajax : 'true'
                }, function(data) {
                
                    var len = data.length;

					$('#sub_dept')
				    .find('option')
				    .remove()
				    .end()
				// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
                    for ( var i = 0; i < len; i++) {
                            
                                
                        $("#sub_dept").append(
                                $("<option></option>").attr(
                                    "value", data[i].subDeptId).text(data[i].subDeptCode+" "+data[i].subDeptDesc)
                            );
                    }

                    $("#sub_dept").trigger("chosen:updated");
                });
            });
});
</script>

	<script type="text/javascript">
$(document).ready(function() {
	
    $('#group').change(
            function() {
            	
                $.getJSON('${itemListByGroupId}', {
                    grpId : $(this).val(),
                    ajax : 'true'
                }, function(data) {
                
                    var len = data.length;

					$('#item_name')
				    .find('option')
				    .remove()
				    .end()
				// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
                    for ( var i = 0; i < len; i++) {
                            
                                
                        $("#item_name").append(
                                $("<option></option>").attr(
                                    "value", data[i].itemId).text(data[i].itemDesc)
                            );
                    }

                    $("#item_name").trigger("chosen:updated");
                });
            });
});
</script>



	<script type="text/javascript">
/* $(document).ready(function() {
	
    $('#ind_cat').change(
            function() {
            	
                $.getJSON('${getgroupListByCatId}', {
                    catId : $(this).val(),
                    ajax : 'true'
                }, function(data) {
                
                    var len = data.length;

					$('#group')
				    .find('option')
				    .remove()
				    .end()
				// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
				    var html = '<option value="">Select group</option>';
        			html += '</option>';
        			$('#group').html(html);
                    for ( var i = 0; i < len; i++) {
                            
                                
                        $("#group").append(
                                $("<option></option>").attr(
                                    "value", data[i].grpId).text(data[i].grpCode+' '+data[i].grpDesc)
                            );
                    }

                    $("#group").trigger("chosen:updated");
                    
                    var html = '<option value="" selected >Select Item</option>';
        			html += '</option>';
        			$('#item_name').html(html);
        			$("#item_name").trigger("chosen:updated");
                });
            });
}); */

$(document).ready(function() {
	
    $('#ind_cat').change(
            function() {
            	
                $.getJSON('${getgroupListByCatId}', {
                    catId : $(this).val(),
                    ajax : 'true'
                }, function(data) {
                
                    var len = data.length;

					$('#item_name')
				    .find('option')
				    .remove()
				    .end()
				// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
				    var html = '<option value="">Select Item</option>';
        			html += '</option>';
        			$('#item_name').html(html);
                    for ( var i = 0; i < len; i++) {
                            
                         if(data[i].itemIsCons==0){    
                        $("#item_name").append(
                                $("<option></option>").attr(
                                    "value", data[i].itemId).text(data[i].itemCode+' '+data[i].itemDesc)
                            );
                         }   
                    }

                    $("#item_name").trigger("chosen:updated");
                    
                    /* var html = '<option value="" selected >Select Item</option>';
        			html += '</option>';
        			$('#item_name').html(html);
        			$("#item_name").trigger("chosen:updated"); */
                });
            });
});
</script>

	<script type="text/javascript">
	function insertIndentDetail() {
		
		 var itemId=$('#item_name').val();
		 var qty=$('#quantity').val();
		 var remark=$('#remark').val();
		 var schDay=$('#sch_days').val();
		 var itemName=$("#item_name option:selected").html();
		 var catId=$('#ind_cat').val();
		 var indentDate=$('#indent_date').val();
		  
		 /* var moqQty = parseFloat(document.getElementById("moqQtyByItemId").value);
		 
		 
		 var rem=qty%moqQty; */
		 
		 /* if(rem!=0){
			 alert("Enter Multiple of "+ moqQty +" Qty ");
			 document.getElementById("qty"+key).value=moqQty; 
		 } */
		 
		if(qty!=0 && (itemId!="" || itemId!=null) && schDay!=""){
		$.getJSON('${getIndentDetail}', {
			itemId : itemId,
			qty : qty,
			remark : remark,
			itemName : itemName,
			schDay : schDay,
			indentDate : indentDate,
			key : -1,
			ajax : 'true',

		}, function(data) {
			//alert(data);
		
			var len = data.length;
			$('#table1 td').remove();
			$.each(data,function(key, trans) {
				if(trans.isDuplicate==1){
					alert("Item Already Added in Indent");
				}
			 
			var tr = $('<tr></tr>');
			tr.append($('<td   ></td>').html(key+1));
		  	tr.append($('<td   ></td>').html(trans.itemCode));
		  	tr.append($('<td   ></td>').html(trans.itemName));
		  	tr.append($('<td   ></td>').html(trans.uom));
		  	tr.append($('<td   ></td>').html(trans.curStock));

		  	tr.append($('<td   ></td>').html(trans.qty)); 
		  	tr.append($('<td   ></td>').html(trans.poPending)); 
		  	tr.append($('<td   ></td>').html((trans.avgIssueQty).toFixed(2))); 
		  	tr.append($('<td   ></td>').html(trans.moqQty)); 
		  	tr.append($('<td   ></td>').html(trans.date)); 

		  	 
		  	/* tr
			.append($(
					'<td class="col-md-1" style="text-align: center;"></td>')
					.html(
							"<input type=button style='text-align:center; width:40px' class=form-control name=delete_indent_item"
									+ trans.itemId+ "id=delete_indent_item"
									+ trans.itemId
									+ " onclick='deleteIndentItem("+trans.itemId+","+key+")'  />"));
 */
		  	
		  	tr
			.append($(
					'<td class="col-md-1" style="text-align: center;"></td>')
					.html(
							"<a href='#' class='action_btn'onclick=deleteIndentItem("+trans.itemId+","+key+")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));
		  	
			$('#table1 tbody').append(tr);
			//document.getElementById("ind_cat").disabled=true;
			  $('#ind_cat').prop('disabled', true).trigger("chosen:updated");
			 
			document.getElementById("catId").value = catId;   
			document.getElementById("submitt").disabled=false;
			
			})
		
			//getLastRate(qty,1);
		});
		document.getElementById("quantity").value = "0"; 
		 document.getElementById("remark").value="";
		//document.getElementById("item_name").selectedIndex = "0";
		 document.getElementById("sch_days").value = "";  
		 
		   $("#group").focus();
		 //document.getElementById("rm_cat").selectedIndex = "0";  
		 }else{
			/*  if(rem!=0){
				 alert("Enter Multiple of "+ moqQty +" Qty ");
				 
			 }
			 else{ */
				 
				 alert("Please Enter  valid Infromation");
			 //}
			
		 }
		}
	</script>
	<script>
function myFunction() {
  var input, filter, table, tr, td, i;
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

<script type="text/javascript">
function deleteIndentItem(itemId,key){
	
	// var itemId=$('#item_name').val();
	 var qty=$('#quantity').val();
	 var remark=$('#remark').val();
	 var schDay=$('#sch_days').val();
	 var itemName=$("#item_name option:selected").html();
	 
	 var indentDate=$('#indent_date').val();
	
	$.getJSON('${getIndentDetail}', {
		itemId : itemId,
		qty : qty,
		remark : remark,
		itemName : itemName,
		schDay : schDay,
		indentDate : indentDate,
		key : key,
		ajax : 'true',

	}, function(data) {
		//alert(data);
		if(data==""){
			alert("No Record ");
			  $('#ind_cat').prop('disabled', false).trigger("chosen:updated");  
			  document.getElementById("ind_cat").value="";
			  $("#ind_cat").trigger("chosen:updated");
			  
			document.getElementById("submitt").disabled=true;
			var html = '<option value="" selected >Select Item</option>';
			html += '</option>';
			$('#item_name').html(html);
			$("#item_name").trigger("chosen:updated");
		}
		var len = data.length;
		$('#table1 td').remove();
		$.each(data,function(key, trans) {
			
			var tr = $('<tr></tr>');
			tr.append($('<td   ></td>').html(key+1));
		  	tr.append($('<td   ></td>').html(trans.itemCode));
		  	tr.append($('<td   ></td>').html(trans.itemName));
		  	tr.append($('<td   ></td>').html(trans.uom));
		  	tr.append($('<td   ></td>').html(trans.curStock));

		  	tr.append($('<td   ></td>').html(trans.qty)); 
		  	tr.append($('<td   ></td>').html(trans.poPending)); 
		  	tr.append($('<td   ></td>').html((trans.avgIssueQty).toFixed(2))); 
		  	tr.append($('<td   ></td>').html(trans.moqQty)); 
		  	tr.append($('<td   ></td>').html(trans.date)); 
	  	
	  /* 	tr
		.append($(
				'<td class="col-md-1" style="text-align: center;"></td>')
				.html(
						"<input type=button style='text-align:center;' class=form-control name=delete_indent_item"
								+ trans.itemId+ "id=delete_indent_item"
								+ trans.itemId
								+ " onclick='deleteIndentItem("+trans.itemId+","+key+")'  />")); */
								
								tr
								.append($(
										'<td class="col-md-1" ></td>')
										.html(
												"<a href='#' class='action_btn'onclick=deleteIndentItem("+trans.itemId+","+key+")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));
		$('#table1 tbody').append(tr);
		})
		  
		//getLastRate(qty,-1);
		});
	
	
	
	
}
</script>
<script type="text/javascript">

function getInvoiceNo() {
	
	var date = $("#indent_date").val(); 
	var catId = $("#ind_cat").val(); 
	var typeId = $("#indent_type").val(); 
	
	$.getJSON('${getInvoiceNo}', {

		catId:catId,
		docId:1,
		date : date,
		typeId : typeId,
		ajax : 'true',

	}, function(data) { 
		
	document.getElementById("indent_no").value=data.code;  
	document.getElementById("mrnLimit").innerHTML = data.subDocument.categoryPostfix;
	document.getElementById("mrnLimitText").value = data.subDocument.categoryPostfix;;
	//getlimitationValue(catId,typeId);
	//getIndentValueLimit(catId,typeId);
	
	});

}

function getlimitationValue(catId,typeId) {
	 
	$.getJSON('${getlimitationValue}', {
 
		ajax : 'true',

	}, function(data) { 
		
		var flag=0;
		
	for(var i=0;i<data.length;i++){
		
		if(data[i].typeId==typeId){
			
			for(var j=0;j<data[i].consumptionReportList.length;j++){
				
				if(data[i].consumptionReportList[j].catId==catId){
					
					//alert("Monthly Value Is " + data[i].consumptionReportList[j].monthlyValue);
					document.getElementById("totalmrn").innerHTML = data[i].consumptionReportList[j].monthlyValue;
					document.getElementById("totalmrnText").value = data[i].consumptionReportList[j].monthlyValue;
					flag=1;
					break;
				}
				 
			}
			 
		}
	}
	
	});

}

function getIndentValueLimit(catId,typeId) {
	 
	$.getJSON('${getIndentValueLimit}', {
 
		catId:catId,  
		typeId : typeId,
		ajax : 'true',

	}, function(data) { 
		 
		document.getElementById("approvedIndentValue").innerHTML = data;
		document.getElementById("approvedIndentValueText").value = data;
		getIndentPeningValueLimit(catId,typeId);
	});

}

function getIndentPeningValueLimit(catId,typeId) {
	 
	$.getJSON('${getIndentPendingValueLimit}', {
 
		catId:catId,  
		typeId : typeId,
		ajax : 'true',

	}, function(data) {  
		 
		document.getElementById("totalIndentPendingValue").innerHTML = data;
		document.getElementById("totalIndentPendingValueText").value = data;
		
		var approvedIndentValueText = parseFloat($("#approvedIndentValueText").val());
		
		document.getElementById("totalIndentValue").innerHTML = parseFloat(approvedIndentValueText+data);
		document.getElementById("totalIndentValueText").value = parseFloat(approvedIndentValueText+data);
	});

}

function getLastRate(qty,flag) {
	 
	var itemId = $("#item_name").val();
	var totalIndentValueText = parseFloat($("#totalIndentValueText").val());
	$.getJSON('${getLastRate}', {
  
		itemId : itemId,
		flag : flag,
		qty : qty,
		totalIndentValueText : totalIndentValueText,
		ajax : 'true',

	}, function(data) {  
		   
			document.getElementById("totalIndentValue").innerHTML = data;
			document.getElementById("totalIndentValueText").value = data;
		  
	});

}

function getMoqQty() {
	 
	var itemId = $("#item_name").val();
	 
	$.getJSON('${getMoqQtyForValidation}', {
  
		itemId : itemId, 
		ajax : 'true',

	}, function(data) {  
		   
		document.getElementById("moqQtyByItemId").value = data.maxLevel;
			document.getElementById("itemPendingMrnQty").value = data.poPending;
			document.getElementById("itemAvgIssueQty").value = (data.avgIssueQty).toFixed(2);
	});

}

function getItemFroItemListBelowROL()
{
	document.getElementById("minMaxRol1").checked=true;
	var catId = $("#ind_cat").val();  
	  //alert(catId);
	  $
		.getJSON(
				'${getItemFroItemListBelowROL}',

				{
					catId : catId, 
					ajax : 'true'

				},
				function(data) {
					 //alert(data);
					  if (data == "") {
						alert("No records found !!");

					}
					  
					  $('#table_grid1 td').remove();
					  $('#table_grid2 td').remove();
					  $('#table_grid3 td').remove();
					  
					  var i = 1;
					  var j = 1;
					  var k = 1;
				  $.each(
								data,
								function(key, itemList) { 
									
									 
									if(itemList.clsQty<=itemList.minLevel){
										if(itemList.active==0){
										var tr = $('<tr></tr>');
										tr.append($('<td></td>').html('<input type="checkbox" onchange="requiredField('+itemList.itemId+')" name="select_to_approve"'+
												'id="select_to_approve'+itemList.itemId+'" value="'+itemList.itemId+'" >'));
										tr.append($('<td ></td>').html(i));
									  	tr.append($('<td ></td>').html(itemList.itemCode+' '+itemList.itemDesc)); 
									  	tr.append($('<td ></td>').html(itemList.itemUom));
									  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" onchange="checkQty('+itemList.itemId+');" id="qty'+itemList.itemId+'" name="qty'+itemList.itemId+'"   onchange="checkQty('+itemList.itemId+')" class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >'));
									  	tr.append($('<td ></td>').html('<input class="form-control " id="schDate'+itemList.itemId+'"  type="date" name="schDate'+itemList.itemId+'"   />'));
									  	tr.append($('<td style="text-align: right;"></td>').html(itemList.poPending));
									  	tr.append($('<td style="text-align: right;"></td>').html('<input   type="hidden" id="moqQty'+itemList.itemId+'" value='+itemList.itemopQty+' name="moqQty'+itemList.itemId+'" >'+itemList.itemopQty));
									  	tr.append($('<td style="text-align: right;"></td>').html(itemList.minLevel));  
									  	tr.append($('<td style="text-align: right;"></td>').html((itemList.clsQty).toFixed(2))); 
									  	tr.append($('<td style="text-align: right;"></td>').html((itemList.avgIssueQty).toFixed(2)));
										$('#table_grid1 tbody').append(tr); 
										i++;
										}
									}
									if(itemList.clsQty<=itemList.maxLevel && itemList.clsQty>itemList.rolLevel){
										if(itemList.active==0){
										var tr = $('<tr></tr>');
										tr.append($('<td></td>').html('<input type="checkbox" onchange="requiredField('+itemList.itemId+')" name="select_to_approve"'+
												'id="select_to_approve'+itemList.itemId+'" value="'+itemList.itemId+'" >'));
										tr.append($('<td ></td>').html(j));
									  	tr.append($('<td ></td>').html(itemList.itemCode+' '+itemList.itemDesc)); 
									  	tr.append($('<td ></td>').html(itemList.itemUom));
									  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" onchange="checkQty('+itemList.itemId+');" id="qty'+itemList.itemId+'" name="qty'+itemList.itemId+'"   onchange="checkQty('+itemList.itemId+')" class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >'));
									  	tr.append($('<td ></td>').html('<input class="form-control " id="schDate'+itemList.itemId+'"  type="date" name="schDate'+itemList.itemId+'"   />'));
									  	tr.append($('<td style="text-align: right;"></td>').html(itemList.poPending));
									  	tr.append($('<td style="text-align: right;"></td>').html('<input   type="hidden" id="moqQty'+itemList.itemId+'" value='+itemList.itemopQty+' name="moqQty'+itemList.itemId+'" >'+itemList.itemopQty));
									  	tr.append($('<td style="text-align: right;"></td>').html(itemList.maxLevel)); 
									  	tr.append($('<td style="text-align: right;"></td>').html((itemList.clsQty).toFixed(2)));
									  	tr.append($('<td style="text-align: right;"></td>').html((itemList.avgIssueQty).toFixed(2)));
										$('#table_grid2 tbody').append(tr); 
										j++;
										}
									}
									if(itemList.clsQty<=itemList.rolLevel && itemList.clsQty>itemList.minLevel){
										if(itemList.active==0){
										var tr = $('<tr></tr>');
										tr.append($('<td></td>').html('<input type="checkbox" onchange="requiredField('+itemList.itemId+')" name="select_to_approve"'+
												'id="select_to_approve'+itemList.itemId+'" value="'+itemList.itemId+'" >'));
										tr.append($('<td ></td>').html(k));
									  	tr.append($('<td ></td>').html(itemList.itemCode+' '+itemList.itemDesc)); 
									  	tr.append($('<td ></td>').html(itemList.itemUom)); 
									  	tr.append($('<td ></td>').html('<input style="text-align:right; width:100px" type="text" onchange="checkQty('+itemList.itemId+');" id="qty'+itemList.itemId+'" name="qty'+itemList.itemId+'"   onchange="checkQty('+itemList.itemId+')" class="form-control"  pattern="[+-]?([0-9]*[.])?[0-9]+"  >'));
									  	tr.append($('<td ></td>').html('<input class="form-control " id="schDate'+itemList.itemId+'"  type="date" name="schDate'+itemList.itemId+'"   />'));
									  	tr.append($('<td style="text-align: right;"></td>').html(itemList.poPending));
									  	tr.append($('<td style="text-align: right;"></td>').html('<input   type="hidden" id="moqQty'+itemList.itemId+'" value='+itemList.itemopQty+' name="moqQty'+itemList.itemId+'" >'+itemList.itemopQty));
									  	tr.append($('<td style="text-align: right;"></td>').html(itemList.rolLevel));
									  	tr.append($('<td style="text-align: right;"></td>').html((itemList.clsQty).toFixed(2))); 
									  	tr.append($('<td style="text-align: right;"></td>').html((itemList.avgIssueQty).toFixed(2)));
										$('#table_grid3 tbody').append(tr); 
										k++;
										}
									}
										
										  /* $('#ind_cat').prop('disabled', true).trigger("chosen:updated");
										 
										document.getElementById("catId").value = catId;   
										document.getElementById("submitt").disabled=false; */
									 
									
								})  
								 
								 
					
				});
}
</script>
<script> 
var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementById("close");

btn.onclick = function() {
	 
	var catId = $("#ind_cat").val(); 
	
	if(catId=="" || catId==null) {
	 alert("select Category ");
	 
	} else{
		modal.style.display = "block";
		getItemFroItemListBelowROL();
		
	}
    
}

span.onclick = function() {
    modal.style.display = "none"; 
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        
    }  
}
function changeTable(value) {
	 
	if(value==1){
		var x = document.getElementById("itemTable1");
	    x.style.display = "block";
	    var y = document.getElementById("itemTable2");
	    y.style.display = "none";
	    var z = document.getElementById("itemTable3");
	    z.style.display = "none";
	}
	if(value==2){
		var x = document.getElementById("itemTable1");
	    x.style.display = "none";
		var y = document.getElementById("itemTable2");
	    y.style.display = "block";
	    var z = document.getElementById("itemTable3");
	    z.style.display = "none";
	}
	if(value==3){
		var x = document.getElementById("itemTable1");
	    x.style.display = "none";
		var y = document.getElementById("itemTable2");
	    y.style.display = "none";
		var z = document.getElementById("itemTable3"); 
	    z.style.display = "block";
	}
}
function checkQty(key)
{
	var itemQty = parseFloat($("#qty"+key).val()); 
	var moqQty = parseFloat($("#moqQty"+key).val()); 
	
	if(itemQty==0 || itemQty=="" )
	{
		document.getElementById("qty"+key).value=""; 
		alert("Enter Greater Than 0 ");
		document.getElementById("select_to_approve"+key).checked=false;  
	}
	else{
		/* var rem=itemQty%moqQty;
		 if(rem!=0){
			 alert("Enter Multiple of "+ moqQty +" Qty ");
			 document.getElementById("qty"+key).value=moqQty; 
		 } */
		
		document.getElementById("select_to_approve"+key).checked=true;  
	}
	 
	requiredField(key);
}
function requiredField(key)
{
	 
	if(document.getElementById("select_to_approve"+key).checked == true)
	{
		document.getElementById("qty"+key).required=true; 
		document.getElementById("schDate"+key).required=true; 
	} 
	else
	{
		document.getElementById("qty"+key).required=false; 
		document.getElementById("schDate"+key).required=false; 
	}
	
	 
} 
</script>
<script type="text/javascript">
function getValue()
{
	
	if(document.getElementById("ind_cat").value==""){
		document.getElementById("catIdTemp").value=0;
	}
	else{
		document.getElementById("catIdTemp").value=document.getElementById("ind_cat").value;
	}
	 
	document.getElementById("accHeadTemp").value=document.getElementById("acc_head").value;
	document.getElementById("indHeaderRemarkTemp").value=document.getElementById("indHeaderRemark").value;
	document.getElementById("indentDateTemp").value=document.getElementById("indent_date").value;
	document.getElementById("indentTypeTemp").value=document.getElementById("indent_type").value; 
	document.getElementById("indentNoTemp").value=document.getElementById("indent_no").value;
	
} 
/* function addItemFromItemList() {
	  
	 
	var inputElements = document.getElementsByName('select_to_approve');
 
	 var ids = "";
	  for(var i=0; i < inputElements.length; i++){
	        if(inputElements[i].checked){ 
	            if(ids==""){
	            	ids = inputElements[i].value;
	            }else{
	            	ids = ids+","+inputElements[i].value;
	            }
	           
	           
	        }
	       
	} 
	   alert(ids)
	  $.getJSON(
				'${addItemFromItemListInIndent}',

				{
					ids : ids, 
					ajax : 'true'

				},
				function(data) {
					 //alert(data);
					  if (data == "") {
						alert("No records found !!");

					} 
					
				});
	 
} */

function exportExcel()
{
	
	var catId = $("#ind_cat").val(); 
	var typeId = $("#indent_type").val(); 
	  //alert(catId);
	  $
		.getJSON(
				'${exportExcelforIndent}',

				{
					catId : catId,
					typeId : typeId,
					ajax : 'true'

				},
				function(data) {
					 //alert(data);
					  if (data == "") {
						alert("No records found !!");

					}
					 
					  $('#table1 td').remove();
				  $.each(
								data,
								function(key, trans) {
								//alert(itemList.indDetailId);
									
									 
									try {
										 
										var tr = $('<tr></tr>');
										tr.append($('<td class="col-sm-1" ></td>').html(key+1));
									  	tr.append($('<td class="col-md-1" ></td>').html(trans.itemCode));
									  	tr.append($('<td class="col-md-4" ></td>').html(trans.itemName));
									  	tr.append($('<td class="col-md-1" ></td>').html(trans.uom));
									  	tr.append($('<td class="col-md-1" ></td>').html(trans.curStock));

									  	tr.append($('<td class="col-md-1" ></td>').html(trans.qty)); 
									  	tr.append($('<td class="col-md-1" ></td>').html(trans.date));
									  	 
									  	 
									  	tr
										.append($(
												'<td class="col-md-1" style="text-align: center;"></td>')
												.html(
														"<a href='#' class='action_btn'onclick=deleteIndentItem("+trans.itemId+","+key+")><abbr title='Delete'><i class='fa fa-trash-o  fa-lg'></i></abbr></a>"));
									  	
										$('#table1 tbody').append(tr); 
										  $('#ind_cat').prop('disabled', true).trigger("chosen:updated");
										 
										document.getElementById("catId").value = catId;   
										document.getElementById("submitt").disabled=false;
									}
									catch(err) {
									    
									}
								  	
								})  
								
							 
					
				});
}
</script>
</body>
</html>

