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
<title>Item Issue PDF</title>
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


		<h4 align="center" align="center" style=" font-family: arial; font-weight: bold; font-size: 120%;">${company.companyName}</h4>


		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">
				<tr class="information">
					<td colspan="3" valign="top">
						<table>
							<tr>

								<td width="20%">Issue No. : &nbsp;&nbsp;${item.issueNo}</td>


								<td width="60%" valign="top" align="center"
									style="font-weight: bold;">ITEMS ISSUE SLIP</td>


								<td width="20%" align="left">Slip No.&nbsp;&nbsp;: ${item.issueSlipNo}
									<br> Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
									${item.issueDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>



		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="1" valign="top">
						<table>
							<tr>
								<td width="50%" valign="top"
									style="border-left: 0px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; ">
									Department.  &nbsp;&nbsp;&nbsp;: ${item.deptCode}<br>
									Sub.Dept. &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;: ${item.subDeptCode}
								</td>

								<!-- 	<td width="50%" valign="top"
								style="border-left: 0px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;"> &nbsp; ..
							</td> -->

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>


		<br>


		<table align="center" border="1" cellspacing="0" cellpadding="1"
			id="table_grid" class="table table-bordered">
			<thead>
				<tr>
					<th>SR.</th>
					<th>ITEM</th>
					<th>DESCRIPTION</th>
					<th>UOM</th>
					<th>ISSUED QTY.</th> 

				</tr>
			</thead>
			<tbody>

				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="5" />

				<c:forEach items="${item.issueReportDetailList}" var="row"
					varStatus="count">

					<c:choose>

						<c:when test="${totalRowCount eq maxRowCount}">

							<c:set var="totalRowCount" value="${totalRowCount+1}" />

							<div style="page-break-after: always;"></div>



							<!-- new page -->
			</tbody>
		</table>


		<div align="left">
			<h5>${documentBean.docIsoSerialNumber}</h5>
		</div>


		<h4 align="center">${company.companyName}</h4>


		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">
				<tr class="information">
					<td colspan="3" valign="top">
						<table>
							<tr>

								<td width="20%">Issue No. : &nbsp;&nbsp;${item.issueNo}</td>


								<td width="60%" valign="top" align="center"
									style="font-weight: bold;">ITEMS ISSUE SLIP</td>


								<td width="20%" align="left">Slip No.&nbsp;&nbsp;: 0001
									<br> Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
									${item.issueDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>



		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="1" valign="top">
						<table>
							<tr>
								<td width="50%" valign="top"
									style="border-left: 0px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">
									Department.  &nbsp;&nbsp;&nbsp;: ${item.deptCode}<br>
									Sub.Dept. &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;: ${item.subDeptCode}
								</td>

								<!-- 	<td width="50%" valign="top"
								style="border-left: 0px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;"> &nbsp; ..
							</td> -->

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>


		<br>


		<table align="center" border="1" cellspacing="0" cellpadding="1"
			id="table_grid" class="table table-bordered">
			<thead>
				<tr>
					<th>SR.</th>
					<th>ITEM</th>
					<th>DESCRIPTION</th>
					<th>UOM</th>
					<th>ISSUED QTY.</th> 

				</tr>
			</thead>
			<tbody>

				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="5" />


				<!-- end of new page -->

				</c:when>

				</c:choose>


				<tr>
					<td width="0" align="center"><c:out value="${count.index+1}" /></td>
					<td width="0" align="center"><c:out value="${row.itemCode}" /></td>
					<td width="60%" align="left" style="padding: 10px;"><c:out value="${row.itemDesc}" /></td>
					<td width="0" align="center"><c:out value="${row.itemUom}" /></td>
					<td width="0" align="right" style="padding: 10px;"><c:out value="${row.itemIssueQty}" /></td>
			 

				</tr>




				</c:forEach>

			</tbody>
		</table>

		<br>
		<br>



		<p
			style="color: #000;   text-align: left; margin: 0px;   font-family: arial; font-weight: bold; font-size: 90%;">
			Remark - <br> <br> <br> <br>
			<br>

		</p>

		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="3" valign="top">
						<table>
							<tr>
								<td width="25%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Authorised By</td>

								<td width="25%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Issued By</td>

								<td width="25%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Received By</td>



							</tr>

						</table>
					</td>
				</tr>
			</table>
															<hr	style="height: 1px; border: none; color: black; background-color: black;">
			
		</div>
		<div style="page-break-after: always;"></div>
	</c:forEach>

	<!-- END Main Content -->

</body>
</html>