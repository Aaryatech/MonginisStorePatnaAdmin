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
<title>Enquiry PDF</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


<style type="text/css">
table {
	border-collapse: separate;
	border-color: black;
	font-size: 12;
	width: 100%;
	page-break-inside: auto !important;
	min-height: 500px;
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
	font-family: sans-serif;
	font-size: 70%;
	font-weight: normal;
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
	background-color: #6a9ef2;
	color: white;
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
</style>

</head>
<body>
	<div align="right">
		<h6> ${documentBean.docIsoSerialNumber}</h6>
	</div>

	<h4 align="center">${company.companyName}</h4>
	<hr style="height: 1px; border: none; color: black; background-color: black;">

	<div class="invoice-box">
		<table cellpadding="0" cellspacing="0">

			<tr class="information">
				<td colspan="3" valign="top">
					<table>
						<tr>
							<td valign="top" width="32%">To,<br>${editEnquiry.vendorName} 
							</td>
							<td valign="top" width="10%"> 
							</td>
							<td valign="top" width="30%">Vendor Code - ${editEnquiry.vendorCode}<br> <br> <br>

							</td>

							<td>Enquiry No.&nbsp;&nbsp;: ${editEnquiry.enqNo}<br> <br>
								Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${editEnquiry.enqDate}<br>
							<br> Due Date &nbsp;&nbsp;&nbsp;&nbsp;: 
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>


	<hr
		style="height: 1px; border: none; color: black; background-color: black;">

	<h5>
		Dear Sirs,<br> Please submit your quotation for the following
		&nbsp;&nbsp;:
	</h5>
	<table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid" class="table table-bordered">
		<thead>
			<tr>
				<th width=7%>Sr. No.</th> 
				<th width=48%>Description</th>
				<th width=10%>UOM</th>
				<th width=15%>Quantity</th>
				<th width=15%>Drg.No. / IND.No.</th>

			</tr>
		</thead>
		<tbody>
 
			<c:forEach items="${editEnquiry.enquiryDetailList}" var="item" varStatus="count">
				<tr>
					<td width="7%" align="center"><c:out value="${count.index+1}" /></td> 
					<td width="48%" align="left" style="padding: 5px;"><c:out
							value="${item.itemCode}" /></td>
					<td width="10%" align="left" style="padding: 5px;"><c:out
							value="${item.vendorName}" /></td>
					<td width="15%" align="right" style="padding: 5px;"><c:out value="${item.enqQty}" /></td>
					
					<c:choose>
						<c:when test="${item.indNo==null || item.indNo==''}">
						<td width="15%" align="center"><c:out
							value="-" /></td>
						</c:when>
						<c:otherwise>
						<td width="15%" align="center"><c:out
							value="${item.indNo}" /></td>
						</c:otherwise>
					</c:choose>
					

				</tr>

			</c:forEach>

		</tbody>
	</table>

	<br>
	
	<h6 style="font-weight: bold; margin-bottom: 10px;" align="left">YOUR
		QUOTATION WILL NOT BE CONSIDERED IF NOT RECEIVED IN THE ENCLOSED
		ENVELOPE</h6>


<div class="invoice-box">
        <table cellpadding="0" cellspacing="0">

 <tr class="information" >
                <td colspan="1" valign="top">
                    <table>
                        <tr>
                            <td valign="top">
                               VALIDITY -  Your quotation should be valid for  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from the date of receipt.<br><br>
                                PRICE - 1. Should be F.O.R. Nashik / SNR / Free Delivery at our stores basis inclusive of packing charges.<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. For job work, under no circumstances the price will be increased later on.
                                Therefore please quote price taking all aspects into consideration.
                                <br><br>
                                PAYMENT - Within  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from the date of receipt and acceptance of goods at our end.
                                <br>
                                
                            </td>
                            
                            
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
            </div>




<table width="100%" border="0"  cellpadding="0" cellspacing="0" style="border-top:1px solid #313131;border-right:1px solid #313131;">
  
 
    
  <tr>
    <td colspan="6" width="50%" style="border-left:1px solid #313131; padding:8px;color:#000; font-size:12px;">
     <p style="color:#000; font-size:10px; text-align:left;margin:0px;font-weight: normal;">DRAWING/ SPECIMENS / NORMS ETC- Drawings, Specimens, Norms or other data enclosed with this enquiry are for your price calculations only. PLEASE RETURN THEM ALONG WITH YOUR QUOTATION.</p>
</td>
    <td colspan="6" width="50%" style="border-left:1px solid #313131; padding:8px;color:#000; font-size:12px;">
     <p style="color:#000; font-size:10px; vertical-align:top; text-align:center; margin:0px;font-weight: normal;">For TRAMBAK RUBBER INDUSTRIES LTD.</td>
  </tr>
  
  
    
 
  
  <tr>
    <td colspan="6"  width="50%" style="border-bottom:1px solid #313131;border-top:1px solid #313131;border-left:1px solid #313131; padding:10px;color:#000; font-size:12px;">
     <p style="color:#000; font-size:10px; text-align:left;margin:0px;">NOTE - Your quotation will be considered only if received on or before the due date.</p>
</td>
    <td align="center" colspan="6" width="38%" style="border-bottom:1px solid #313131;border-top:0px solid #313131;border-left:1px solid #313131; padding:10px;color:#000;font-size:12px;">Purchase Officer</td>
  </tr>
  
</table>

<h5 style="font-weight: normal; margin: 0px;" align="left">NASHIK OFFICE : "MARUTI", 3 & 4, TAGORE NAGAR, OPP. AMBEDKAR NAGAR, NASHIK</h5>

<h5 style="font-weight: normal; margin: 0px;" align="left">PHONE: 0253-2410069, FAX : 0253-2417180, Email : purchase@trambakrubber.com</h5>

<h5 style="font-weight: bold; margin: 0px;" align="left">WORKS: A-83, A-86, A-107, A-110, Sinnar Tal. Indl. Estate, SINNAR - 422 103</h5>


	<!-- END Main Content -->

</body>
</html>