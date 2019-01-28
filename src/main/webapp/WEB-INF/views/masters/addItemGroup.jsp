<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="FocusOnInput()">

	<c:url var="checkGroupCodeExist" value="/checkGroupCodeExist"></c:url>
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

						<i class="fa fa-file-o"></i>Item Group

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
										Edit Item Group
										</c:when>
										<c:otherwise>
										Add Item Group
										</c:otherwise>
									</c:choose>
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addItemGroup">
									Add Item Group</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertItemGroup"
								onsubmit="return confirm('Do you really want to submit the form?');" method="post">
								<div class="box-content">

									<div class="col-md-2">Group Code*</div>
									<div class="col-md-3">
									<c:choose>
										<c:when test="${isEdit==1}">
										<input id="grpCode" class="form-control"
									placeholder="Group Code" style="text-align: left;"
									name="grpCode" value="${editItemGroup.grpCode}" type="text"
									readonly> 
										</c:when>
										<c:otherwise>
										<input id="grpCode" class="form-control"
									placeholder="Group Code" style="text-align: left;"
									name="grpCode" maxlength="2" onchange="checkGroupCodeExist()" onkeydown="upperCaseF(this)" value="${editItemGroup.grpCode}" type="text"
									required> 
										</c:otherwise>
									</c:choose>
									
										<input id="grpId" class="form-control"
									name="grpId" value="${editItemGroup.grpId}" type="hidden">
									
									</div>
									<div class="col-md-1"></div>
									
									<div class="col-md-2">Select Category*</div>
									<div class="col-md-3"> 
								<select class="form-control chosen"  name="catId" id="catId"   required>
									<option value="">select</option>
									<c:forEach items="${categoryList}" var="categoryList">
										<c:choose>
											<c:when test="${categoryList.catId==editItemGroup.catId}">
												<option value="${categoryList.catId}" selected>${categoryList.catDesc}</option>
											</c:when>
											<c:otherwise>
												<option value="${categoryList.catId}">${categoryList.catDesc}</option>
											</c:otherwise>
										</c:choose>


									</c:forEach>
								</select>
									</div>
									 

								</div>
								<br> 
								<div class="box-content">

									<div class="col-md-2">Group Description*</div>
									<div class="col-md-10">
										<input id="grpDesc" class="form-control"
									placeholder="Delivery Term Description"
									style="text-align: left;" name="grpDesc" type="text"
									value="${editItemGroup.grpDesc}" required>
									
									</div>
									 
								</div> <br>
								
								<div class="box-content">

									 
									<div class="col-md-2">Group Value*</div>
									<div class="col-md-3">
										<input id="grpValueyn" class="form-control"
									placeholder="Group Value" style="text-align: right: ;"
									pattern="[+-]?([0-9]*[.])?[0-9]+" name="grpValueyn" type="text"
									value="${editItemGroup.grpValueyn}" required>
									
									</div>
									 
								</div>
								
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										 
									<c:choose>
										<c:when test="${isEdit==1}">
										<input type="submit" class="btn btn-info" onclick="check()" value="Submit"
											id="submit">
										</c:when>
										<c:otherwise>
										<input type="submit" class="btn btn-info" onclick="check()" value="Submit"
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
											<th class="col-sm-1">Sr no.</th>
											<th class="col-md-2">Group Code</th>
											<th class="col-md-2">Group Description</th>
											<th class="col-md-2">Group Value</th>
											<th class="col-md-2">Category</th>
											<th class="col-md-1">Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${itemGroupList}" var="itemGroupList"
											varStatus="count">
											<tr>
												<td class="col-md-1"><c:out value="${count.index+1}" /></td>


												<td class="col-md-1"><c:out
														value="${itemGroupList.grpCode}" /></td>

												<td class="col-md-1"><c:out
														value="${itemGroupList.grpDesc}" /></td>

												<td class="col-md-1"><c:out
														value="${itemGroupList.grpValueyn}" /></td>

												<td class="col-md-1"><c:out
														value="${itemGroupList.catDesc}" /></td>


												<td><a
													href="${pageContext.request.contextPath}/editItemGroup/${itemGroupList.grpId}"><abbr
														title="Edit"><i class="fa fa-edit"></i></abbr></a>  
															<a href="${pageContext.request.contextPath}/deleteItemGroup/${itemGroupList.grpId}" onClick="return confirm('Are you sure want to delete this record');"><span
												class="glyphicon glyphicon-remove"></span></a></td>

											</tr>
										</c:forEach>

									</tbody>

								</table>
  
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
	function checkGroupCodeExist() {
		
		
		var grpCode = $("#grpCode").val(); 
		if(grpCode.length==2){
		$.getJSON('${checkGroupCodeExist}', {

			grpCode : grpCode,
			ajax : 'true',

		}, function(data) {
			
			if(data==0) 
			{
				document.getElementById("submit").disabled = false;  
			}
			else if(grpCode=="" || grpCode==null)
			{
				document.getElementById("submit").disabled = true; 
			}
			else
			{
				alert("Code Is Available ");
				document.getElementById("grpCode").value = "";
				document.getElementById("submit").disabled = true;
				document.getElementById("grpCode").focus();
			}
	 
		});
		}
		else{
			alert("Enter 2 Length Group Code ");
			document.getElementById("grpCode").value = "";
			document.getElementById("submit").disabled = true;
			document.getElementById("grpCode").focus();
		}

	}
		function check() {

			var catId = $("#catId").val(); 
			 if(catId=="" || catId==null)
				 {
				 alert("Select Category");
				 }
		}
		function upperCaseF(a){
		    setTimeout(function(){
		        a.value = a.value.toUpperCase();
		    }, 1);
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
document.getElementById("grpCode").focus();
}
</script>

</body>
</html>