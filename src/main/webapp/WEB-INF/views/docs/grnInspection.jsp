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
<title>GRN INSPECTION</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

 <style type="text/css">
 table {
	border-collapse: collapse;
	font-family: arial;
	font-weight: bold;
	font-size: 90%;
	width:100%;
    page-break-inside: auto !important ;
    
} 
p  {
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
h6  {
    color: black;
    font-family: arial;
    font-size: 80%;
}

th {
	 
	color: black;
	
}
hr { height:3px; border:none; color:rgb(60,90,180); background-color:rgb(60,90,180); }

</style>

</head>
<body>

	<c:forEach items="${list}" var="item" varStatus="count">


<div align="left"> <h5>${documentBean.docIsoSerialNumber}</h5></div>

<h3 align="center" style=" font-family: arial; font-weight: bold; font-size: 120%;">${company.companyName}</h3>
 
<div class="invoice-box">
		<table cellpadding="0" cellspacing="0">

			<tr class="information">
				<td colspan="3" valign="top">
					<table>
						<tr>
							<td valign="top" width="20%">
								Party Code :&nbsp;&nbsp; ${item.vendorCode}<br>
								${item.vendorName}
								</td>

<td valign="top" width="60%" align="center" style="font-weight: bold;  ">
GOODS INSPECTION REPORT
								</td>

							<td align="left" width="20">GRN NO : &nbsp;&nbsp;${item.mrnNo }<br>
							Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp; ${item.mrnDate }
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>



<hr style="height:1px; border:none; color:black; background-color:black;">






<div class="invoice-box">
		<table cellpadding="0" cellspacing="0">

			<tr class="information">
				<td colspan="3" valign="top">
					<table>
						<tr>
							<td valign="top" width="33%" align="left">
								Gate Entry No : ${item.gateEntryNo }<br>
								Gate Entry Dt. : ${item.gateEntryDate }</td>



							<td align="left" width="33%">Invoice No : ${item.billNo }<br>
							Invoice Dt&nbsp;&nbsp;: ${item.billDate }
							</td>
							
							
							<td align="left"  width="33%">D/C No. - ${item.docNo } <br>
							D/C Dt.&nbsp;&nbsp;- ${item.docDate }
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

<hr style="height:1px; border:none; color:black; background-color:black;">

	<table  align="center" border="1" cellspacing="0" cellpadding="1" 
		id="table_grid" class="table table-bordered">
		<thead>
			<tr >
				<th >SR.</th>
				<th >ITEM</th>
				<th >DESCRIPTION</th>
				<th >UOM</th>
				<th >CHLN.QTY</th>
				<th >REC.QTY</th> 
				<th >REJ.QTY</th>
				<th >POREF/REMARK</th>
			</tr>
		</thead>
		<tbody>
			
			
			<c:forEach items="${item.mrnReportDetailList}" var="row"
					varStatus="count">
			
			<tr>
					<td width="0" align="center"><c:out value="${count.index+1}" /></td>
					<td width="0" align="center" ><c:out value="${row.itemCode}" /></td>
					<td width="50%" align="left" style="padding: 10px;"><c:out value="${row.itemDesc}" /></td>
					<td width="0" align="left" style="padding: 10px;"><c:out value="${row.itemUom}" /></td>
					<td width="0" align="right" style="padding: 10px;"><c:out value="${row.mrnQty}" /></td>
					<td width="0" align="right" style="padding: 10px;"><c:out value="${row.approveQty}" /></td>
					<td width="0" align="right" style="padding: 10px;"><c:out value="${row.rejectQty }" /></td>
					<td width="0" align="center">${row.poNo}/${row.rejectRemark}</td>

				</tr>
			</c:forEach>
				
		</tbody>
	</table>
	
	<br>
	
	 <p style="color: #000;   text-align: left; margin: 0px;   font-family: arial; font-weight: bold; font-size: 100%;">
			Insp. Remark - 
		</p>
	
	<br><br>



<div class="invoice-box">
		<table cellpadding="0" cellspacing="0">

			<tr class="information">
				<td colspan="2" valign="top">
					<table>
						<tr>
						
						<td width="25%" valign="top" align="center"
								style=" padding: 8px; color: #000;  font-weight: bold;">

								Inspected By</td>
								
							<td width="25%" valign="top" align="center"
								style=" padding: 8px; color: #000;  font-weight: bold;">

								Prepared By</td>
								
							<td width="25%" valign="top" align="center"
								style=" padding: 8px; color: #000;   font-weight: bold;">

								Approved By</td>
								
								<td width="25%" valign="top" align="center"
								style=" padding: 8px; color: #000;   font-weight: bold;">

								Authorised By</td>

						
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