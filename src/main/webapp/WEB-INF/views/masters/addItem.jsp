<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="FocusOnInput()">


	<c:url var="getgroupIdByCatId" value="/getgroupIdByCatId"></c:url>
	<c:url var="getSubGroupIdByGroupId" value="/getSubGroupIdByGroupId"></c:url>
	<c:url var="exhibitorMobileNo" value="/exhibitorMobileNo"></c:url>

	<c:url var="getNextItemCode" value="/getNextItemCode"></c:url>


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

						<i class="fa fa-file-o"></i>Item

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
									<c:when test="${isEdit==1}">Edit Item</c:when>
									<c:otherwise>Add Item</c:otherwise>
								</c:choose>
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/getItemList">
									Item List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/insertItem" enctype="multipart/form-data"
								onsubmit="return confirm('Do you really want to submit the form?');" method="post">
								
								<div class="box-content">

									<div class="col-md-2">Select Category*</div>
									<div class="col-md-3">
									
									<c:choose>
										<c:when test="${isEdit==1}">
										<input id="catId" value="${editItem.catId}" name="catId" type="hidden" >
										<select class="form-control chosen"  name="catIde" id="catIde" disabled>
											<option value="">select</option>
											<c:forEach items="${categoryList}" var="categoryList">
												<c:choose>
													<c:when test="${categoryList.catId==editItem.catId}">
														<option value="${categoryList.catId}" selected>${categoryList.catDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${categoryList.catId}">${categoryList.catDesc}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>
										</select>
										</c:when>
										<c:otherwise>
										<select class="form-control"
											onchange="getgroupIdByCatId()" name="catId" id="catId"
											required>
											<option value="">select</option>
											<c:forEach items="${categoryList}" var="categoryList">
												<c:choose>
													<c:when test="${categoryList.catId==editItem.catId}">
														<option value="${categoryList.catId}" selected>${categoryList.catDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${categoryList.catId}">${categoryList.catDesc}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>
										</select>
										</c:otherwise>
									</c:choose>
									 

									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Select Group*</div>
									<div class="col-md-3">
									
									<c:choose>
										<c:when test="${isEdit==1}">
										<input id="grpId" value="${editItem.grpId}" name="grpId" type="hidden" >
										<select class="form-control chosen"
											onchange="getSubGroupIdByGroupId()" name="grpIde" id="grpIde" disabled>
											<c:forEach items="${getItemGroupList}" var="getItemGroupList">
												<c:choose>
													<c:when test="${getItemGroupList.grpId==editItem.grpId}">
														<option value="${getItemGroupList.grpId}" selected>${getItemGroupList.grpCode}&nbsp;&nbsp;${getItemGroupList.grpDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${getItemGroupList.grpId}">${getItemGroupList.grpCode}&nbsp;&nbsp;${getItemGroupList.grpDesc}</option>
													</c:otherwise>
												</c:choose> 
											</c:forEach> 
										</select>
										</c:when>
										<c:otherwise>
										<select class="form-control chosen"
											onchange="getSubGroupIdByGroupId()" name="grpId" id="grpId"
											required>
											<c:forEach items="${getItemGroupList}" var="getItemGroupList">
												<c:choose>
													<c:when test="${getItemGroupList.grpId==editItem.grpId}">
														<option value="${getItemGroupList.grpId}" selected>${getItemGroupList.grpCode}&nbsp;&nbsp;${getItemGroupList.grpDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${getItemGroupList.grpId}">${getItemGroupList.grpCode}&nbsp;&nbsp;${getItemGroupList.grpDesc}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>

										</select>
										</c:otherwise>
									</c:choose>
									 
									</div>

								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Item Code*</div>
									<div class="col-md-3">
									<c:choose>
										<c:when test="${isEdit==1}">
										<input id="itemCode" class="form-control"
											placeholder="Item Code" value="${editItem.itemCode}"
											style="text-align: left;" name="itemCode" type="text"
											readonly>
										</c:when>
										<c:otherwise>
										<input id="itemCode" class="form-control"
											placeholder="Item Code" value="${editItem.itemCode}"
											style="text-align: left;" maxlength="6" onchange="checkItemCodeExist()" onkeydown="upperCaseF(this)" name="itemCode" type="text"
											readonly>
										</c:otherwise>
									</c:choose>
										 <input id="itemId" class="form-control"
											name="itemId" value="${editItem.itemId}" type="hidden">

									</div>
									 
									<div class="col-md-1"></div>
									<div class="col-md-2">Select Sub-Group*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="subGrpId"
											id="subGrpId" required>

											<c:forEach items="${getItemSubGrpList}"
												var="getItemSubGrpList">
												<c:choose>
													<c:when
														test="${getItemSubGrpList.subgrpId==editItem.subGrpId}">
														<option value="${getItemSubGrpList.subgrpId}" selected>${getItemSubGrpList.subgrpDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${getItemSubGrpList.subgrpId}">${getItemSubGrpList.subgrpDesc}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>

										</select>


									</div>  
									
									 
								</div>
								<br>
								
								<div class="box-content">

									  
									<div class="col-md-2">Item Description*</div>
									<div class="col-md-10">
										<input id="itemDesc" class="form-control"
											placeholder="Item Description" value='${editItem.itemDesc}'
											style="text-align: left;" name="itemDesc" type="text"
											required>
									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">UOM*</div>
									<div class="col-md-3">
									
									<select class="form-control chosen" name="uom"
											id="uom" required>
											<option value="">Select UOM</option>
											  <c:forEach items="${uomList}"
												var="uomList">
												  <c:set var="uomString" value="${uomList.uomId}"></c:set>  
												  <c:choose>
													<c:when
														test="${editItem.itemUom2 eq uomString}">
														<option value="${uomList.uomId}" selected>${uomList.uom}</option>
													</c:when>
													<c:otherwise>  
														<option value="${uomList.uomId}">${uomList.uom}</option>
													  </c:otherwise>
												</c:choose>  


											</c:forEach>  

										</select>
										 

									</div>
									<div class="col-md-1"></div>
									<!-- <div class="col-md-2">Item Date*</div> -->
									<div class="col-md-3">
										<input id="itemDate" class="form-control date-picker"
											placeholder="Item Date" value="${date}"
											name="itemDate" type="hidden" readonly>


									</div>

								</div>
								<br>

								

								<%-- <div class="box-content">
								
								

									 <div class="col-md-2">Select Sub-Group*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="subGrpId"
											id="subGrpId" required>

											<c:forEach items="${getItemSubGrpList}"
												var="getItemSubGrpList">
												<c:choose>
													<c:when
														test="${getItemSubGrpList.subgrpId==editItem.subGrpId}">
														<option value="${getItemSubGrpList.subgrpId}" selected>${getItemSubGrpList.subgrpDesc}</option>
													</c:when>
													<c:otherwise>
														<option value="${getItemSubGrpList.subgrpId}">${getItemSubGrpList.subgrpDesc}</option>
													</c:otherwise>
												</c:choose>


											</c:forEach>

										</select>


									</div>  

								</div> --%>
								 
								<div class="box-content">
 
									
									<div class="col-md-2">MIN Qty*</div>
									<div class="col-md-3">
										<input id="opQty" class="form-control"
											placeholder="Item OP Qty" name="opQty"
											value="${editItem.itemOpQty}" style="text-align: left;"
											pattern="[+-]?([0-9]*[.])?[0-9]+" title="Enter in Number Formate" type="text" required>


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Item OP Rate*</div>
									<div class="col-md-3">
										<input id="opRate" class="form-control"
											placeholder="Item OP Rate" name="opRate"
											value="${editItem.itemOpRate}"
											pattern="[+-]?([0-9]*[.])?[0-9]+" style="text-align: left;"
											title="Enter in Number Formate" type="text" required>

									</div>


								</div>
								<br>

								<div class="box-content"> 
								
								<c:choose>
										<c:when test="${isEdit==1}">
										<div class="col-md-2">MAX Qty*</div>
									<div class="col-md-3">
										<input id="clQty" class="form-control"
											placeholder="Item OP Qty" name="clQty"
											value="${editItem.itemClQty}" style="text-align: left;"
											title="Enter in Number Formate" type="number" readonly>


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Item CL Rate*</div>
									<div class="col-md-3">
										<input id="clRate" class="form-control"
											placeholder="Item CL Rate" name="clRate"
											value="${editItem.itemClRate}"
											pattern="[+-]?([0-9]*[.])?[0-9]+" style="text-align: left;"
											title="Enter in Number Formate" type="text" readonly>


									</div>
										</c:when>
										<c:otherwise>
										<div class="col-md-2">MAX Qty*</div>
									<div class="col-md-3">
										<input id="clQty" class="form-control"
											placeholder="Item OP Qty" name="clQty"
											pattern="[+-]?([0-9]*[.])?[0-9]+" value="${editItem.itemClQty}" style="text-align: left;"
											title="Enter in Number Formate" type="text" required>


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">Item CL Rate*</div>
									<div class="col-md-3">
										<input id="clRate" class="form-control"
											placeholder="Item CL Rate" name="clRate"
											value="${editItem.itemClRate}"
											pattern="[+-]?([0-9]*[.])?[0-9]+" style="text-align: left;"
											title="Enter in Number Formate" type="text" required>


									</div>
										</c:otherwise>
									</c:choose>
									
									


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Item Min Level*</div>
									<div class="col-md-3">
										<input id="minLevel" class="form-control"
											placeholder="Item Min Level" name="minLevel"
											pattern="[+-]?([0-9]*[.])?[0-9]+" value="${editItem.itemMinLevel}" style="text-align: left;"
											title="Enter in Number Formate" type="text" required>


									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Item Max Level*</div>
									<div class="col-md-3">
										<input id="maxLevel" class="form-control"
											placeholder="Item Max Level" name="maxLevel"
											pattern="[+-]?([0-9]*[.])?[0-9]+" value="${editItem.itemMaxLevel}" style="text-align: left;"
											title="Enter in Number Formate" type="text" required>


									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Item Rod Level*</div>
									<div class="col-md-3">
										<input id="rodLevel" class="form-control"
											placeholder="Item Rod Level" name="rodLevel"
											pattern="[+-]?([0-9]*[.])?[0-9]+" value="${editItem.itemRodLevel}" style="text-align: left;"
											title="Enter in Number Formate" type="text" required>


									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Item Weight*</div>
									<div class="col-md-3">
										<input id="itemWeight" class="form-control"
											placeholder="Item Weight" name="itemWeight"
											value="${editItem.itemWt}" pattern="[+-]?([0-9]*[.])?[0-9]+"
											style="text-align: left;" title="Enter in Number Formate"
											type="text" required>


									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Item Location*</div>
									<div class="col-md-3">
										<input id="itemLocation" class="form-control"
											placeholder="Item Location" name="itemLocation"
											value="${editItem.itemLocation}" style="text-align: left;"
											type="text" required>


									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Item Abc*</div>
									<div class="col-md-3">
										<input id="itemAbc" class="form-control"
											placeholder="Item Abc" name="itemAbc"
											style="text-align: left;" value="${editItem.itemAbc}"
											type="text" required>


									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Item Life*</div>
									<div class="col-md-3">
										<input id="itemLife" class="form-control"
											placeholder="Item Life" name="itemLife"
											style="text-align: left;" value="${editItem.itemLife}"
											type="text" required>

									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Item Schd*</div>
									<div class="col-md-3">
										<input id="itemSchd" class="form-control"
											placeholder="Item Schd" name="itemSchd"
											style="text-align: left;" value="${editItem.itemSchd}"
											type="text" required>


									</div>


								</div>
								<br>
								<div class="box-content">

									<div class="col-md-2">Item Is Critical*</div>
									<div class="col-md-3">
										<select class="form-control chosen" title="Please Select"
											name="isCritical" id="isCritical" required>
											<c:choose>
												<c:when test="${editItem.itemIsCritical==0}">
													<option value="0" selected>NO</option>
													<option value="1">YES</option>
												</c:when>
												<c:when test="${editItem.itemIsCritical==1}">
													<option value="0">NO</option>
													<option value="1" selected>YES</option>
												</c:when>
												<c:otherwise>
													<option value="0">NO</option>
													<option value="1">YES</option>
												</c:otherwise>

											</c:choose>

										</select>
									</div>

									<div class="col-md-1"></div>
									<div class="col-md-2">Select HSN CODE*</div>
									<div class="col-md-3">
										<select class="form-control chosen" title="Please Select"
											name="isCapital" id="isCapital" required>
											<option value="">Select HSN Code</option>
											<c:forEach items="${taxFormList}" var="taxFormList" >
											<c:choose>
											
												<c:when test="${editItem.itemIsCapital==taxFormList.taxId}">
													<option value="${taxFormList.taxId}" selected><c:out value="${taxFormList.taxDesc}"/></option>
												</c:when>
												 
												<c:otherwise>
													<option value="${taxFormList.taxId}"><c:out value="${taxFormList.taxDesc}"/></option>
												</c:otherwise>

											</c:choose>
												
											</c:forEach>
											

										</select>

									</div>


								</div>
								<br>

								<div class="box-content">

									<div class="col-md-2">Is Active*</div>
									<div class="col-md-3">
										<select class="form-control chosen" title="Please Select"
											name="itemCon" id="itemCon" required>


											<c:choose>
												<c:when test="${editItem.itemIsCons==0}">
													<option value="0" selected>YES</option>
													<option value="1">NO</option>
												</c:when>
												<c:when test="${editItem.itemIsCons==1}">
													<option value="0">YES</option>
													<option value="1" selected>NO</option>
												</c:when>
												<c:otherwise>
													<option value="0">YES</option>
													<option value="1">NO</option>
												</c:otherwise>

											</c:choose>

										</select>
									</div>

									<div class="col-md-1"></div>

								</div>

								<br>
								
								<div class="box-content">
									<div class="form-group">
										<div class="col-md-2">Image</div>
										<div class="col-md-3">
											<div class="fileupload fileupload-new"
												data-provides="fileupload">
												<div class="fileupload-new img-thumbnail"
													style="width: 150px; height: 150px;">
													<img src="${imageUrl}${editItem.itemDesc3}"
														onerror="this.src='http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image"
														alt="" />
												</div>
												<div
													class="fileupload-preview fileupload-exists img-thumbnail"
													style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
												<div>
													<span class="btn btn-default btn-file"><span
														class="fileupload-new">Select image</span> <span
														class="fileupload-exists">Change</span> <input type="file"
														oninvalid="this.setCustomValidity('Please insert Image here')"
														oninput="this.setCustomValidity('')" / class="file-input"
														name="documentFile" id="documentFile" /></span> <a href="#"
														class="btn btn-default fileupload-exists"
														data-dismiss="fileupload">Remove</a>

												</div>
											</div>
											<input class="form-control" id="imageName" value="${editItem.itemDesc3}"  type="hidden" name="imageName" />
										</div>

									</div>

								</div>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br>

								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">

								<c:choose>
										<c:when test="${isEdit==1}">
										<input type="submit" class="btn btn-info" onclick="check()" value="Submit"
											id="submit">
										</c:when>
										<c:otherwise>
										<input type="submit" class="btn btn-info" onclick="check()" value="Submit"
											id="submit"  >
										</c:otherwise>
									</c:choose> 

									</div>
								</div>
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
	
	function checkItemCodeExist() {
		
		var itemCode = $("#itemCode").val(); 

		$.getJSON('${checkItemCodeExist}', {

			itemCode : itemCode,
			ajax : 'true',

		}, function(data) {
			
			if(data==0) 
			{
				document.getElementById("submit").disabled = false;  
			}
			else if(itemCode=="" || itemCode==null)
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
		    
		function check() {

			var uom = document.getElementById("uom").value;
			var catId = document.getElementById("catId").value;
			var grpId = document.getElementById("grpId").value;
			var subGrpId = document.getElementById("subGrpId").value;

			if (uom == "" || uom == null) {
				alert("Select UOM");
			} else if (catId == "" || catId == null) {
				alert("Select Category");
			}
			else if (grpId == "" || grpId == null) {
				alert("Select Group ");
			}
			else if (subGrpId == "" || subGrpId == null) {
				alert("Select Sub Group");
			}
		}
	</script>

	<script type="text/javascript">
		function getgroupIdByCatId() {

			var catId = document.getElementById("catId").value;

			$.getJSON('${getgroupIdByCatId}', {

				catId : catId,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="">Select Category</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].grpId + '">'
							+ data[i].grpCode + '&nbsp;&nbsp;&nbsp;'+data[i].grpDesc+'</option>';
				}
				html += '</option>';
				$('#grpId').html(html);
				$("#grpId").trigger("chosen:updated");
			});
		}

		function getSubGroupIdByGroupId() {

			var grpId = document.getElementById("grpId").value;
			
			getNextItemCode();

			$.getJSON('${getSubGroupIdByGroupId}', {

				grpId : grpId,
				ajax : 'true'
			}, function(data) {

				  var html = '<option value="">Select Sub-Category</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].subgrpId + '">'
							+ data[i].subgrpDesc + '</option>';
				}
				html += '</option>';
				$('#subGrpId').html(html);
				$("#subGrpId").trigger("chosen:updated"); 
			});
		}
		
		function getNextItemCode() {

			var grpId = document.getElementById("grpId").value;

			$.getJSON('${getNextItemCode}', {

				grpId : grpId,
				ajax : 'true'
			}, function(data) {
				 document.getElementById("itemCode").value = data.message;
			});
		}
		
		function upperCaseF(a){
		    setTimeout(function(){
		        a.value = a.value.toUpperCase();
		    }, 1);
		}
		function FocusOnInput()
		{
		document.getElementById("catId").focus();
		}
	</script>


</body>
</html>