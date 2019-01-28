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
<title>GRN</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

 
<style type="text/css">
table {
	border-collapse: collapse;
	font-family: arial;
	font-weight: bold;
	font-size: 90%;
	width: 100%;
	page-break-inside: auto !important;
}

p {
	color: black;
	font-family: arial;
	font-size: 70%;
	margin-top: 0;
	padding: 0;
	font-weight: bold;
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
	font-size: 80%;
}

th {
	 
	color: black;
}

hr {
	height: 3px;
	border: none;
	color: rgb(60, 90, 180);
	background-color: rgb(60, 90, 180);
}
</style>

</head>
<body>

	<c:forEach items="${list}" var="item" varStatus="count">


		<div align="left">
			<h5>${documentBean.docIsoSerialNumber}</h5>
		</div>

		<div align="center" align="center" style=" font-family: arial; font-weight: bold; font-size: 120%;">${company.companyName}</div>
			<div align="center" style=" font-family: arial; font-weight: bold; font-size: 85%;">${company.factoryAdd}</div>
		<p align="center" style=" font-family: arial; font-weight: bold; font-size: 95%;">REJECTION MEMO</p>


		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="2" valign="top">
						<table>
							<tr>
								<td valign="top" width="40%"
									style="border-top: 1px solid #313131; border-bottom: 1px solid #313131;">To,
									<br> ${item.vendorName}<br> ${item.vendorAdd1}
								</td>



								<td align="left" width="60%"
									style="border-top: 1px solid #313131; border-bottom: 1px solid #313131;">
									<div class="invoice-box">
										<table cellpadding="0" cellspacing="0">

											<tr class="information">
												<td colspan="2" valign="top">
													<table>
														<tr>
															<td valign="top">Vendor Code - ${item.vendorCode}</td>



															<td align="left"
																style="border-left: 1px solid #313131; padding-left: 10px solid #313131">



																Memo No &nbsp;&nbsp;: ${item.rejectionNo }<br> Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
																${item.rejectionDate } <br> <br> DC.No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
																${item.dcoId }<br> D.C. Date &nbsp;&nbsp;: ${item.dcoDate }

															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>




								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>




		<table align="center" border="1" cellspacing="0" cellpadding="1"
			id="table_grid" class="table table-bordered">
			<thead>
				<tr>
					<th>SR.</th>
					<th>ITEM NO.</th>
					<th>DESCRIPTION</th>
					<th>UOM</th>
					<th>QTY</th>
					<th>GRN NO./ Date</th>

				</tr>
			</thead>
			<tbody>


				<c:forEach items="${item.rejReportDetailList}" var="row"
					varStatus="count">

					<tr>
						<td width="3%" align="center"><c:out value="${count.index+1}" /></td>
						<td width="10%" align="center" ><c:out value="${row.itemCode}" /></td>
						<td   align="left" style="padding: 10px;"><c:out value="${row.itemDesc}" /></td>
						<td width="7%" align="center"><c:out value="${row.itemUom}" /></td>
						<td width="7%" align="right" style="padding: 10px;"><c:out
								value="${row.rejectionQty}" /></td>

						<td width="20%" align="center">
								GRN&nbsp;&nbsp;- ${row.mrnNo} <br> DT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ${row.mrnDate } </td>

					</tr>
				</c:forEach>

			</tbody>
		</table>

		<br>
		<br>


		<p
			style="color: #000; font-family: arial; font-weight: bold; font-size: 90%; text-align: left; margin: 0px;  ">
			Rejection Reason : ${item.rejectionRemark}<br> <br> <br>
			<br>
			<br>

		</p>

		<p
			style="color: #000; font-family: arial; font-weight: bold; font-size: 90%; text-align: left; margin: 0px;  ">
			Please arrange to collect the rejected material within eight days.
			Otherwise we will not be responsible for any loss or damage. <br>


		</p>
		<br>
		<br>



		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="3" valign="top">
						<table>
							<tr>
								<td width="33%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Stores</td>

								<td width="33%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Rejected By</td>

								<td width="33%" valign="top" align="center"
									style="padding: 8px; color: #000;   font-weight: bold;">

									Authorised Sign</td>


							</tr>

						</table>
					</td>
				</tr>
			</table>
															<hr	style="height: 1px; border: none; color: black; background-color: black;">
			
			
		</div>
	</c:forEach>

	<!-- END Main Content -->

</body>
</html>