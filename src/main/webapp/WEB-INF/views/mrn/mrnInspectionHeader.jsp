<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	
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

						<i class="fa fa-file-o"></i>MRN

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						 <div class="box-title">
							<h3>
								<i class="fa fa-list"></i>Mrn Inspection List
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/">
									</a> <a data-action="collapse" href="#"></a>
							</div>

						</div>
 
						<div class=" box-content">
							<form id="addInspection"
								action="${pageContext.request.contextPath}/getMrnInspForVendor"
								method="post">
								<div class="box-content">

									<div class="col-md-2">Vendor*</div>
										<div class="col-md-3">
										<select name="vendId" id="vendId" class="form-control chosen" tabindex="6" required>
										<option value="">Select Vendor</option>
										<option value="0" selected>ALL</option>
											 <c:forEach items="${vendorList}" var="vendorList"
							varStatus="count">
							<c:choose>
							<c:when test="${vendorId==vendorList.vendorId}">
							 <option value="${vendorList.vendorId}" selected><c:out value="${vendorList.vendorName}"/></option>
							
							</c:when>
							<c:otherwise>
							 <option value="${vendorList.vendorId}" ><c:out value="${vendorList.vendorName}"/></option>
							
							</c:otherwise>
							</c:choose>
 													 
												</c:forEach>
						

										</select>
									</div>
									
									<div class="col-md-2">Select Mrn Status</div>
								<div class="col-md-3">

									<select  id="mrn_status"
										class="form-control chosen" tabindex="6" name="mrn_status"
										required>
										<c:choose>
							<c:when test="${status==-1}">
										<option value="-1" selected>All</option>
										<option value="0">Pending</option>
										<option value="1">Partial Pending</option>
										<option value="2">Completed</option>
							</c:when>
								<c:when test="${status==0}">
										<option value="-1" >All</option>
										<option value="0"selected>Pending</option>
										<option value="1">Partial Pending</option>
										<option value="2">Completed</option>
							</c:when>
								<c:when test="${status==1}">
										<option value="-1" >All</option>
										<option value="0">Pending</option>
										<option value="1"selected>Partial Pending</option>
										<option value="2">Completed</option>
							</c:when>
							
								<c:when test="${status==2}">
										<option value="-1" >All</option>
										<option value="0">Pending</option>
										<option value="1">Partial Pending</option>
										<option value="2"selected>Completed</option>
							</c:when>
							<c:otherwise>
							            <option value="-1" >All</option>
										<option value="0">Pending</option>
										<option value="1">Partial Pending</option>
										<option value="2">Completed</option>
							</c:otherwise>
							</c:choose>

									</select>

								</div>
									<div class="col-md-1"></div>
									<div class="col-md-2"><input type="submit" class="btn btn-info" value="Submit"
											id="submit">

									</div>
									 
								</div>
								<br>
								
								
								<div class="box-content">

					<br /> <br />
					
					<div class="col-md-8" ></div> 
		<!-- 			<label for="search" class="col-md-2" id="search">
    <i class="fa fa-search" style="font-size:15px"></i>
									<input type="text" value="" id="myInput" style="text-align: left; width: 240px;" class="form-control" onkeyup="myFunction()" placeholder="Search Mrn by Name or Vendor" title="Type in a name">
										</label>  -->
										<div class="input-group">
    <input type="text"  id="myInput"  style="text-align: left; color: green;" class="form-control" onkeyup="myFunction()" placeholder="Search By Mrn No or Vendor Name"/>
    <span class="input-group-addon">
        <i class="fa fa-search"></i>
    </span>
</div>
<br/>
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table1">  
									<thead>
												<tr class="bgpink">
													<th class="col-sm-1">Sr no.</th> 
													<th class="col-md-1">MRN No.</th> 
													<th class="col-md-1">Date</th>
													<th class="col-md-2">MRN Type</th>
													<th class="col-md-4">Vendor</th>
													<th class="col-md-1">Status</th>
													<th class="col-md-1">Action</th>
												</tr>
											</thead>
											<tbody>
											
											  <c:forEach items="${getMrnHeaderList}" var="getMrnHeaderList"
									varStatus="count">
									<tr>
										 <td class="col-md-1"><c:out value="${count.index+1}" /></td>
										 <td class="col-md-1"><c:out value="${getMrnHeaderList.mrnNo}" /></td> 
									     <td class="col-md-1"><c:out value="${getMrnHeaderList.mrnDate}" /></td> 
									     <td class="col-md-2">
									     <c:forEach items="${typeList}" var="typeList" >
									<c:choose><c:when test="${typeList.typeId==getMrnHeaderList.mrnType}"><c:out value="${typeList.typeName}" /></c:when></c:choose>
									</c:forEach>
									     
									     </td> 
										 <td class="col-md-4"><c:out value="${getMrnHeaderList.vendorName}" /></td> 
									     <td class="col-md-1"><c:choose><c:when test="${getMrnHeaderList.mrnStatus==0}"><c:out value="Inspection Pending" /></c:when><c:when test="${getMrnHeaderList.mrnStatus==2}"><c:out value="Inspection Complete" /></c:when><c:when test="${getMrnHeaderList.mrnStatus==2}"><c:out value="1st Approved Complete" /></c:when><c:when test="${getMrnHeaderList.mrnStatus==3}"><c:out value="1st Approved Complete" /></c:when>
									     <c:when test="${getMrnHeaderList.mrnStatus==4}"><c:out value="2st Approved Complete" /></c:when><c:when test="${getMrnHeaderList.mrnStatus==1}"><c:out value="Partially Inspection " /></c:when></c:choose></td> 
									     <td class="col-md-1">
									     <a href="javascript:genPdf(${ getMrnHeaderList.mrnId});" title="PDF"><i
															class="glyphicon glyphicon glyphicon-file"></i></a>
										<a href="${pageContext.request.contextPath}/getMrnDetail/${getMrnHeaderList.mrnId}"><abbr title="Details"><i  class="fa fa-list"></i></abbr></a></td> 
									</tr>
								</c:forEach>  

											</tbody>

								</table>
								<buttons
											style="background-color: #008CBA; border: none; color: white; text-align: center; text-decoration: none; display: block; font-size: 12px; cursor: pointer; width: 50px; height: 30px; margin: auto;"
											onclick="commonPdf()">PDF</button>
  
					</div>
				</div>
							</form>


						</div>
					</div>


				</div>
			</div>


			<div class=" box-content">

				

			</div>

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
		function passwordValidation() {

			var pass = document.getElementById("password").value;
			var pass1 = document.getElementById("rePassword").value;

			if (pass != "" && pass1 != "") {
				if (pass != pass1) {
					alert("Password Not Matched ");
					document.getElementById("submit").disabled = true;
				} else {
					document.getElementById("submit").disabled = false;

				}

			}
		}
	</script>
	<script type="text/javascript">
			function genPdf(id) {
			
		
				window.open('pdfForReport?url=/pdf/grnInspectionPdf/'+id
						 );

			}
			
			function commonPdf() {

				 
				 var list = [];
				 
							$("input:checkbox[name=name1]:checked").each(function(){
								list.push($(this).val());
				});
							
							window.open('pdfForReport?url=/pdf/grnInspectionPdf/' + list);

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
    td = tr[i].getElementsByTagName("td")[4];
    td1 = tr[i].getElementsByTagName("td")[1];
    if (td || td1) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }  else {
        tr[i].style.display = "none";
      }
    }       
  }//end of for
  
 
  
}
</script>

</body>
</html>