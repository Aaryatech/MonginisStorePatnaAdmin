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



	<c:forEach items="${list}" var="item" varStatus="count">


		<!--  -->

		<p style="text-align: left; font-weight: normal;">
			Original / Duplicate(Acnt)/Triplicate(Purch)/Stroes <span
				style="float: right;">${documentBean.docIsoSerialNumber}</span>
		</p>
		<!-- p -->
 
		 
<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="100%">
							<tr>
								<td width="22.33%" >
								<img src="${pageContext.request.contextPath}/resources/img/monginislogo.png" width="95" height="60" />
								</td>

								<td width="53.33%" valign="top" style="font-weight: bold; margin: 0px;" align="center">
 													<h4 align="center" style=" font-size: 16px;">${company.companyName}</h4> 
								<h6 style="font-weight: bold; margin: 0px;font-size: 10px;" align="center">Delivery
									& Billing Addr.: ${company.factoryAdd}</h6>
								<h6 style="font-weight: normal; margin: 0px;font-size: 10px;" align="center">CIN
									NO : ${company.cinNumber}</h6>
								</td>
								
								<td width="22.33%" valign="top"  style="font-weight: bold; margin: 0px;" align="right"> 
								</td>

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
		<br> 
		
		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="100%">
							<tr>
								<td width="33.33%" 
									 valign="top" style="font-weight: bold; margin: 0px;" align="left">GST&nbsp; NO&nbsp; : ${company.gstNumber} <br>PAN &nbsp;NO&nbsp; : ${company.panNumber}
								</td>

								<td width="33.33%" valign="top" style="font-weight: bold; margin: 0px;" align="center">
 													PURCHASE ORDER   
								</td>
								
								<td width="33.33%" valign="top"  style="font-weight: bold; margin: 0px;" align="right">Order
				No.&nbsp; : ${item.poNo}<br> Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
				${item.poDate} 
								</td>

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
<br> 
		<!-- t -->


		<!-- t -->


		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="1000px">
							<tr>
								<td width="900px	" valign="top"
									style="border-left: 1px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px; font-weight: bold;">To,<br>
									${item.vendorName}<br>${item.vendorAdd1}<br>GST No. : ${item.vendorGstNo}
								</td>

								<td width="50%"
									valign="top" style="border-left: 1px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; border-right: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">

									<div class="invoice-box">
										<table cellpadding="0" cellspacing="0">
											<tr class="information">
												<td colspan="2" valign="top">
													<table>
														<tr>

															<td width="50%" valign="top">Party Cd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${item.vendorCode}  </td>

															 

														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div> <%-- Quotation No. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${item.vendQuation}<br> Quotation Dt. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${item.vendQuationDate}<br>  --%>
									Indent No. & Date :
									${item.indNo}  ${item.indDate}<br>Order Validity : ${item.approvStatus}
								</td>

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>


		<br>
		<h5>
			DEAR SIR,<br> WE HAVE PLEASURE IN PLACING/CONFIRMING OUR ORDER
			FOR UNDERMENTIONED GOODS.

		</h5>
		
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


		<p style="text-align: left; font-weight: normal;">
			<span style="float: right; margin-right: 96px;">TOTAL -
				<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${total}" /></span>
		</p>


		<br>

		
			<table cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%">

				<tr >
					<td colspan="12" valign="top">
						<table>
							<tr>
								<td colspan="6" width="50%" valign="top"
									style="border-bottom: 1px solid #313131; border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 12px;">Delivery
									Terms : ${item.deliveryDesc}<br> <br> Payment Terms :
									${item.pymtDesc} <br> <br> Dispatch Mode :
									${item.dispModeDesc}<br> <br>
									<p
										style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: bold;">*
										Ensure that your supplies are full filling current goverment
										rules/regulations as applicable.</p>
								</td>
								<td colspan="6" width="50%" valign="top"
									style="border-bottom: 1px solid #313131; border-top: 1px solid #313131; border-left: 1px solid #313131; border-right: 1px solid #313131; padding: 10px; color: #000; font-size: 12px;">Packing/Forwarding
									&nbsp;&nbsp;&nbsp;- ${item.poPackRemark} <br> <br> GST
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
									AS APPLICABLE. <br> <br> Freight/Transport
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ${item.poFrtRemark} <br> <br>
									Other Charges &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;- ${item.otherChargeAfterRemark}

								</td>

							</tr>



						</table>
					</td>
				</tr>
			</table>
		

		<br>
		 
		<p
			style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: normal;">
			REMARKS IF ANY : ${item.poRemark }<br> 
		</p>



		<p
			style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: bold;">NOTE
			: PLEASE MENTION THE FOLLOWING</p>
 
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			style="border-top: 1px solid #313131; border-right: 1px solid #313131;">


			<tr>
				<td colspan="6" width="50%"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">
					<p
						style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: normal;">
						1) ITEMCODE, PARTY CODE & PO.NO ON YOUR D/C./Invoice <br> 2) PL.
						PROVIDE YOUR TEST & INSP.CERTIFICATE -YES/NO<br> 3)
						INSPECTION SUBJECT TO OUR / YOUR END.<br> 4) EXPIRY DATE OF
						EACH ITEM.<br> 5) IF MTRL.REJECTED, PLS.ARRANGE TO COLLECT
						FROM OUR FACTORY SITE &nbsp;&nbsp;&nbsp;&nbsp;WITHIN 8 DAYS
						OTHERWISE WE WILL NOT RESPONSIBLE FOR ANY LOSS OR
						&nbsp;&nbsp;&nbsp;&nbsp;DAMAGE.<br> 6) IF REJECTION PLEASE SUBMIT INVOICE 
						ONLY FOR ACCEPTED MATERIAL.

					</p>
				</td>
				<td colspan="6" width="50%"
					style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">
					<p
						style="color: #000; font-size: 10px; vertical-align: top; text-align: center; margin: 0px; font-weight: normal;">
						For ${company.companyName}<br> <br> <br> <br>
						Purchase Order authorised Shabbir Fatehnagri/Shabbir Kanorewala 
				</td>
			</tr>


		</table>

		<br>
 
		<h5 style="font-weight: normal; margin: 0px;" align="left">PUNE
			OFFICE : ${company.officeAdd}</h5>

		<h5 style="font-weight: normal; margin: 0px;" align="left">PHONE:
			${company.officePhoneNumber}, FAX : ${company.officeFaxNumber}, Email : ${company.purchaseEmail}</h5>

		<h5 style="font-weight: bold; margin: 0px; padding-bottom: 5px" align="left" >FACTORY/WORKS:
			${company.factoryAdd}</h5>
			
			<p
			style="font-weight: normal; margin: 0px; padding-bottom: 5px"
			align="right">${pageCount}/<fmt:formatNumber value="${totalPage+(1-(totalPage%1))%1}" type="number" pattern="#"/>
			<c:set var="pageCount" value="${pageCount+1}" />
		</p>


		<!-- END Main Content -->


		<!-- end of footer -->








		<p style="text-align: left; font-weight: normal;">
			Original / Duplicate(Acnt)/Triplicate(Purch)/Stroes <span
				style="float: right;">${documentBean.docIsoSerialNumber}</span>
		</p>


					<table width="100%">
							<tr>
								<td width="23%" > 
									<img src="${pageContext.request.contextPath}/resources/img/monginislogo.png" width="95" height="60" />
								</td>

								<td width="85%" style="text-align: center;">
 <h4 align="center">${company.companyName}</h4>



		<h6 style="font-weight: bold; margin: 0px;" align="center">Delivery
			& Billing Addr.: ${company.factoryAdd}</h6>
		<h6 style="font-weight: normal; margin: 0px;" align="center">CIN
			NO : ${company.cinNumber}</h6>
								</td>

							</tr>

						</table>
		 
        <span style="float: left; font-weight: bold; font-size: 13px;">GST&nbsp; NO&nbsp; : ${company.gstNumber}
		 <br>PAN &nbsp;NO&nbsp; : ${company.panNumber}
			</span>
		<p
			style="text-align: center; font-weight: bold; font-size: 13px; margin-left: 100px;">
			PURCHASE ORDER <span style="float: right;">Order
				No.&nbsp; : ${item.poNo}<br>&nbsp;&nbsp; Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
				${item.poDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</span>
		</p>

		<br>



		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="1000px">
							<tr>
								<td width="900px	" valign="top"
									style="font-weight: bold; border-left: 1px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">To,<br>
									${item.vendorName}<br>${item.vendorAdd1}<br>GST No. : ${item.vendorGstNo}
								</td>

								<td width="50%"
									style="border-left: 1px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; border-right: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">

									<div class="invoice-box">
										<table cellpadding="0" cellspacing="0">
											<tr class="information">
												<td colspan="2" valign="top">
													<table>
														<tr>

															<td width="50%" valign="top">Party Cd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
																${item.vendorCode} &nbsp;&nbsp;&nbsp;&nbsp; Order Validity : ${item.approvStatus}</td>
 
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div> Quotation No. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${item.vendQuation}<br> Quotation Dt. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${item.vendQuationDate}<br> Indent No. & Date :
									${item.indNo} ${item.indDate}
								</td>

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>


		<br>
		<h5>
			DEAR SIR,<br> WE HAVE PLEASURE IN PLACING/CONFIRMING OUR ORDER
			FOR UNDERMENTIONED GOODS.

		</h5>
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
	
	<tr style="font-size: 13px;">
					<td  colspan="9"><c:out value="Total " /></td> 
					
					<td align="right" style="padding: 5px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
										value="${total}" /></td>
					<td  align="center">- </td> 
				</tr>

	</tbody>
	</table>

<br>

		<div class="invoice-box">
					<table cellpadding="0" cellspacing="0" width="1000px">
		
						<tr class="information">
							<td valign="top">
								<table width="100%">
									<tr>
										<td width="80%" 
											 valign="top" style="font-weight: bold; margin: 0px;" align="left"> </td>
		
										<td width="10%" valign="top" style="font-weight: bold; margin: 0px;" align="left">
		 													     Total Value : <br> 
		 													     Pack. Value : <br>
		 													     Insu. Value : <br> 
		 													     Fret. Value : <br> 
		 													     Tax Value : <br> 
		 													     Other Charge : <br> 
		 													     Total : <br>
										</td>
										
										<td width="10%" valign="top"  style="font-weight: bold; margin: 0px;" align="right"> 
										
										 <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${total}" /> <br> 
			  							<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.poPackVal}" /> <br> 
			  							 <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.poInsuVal}" /> <br> 
			  							 <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.poFrtVal}" /> <br> 
			  							 <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.poTaxValue}" /> <br> 
			  							 <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.otherChargeAfter}" /> <br> 
			  							 <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${total+item.poPackVal+item.poInsuVal+item.poFrtVal+item.poTaxValue+item.otherChargeAfter}" /> <br>
										</td>
		
									</tr>
		
								</table>
							</td>
						</tr>
					</table>
				</div>
		<br> 
 
	<table cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%">

				<tr >
					<td colspan="12" valign="top">
						<table>
							<tr>
								<td colspan="6" width="50%" valign="top"
									style="border-bottom: 1px solid #313131; border-top: 1px solid #313131; border-left: 1px solid #313131; padding: 10px; color: #000; font-size: 12px;">Delivery
									Terms : ${item.deliveryDesc}<br> <br> Payment Terms :
									${item.pymtDesc} <br> <br> Dispatch Mode :
									${item.dispModeDesc}<br> <br>
									<p
										style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: bold;">*
										Ensure that your supplies are full filling current goverment
										rules/regulations as applicable.</p>
								</td>
								<td colspan="6" width="50%" valign="top"
									style="border-bottom: 1px solid #313131; border-top: 1px solid #313131; border-left: 1px solid #313131; border-right: 1px solid #313131; padding: 10px; color: #000; font-size: 12px;">Packing/Forwarding
									&nbsp;&nbsp;&nbsp;- ${item.poPackRemark} <br> <br> GST
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
									AS APPLICABLE. <br> <br> Freight/Transport
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ${item.poFrtRemark} <br> <br>
									Other Charges &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;- ${item.otherChargeAfterRemark}

								</td>

							</tr>



						</table>
					</td>
				</tr>
			</table>

	<br>
	<p
		style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: normal;">
		REMARKS IF ANY : ${item.poRemark }<br>  
	</p>



	<p
		style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: bold;">NOTE
		: PLEASE MENTION THE FOLLOWING</p>



	<table width="100%" border="0" cellpadding="0" cellspacing="0"
		style="border-top: 1px solid #313131; border-right: 1px solid #313131;">


		<tr>
			<td colspan="6" width="50%"
				style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">
				<p
					style="color: #000; font-size: 10px; text-align: left; margin: 0px; font-weight: normal;">
					1) ITEMCODE, PARTY CODE & PO.NO ON YOUR D/C./Invoice<br> 2) PL.
					PROVIDE YOUR TEST & INSP.CERTIFICATE -YES/NO<br> 3) INSPECTION
					SUBJECT TO OUR / YOUR END.<br> 4) EXPIRY DATE OF EACH ITEM.<br>
					5) IF MTRL.REJECTED, PLS.ARRANGE TO COLLECT FROM OUR FACTORY SITE
					&nbsp;&nbsp;&nbsp;&nbsp;WITHIN 8 DAYS OTHERWISE WE WILL NOT
					RESPONSIBLE FOR ANY LOSS OR &nbsp;&nbsp;&nbsp;&nbsp;DAMAGE.<br> 6) IF REJECTION PLEASE SUBMIT INVOICE 
						ONLY FOR ACCEPTED MATERIAL.

				</p>
			</td>
			<td colspan="6" width="50%"
				style="border-left: 1px solid #313131; border-bottom: 1px solid #313131; padding: 8px; color: #000; font-size: 12px;">
				<p
					style="color: #000; font-size: 10px; vertical-align: top; text-align: center; margin: 0px; font-weight: normal;">
					For ${company.companyName} <br> <br> <br> <br>
					Authorised By <br> Shabbir Fatehnagri/Shabbir Kanorewala
			</td>
		</tr>


	</table>

	<c:choose>
		<c:when test="${totalPage+(1-(totalPage%1))%1>1}">
		<br>
		</c:when>
		<c:otherwise>
		<div style="padding-bottom:13px; "> </div>
		</c:otherwise>
	</c:choose>
	 
	<h5 style="font-weight: normal; margin: 0px;" align="left">PUNE
			OFFICE : ${company.officeAdd}</h5>

	<h5 style="font-weight: normal; margin: 0px;" align="left">PHONE:${company.officePhoneNumber}, FAX : ${company.officeFaxNumber}, Email : ${company.purchaseEmail}</h5>

	<h5 style="font-weight: bold; margin: 0px; padding-bottom: 5px"  align="left">FACTORY/WORKS:
		${company.factoryAdd}</h5>

<%-- <p style="font-weight: normal; margin: 0px; padding-bottom: 10px"
		align="right"> ${pageCount}/<fmt:formatNumber value="${totalPage+(1-(totalPage%1))%1}" type="number" pattern="#"/> 
		<c:set var="pageCount" value="${pageCount+1}" />
	</p> --%>
	<!-- END Main Content -->
	  
 <div style="page-break-after: always;"></div>
	</c:forEach>
</body>
</html>