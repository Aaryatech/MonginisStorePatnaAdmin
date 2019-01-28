<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Non Returnable Gate Pass</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


<style type="text/css">
table {
	border-collapse: separate;
	font-family: arial;
	font-weight: bold;
	font-size: 90%;
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
	font-size: 80%;
	font-weight: bold;
	padding-bottom: 10px;
	margin: 0;
}

h5 {
	color: black;
	font-family: arial;
	font-size: 95%;
	font-weight: bold;
	padding-bottom: 10px;
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
	/* background-color: #6a9ef2; */
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


	<c:forEach items="${list}" var="item" varStatus="count">


		<div align="left">
			<h5>${documentBean.docIsoSerialNumber}</h5>
		</div>

		<div align="center" style=" font-family: arial; font-weight: bold; font-size: 120%;">${company.companyName}</div>
			<div align="center" style=" font-family: arial; font-weight: bold; font-size: 85%;">${company.factoryAdd}</div>
		<p align="center" style=" font-family: arial; font-weight: bold; font-size: 95%;">OUTWARD MATERIAL GATE PASS NON-RETURNABLE</p>


		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="2" valign="top">
						<table>
							<tr>
								<td valign="top" width="80%">GP No. : ${item.gpNo}<br> To,<br>
									${item.vendorName} ,<br> ${item.vendorAdd1}

								</td>

								<td align="right" valign="top" width="20%"><br> Date :
									${item.gpReturnDate}</td>

							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

		<br>
		<br>

		<p
			style="color: #000;   text-align: left; margin: 0px;   font-family: arial; font-weight: bold; font-size: 100%;">
			Sending following materials personally / Vehicle No. -
			${item.sendingWith}<br> as per details given below. <br>

		</p>

		<br>



		<table align="center" border="1" cellspacing="0" cellpadding="1"
			id="table_grid" class="table table-bordered">
			<thead>
				<tr>
					<th>SR.</th>
					<th>ITEM NO.</th>
					<th>DESCRIPTION</th>
					<th>UOM</th>
					<th>QTY</th> 
				</tr>
			</thead>
			<tbody>

				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="3" />

				<c:forEach items="${item.gatepassReportDetailList}" var="row"
					varStatus="count">

					<c:choose>

						<c:when test="${totalRowCount eq maxRowCount}">

							<c:set var="totalRowCount" value="${totalRowCount+1}" />

							<div style="page-break-after: always;"></div>



							<!-- new page -->
			</tbody>
		</table>




<hr
				style="height: 1px; border: none; color: black; background-color: black;">



		<div align="left">
			<h5>${documentBean.docIsoSerialNumber}</h5>
		</div>

		<div align="center" style=" font-family: arial; font-weight: bold; font-size: 120%;">${company.companyName}</div>
			<div align="center" style=" font-family: arial; font-weight: bold; font-size: 85%;">${company.factoryAdd}</div>
		<p align="center" style=" font-family: arial; font-weight: bold; font-size: 95%;">OUTWARD MATERIAL GATE PASS NON-RETURNABLE</p>


		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="2" valign="top">
						<table>
							<tr>
								<td valign="top" width="80%">GP No. : ${item.gpNo}<br> To,<br>
									${item.vendorName} ,<br> ${item.vendorAdd1}

								</td>

								<td align="right" valign="top" width="20%"><br> Date :
									${item.gpReturnDate}</td>

							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

		<br>
		<br>

		 <p
			style="color: #000;   text-align: left; margin: 0px;   font-family: arial; font-weight: bold; font-size: 100%;">
			Sending following materials personally / Vehicle No. -
			${item.sendingWith}<br> as per details given below. <br>

		</p>  

		<br>



		<table align="center" border="1" cellspacing="0" cellpadding="1"
			id="table_grid" class="table table-bordered">
			<thead>
				<tr>
					<th>SR.</th>
					<th>ITEM NO.</th>
					<th>DESCRIPTION</th>
					<th>UOM</th>
					<th>QTY</th> 
				</tr>
			</thead>
			<tbody>

				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="3" />


				<!-- end of new page -->

				</c:when>

				</c:choose>


				<c:set var="totalRowCount" value="${totalRowCount+1}" />



				<tr>
					<td width="0" align="center"><c:out value="${count.index+1}" /></td>

					<td width="0" align="center">
					<c:out value="${row.itemCode}" /></td>
					<c:set var="find" value="0"></c:set>
					<td width="60%" align="left" style="padding: 10px;">
							  <c:forEach items="${oneTimeItem}" var="oneTimeItem" varStatus="count">
								<c:choose>
									<c:when test="${oneTimeItem==row.gpItemId}"> 
									<c:set var="find" value="1"></c:set>
									</c:when> 
								</c:choose> 
							</c:forEach>  
					
					<c:choose>
						<c:when test="${find==1}">
						<c:out value="${row.remark}" />
						</c:when>
						<c:otherwise>  
						${row.itemDesc}<br>${row.remark}
						  </c:otherwise>
					</c:choose>
				 
					
					</td>
					<td width="0" align="center"><c:out value="${row.itemUom}" /></td>
					<td width="0" align="right" style="padding: 10px;"><c:out value="${row.gpQty}" /></td> 

				</tr>
				</c:forEach>

			</tbody>
		</table>

		<br>





		<p
			style="color: #000; font-family: arial; font-weight: bold; font-size: 90%; text-align: left; margin: 0px;  ">
			Reason : ${item.remark1} <br>

		</p>


		<br>


		<br>



		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="4" valign="top">
						<table>
							<tr>
								<td width="25" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Receiver Signature</td>

								<td width="25%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Prepared By</td>

								<td width="25%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Approved By</td>
								<td width="25%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Authorised By</td>


							</tr>

						</table>
					</td>
				</tr>
			</table>
			<hr
				style="height: 1px; border: none; color: black; background-color: black;">

		</div>

	</c:forEach>
	<br>



	<!-- END Main Content -->

</body>
</html>