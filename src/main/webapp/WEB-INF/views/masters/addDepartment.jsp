<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="FocusOnInput()">

	<c:url var="checkDeptCodeExist" value="/checkDeptCodeExist"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>
	<c:url var="getDeptListExportToExcel" value="/getDeptListExportToExcel"></c:url>


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

						<i class="fa fa-file-o"></i>Department

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>
								<c:choose>
										<c:when test="${isEdit==1}">
										Edit Department
										</c:when>
										<c:otherwise>
										Add Department
										</c:otherwise>
									</c:choose>
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addDepartment">Add Department</a> <a
									data-action="collapse" href="#"><i class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertDepartment" 
								onsubmit="return confirm('Do you really want to submit the form?');" method="post">
								<div class="box-content">

									<div class="col-md-2">Department Code*</div>
									<div class="col-md-3">
									<c:choose>
										<c:when test="${isEdit==1}">
										<input id="deptCode" class="form-control"
											placeholder="Department Code" value="${editDept.deptCode}"
											style="text-align: left;" maxlength="6"  onkeydown="upperCaseF(this)" name="deptCode" type="text"
											readonly> 
										</c:when>
										<c:otherwise>
										<input id="deptCode" class="form-control"
											placeholder="Department Code" value="${editDept.deptCode}"
											style="text-align: left;" maxlength="6" onchange="checkDeptCodeExist()" onkeydown="upperCaseF(this)" name="deptCode" type="text"
											required> 
										</c:otherwise>
									</c:choose>
										 <input id="deptId" class="form-control"
											name="deptId" value="${editDept.deptId}" type="hidden">
									</div>
									 

								</div><br>
								
								<div class="box-content">
 
									<div class="col-md-2">Department Description*</div>
									<div class="col-md-10">
										<input id="deptDesc" class="form-control"
											placeholder="Department Description"
											value="${editDept.deptDesc}" style="text-align: left;"
											name="deptDesc" type="text" required>

									</div>


								</div>
								<br> <br> <br>
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
									
									<c:choose>
										<c:when test="${isEdit==1}">
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit">
										</c:when>
										<c:otherwise>
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit" disabled>
										</c:otherwise>
									</c:choose> 
									</div>
								</div>

								<div class="box-content">

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
													<th style="width:2%;">Sr no.</th>
													<th class="col-md-1">Department Code</th>
													<th class="col-md-5">Department Description</th>
													<th class="col-md-1">Action</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${deparmentList}" var="deparmentList"
													varStatus="count">
													<tr>
														<td><c:out value="${count.index+1}" /></td>


														<td class="col-md-1"><c:out
																value="${deparmentList.deptCode}" /></td>
														<td class="col-md-1"><c:out
																value="${deparmentList.deptDesc}" /></td>

														<td><a
															href="${pageContext.request.contextPath}/editDepartment/${deparmentList.deptId}"><abbr
																title="Edit"><i class="fa fa-edit"></i></abbr></a>&nbsp;&nbsp;
															<a
															href="${pageContext.request.contextPath}/deleteDepartment/${deparmentList.deptId}"
															onClick="return confirm('Are you sure want to delete this record');"><span
																class="glyphicon glyphicon-remove"></span></a></td>

													</tr>
												</c:forEach>

											</tbody>

										</table>

									</div>
								</div>
								
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="button" id="expExcel" class="btn btn-primary"
								value="EXPORT TO Excel" onclick="exportToExcel();">
								<button class="btn btn-primary" value="PDF" id="PDFButton"
						disabled="disabled" onclick="genPdf()">PDF</button>

									</div>
								</div>
								
								 
							</form>
						</div>
					</div>
					




				</div>


			</div>
			<footer>
			<p>2019 © MONGINIS</p>
		</footer>
		</div>


		<div class=" box-content"></div>

		<!-- END Main Content -->
		

		<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
			class="fa fa-chevron-up"></i></a>
	</div>
	<!-- END Content -->
	</div>
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
	
function checkDeptCodeExist() {
	
	var deptCode = $("#deptCode").val(); 

	$.getJSON('${checkDeptCodeExist}', {

		deptCode : deptCode,
		ajax : 'true',

	}, function(data) {
		
		if(data==0) 
		{
			document.getElementById("submit").disabled = false;  
		}
		else if(deptCode=="" || deptCode==null)
		{
			document.getElementById("submit").disabled = true; 
		}
		else
		{
			alert("Code Is Available ");
			document.getElementById("submit").disabled = true;
		}
 
	});

}

		function exportToExcel() {

			$.getJSON('${getDeptListExportToExcel}', {

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
			window.open('${pageContext.request.contextPath}/deptListPdf/');

		}
		function upperCaseF(a){
		    setTimeout(function(){
		        a.value = a.value.toUpperCase();
		    }, 1);
		}
	</script>
	
	<script>
function myFunction() {
  var input, filter, table, tr, td ,td1, i;
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
    	      }  else {
    	        tr[i].style.display = "none";
    	      }
       
    }  
    
     
  }
}
function FocusOnInput()
{
document.getElementById("deptCode").focus();
}
</script>

</body>
</html>