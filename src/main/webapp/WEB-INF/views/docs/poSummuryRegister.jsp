<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>PO PDF</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


<style type="text/css">
table {
	border-color: black;
	font-size: 12;
	width: 100%;
	page-break-inside: auto !important;
	display: block;
}

p {
	color: black;
	font-family: arial;
	font-size: 70%;
	margin-top: 0;
	padding: 0;
	font-weight: bold;
}

.pn {
	color: black;
	font-family: arial;
	font-size: 10%;
	margin-top: 0;
	padding: 0;
	font-weight: normal;
}

h4 {
	color: black;
	font-family: sans-serif;
	font-size: 100%;
	font-weight: bold;
	padding-bottom: 10px;
	margin: 0;
}

h5 {
	color: black;
	font-family: sans-serif;
	font-size: 70%;
	font-weight: normal; 
	margin: 0;
}

h6 {
	color: black;
	font-family: arial;
	font-size: 60%;
	font-weight: normal;
	margin: 10%;
}

th {
	color: black;
}

hr {
	height: 1px;
	border: none;
	color: rgb(60, 90, 180);
	background-color: rgb(60, 90, 180);
}

.invoice-box table tr.information table td {
	padding-bottom: 0px;
	align-content: center;
}

.set-height td {
	position: relative;
	overflow: hidden;
	height: 2em;
}

.set-height t {
	position: relative;
	overflow: hidden;
	height: 2em;
}

.set-height p {
	position: absolute;
	margin: .1em;
	left: 0;
	top: 0;
}
</style>

</head>
<body>

<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="100%">
							<tr>
								<td width="22.33%" >
								 
								</td>

								<td width="53.33%" valign="top" style="font-weight: bold; margin: 0px;" align="center">
 													<h4 align="center" style=" font-size: 16px;">PURCHASE ORDER SUMMARY REPORT</h4> 
								 
								</td>
								
								<td width="22.33%" valign="top"  style="font-weight: bold; margin: 0px;" align="right"> 
								</td>

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
		 
<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="100%">
							<tr>
								 

								<td width="100%" valign="top" style="font-weight: bold; margin: 0px;" align="center">
 													PURCHASE ORDER REGISTER FROM ${fromDate} TO ${toDate}
								</td>
								 
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div><br>

	<c:forEach items="${list}" var="item" varStatus="count">

 
		 
<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="100%">
							<tr>
								<td width="100%" 
									 valign="top" style="font-weight: bold; margin: 0px;" align="left"> Name &nbsp;&nbsp; : ${item.vendorName}<br>
									 Po No.&nbsp;&nbsp; : ${item.poNo}<br>
									 Po Date  : ${item.poDate} 
								</td>
 
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
<br> 
		  
		
		<c:set var="pageCount" value="1" />
		<c:set var="totalPage" value="${item.pOReportDetailList.size()/8}" />
		
		<table align="center" border="1" cellpadding="0" cellspacing="0"
			 
			id="table_grid">
			<thead>
				<tr style="font-size: 15px;">
					<th height="5px" style="max-height: 10px; max-width: 30px;"
						width="30px">SR.</th>
					<th width=5%>Item</th>
					<th width=35%>Description</th>
					<th width=5%>UOM</th>
					<th align="right" width=7%>Qty</th>
					<th align="right" width=10%>Rate</th>
					<th align="right" width=4%>CGST </th>
					<th align="right" width=4%>SGST </th>
					<th align="right" width=4%>IGST </th>
					<th align="right" width=10%>Value</th>
					<th align="center" width=30%>Schedule</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="8" />
				<c:set var="total" value="0" />

				<c:forEach items="${item.pOReportDetailList}" var="row"
					varStatus="count">



					<c:choose>

						<c:when test="${totalRowCount eq maxRowCount}">

							 




							<!-- new page -->
			</tbody>
		</table>

		<!-- start of footer -->


		 
		<table align="center" border="1" cellpadding="0" cellspacing="0"
			 
			id="table_grid">
			<thead>
				<tr style="font-size: 15px;">
					<th height="5px" style="max-height: 10px; max-width: 30px;"
						width="30px">SR.</th>
					<th width=5%>Item</th>
					<th width=35%>Description</th>
					<th width=5%>UOM</th>
					<th align="right" width=7%>Qty</th>
					<th align="right" width=10%>Rate</th>
					<th align="right" width=4%>CGST </th>
					<th align="right" width=4%>SGST </th>
					<th align="right" width=4%>IGST </th>
					<th align="right" width=10%>Value</th>
					<th align="center" width=30%>Schedule</th>
				</tr>
			</thead>
			<tbody>




				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="8" />
				<c:set var="total" value="0" />




				<!-- end of new page -->

				</c:when>

				</c:choose>

				 

				<c:set var="total" value="${total+row.basicValue-row.discValue}" />
				<tr style="font-size: 13px;">
					<td height="5px" style="max-height: 5px" align="center"
						width="30px"><c:out value="${count.index+1}" /></td>
					<td align="center" style="padding: 2px;"><c:out value="${row.itemCode}" /></td>
					<td align="left" width=40% style="padding: 5px;"><c:out value="${row.itemDesc}" /></td>
					<td align="center"><c:out value="${row.itemUom}" /></td>
					<td align="right" style="padding: 5px;"><c:out value="${row.itemQty}" /></td>
					<td align="right" style="padding: 5px;">
					<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${row.itemRate}" /> </td>
					
														<c:choose>
													  				<c:when test="${row.igst==0}">
													  					<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${row.taxValue/2}"/>(${row.cgst}%)
															  			<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${row.taxValue/2}"/>(${row.sgst}%)
															  			<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="0"/>(${row.igst}%)
													  				</c:when>
													  				<c:otherwise>
													  					<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="0"/>(${row.cgst}%)
															  			<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="0"/>(${row.sgst}%)
															  			<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${row.taxValue}"/>(${row.igst}%)
													  				
													  				</c:otherwise>
													  			</c:choose>
													  			
					<%-- <td align="right" style="padding: 5px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${row.cgst+row.sgst+row.igst}" /> </td> --%>
					<td align="right" style="padding: 5px;">
					<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${row.basicValue-row.discValue}" /> </td>
					<td align="center" width=10%><c:out
							value=" ${row.schDate} " /></td>

				</tr>
				 
	</c:forEach>
	
	<%-- <tr style="font-size: 13px;">
					<td  colspan="9"><c:out value="Total " /></td> 
					
					<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${total}" /></td>
					<td  align="center">- </td> 
				</tr> --%>

	</tbody>
	</table>

<br>
 
 
	<!-- END Main Content -->
	  
  
	</c:forEach>
</body>
</html>