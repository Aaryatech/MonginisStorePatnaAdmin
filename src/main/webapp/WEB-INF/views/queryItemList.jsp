<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<%-- <c:url var="getMixingListWithDate" value="/getMixingListWithDate"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>

	<c:url var="getItemListExportToExcel" value="/getItemListExportToExcel" /> --%>
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
			<div class="page-title">
				<!-- <div>
					<h1>

						<i class="fa fa-file-o"></i>Query Item List

					</h1>
				</div> -->
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Query: <b>${docType}</b>
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem"> Add
									Item</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class="box-content">
							<div class="col-md-1">
								<p>
									<b> ${itemList[0].itemCode}</b>
								</p>
							</div>
							<div class="col-md-10">
								<p>
									<b>${itemList[0].itemDesc}</b>
								</p>
							</div>

							<div class="col-sm-1">
								<p>
									UOM:<b>${itemList[0].itemUom}</b>
								</p>
							</div>

						</div>
						<div class="box-content">
							<div class="col-md-9"></div>
							<!-- 	<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label> -->

							<br /> <br />
							<div class="clearfix"></div>
							<c:choose>
								<c:when test="${docId==1}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">Indent No</th>
													<th class="col-md-1">Date</th>
													<th class="col-md-1">Category</th>
													<th class="col-md-1">Department</th>
													<th class="col-md-1">Sub Department</th>
													<th class="col-md-1">Ind. Qty</th>
													<th class="col-md-1">Status</th>

												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">

													<c:set var="status" value="-" />


													<c:if test="${itemList.indDStatus==0}">
														<c:set var="status" value="Pending" />
													</c:if>

													<c:if test="${itemList.indDStatus==1}">
														<c:set var="status" value="Partial" />
													</c:if>

													<c:if test="${itemList.indDStatus==2}">
														<c:set var="status" value="Completed" />
													</c:if>
													<c:if test="${itemList.indDStatus==9}">
														<c:set var="status" value="Pending Apr 1" />
													</c:if>
													<c:if test="${itemList.indDStatus==7}">
														<c:set var="status" value="Pending Apr 2" />
													</c:if>
													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.indMNo}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.indMDate}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.catDesc}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.deptDesc}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.subDeptDesc}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.indQty}" /></td>

														<td class="col-md-1"><c:out value="${status}" /></td>

													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>

								<c:when test="${docId==2}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">PO No</th>
													<th class="col-md-1">PO Date</th>
													<th class="col-md-1">PO Type</th>
													<th class="col-md-1">Vendor Code</th>
													<th class="col-md-1">Vendor Name</th>
													<th class="col-md-1">PO.Qty</th>
													<th class="col-md-1">PO.Rate</th>
													<th class="col-md-1">Ind.Qty</th>
													<th class="col-md-1">Ind No</th>
													<th class="col-md-1">Ind Date</th>

												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">

													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out value="${itemList.poNo}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.poDate}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.poType}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.vendorCode}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.vendorName}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.itemQty}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.itemRate}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.indedQty}" /></td>
														<td class="col-md-1"><c:out value="${itemList.indNo}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.indDate}" /></td>

													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>

								<c:when test="${docId==3}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">Mrn No</th>
													<th class="col-md-1">Date</th>
													<th class="col-md-1">PO No</th>
													<th class="col-md-1">Vendor Code</th>
													<th class="col-md-1">Vendor Name</th>
													<th class="col-md-1">Recd Qty</th>
													<th class="col-md-1">Chalan Qty</th>
													<th class="col-md-1">Acc Qty</th>
													<th class="col-md-1">Rej Qty</th>
													<th class="col-md-1">Po Date</th>
													<th class="col-md-1">Indent No</th>
													<th class="col-md-1">Indent Date</th>

												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">

													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out value="${itemList.mrnNo}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.mrnDate}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.poDate}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.vendorCode}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.vendorName}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.mrnQty}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.chalanQty}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.approveQty}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.rejectQty}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.poDate}" /></td>
														<td class="col-md-1"><c:out value="${itemList.indNo}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.indDate}" /></td>

													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>


								<c:when test="${docId==4 or docId==5}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">Ret No</th>
													<th class="col-md-1">Date</th>
													<th class="col-md-1">Vendor Name</th>
													<th class="col-md-1">Qty</th>
													<th class="col-md-1">Reason</th>
													<th class="col-md-1">Type</th>

												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">

													<c:set var="gpType" value="${itemList.gpType}"></c:set>

													<c:if test="${itemList.gpType==1}">
														<c:set var="gpType" value="Returnable"></c:set>
													</c:if>

													<c:if test="${itemList.gpType==0}">
														<c:set var="gpType" value="Non Returnable"></c:set>
													</c:if>
													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out value="${itemList.gpNo}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.gpDate}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.vendorName}" /></td>

														<td class="col-md-1"><c:out value="${itemList.gpQty}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.reason}" /></td>
														<td class="col-md-1"><c:out value="${gpType}" /></td>

													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>


								<c:when test="${docId==6}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">Issue No</th>
													<th class="col-md-1">Date</th>
													<th class="col-md-1">Department</th>
													<th class="col-md-1">Sub Department</th>
													<th class="col-md-1">Qty</th>


												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">


													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.issueNo}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.issueDate}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.deptDesc}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.subDeptDesc}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.itemIssueQty}" /></td>

													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>

								<c:when test="${docId==8}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">Enq. No</th>
													<th class="col-md-1">Date</th>
													<th class="col-md-1">Vendoor Name</th>
													<th class="col-md-1">Qty</th>


												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">


													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out value="${itemList.enqNo}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.enqDetailDate}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.vendorName}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.enqQty}" /></td>

													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>


								<c:when test="${docId==9}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">Rej No</th>
													<th class="col-md-1">Date</th>
													<th class="col-md-1">Vendoor Name</th>
													<th class="col-md-1">Qty</th>


												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">


													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out value="${itemList.rejNo}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.rejectionDate}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.vendorName}" /></td>
														<td class="col-md-1"><c:out
																value="${itemList.rejectionQty}" /></td>

													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>


								<c:when test="${docId==10}">

									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr class="bgpink">

													<th style="width: 2%;">Sr</th>
													<th class="col-md-1">Date</th>
													<th class="col-md-1">Qty</th>
													<th class="col-md-2">Reason</th>



												</tr>
											</thead>
											<tbody>

												<c:forEach items="${itemList}" var="itemList"
													varStatus="count">


													<tr>
														<td style="width: 2%;"><c:out
																value="${count.index+1}" /></td>
														<td class="col-md-1"><c:out value="${itemList.date}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.qty}" /></td>

														<td class="col-md-1"><c:out
																value="${itemList.reason}" /></td>
														
													</tr>
												</c:forEach>
											</tbody>

										</table>

									</div>

								</c:when>


							</c:choose>



						

						</div>

					</div>
				</div>

			</div>
			<footer>
				<p>2019 © MONGINIS</p>
			</footer>
		</div>


		<!-- END Main Content -->


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

	<script type="text/javascript">
		function exportToExcel() {

			$.getJSON('${getItemListExportToExcel}', {

				ajax : 'true',

			}, function(data) {

				var len = data.length;

				if (data == "") {
					document.getElementById("expExcel").disabled = true;
					document.getElementById("PDFButton").disabled = true;
				}
				document.getElementById("PDFButton").disabled = false;
				alert("asd");
				exportExcel();
			}

			);

		}
		function exportExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
	</script>

	<script type="text/javascript">
		function genPdf() {
			window.open('${pageContext.request.contextPath}/itemListPdf/');

		}
	</script>
	<script>
function myFunction() {
  var input, filter, table, tr, td,td1, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    td1 = tr[i].getElementsByTagName("td")[2];
    if (td || td1) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }  
    
   /*  if (td1) {
        if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }   */
  }
}
</script>
</body>
</html>