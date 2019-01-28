<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getMixingListWithDate" value="/getMixingListWithDate"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>

	<c:url var="getItemListExportToExcel" value="/getItemListExportToExcel" />
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
					<h1>

						<i class="fa fa-file-o"></i>Item List

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Item List
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItem"> Add
									Item</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						
						<c:set value="0" var="isEdit"></c:set>
								<c:set value="0" var="isDelete"></c:set>
									<c:forEach items="${sessionScope.newModuleList}" var="allModuleList" >
															<c:choose>
																<c:when test="${allModuleList.moduleId==sessionScope.sessionModuleId}">
																	  <c:forEach items="${allModuleList.subModuleJsonList}" var="subModuleJsonList" >
																	  		<c:choose>
																			  	<c:when test="${subModuleJsonList.subModuleId==sessionScope.sessionSubModuleId}">
																			  		  <c:choose>
																			  		  
																			  				<c:when test="${subModuleJsonList.editReject eq 'visible'}">
																			  				<c:set value="1" var="isEdit"></c:set>
																			  				</c:when>
																			  			</c:choose>
																			  			<c:choose>
																			  				<c:when test="${subModuleJsonList.deleteRejectApprove eq 'visible'}">
																			  				<c:set value="1" var="isDelete"></c:set>
																			  				</c:when> 
																			  			</c:choose>
																			  	</c:when>
																		  	</c:choose>
																	  </c:forEach>
																</c:when> 
															</c:choose>
														 
														</c:forEach> 
 		<form id="submitPurchaseOrder" action="${pageContext.request.contextPath}/getItemList" method="get">
						<div class="box-content">
						
						<div class="box-content">

									 
									<div class="col-md-2">Select Category*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="catId" id="catId"
											required>
											<option value="0">All</option>
											<c:forEach items="${categoryList}" var="categoryList">
											<c:choose>
												<c:when test="${categoryList.catId==catId}">
												<option value="${categoryList.catId}" selected>${categoryList.catDesc}</option> 
												</c:when>
												<c:otherwise>
												<option value="${categoryList.catId}">${categoryList.catDesc}</option> 
												</c:otherwise>
											</c:choose> 
													 
											</c:forEach>
										</select>

									</div>
								</div><br> <br> 
								
								<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-info"   value="Search">
								  
							</div>
							
						</div> <br>
						
						
							<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label>
								
							<br /> <br />
							<div class="clearfix"></div>
							<div class="table-responsive" style="border: 0">
								<table class="table table-advance" id="table1">
									<thead>
										<tr class="bgpink">
											<th style="width:2%;">Sr No</th>
											<th class="col-md-1">Item Code</th>
											<th class="col-md-5">Item Description</th>  
											<th class="col-md-1">Item UOM</th>
											<th class="col-md-1">Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${itemList}" var="itemList"
											varStatus="count">
											<tr>
												<td style="width:2%;"><c:out value="${count.index+1}" /></td>
												<td class="col-md-1"><c:out
														value="${itemList.itemCode}" /></td>
												 <td class="col-md-5"><c:out
														value="${itemList.itemDesc}" /></td> 
												<td class="col-md-1"><c:out value="${itemList.itemUom}" /></td>
												<td><c:choose>
																<c:when test="${isEdit==1}"><a
													href="${pageContext.request.contextPath}/editItem/${itemList.itemId}"
													data-toggle="tooltip" title="Edit"><span
														class="glyphicon glyphicon-edit"></span></a></c:when></c:choose>
														<c:choose>
											 					<c:when test="${isDelete==1}"> <a
													href="${pageContext.request.contextPath}/deleteItem/${itemList.itemId}"
													onClick="return confirm('Are you sure want to delete this record');"
													data-toggle="tooltip" title="Delete"><span
														class="glyphicon glyphicon-remove"></span></a></c:when></c:choose></td>
											</tr>
										</c:forEach>
									</tbody>

								</table>

							</div>
							
							
							<div class=" box-content">
									<div class="col-md-12" style="text-align: center">

								<input type="button" id="expExcel" class="btn btn-primary"
							value="EXPORT TO Excel" onclick="exportToExcel();">
							<button class="btn btn-primary" value="PDF" id="PDFButton"
					  onclick="genPdf()">PDF</button>

									</div>
								</div>
							
							
						</div>
</form>
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