<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="FocusOnInput()">

	<c:url var="checkUserExist" value="/checkUserExist"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>


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

						<i class="fa fa-file-o"></i>Add Account Head

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
								<c:choose><c:when test="${isEdit==1}">Edit User</c:when><c:otherwise>Add User</c:otherwise> </c:choose> 
							</h3>
							<div class="box-tool">
								<c:choose>
									<c:when test="${flag==1}">
									<a href="${pageContext.request.contextPath}/addUser">
									Add User</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
									</c:when>
									<c:otherwise>
									<a href="${pageContext.request.contextPath}/userEdit/${userInfo.id}/0">
									Edit Profile </a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
									
									</c:otherwise>
									</c:choose> 
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertUser"
								onsubmit="return confirm('Do you really want to submit the form?');" method="post">
								<div class="box-content">

									<div class="col-md-2">User Name*</div>
									<div class="col-md-5">
									<c:choose>
									<c:when test="${isEdit==1}">
									<input id="userName" class="form-control"
								placeholder="User Name" value="${editUser.username}" onchange="checkUserExist()" style="text-align: left;" name="userName" type="text" readonly>
									</c:when>
									<c:otherwise><input id="userName" class="form-control"
								placeholder="User Name" value="${editUser.username}" onchange="checkUserExist()" style="text-align: left;" name="userName" type="text" required>
									</c:otherwise> </c:choose> 
										
								<input id="userId" class="form-control"
								  name="userId" value="${editUser.id}" type="hidden" >
								  <input id="roleId" class="form-control"
								  name="roleId" value="${editUser.roleId}" type="hidden" >
								  <input id="flag" class="form-control"
								  name="flag" value="${flag}" type="hidden" >
								  <input id="orignalPass" class="form-control"
								  name="orignalPass" value="${editUser.password}" type="hidden" >
								  <input id="currentDeptId" class="form-control"
								  name="currentDeptId" value="${editUser.deptId}" type="hidden" >
									</div>
									<div class="col-md-1"></div>
									
									 
								</div>
								<br> 
								
								<c:choose>
										<c:when test="${flag==0}">
										 
											 <div class="box-content"> 
													<div class="col-md-2">Enter Old Password*</div>
													<div class="col-md-5">
													 
														<input id="oldPass" class="form-control"
												placeholder="Enter Old Password" onchange="checkOldPass();" style="text-align: left;" name="oldPass" type="text" required>
														 
													</div>
													<div class="col-md-1"></div> 
											</div>
											<br>
										</c:when> 
									</c:choose>
								
								<div class="box-content">

									
									<c:choose>
										<c:when test="${flag==1}">
										<div class="col-md-2">Password*</div>
									<div class="col-md-5">
										<input id="pass" class="form-control"
								placeholder="Password" value="${editUser.password}"  style="text-align: left;" name="pass" type="text" required>
										</div>
										</c:when>
										<c:otherwise>
										<div class="col-md-2">New Password*</div>
									<div class="col-md-5">
										<input id="pass" class="form-control"
								placeholder="Password"  onchange="passwordValidation();" style="text-align: left;" name="pass" type="text" required>
								</div>
										</c:otherwise>
									</c:choose>
									
								 
									<div class="col-md-1"></div>
									
									 
								</div>
								<br>
								
								<c:choose>
										<c:when test="${flag==1}">
								<div class="box-content">

									
									 
										<div class="col-md-2">Select Department*</div>
									<div class="col-md-5">
									<select class="form-control chosen" name="deptId" id="deptId"
											required>
											<option value="">Select</option>
											<c:forEach items="${departmentMasterList}" var="departmentMasterList">
											<c:choose>
												<c:when test="${departmentMasterList.deptId==editUser.deptId}">
												<option value="${departmentMasterList.deptId}" selected>${departmentMasterList.deptName}</option> 
												</c:when>
												<c:otherwise>
												<option value="${departmentMasterList.deptId}">${departmentMasterList.deptName}</option> 
												</c:otherwise>
											</c:choose> 
													 
											</c:forEach>
										</select>
										</div>
										 
									<div class="col-md-1"></div>
									
									 
								</div>
								<br>
								</c:when> 
									</c:choose>
								
								<c:choose>
										<c:when test="${flag==0}">
								<div class="box-content"> 
										<div class="col-md-2">Re-Password*</div>
									<div class="col-md-5">
										<input id="repass" class="form-control"
								placeholder="Re-Password" onchange="passwordValidation();" style="text-align: left;" name="repass" type="text" required>
										</div>
										 
									<div class="col-md-1"></div>
									
									 
								</div> 
								<br>
								</c:when> 
									</c:choose>
								
								  
					<br>
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
									<c:choose>
											<c:when test="${isEdit==1}"> 
												<c:choose> 
													<c:when test="${flag==0}">
														<input type="submit" class="btn btn-info" value="Submit"
																id="submit"  disabled>
													</c:when>
													<c:otherwise>
													<input type="submit" class="btn btn-info" value="Submit"
																id="submit"  >
													</c:otherwise>  
												</c:choose> 
											</c:when> 
											<c:otherwise>
										<input type="submit" class="btn btn-info" value="Submit"
											id="submit" disabled>
											</c:otherwise> 
									</c:choose> 
											 
									</div>
								</div>
								<c:choose>
									<c:when test="${flag==1}">
									 
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
													<th class="col-md-1">Sr no.</th> 
													<th >User Name</th> 
													<th class="col-md-1">Password </th>
													<th class="col-md-1">Action </th>
												</tr>
											</thead>
											<tbody>
											
											  <c:forEach items="${userList}" var="userList"
									varStatus="count">
									<tr>
										 <td class="col-md-1"><c:out value="${count.index+1}" /></td>
										  
											 
										 <td><c:out value="${userList.username}" /></td> 
										 <td class="col-md-1"><c:out value="${userList.password}" /></td>
									 <td class="col-md-1">
									 <a href="${pageContext.request.contextPath}/userEdit/${userList.id}/1"><abbr title="Edit"><i  class="fa fa-edit"></i></abbr></a>&nbsp;&nbsp;
									 <a href="${pageContext.request.contextPath}/userDelete/${userList.id}" onClick="return confirm('Are you sure want to delete this record');"><span
												class="glyphicon glyphicon-remove"></span></a>
									  
									 </td>
										 
									</tr>
								</c:forEach>  

											</tbody>

								</table>
  
					</div>
				</div>
				</c:when>
								</c:choose>
							</form>


						</div>
					</div>


				</div>
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
function checkUserExist() {
		
		var userName = $("#userName").val(); 
		
		if(userName.length>0)
		{
			//alert(vendorCode);
			$.getJSON('${checkUserExist}', {
	
				userName : userName,
				ajax : 'true',
	
			}, function(data) {
				
				 
				 if(data==0){
					 document.getElementById("submit").disabled = false; 
				 }
				 else{
					 document.getElementById("submit").disabled = true;
						document.getElementById("userName").value = "";
						document.getElementById("userName").focus();
						alert("User Is Already Register ");
						
				 }
					 
			});
		}
		else{
			document.getElementById("submit").disabled = true; 
			alert("Enter User Name ");
		}

	}
		function passwordValidation() {
 
			var pass = document.getElementById("pass").value;
			var pass1 = document.getElementById("repass").value;

			if (pass != "" && pass1 != "") {
				if (pass != pass1) {
					alert("Password Not Matched ");
					document.getElementById("submit").disabled = true;
				} else {
					document.getElementById("submit").disabled = false;

				}

			}
		}
		
		function checkOldPass() {
			 
			var oldPass = document.getElementById("oldPass").value;
			var originalPass = document.getElementById("orignalPass").value;

			if (oldPass != "" && originalPass != "") {
				if (oldPass != originalPass) {
					alert("Old Password Not Matched ");
					document.getElementById("submit").disabled = true;
					document.getElementById("oldPass").value="";
					document.getElementById("oldPass").focus();
				} else {
					alert("Password Match");
					document.getElementById("submit").disabled = false;
					document.getElementById("oldPass").disabled = true;

				}

			}
		}
		
		
	</script>
	<script>
function myFunction() {
  var input, filter, table, tr,td1, td, i;
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
document.getElementById("userName").focus();
}
</script>

</body>
</html>