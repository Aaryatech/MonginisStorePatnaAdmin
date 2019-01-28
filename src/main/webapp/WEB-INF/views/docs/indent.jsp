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
<title>Indent PDF</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


<style type="text/css">
table {
	border-collapse: separate;
	border-color: black;
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

		<h4 align="center" align="center" style=" font-family: arial; font-weight: bold; font-size: 120%;">${company.companyName}</h4>
 		
 		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="1000px">
							<tr>
								<td width="200px"  valign="top" align="center" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;"> 
								</td>
								<td width="600px"  valign="top" align="center" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;">STORE REQUISITION / INDENT
								</td>
								<td width="200px"  valign="top" align="left" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;">
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
						<table width="1000px"> 
							<tr>
								<td  width="600px"  valign="top" align="left" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;"> Indent No. : ${item.indMNo}
								</td>
								 
								  
								<td width="400px"  valign="top" align="right" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;">Date : ${item.indMDate}
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
						<table width="1000px">
							<tr>
								<td width="500px" valign="top"
									  ><%--Indenting
									Category &nbsp;&nbsp;&nbsp; - ${item.catDesc}<br> Account Head
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ${item.accHeadDesc} <br>  For
									Development &nbsp;&nbsp;&nbsp;- <c:choose>
										<c:when test="${item.indIsdev==1}">YES</c:when><c:otherwise>NO</c:otherwise>
									</c:choose><br> --%> Indent Type : ${item.typeName}
								</td>

								<%-- <td width="500px"
									 align="right" >
								  	Department &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;- ${item.deptDesc} <br> Sub department
									&nbsp;&nbsp;&nbsp;- ${item.subDeptDesc}<br> Monthly &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;	-
									<c:choose>
										<c:when test="${item.indIsmonthly==1}">YES</c:when><c:otherwise>NO</c:otherwise>
									</c:choose> 
 
								</td> --%>

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
		  
		<br>
		
		<table align="center" border="1" cellpadding="0" cellspacing="0"
			 
			id="table_grid">
			<thead>
				<tr style="font-size: 95%;">
					<th>Sr.</th>

					<th width="40%">Description</th>
					<th>UOM</th>
					<th>Qty. Req.</th>
					<th>Schedule Date</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="25" />
				<c:set var="total" value="0" />

				<c:forEach items="${item.indentReportDetailList}" var="row"
					varStatus="count">



					<c:choose>

						<c:when test="${totalRowCount eq maxRowCount}">

							<c:set var="totalRowCount" value="${totalRowCount+1}" />




							<!-- new page -->
			</tbody>
		</table>

		<!-- start of footer -->
		  
		 <div align="left">
			<h5>${documentBean.docIsoSerialNumber}</h5>
		</div>


		<h4 align="center" align="center" align="center" style=" font-family: arial; font-weight: bold; font-size: 120%;">${company.companyName}</h4>
 
 		 <div class="invoice-box">
			<table cellpadding="0" cellspacing="0" width="1000px">

				<tr class="information">
					<td valign="top">
						<table width="1000px">
							<tr>
								<td width="200px"  valign="top" align="center" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;"> 
								</td>
								<td width="600px"  valign="top" align="center" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;">STORE REQUISITION / INDENT
								</td>
								<td width="200px"  valign="top" align="left" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;">
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
						<table width="1000px"> 
							<tr>
								<td  width="600px"  valign="top" align="left" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;"> Indent No. : ${item.indMNo}
								</td>
								  
								<td width="400px"  valign="top" align="right" 
								style=" font-family: arial; font-weight: bold; font-size: 95%;">Date : ${item.indMDate}
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
						<table width="1000px">
							<tr>
								<td width="500px" valign="top"
									  >Indenting
									Category &nbsp;&nbsp;&nbsp; - ${item.catDesc}<br> Account Head
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ${item.accHeadDesc} <br> <%-- For
									Development &nbsp;&nbsp;&nbsp;- <c:choose>
										<c:when test="${item.indIsdev==1}">YES</c:when><c:otherwise>NO</c:otherwise>
									</c:choose><br> --%> Indent Type
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ${item.typeName}
								</td>

								<%-- <td width="500px"
									 align="right" >
								  	Department &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;- ${item.deptDesc} <br> Sub department
									&nbsp;&nbsp;&nbsp;- ${item.subDeptDesc}<br> Monthly &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;	-
									<c:choose>
										<c:when test="${item.indIsmonthly==1}">YES</c:when><c:otherwise>NO</c:otherwise>
									</c:choose> 
 
								</td> --%>

							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
		<br>  


		<table align="center" border="1" cellpadding="0" cellspacing="0"
			 
			id="table_grid">
			<thead>
				<tr style="font-size: 95%;">
					<th>Sr.</th>

					<th width="40%">Description</th>
					<th>UOM</th>
					<th>Qty. Req.</th>
					<th>Schedule Date</th>
				</tr>
			</thead>
			<tbody>




				<c:set var="totalRowCount" value="0" />
				<c:set var="maxRowCount" value="25" />
				<c:set var="total" value="0" />




				<!-- end of new page -->

				</c:when>

				</c:choose>

				  <%-- <c:set var="totalRowCount" value="${totalRowCount+1}" /> --%>  

				 
				<tr style="font-size: 95%;">
					<td width="5%" align="center"><c:out value="${count.index+1}" /></td>
					<td   align="left" style="padding: 10px;"><c:out value="${row.indItemDesc}" /></td>
					<td width="6%" align="center"><c:out value="${row.indItemUom}" /></td>
					<td width="6%" align="right" style="padding: 10px;"><c:out value="${row.indQty}" /></td>
					<td width="15%" align="center"><c:out
							value="${row.indItemSchddt}" /></td>

				</tr>
	</c:forEach>

	</tbody>
	</table>

		<br>
		

<!-- 
	<table cellpadding="0" cellspacing="0">

				<tr class="information">
					<td colspan="1" valign="top">
						<table>
							<tr>
								<td width="25%" valign="top" align="left"
									style="padding: 8px; color: #000;  ">

									Purpose &nbsp;&nbsp;&nbsp;- </td>


							</tr>

						</table>
					</td>
				</tr>
			</table> -->
<br><br>
		<div class="invoice-box">
			 
						<table width="1000px">
							<tr>
								<td width="500px" valign="top" align="center"
									style="padding: 8px; color: #000;  font-weight: bold;">

									Prepared By</td>

							 

								<td width="500px" valign="top" align="center"
									style="padding: 8px; color: #000;  font-weight: bold;">

									Approved By</td>

							</tr>

						</table> 
			<hr
				style="height: 1px; border: none; color: black; background-color: black;">

		</div>
		<div style="page-break-after: always;"></div>
	</c:forEach>

	<!-- END Main Content -->

</body>
</html>