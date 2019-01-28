<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="FocusOnInput()">

	<c:url var="checkSubDeptCodeExist" value="/checkSubDeptCodeExist"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>
	<c:url var="getSubDeptListExportToExcel"
		value="/getSubDeptListExportToExcel"></c:url>


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

						<i class="fa fa-file-o"></i>Sub Department

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
										Edit Sub Department
										</c:when>
										<c:otherwise>
										Add Sub Department
										</c:otherwise>
									</c:choose> 
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addSubDepartment">
									Add Sub Department</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertsubDept"
								onsubmit="return confirm('Do you really want to submit the form?');" method="post">
								<div class="box-content">
								
								<div class="col-md-2">Sub Department Code*</div>
									<div class="col-md-3">
									
									<c:choose>
										<c:when test="${isEdit==1}">
										<input id="subGroupCode" class="form-control"
											placeholder="Sub Group Code"
											value="${editSubDept.subDeptCode}" style="text-align: left;"
											name="subGroupCode" type="text" readonly>
										</c:when>
										<c:otherwise>
										<input id="subGroupCode" class="form-control"
											placeholder="Sub Group Description"
											value="${editSubDept.subDeptCode}" style="text-align: left;"
											name="subGroupCode" maxlength="6" onchange="checkSubDeptCodeExist()" onkeydown="upperCaseF(this)" type="text" required>
										</c:otherwise>
									</c:choose>  
									</div>
							<div class="col-md-1"></div>
							
							<div class="col-md-2">Select Department*</div>
									<div class="col-md-3">

										<select class="form-control chosen" name="deptId" id="deptId"
											required> 
											<option value=""  >Select Department</option>
											<c:forEach items="${deparmentList}" var="deparmentList">
												<c:choose>
													<c:when test="${deparmentList.deptId==editSubDept.deptId}">
														<option value="${deparmentList.deptId}" selected>${deparmentList.deptCode}&nbsp;&nbsp;${deparmentList.deptDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${deparmentList.deptId}">${deparmentList.deptCode}&nbsp;&nbsp;${deparmentList.deptDesc}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>
										</select>
									</div>
							 
									 
								</div>
								<br>
								<div class="box-content">
								
								<div class="col-md-2">Sub Department*</div>
									<div class="col-md-10">
										<input id="subDeptDesc" class="form-control"
											placeholder="Sub Department"
											value="${editSubDept.subDeptDesc}" style="text-align: left;"
											name="subDeptDesc"  type="text" required> <input
											id="subDeptId" class="form-control" name="subDeptId"
											value="${editSubDept.subDeptId}" type="hidden">

									</div>
 
								</div>
								<br> <br>
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<c:choose>
										<c:when test="${isEdit==1}">
										<input type="submit" onclick="check()" class="btn btn-info" value="Submit"
											id="submit">
										</c:when>
										<c:otherwise>
										<input type="submit" onclick="check()" class="btn btn-info" value="Submit"
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
													<th style="width:3%;">Sr no.</th>
													<th class="col-md-1">Sub Department </th>
													<th class="col-md-1">Sub Department Code</th>
													<th class="col-md-1">Department</th>
													<th class="col-md-1">Action</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${subDeptList}" var="subDeptList"
													varStatus="count">
													<tr>
														<td><c:out value="${count.index+1}" /></td>


														<td class="col-md-5"><c:out
																value="${subDeptList.subDeptDesc}" /></td>
														<td class="col-md-1"><c:out
																value="${subDeptList.subDeptCode}" /></td>
														<td class="col-md-1"><c:out
																value="${subDeptList.deptCode}" /></td>
														<td><a
															href="${pageContext.request.contextPath}/editSubDept/${subDeptList.subDeptId}"><abbr
																title="Edit"><i class="fa fa-edit"></i></abbr></a>&nbsp;&nbsp;
															<a
															href="${pageContext.request.contextPath}/deleteSubDept/${subDeptList.subDeptId}"
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


			<div class=" box-content"></div>

			<!-- END Main Content -->
			<footer>
				<p>2019 © MONGINIS</p>
			</footer>

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
	
	function checkSubDeptCodeExist() {
		
		var subGroupCode = $("#subGroupCode").val(); 

		$.getJSON('${checkSubDeptCodeExist}', {

			subGroupCode : subGroupCode,
			ajax : 'true',

		}, function(data) {
			
			if(data==0) 
			{
				document.getElementById("submit").disabled = false;  
			}
			else if(subGroupCode=="" || subGroupCode==null)
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

			$.getJSON('${getSubDeptListExportToExcel}', {

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
			window.open('${pageContext.request.contextPath}/subDeptListPdf/');

		}
		function upperCaseF(a){
		    setTimeout(function(){
		        a.value = a.value.toUpperCase();
		    }, 1);
		}
		
		function check() {

			var deptId = document.getElementById("deptId").value;
			 
			if (deptId == "" || deptId == null) {
				alert("Select Department");
			} 
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
document.getElementById("subGroupCode").focus();
}
</script>
</body>
</html>