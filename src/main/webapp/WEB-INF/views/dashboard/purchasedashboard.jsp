<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>MONGINIS</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<!--base css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">

<!--page specific css styles-->

<!--flaty css styles-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaty.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaty-responsive.css">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/monginislogo.jpg" type="image/x-icon" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.buttonload {
    background-color: #fdf3e5; /* Green background */
    border: none; /* Remove borders */
    color: #ec268f; /* White text */
    padding: 12px 20px; /* Some padding */
    font-size: 15px; /* Set a font-size */
    display:none;
}
</style>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Roboto');

body{
  font-family: 'Roboto', sans-serif;
}

h2{
  margin:0px;
  text-transform: uppercase;
}

h6{
  margin:0px;
  color:#777;
}

.wrapper{
 /*  text-align:center;
  margin:50px auto; */
}

.tabs1{
 /*  margin-top:50px; */
  font-size:13px;
  padding:0px;
  list-style:none;
  background:#fff;
  box-shadow:0px 5px 20px rgba(0,0,0,0.1);
  display:inline-block;
  border-radius:50px;
  position:relative;
}

.tabs1 a{
  text-decoration:none;
  color: #777;
  text-transform:uppercase;
  padding:10px 20px;
  display:inline-block;
  position:relative;
  z-index:1;
  transition-duration:0.6s;
}

.tabs1 a.active{
  color:#fff;
}

.tabs1 a i{
  margin-right:5px;
}

.tabs1 .selector1{
  height:100%;
  display:inline-block;
  position:absolute;
  left:0px;
  top:0px;
  z-index:1;
  border-radius:50px;
  transition-duration:0.6s;
  transition-timing-function: cubic-bezier(0.68, -0.55, 0.265, 1.55);
  
  background: #05abe0;
  background: -moz-linear-gradient(45deg, #05abe0 0%, #8200f4 100%);
  background: -webkit-linear-gradient(45deg, #05abe0 0%,#8200f4 100%);
  background: linear-gradient(45deg, #058fe0 0%,#8c8537 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#05abe0', endColorstr='#8200f4',GradientType=1 );
}

</style>
<style type="text/css">
.tabs2{
 /*  margin-top:50px; */
  font-size:12px;
  padding:0px;
  list-style:none;
  background:#fff;
  box-shadow:0px 5px 20px rgba(0,0,0,0.1);
  display:inline-block;
  border-radius:50px;
  position:relative;
}

.tabs2 a{
  text-decoration:none;
  color: #777;
  text-transform:uppercase;
  padding:10px 20px;
  display:inline-block;
  position:relative;
  z-index:1;
  transition-duration:0.6s;
}

.tabs2 a.active{
  color:#fff;
}

.tabs2 a i{
  margin-right:5px;
}

.tabs2 .selector2{
  height:100%;
  display:inline-block;
  position:absolute;
  left:0px;
  top:0px;
  z-index:1;
  border-radius:50px;
  transition-duration:0.6s;
  transition-timing-function: cubic-bezier(0.68, -0.55, 0.265, 1.55);
  
  background: #05abe0;
  background: -moz-linear-gradient(45deg, #05abe0 0%, #8200f4 100%);
  background: -webkit-linear-gradient(45deg, #05abe0 0%,#8200f4 100%);
  background: linear-gradient(45deg, #050ce0 0%,#f45a00 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#05abe0', endColorstr='#8200f4',GradientType=1 );
}
</style>
</head>
<body>
     <c:url var="getPoListRes" value="/getPoListRes"></c:url>
     <c:url var="consumptionIssueReportCategoryWise" value="/consumptionIssueReportCategoryWise"></c:url>
     <c:url var="consumptionMrnReportCategoryWise" value="/consumptionMrnReportCategoryWise"></c:url>
     
      <c:url var="consumptionMrnReportCategoryWiseExel" value="/consumptionMrnReportCategoryWiseExel"></c:url>
       <c:url var="consumptionIssueReportCategoryWiseExel" value="/consumptionIssueReportCategoryWiseExel"></c:url>
<c:url var="listMrnConsumptionGraph" value="/listMrnConsumptionGraph"></c:url>
<c:url var="listIssueConsumptionGraph" value="/listIssueConsumptionGraph"></c:url>
	<!-- BEGIN Container -->
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
			<!-- <div class="page-title">
				<div>
					<h5>
						<i class="fa fa-file-o"></i> Dashboard
					</h5>
					
				</div>
			</div>  -->
			<!-- END Page Title -->

			<!-- BEGIN Breadcrumb -->
			<!-- <div id="breadcrumbs">
				<ul class="breadcrumb">
					<li class="active"><i class="fa fa-home"></i> Home</li>
				</ul>
			</div> -->
			<!-- END Breadcrumb -->
<div class="container"> 
<div class="wrapper">
 
  <nav class="tabs1">
    <div class="selector1"></div>
    <a href="#" class="active" onclick="enableDiv(1)" ><i class="fa fa-shopping-cart "></i>Indent Pending</a>
    <a href="#"  onclick="enableDiv(2)" ><i class="fa fa-question-circle"></i>Pending MRN</a>
    <a href="#" onclick="enableDiv(3)"><i class="fa fa-file-pdf-o" ></i>Receipt  Valuation  </a>
       <a href="#" onclick="enableDiv(4)"><i class="fa fa-file-pdf-o" ></i>Issue  Valuation </a>
    <!-- <a href="#"><i class="fab fa-superpowers"></i>Black Panther</a> -->
  </nav>
</div>
<div id="poPending">
<br><div class="col-md-1"></div>
<div class="wrapper">
 
  <nav class="tabs2">
    <div class="selector2"></div>
    <a href="#" class="active" onclick="enableDiv1(1)" ><i class="fa fa-question-circle"></i>For PO</a>
    <a href="#"  onclick="enableDiv1(2)" ><i class="fa fa-question-circle"></i>Partial PO </a>
    <a href="#" onclick="enableDiv1(3)"><i class="fa fa-question-circle" ></i>Enquiry</a>
    <!-- <a href="#"><i class="fab fa-superpowers"></i>Black Panther</a> -->
  </nav>
</div>
   <br>  <div id="tabBody0" >
                        	<div class="row">
                            	
                                <div class="col-md-12">
                        		<div class="box" id="todayslist">
							<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Pending PO 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem">
									</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
								<div class="box-content">

					
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">  
									<thead>
										<tr class="bgpink">
											<th class="col-sm-1">Sr No</th>
											<th class="col-md-1">Indent No.</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Category</th>
											<th class="col-md-1">Indent Type</th>
											<th class="col-md-1">Account Head</th>
											<th class="col-md-1">Is Monthly</th>
											<th class="col-md-1">Status</th>
											 <th class="col-md-1">Action</th> 
										</tr>
									</thead>
									<tbody>

									<c:forEach items="${indentListRes1}" var="indent" varStatus="count">
											<tr>
												<td class="col-sm-1"><c:out value="${count.index+1}" /></td>
												<td class="col-md-2"><c:out value="${indent.indMNo}" /></td>
												<td class="col-md-2"><c:out value="${indent.indMDate}" /></td>
												<td class="col-md-1"><c:out value="${indent.catDesc}" /></td>
												<td class="col-md-1">
												<c:forEach items="${typeList}" var="typeList" >
													<c:choose>
														<c:when test="${indent.indMType==typeList.typeId}">
														${typeList.typeName}
														</c:when>
													</c:choose>
												</c:forEach>
												</td>
 												<td class="col-md-1"><c:out value="${indent.accountHead}" /></td>
 												<td class="col-md-1" style="color: red;">
 												<c:choose><c:when test="${indent.indIsmonthly==1}">YES</c:when><c:when test="${indent.indIsmonthly==0}">NO</c:when></c:choose></td>
 												<td class="col-md-1"><c:out value="Pending" /></td>
										       <%--  <td class="col-md-1">
										        <c:choose>
										        <c:when test="${indent.indDStatus==0}">
										          <c:out value="Pending"/>
										        </c:when>
										       <c:otherwise>
										        <c:out value="closed"/>
										       </c:otherwise>
										        </c:choose>
										      </td> --%>
											<td><a href="${pageContext.request.contextPath}/addPurchaseOrderFromDashboard/${indent.indMId}/${indent.indMType}">PO </a> </td>
										
											</tr>
										</c:forEach>

										</tbody>

								</table>
  
					</div>
				</div>
							 


						</div>
					
						  </div>
                                
                            </div>
                        </div>
                                 
                              <div class="row" id="tabBody1" style="display: none;">
                        <div class="col-md-12">
                        
                        			<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Partial PO 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem">
									</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
 
					<div class="box-content">

					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 1px;border: 1px Solid lightblue;">
						<table class="table table-advance" id="table1">  
									<thead>
										<tr class="bgpink">
										    <th class="col-sm-1">Sr No</th>
											<th class="col-md-1">Indent No.</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Category</th>
											<th class="col-md-1">Indent Type</th>
											<th class="col-md-1">Account Head</th>
											<th class="col-md-1">Is Monthly</th>
											<th class="col-md-1">Status</th>
											 <th class="col-md-1">Action</th> 
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${indentListRes2}" var="indent" varStatus="count">
											<tr>
												<td class="col-sm-1"><c:out value="${count.index+1}" /></td>
												<td class="col-md-2"><c:out value="${indent.indMNo}" /></td>
												<td class="col-md-2"><c:out value="${indent.indMDate}" /></td>
												<td class="col-md-1"><c:out value="${indent.catDesc}" /></td>
												<td class="col-md-1"> 
												<c:forEach items="${typeList}" var="typeList" >
													<c:choose>
														<c:when test="${indent.indMType==typeList.typeId}">
														${typeList.typeName}
														</c:when>
													</c:choose>
												</c:forEach>
												</td>
 												<td class="col-md-1"><c:out value="${indent.accountHead}" /></td>
 												<td class="col-md-1">
 												<c:choose><c:when test="${indent.indIsmonthly==1}">YES</c:when><c:when test="${indent.indIsmonthly==0}">NO</c:when></c:choose></td>
 												<td class="col-md-1"><c:out value="Pending" /></td>
										       
											<td><a href="${pageContext.request.contextPath}/addPurchaseOrderFromDashboard/${indent.indMId}/${indent.indMType}">PO </a> </td>
											</tr>
										</c:forEach>
										</tbody>

								</table>
  
					</div>
				</div>
							 


						</div>
                                </div>
                            </div>
                
                    <div class="row" id="tabBody2" style="display: none;">
                        <div class="col-md-12">
                      
                        			<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Enquiry
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem">
									</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
 
								<div class="box-content">

					
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 1px; ">
						<table class="table table-advance" id="mrnTable" >  
									<thead>
										<tr class="bgpink">
										  <th class="col-sm-1">Sr No</th>
											<th class="col-md-1">Enquiry No.</th>
												<th class="col-md-1">Indent No</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Vendor Name</th>
											<th class="col-md-1">Vendor Code</th>
										<!-- 	<th class="col-md-1">Account Head</th>
											<th class="col-md-1">Is Monthly</th> -->
											<th class="col-md-1">Status</th>
											 <th class="col-md-1">Action</th> 
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${indentListRes3}" var="enq" varStatus="count">
											<tr>
											<td class="col-sm-1"><c:out value="${count.index+1}" /></td>
												<td class="col-md-2"><c:out value="${enq.enqNo}" /></td>
												<td class="col-md-2"><c:out value="${enq.indNo}" /></td>
												<td class="col-md-2"><c:out value="${enq.enqDate}" /></td>
												<td class="col-md-1"><c:out value="${enq.vendorName}" /></td>
												<td class="col-md-1"><c:out value="${enq.vendorCode}" /></td>
 											
 												<td class="col-md-1"><c:out value="Pending" /></td>        
												<td><a>PO </a><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span></td>
										
											</tr>
										</c:forEach>

										</tbody>

								</table>
  
					</div>
				</div>
						</div>
                                </div>
                            </div>
                  
    </div><br>
    <div id="mrnPending" style="display: none;">
      <div class="row">
                        <div class="col-md-12">
                      <div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Pending MRN
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem">
									</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
				<div class="box-content">
					<div class="clearfix"></div>
					<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label>
					<div class="table-responsive" style="border: 1px; ">
						<table class="table table-advance" id="mrnTable1" >  
									<thead>
													<tr class="bgpink">
											<th class="col-sm-1">Sr No</th>
											<th class="col-md-1">Indent No</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Vendor Name</th>
											<th class="col-md-1">PO No.</th>
											<th class="col-md-1">PO Date</th>
											 <th class="col-md-1">PO Type</th> 
											 <th class="col-md-1">PO Status</th> 
											 <th class="col-md-1">Action</th> 
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${headerList}" var="indent" varStatus="count">
											<tr>
											<td class="col-sm-1"><c:out value="${count.index+1}" /></td>
												<td class="col-md-1"><c:out value="${indent.indNo}" /></td>
												<td class="col-md-1"><c:out value="${indent.indDate}" /></td>
												<td class="col-md-2"><c:out value="${indent.vendorCode}" /></td>
												<td class="col-md-1"><c:out value="${indent.poNo}" /></td>
												<td class="col-md-1"><c:out value="${indent.poDate}" /></td>
												<td class="col-md-1"> <c:out value="${indent.typeName}" /></td>
												<td class="col-md-1"><c:choose><c:when test="${indent.poStatus==0}">Pending For MRN</c:when><c:when test="${indent.poStatus==1}">Partially MRN</c:when></c:choose></td>
												<td><a>Detail </a><span style="visibility: hidden;" class="glyphicon glyphicon-list" onclick="submit('+key+');" id="ok'+key+'"></span></td>
										
											</tr>
										</c:forEach>

										</tbody>

								</table>
  
					</div>
					
				</div>
						</div>
                                </div>
                            </div>
    </div>
    <div id="consumptionReport" style="display: none;">
      <div class="row">
                        <div class="col-md-12">
                      <div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Receipt Valuation
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem">
									</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
				<div class="box-content">
				<div class="box-content">
							
								<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input id="fromDate" class="form-control date-picker"  value="${fromDate}" name="fromDate" type="date"  >


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date</div>
									<div class="col-md-3">
										<input id="toDate" class="form-control date-picker"  value="${toDate}"  name="toDate" type="date"  >


									</div>
								
				 
							</div><br><br>
							
							<div class="row">
							<div class="col-md-12" style="text-align: center">
									  <input type="button" class="btn btn-primary"
										value="Submit" onclick="search()">  
										 <input type="button" value="PDF" class="btn btn-primary"
													onclick="genMrnPdf()" />&nbsp;
											 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportMrnExcel();" >
										 <input type="button" class="btn btn-primary" onclick="showChart()"  value="Graph">  
								</div>
							</div>
							<div align="center" id="loader" style="display: none">

								<span>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>
							<br>
							<br>
					<div class="clearfix"></div>
					<div style="overflow:scroll;height:100%;width:100%;overflow:auto" id="tbl">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%" id="table_grid"> 
									<thead>
									<tr class="bgpink">
										  <th style="width: 2%;"></th>
											<th class="col-md-1"></th>
												<c:forEach items="${categoryList}" var="category" varStatus="count">
											<th class="col-md-1" colspan="2" style="text-align: center">${category.catDesc}</th>
											</c:forEach>
										</tr>
										<tr class="bgpink">
										  <th style="width: 2%;">Sr No</th>
											<th class="col-md-1">Type</th>
												<c:forEach items="${categoryList}" var="category" varStatus="count">
											
											<th class="col-md-1" style="text-align: center;">Monthly</th>
											<th class="col-md-1" style="text-align: center">YTD</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
                                    <c:set var="sr" value="0"> </c:set>
								<c:forEach items="${mrnReportList}" var="mrnReportList" varStatus="count">
								 
											<tr>
											
												 
												<td  style="width: 2%;"><c:out value="${sr+1}" /></td> 
												<c:set var="sr" value="${sr+1}" ></c:set>


												<td  ><c:out value="${mrnReportList.typeName}" /></td>
												 <c:forEach items="${mrnReportList.consumptionReportList}" var="consumptionReportList" varStatus="count">
												 <td  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${consumptionReportList.monthlyValue}"/> </td>
												 <td  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${consumptionReportList.ytd}"/> </td>
												 
												 </c:forEach>
												 
											</tr>
											 
										</c:forEach>
										</tbody>

								</table>
  
					</div>
					
					<div id="chart" style="display: none"><br> <hr>
		<div id="chart_div" style="width:100%; height:500px" align="center"></div>
		
			<div   id="PiechartApr" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartMay" style="width:33.33%; height:300; float: Left;" ></div>  
			<div   id="PiechartJun" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartJul" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartAug" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartSep" style="width:33.33%; height:300; float: Left;" ></div>
				 <br> <br> <br> <br> <br> <br> <br>  <br> <br> <br> <br> <br> <br> <br> 
				</div>
				</div>
						</div>
                                </div>
                            </div>
    </div>
   <!-- **************************************************************************************************** -->
     <div id="consumptionReportIssue" style="display: none;">
      <div class="row">
                        <div class="col-md-12">
                      <div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Issue Valuation
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem">
									</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
				<div class="box-content">
				<div class="box-content">
							
								<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input id="fromDate1" class="form-control date-picker"  value="${fromDate}" name="fromDate1" type="date"  >


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date</div>
									<div class="col-md-3">
										<input id="toDate1" class="form-control date-picker"  value="${toDate}"  name="toDate1" type="date"  >


									</div>
								
				 
							</div><br><br>
							<div align="center" id="loader" style="display: none">

								<span>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>
							<div class="row">
							<div class="col-md-12" style="text-align: center">
									  <input type="button" class="btn btn-primary"
										value="Submit" onclick="searchIssueData()"> 
										<input type="button" value="PDF" class="btn btn-primary"
													onclick="genIssuePdf()" />&nbsp;
											 <input type="button" id="expExcel1" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportIssueExcel();" >
											  <input type="button" class="btn btn-primary" onclick="showChart1()"  value="Graph">  
										 
								</div>
							</div>
							<div align="center" id="loader1" style="display: none">

								<span>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>
							<br>
							<br>
					<div class="clearfix"></div>
					<div style="overflow:scroll;height:100%;width:100%;overflow:auto" id="tbl1">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%" id="table_grid1"> 
									<thead>
									<tr class="bgpink">
										  <th style="width: 2%;"></th>
											<th class="col-md-1"></th>
												<c:forEach items="${categoryList}" var="category" varStatus="count">
											<th class="col-md-1" colspan="2" style="text-align: center;">${category.catDesc}</th>
											</c:forEach>
										</tr>
										<tr class="bgpink">
										  <th style="width: 2%;">Sr No</th>
											<th class="col-md-1">Type</th>
												<c:forEach items="${categoryList}" var="category" varStatus="count">
											
											<th class="col-md-1" style="text-align: center;">Monthly</th>
											<th class="col-md-1" style="text-align: center;">YTD</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
									<c:set var="sr" value="0" ></c:set>
                                     <c:forEach items="${issueReportList}" var="issueReportList" varStatus="count">
								 
											<tr>
											
												 
												<td  style="width: 2%;"><c:out value="${sr+1}" /></td> 
												<c:set var="sr" value="${sr+1}" ></c:set>


												<td  ><c:out value="${issueReportList.typeName}" /></td>
												 <c:forEach items="${issueReportList.consumptionReportList}" var="consumptionReportList" varStatus="count">
												 <td  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${consumptionReportList.monthlyValue}"/> </td>
												 <td  style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value ="${consumptionReportList.ytd}"/> </td>
												 
												 </c:forEach>
												 
											</tr>
											 
										</c:forEach>
										</tbody>

								</table>
  
					</div>
					<div id="chart1" style="display: none"><br> <hr>
		<div id="chart_div1" style="width:100%; height:500px" align="center"></div>
		
			<div   id="PiechartApr1" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartMay1" style="width:33.33%; height:300; float: Left;" ></div>  
			<div   id="PiechartJun1" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartJul1" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartAug1" style="width:33.33%; height:300; float: Left;" ></div>
			<div   id="PiechartSep1" style="width:33.33%; height:300; float: Left;" ></div>
				 <br> <br> <br> <br> <br> <br> <br>  <br> <br> <br> <br> <br> <br> <br> 
				</div>
				</div>
						</div>
                                </div>
                            </div>
    </div>
</div>
<br>
		


			<footer>
	<p>2019 © MONGINIS</p>
	</footer>

			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>

		</div>
		<!-- END Content -->
	</div>
	<!-- END Container -->
	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')</script>
	<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<!--page specific plugin scripts-->
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		 
function showChart(){
		
		document.getElementById('chart').style.display = "block";
		   document.getElementById("tbl").style="display:none";
		 
				$.getJSON('${listMrnConsumptionGraph}',{
					
									 
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
									
									 function drawStuff() {
										  
									   var chartDiv = document.getElementById('chart_div');
									   document.getElementById("chart_div").style.border = "thin dotted red";
								       var dataTable = new google.visualization.DataTable();
								       
								       dataTable.addColumn('string', 'TYPE'); // Implicit domain column.
									     
								       for(var i=0; i <data[0].consumptionReportList.length ;i++){
								    	   
								    	   dataTable.addColumn('number', data[0].consumptionReportList[i].catDesc);
								       }
									       
								       for(var i = 0 ; i<data.length ;i++){
								        	 var arry=[];
								        	
								        	 arry.push(data[i].typeName);
								        	   
								        	 
								    	   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
								    		    
								    				   arry.push(data[i].consumptionReportList[j].monthlyValue); 
								    		   
								    	   }
								    	    
								    	     var fin='[[';
								    	   
								    	   for(var k=0 ; k<arry.length; k++){
								    		   
								    		   if(k==0){ 
								    			   fin=fin+'"'+arry[k]+'"'+','; 
								    		   }
								    		   else{
								    			   
								    			   fin=fin+arry[k]+',';
								    		   }
								    		   
								    	   }
								    	   
								    	   fin= fin.substring(0,fin.length-1);
								    	   fin=fin+']]'
								    	    
								    	    
								    	   
								    	    /*  dataTable.addRows([
												 
									             [arry[0],arry[1],arry[2],arry[3],arry[4],arry[5],arry[6], ]
									           
									           ]); */ 
									           var stringData = fin; 
								    	   dataTable.addRows(JSON.parse(stringData));  
								    	    
								       } 
								        
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
								       
								       function drawAprValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==1){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'ENGINEERING CONSUMABLE',
							                       'width':350,
							                       'height':250,
							                       'is3D':true};
											   document.getElementById("PiechartApr").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartApr'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawCapitalValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==2){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'CAPITAL ITEM',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartMay").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartMay'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawAmcValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==3){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'AMC',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartJun").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartJun'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawJobWorkValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==4){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'JOBWORK',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartJul").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartJul'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawOtherValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==5){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'OTHER',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartAug").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartAug'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawGeneralValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==6){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'GENERAL PURCHASE',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartSep").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartSep'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       drawMaterialChart();
								       google.charts.setOnLoadCallback(drawAprValueChart);
								       google.charts.setOnLoadCallback(drawCapitalValueChart);
								       google.charts.setOnLoadCallback(drawAmcValueChart);
								       google.charts.setOnLoadCallback(drawJobWorkValueChart);
								       google.charts.setOnLoadCallback(drawOtherValueChart);
								       google.charts.setOnLoadCallback(drawGeneralValueChart);
									 };
									  
							  	});
			 
}
	</script>
	
		<script type="text/javascript">
		 
function showChart1(){
		
		document.getElementById('chart1').style.display = "block";
		   document.getElementById("tbl1").style="display:none";
		 
				$.getJSON('${listIssueConsumptionGraph}',{
					
									 
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
									
									 function drawStuff() {
										  
									   var chartDiv = document.getElementById('chart_div1');
									   document.getElementById("chart_div1").style.border = "thin dotted red";
								       var dataTable = new google.visualization.DataTable();
								       
								       dataTable.addColumn('string', 'TYPE'); // Implicit domain column.
									     
								       for(var i=0; i <data[0].consumptionReportList.length ;i++){
								    	   
								    	   dataTable.addColumn('number', data[0].consumptionReportList[i].catDesc);
								       }
									       
								       for(var i = 0 ; i<data.length ;i++){
								        	 var arry=[];
								        	
								        	 arry.push(data[i].typeName);
								        	   
								        	 
								    	   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
								    		    
								    				   arry.push(data[i].consumptionReportList[j].monthlyValue); 
								    		   
								    	   }
								    	    
										var fin='[[';
								    	   
								    	   for(var k=0 ; k<arry.length; k++){
								    		   
								    		   if(k==0){ 
								    			   fin=fin+'"'+arry[k]+'"'+','; 
								    		   }
								    		   else{
								    			   
								    			   fin=fin+arry[k]+',';
								    		   }
								    		   
								    	   }
								    	   
								    	   fin= fin.substring(0,fin.length-1);
								    	   fin=fin+']]'
								    	     
								    	   
								    	    /*  dataTable.addRows([
												 
									             [arry[0],arry[1],arry[2],arry[3],arry[4],arry[5],arry[6], ]
									           
									           ]); */ 
									           var stringData = fin; 
								    	   dataTable.addRows(JSON.parse(stringData));  
								    	    
								       } 
								        
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
								       
								       function drawAprValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==1){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'ENGINEERING CONSUMABLE',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartApr1").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartApr1'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawCapitalValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==2){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'CAPITAL ITEM',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartMay1").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartMay1'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawAmcValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==3){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'AMC',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartJun1").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartJun1'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawJobWorkValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==4){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'JOBWORK',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartJul1").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartJul1'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawOtherValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==5){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'OTHER',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartAug1").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartAug1'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawGeneralValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'TYPE');
											 dataTable.addColumn('number', 'MONTHWISE VALUE');
									
											 
											 for(var i = 0 ; i<data.length ;i++){
												 
												 if(data[i].typeId==6){
													  
									    		   for(var j=0 ; j<data[i].consumptionReportList.length ;j++){
										    		     
									    		   var arry=[];
										        	 var monthlyValue=0; 
										        	 arry.push(data[i].consumptionReportList[j].catDesc); 
										        	 monthlyValue=monthlyValue+data[i].consumptionReportList[j].monthlyValue;
									    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
									    				    
									    				   dataTable.addRows([
																 
													             [arry[0],monthlyValue,]
													           
													           ]);
									    			   } 
									    	   }
									    	    
									       }  
											    
										 var options = {'title':'GENERAL PURCHASE',
							                       'width':350,
							                       'height':250,'is3D':true};
											   document.getElementById("PiechartSep1").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartSep1'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       drawMaterialChart();
								       google.charts.setOnLoadCallback(drawAprValueChart);
								       google.charts.setOnLoadCallback(drawCapitalValueChart);
								       google.charts.setOnLoadCallback(drawAmcValueChart);
								       google.charts.setOnLoadCallback(drawJobWorkValueChart);
								       google.charts.setOnLoadCallback(drawOtherValueChart);
								       google.charts.setOnLoadCallback(drawGeneralValueChart);
									 };
									  
							  	});
			 
}
	</script>
	
<script type="text/javascript">

$(document).ready(function() {
  

	  
    var numItems = $('li.fancyTab').length;
		
	
			  if (numItems == 12){
					$("li.fancyTab").width('8.3%');
				}
			  if (numItems == 11){
					$("li.fancyTab").width('9%');
				}
			  if (numItems == 10){
					$("li.fancyTab").width('10%');
				}
			  if (numItems == 9){
					$("li.fancyTab").width('11.1%');
				}
			  if (numItems == 8){
					$("li.fancyTab").width('12.5%');
				}
			  if (numItems == 7){
					$("li.fancyTab").width('14.2%');
				}
			  if (numItems == 6){
					$("li.fancyTab").width('16.666666666666667%');
				}
			  if (numItems == 5){
					$("li.fancyTab").width('20%');
				}
			  if (numItems == 4){
					$("li.fancyTab").width('25%');
				}
			  if (numItems == 3){
					$("li.fancyTab").width('33.3%');
				}
			  if (numItems == 2){
					$("li.fancyTab").width('50%');
				}
		  
	 

	
		});

$(window).load(function() {

  $('.fancyTabs').each(function() {

    var highestBox = 0;
    $('.fancyTab a', this).each(function() {

      if ($(this).height() > highestBox)
        highestBox = $(this).height();
    });

    $('.fancyTab a', this).height(highestBox);

  });
});


</script>
<script type="text/javascript">

function genMrnPdf(){
	var fromDate = $("#fromDate").val();
	var toDate = $("#toDate").val();
	window.open('${pageContext.request.contextPath}/consumptionMrnReportCategoryWisePdf/'+fromDate+'/'+toDate);
}

function genIssuePdf(){
	var fromDate = $("#fromDate1").val();
	var toDate = $("#toDate1").val();
	window.open('${pageContext.request.contextPath}/consumptionIssueReportCategoryWisePdf/'+fromDate+'/'+toDate);
}
function exportToExcel()
{
	window.open("${pageContext.request.contextPath}/exportToExcel");
	
}

 
function exportMrnExcel()
{
	$ .getJSON(
			'${consumptionMrnReportCategoryWiseExel}',

			{
				  
				ajax : 'true'

			},
			function(data) {
				document.getElementById("expExcel").disabled=true;
				exportToExcel();
 
			});
}

function exportIssueExcel()
{
	$ .getJSON(
			'${consumptionIssueReportCategoryWiseExel}',

			{
				  
				ajax : 'true'

			},
			function(data) {
				document.getElementById("expExcel1").disabled=true;
				exportToExcel();
 
			});
}

function search() {
	  
	
	var fromDate = $("#fromDate").val();
	var toDate = $("#toDate").val();
	
	if(fromDate=="" || fromDate == null){
		alert("Select From Date");
	}
	else if (toDate=="" || toDate == null){
		alert("Select To Date");
	}
	else{
		document.getElementById('chart').style.display = "display:none";
		   document.getElementById("tbl").style="block";
	$('#loader').show();

	$
			.getJSON(
					'${consumptionMrnReportCategoryWise}',

					{
						 
						fromDate : fromDate,
						toDate : toDate, 
						ajax : 'true'

					},
					function(data) {

						$('#table_grid td').remove();
						$('#loader').hide();

						if (data == "") {
							alert("No records found !!");

						}
					 
						document.getElementById("expExcel").disabled=false;
					  $.each(
									data,
									function(key, itemList) {
									

										var tr = $('<tr></tr>');
										  
									  	tr.append($('<td></td>').html(key+1));
									  	tr.append($('<td></td>').html(itemList.typeName));
									  	
									  	for(var i=0 ; i<itemList.consumptionReportList.length ;i++){
									  		
									  		tr.append($('<td style="text-align: right;"></td>').html((itemList.consumptionReportList[i].monthlyValue).toFixed(2)));
									  		tr.append($('<td style="text-align: right;"></td>').html((itemList.consumptionReportList[i].ytd).toFixed(2)));
									  		
									  	}
									   
									  	
									    $('#table_grid tbody').append(tr); 
									})  
									
						 
					}); 
	}
}

function searchIssueData() {
	  
	
	var fromDate = $("#fromDate1").val();
	var toDate = $("#toDate1").val();
	
	if(fromDate=="" || fromDate == null){
		alert("Select From Date");
	}
	else if (toDate=="" || toDate == null){
		alert("Select To Date");
	}
	else{
		document.getElementById('chart1').style.display = "display:none";
		   document.getElementById("tbl1").style="block";
	$('#loader1').show();

	$
			.getJSON(
					'${consumptionIssueReportCategoryWise}',

					{
						 
						fromDate : fromDate,
						toDate : toDate, 
						ajax : 'true'

					},
					function(data) {

						$('#table_grid1 td').remove();
						$('#loader1').hide();

						if (data == "") {
							alert("No records found !!");

						}
					 
						document.getElementById("expExcel1").disabled=false;
					  $.each(
									data,
									function(key, itemList) {
									

										var tr = $('<tr></tr>');
										  
									  	tr.append($('<td></td>').html(key+1));
									  	tr.append($('<td></td>').html(itemList.typeName));
									  	
									  	for(var i=0 ; i<itemList.consumptionReportList.length ;i++){
									  		
									  		tr.append($('<td style="text-align: right;"></td>').html((itemList.consumptionReportList[i].monthlyValue).toFixed(2)));
									  		tr.append($('<td style="text-align: right;"></td>').html((itemList.consumptionReportList[i].ytd).toFixed(2)));
									  		
									  	}
									   
									  	
									    $('#table_grid1 tbody').append(tr); 
									})  
									
						 
					}); 
	}
}
function getPoList() {
	  
		var poType = $("#poType").val();
		var status = $("#status").val();
		$('#loader').show();

		$.getJSON('${getPoListRes}',
                     {
			                poType : poType,
							status : status,
							ajax : 'true'

						},
						function(data) {
							
							$('#mrnTable td').remove();
							$('#loader').hide();

							if (data == "") {
								alert("No records found !!");

							}
						  $.each(data,
										function(key, poList) {
							  
											var tr = $('<tr></tr>'); 
										  	tr.append($('<td></td>').html(key+1)); 
										  	tr.append($('<td></td>').html(poList.indNo)); 
										  	tr.append($('<td></td>').html(poList.indDate));
										  	tr.append($('<td></td>').html(poList.poNo));
										 	tr.append($('<td></td>').html(poList.poDate));
										 	var poType;
										 	if(poList.poType==1)
										 		{
										 		poType="Regular";
										 		}
										 	else if(poList.poType==2)
										 		{
										 		poType="Job Work";
										 		}
											else if(poList.poType==3)
									 		{
												poType="General";
									 		}
										 	var poStatus;
										 	if(poList.poStatus==0)
										 		{
										 		poStatus="All";
										 		}
										 	else if(poList.poStatus==1)
										 		{
										 		poStatus="Open";
										 		}
										 	else if(poList.poStatus==2)
									 		{
										 		poStatus="Partial Pending";
									 		}
										 	tr.append($('<td></td>').html(poType));
										 	tr.append($('<td></td>').html(poStatus));
										  	tr.append($('<td></td>').html('<span class="glyphicon glyphicon-edit" id="edit'+key+'" onclick="edit('+key+');"> </span><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span><span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span>'));
										    $('#mrnTable tbody').append(tr);
										})  
						});
}


</script>
<script type="text/javascript">
var tabs = $('.tabs1');
var items = $('.tabs1').find('a').length;
var selector = $(".tabs1").find(".selector1");
var activeItem = tabs.find('.active');
var activeWidth = activeItem.innerWidth();
$(".selector1").css({
  "left": activeItem.position.left + "px", 
  "width": activeWidth + "px"
});

$(".tabs1").on("click","a",function(){
  $('.tabs1 a').removeClass("active");
  $(this).addClass('active');
  var activeWidth = $(this).innerWidth();
  var itemPos = $(this).position();
  $(".selector1").css({
    "left":itemPos.left + "px", 
    "width": activeWidth + "px"
  });
});
</script>
<script type="text/javascript">
var tabs = $('.tabs2');
var items = $('.tabs2').find('a').length;
var selector = $(".tabs2").find(".selector2");
var activeItem = tabs.find('.active');
var activeWidth = activeItem.innerWidth();
$(".selector2").css({
  "left": activeItem.position.left + "px", 
  "width": activeWidth + "px"
});

$(".tabs2").on("click","a",function(){
  $('.tabs2 a').removeClass("active");
  $(this).addClass('active');
  var activeWidth = $(this).innerWidth();
  var itemPos = $(this).position();
  $(".selector2").css({
    "left":itemPos.left + "px", 
    "width": activeWidth + "px"
  });
});
</script>
<script type="text/javascript">
function enableDiv(status) {
	if(status==1){
    var x = document.getElementById("poPending");
    x.style.display = "block";
    var y = document.getElementById("mrnPending");
    y.style.display = "none";
    var z = document.getElementById("consumptionReport");
    z.style.display = "none";
    var z1 = document.getElementById("consumptionReportIssue");
    z1.style.display = "none";
	}
	else if(status==2)
		{
		 var x = document.getElementById("poPending");
		    x.style.display = "none";
		    var y = document.getElementById("mrnPending");
		    y.style.display = "block";
		    var z = document.getElementById("consumptionReport");
		    z.style.display = "none";
		    var z1 = document.getElementById("consumptionReportIssue");
		    z1.style.display = "none";
		}
	else if(status==3)
	{
		 var x = document.getElementById("poPending");
		    x.style.display = "none";
		    var y = document.getElementById("mrnPending");
		    y.style.display = "none";
		    var z = document.getElementById("consumptionReport");
		    z.style.display = "block";
		    var z1 = document.getElementById("consumptionReportIssue");
		    z1.style.display = "none";
	}
	else if(status==4)
	{
		 var x = document.getElementById("poPending");
		    x.style.display = "none";
		    var y = document.getElementById("mrnPending");
		    y.style.display = "none";
		    var z = document.getElementById("consumptionReport");
		    z.style.display = "none";
		    var z1 = document.getElementById("consumptionReportIssue");
		    z1.style.display = "block";
	}
}
function enableDiv1(status) {
	if(status==1){
    var x = document.getElementById("tabBody0");
    x.style.display = "block";
    var y = document.getElementById("tabBody1");
    y.style.display = "none";
    var z = document.getElementById("tabBody2");
    z.style.display = "none";
	}
	else if(status==2)
		{
		 var x = document.getElementById("tabBody0");
		    x.style.display = "none";
		    var y = document.getElementById("tabBody1");
		    y.style.display = "block";
		    var z = document.getElementById("tabBody2");
		    z.style.display = "none";
		}
	else if(status==3)
	{
		 var x = document.getElementById("tabBody0");
		    x.style.display = "none";
		    var y = document.getElementById("tabBody1");
		    y.style.display = "none";
		    var z = document.getElementById("tabBody2");
		    z.style.display = "block";
	}
}
function myFunction() {
	 
	  var input, filter, table, tr, td ,td1,td2,td3,td4,td5, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("mrnTable1");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    td1 = tr[i].getElementsByTagName("td")[3];
	    td2 = tr[i].getElementsByTagName("td")[4];
	    td3 = tr[i].getElementsByTagName("td")[5];
	    td4 = tr[i].getElementsByTagName("td")[6];
	    td5 = tr[i].getElementsByTagName("td")[1];
	    
	    if (td || td1 || td2 || td3|| td4|| td5) {
	    	
	    	 if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	    	        tr[i].style.display = "";
	    	      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
	    	        tr[i].style.display = "";
	    	      }else if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
	    	        tr[i].style.display = "";
	    	      }
	    	      else if (td3.innerHTML.toUpperCase().indexOf(filter) > -1) {
		    	        tr[i].style.display = "";
		    	      }
	    	      else if (td4.innerHTML.toUpperCase().indexOf(filter) > -1) {
		    	        tr[i].style.display = "";
		    	      }
	    	      else if (td5.innerHTML.toUpperCase().indexOf(filter) > -1) {
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
