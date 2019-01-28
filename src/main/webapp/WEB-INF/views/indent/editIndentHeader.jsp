<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body onload="checkIndentDept()">
	<%-- <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include> --%>

	<c:url var="getSubDeptListByDeptId" value="/getSubDeptListByDeptId" />
	<c:url var="getgroupListByCatId" value="/getgroupListByCatId" />

	<c:url var="getIndentDetailForEdit" value="/getIndentDetailForEdit" />

	<c:url var="itemListByGroupId" value="/itemListByGroupId" />

	<c:url var="updateIndDetail" value="/updateIndDetail" />
	<c:url var="getMoqQtyForValidation" value="/getMoqQtyForValidation" />

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
						<i class="fa fa-file-o"></i>Edit Indent
					</h1>

				</div>
			</div> --><br>
			<!-- END Page Title -->
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Edit Indent
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/getIndents">Back to List</a> <a data-action="collapse" href="${pageContext.request.contextPath}/getIndents"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class="box-content">
							<form
								action="${pageContext.request.contextPath}/editIndentProcess"
								onsubmit="return confirm('Do you really want to Apply Changes In Indent ?');" method="post" class="form-horizontal" id="validation-form">

								<div class="form-group">

										 
									<c:forEach items="${typeList}" var="typeList"> 
															<c:choose>
																<c:when test="${typeList.typeId==indent.indMType}">
																	<c:set var="indmtype" value="${typeList.typeName}"></c:set>
																</c:when>
																 
															</c:choose> 
														</c:forEach>
<div class="col-md-1"></div>
									<div class="col-md-2">Indent
										Type</div>
									<div class="col-md-3">
										<c:out value="${indmtype}"></c:out>

									</div>
									<div class="col-md-2">Indent
										Category </div>
									<div class="col-md-3">
										<c:out value="${indent.catDesc}"></c:out>
										<input type="hidden" value="${indent.indMId}" name="indentId">
									</div>
									
								
								</div>
								<div class="form-group">
								
								<div class="col-md-1"></div>
									<div class="col-md-2">Indent
										No.</div>
									<div class="col-md-3">
										<c:out value="${indent.indMNo}"></c:out>
									</div>
								
									<div class="col-md-2">Date</div>
									<div class="col-md-3">
										<input class="form-control date-picker" id="indent_date"
											size="16" type="text" disabled="disabled" name="indent_date"
											value="${indent.indMDate}" required />
									</div>
								</div>
								
								<div class="form-group">
								
								<div class="col-md-1"></div>
									<div class="col-md-2">Remark</div>
									<div class="col-md-8">
										<input type="text" name="indHeaderRemark" id="indHeaderRemark" placeholder="Remark" class="form-control"  value="${indent.indRemark}" required />
									</div>
								 
								</div>
								 
								
								<!-- <div class="form-group">
								<div class="col-md-1"></div> 
									<div class="col-md-2">Account
										Head</div>-->
									<%-- <div class="col-md-3">
										<select name="acc_head" id="acc_head"
		 									class="form-control chosen" placeholder="Account Head"
											data-rule-required="true">
											<c:forEach items="${accountHeadList}" var="accHead"
												varStatus="count">
												<c:choose>
													<c:when test="${indent.achdId==accHead.accHeadId}">
														<option selected value="${accHead.accHeadId}"><c:out value="${accHead.accHeadDesc}"/></option>
													</c:when>
													<c:otherwise>
														<option value="${accHead.accHeadId}"><c:out value="${accHead.accHeadDesc}"/></option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div> --%>
									<input   id="acc_head"  type="hidden"   name="acc_head"
											value="${indent.achdId}"   />
									<input   id="machine_specific"  type="hidden"   name="machine_specific"
											value="${indent.deptId}"   />
											<input   id="subDeptDeptForCompare"  type="hidden"   name="subDeptDeptForCompare"
											value="${indent.subDeptId}"   />

									<%-- <div class="col-md-2">Machine
										Specific</div>

									<div class="col-md-3">
										<select name="machine_specificd" id="machine_specificd"
											onchange="showDept()" class="form-control chosen"
											placeholder="Is Machine Specific" data-rule-required="true">
											<c:choose>

												<c:when test="${indent.deptId==0}">
													<option selected value="0">No</option>
													<option value="1">Yes</option>
												</c:when>
												<c:otherwise>
													<option value="0">No</option>
													<option selected value="1">Yes</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div> --%>
								<!-- </div> -->
								
								<%-- <div class="form-group" style="display: none" id="deptDiv">
									<div class="col-md-1"></div>	<div class="col-md-2">Department
									</div>

									<div class="col-md-3">
										<select name="dept" id="dept" class="form-control chosen"
											placeholder="Department">
											<c:forEach items="${deparmentList}" var="dept"
												varStatus="count">
												<c:choose>
													<c:when test="${indent.deptId==dept.deptId}">
														<option selected value="${dept.deptId}"> ${dept.deptCode} &nbsp;&nbsp; ${dept.deptDesc} </option>
													</c:when>
													<c:otherwise>
														<option value="${dept.deptId}"> ${dept.deptCode} &nbsp;&nbsp; ${dept.deptDesc} </option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>

									<div class="col-md-2">Sub
										Department </div>
									<div class="col-md-3">
										<select name="sub_dept" id="sub_dept"
											class="form-control chosen" placeholder="Sub Department">

										</select>
									</div>

								</div> --%>
								<input   id="is_dev"  type="hidden"   name="is_dev" value="${indent.indIsdev}"   />
								<input   id="is_monthly"  type="hidden"   name="is_monthly" value="${indent.indIsmonthly}"   />
								<input   id="dept"  type="hidden"   name="dept" value="${indent.deptId}"   />
								<input   id="sub_dept"  type="hidden"   name="sub_dept" value="${indent.deptId}"   />
								
								<%-- <div class="form-group"><div class="col-md-1"></div>
								<div class="col-md-2">For
										Development </div>

									<div class="col-md-3">
										<select name="is_dev" id="is_dev" class="form-control"
											placeholder="Is Dev" data-rule-required="true">

											<c:choose>
												<c:when test="${indent.indIsdev==1}">
													<option selected value="1">Yes</option>
													<option value="0">No</option>

												</c:when>
												<c:otherwise>
													<option selected value="0">No</option>
													<option value="1">Yes</option>

												</c:otherwise>
											</c:choose>
										</select>
									</div>

									<div class="col-md-2"> For Monthly
									</div>
									<div class="col-md-3">
										<select name="is_monthly" id="is_monthly" class="form-control"
											placeholder="Is Monthly" data-rule-required="true">

											<c:choose>
												<c:when test="${indent.indIsmonthly==1}">
													<option selected value="1">Yes</option>
													<option value="0">No</option>

												</c:when>
												<c:otherwise>
													<option value="1">Yes</option>

													<option selected value="0">No</option>

												</c:otherwise>
											</c:choose>


										</select>
									</div>
								</div> --%>
								<br /> 
<hr/>
								<div>
								<span style="text-align: left; font-weight: bold;font-size: 20px;">Add Item</span>
									<!-- <div class="box-content">
									
										<label class="col-md-2">Group </label>
										<div class="col-sm-6 col-lg-10 controls">

											<select name="group" id="group" class="form-control"
												placeholder="Group" data-rule-required="true">
											</select>
										</div>
										<label class="col-sm-3 col-lg-2 control-label">Quantity</label>
									<div class="col-sm-6 col-lg-4 controls">
										<input type="text" name="quantity" id="quantity"
											class="form-control" placeholder="Quantity"
											data-rule-required="true" />
									</div>
									</div>
									<br /> -->
									<input   id="group"  type="hidden"   name="group" value="0"   />

									<div class="box-content">
										<label class="col-md-2">Item
											Name </label>
										<div class="col-sm-6 col-lg-10 controls">

											<select id="item_name" name="item_name"
												onchange="getMoqQty()" class="form-control chosen" placeholder="Item Name"
												>

											</select>
										</div>
									</div>
									<br /> <br>
									<div class="box-content">
										<label class="col-md-2">Quantity</label>
										<div class="col-sm-6 col-lg-2 controls">
											<input type="text" name="quantity" id="quantity"  
												class="form-control" placeholder="Quantity"
												    />
										</div>
										 
										<label class="col-md-2">Schedule
											Date</label>
										<div class="col-sm-3 col-lg-2 controls">
											<input type="text" name="sch_days" id="sch_days"
												class="form-control date-picker" placeholder="Schedule Date"
												    />
										</div>
										<label class="col-md-2">Remark</label>
										<div class="col-sm-6 col-lg-2 controls">

											<input type="text" name="remark" id="remark" maxlength="20" 
												class="form-control" placeholder="Remark"
												  />
										</div>
 
										
 
									</div><br><br>
									
									<div class="box-content">
								
								<label class="col-md-2"> MOQ Qty</label>
									<div class="col-sm-6 col-lg-2 controls">
									
									<input type="text" name="moqQtyByItemId" id="moqQtyByItemId"
											class="form-control" placeholder="MOQ Qty"
											  readonly/>
 
									</div>
									
									
									<label class="col-md-2"> Bal To Be Rec</label>
									<div class="col-sm-6 col-lg-2 controls">
									
									<input type="text" name="itemPendingMrnQty" id="itemPendingMrnQty"
											class="form-control" placeholder="Bal To Be Rec"
											  readonly/>
 
									</div>
									
									<label class="col-md-2">Avg Issue Qty</label>
									<div class="col-sm-6 col-lg-2 controls">
									
									<input type="text" name="itemAvgIssueQty" id="itemAvgIssueQty"
											class="form-control" placeholder="Avg Issue Qty"
											  readonly/>
 
									</div>
								</div>
								<br/>
									<br><br><br>
								<div class="row">
						<div class="col-md-12" style="text-align: center">
						<c:choose>
											<c:when test="${indent.indMStatus==7 || indent.indMStatus==9}">
											<input type="button" onclick="insertIndentDetail()"
											class="btn btn-info" value="Submit">
												
											</c:when>
											<c:otherwise>
											<input type="button" onclick="insertIndentDetail()"
											class="btn btn-info" value="Submit" disabled>
 
											</c:otherwise>
										</c:choose>
						
							 
						</div>
					</div>
								</div>

								<br />
								<div class="clearfix"></div>
								<div id="table-scroll" class="table-scroll">

									<div class="table-wrap">

										<table id="table1" class="table table-advance">
											<thead>
												<tr class="bgpink">
													<th width="2%">Sr</th>
													<th class="col-md-1" >Item
														Code</th>
													<th   >Item
														Desc</th>
													<th class="col-md-1" >UOM</th>
												
													<th class="col-md-1" >Indent
														Qty</th>
													 
													<th class="col-md-1" >Sch
														Date</th>
														<th class="col-md-1" >Remark</th>
														<th class="col-md-1" >Action
														</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${indDetailList}" var="indDetail"
													varStatus="count">

													<tr>
														<td  width="2%"><c:out
																value="${count.index+1}" /></td>
																
																<td  class="col-md-1"><c:out
																value="${indDetail.itemCode}" /></td>

														<td   ><c:out
																value="${indDetail.itemDesc}" /></td>
																
																	
																<td  class="col-md-1"><c:out
																value="${indDetail.itemUom}" /></td>
																

														<td  class="col-md-1"><input
															type="text" class="form-control"
															style="text-align:right; " value="${indDetail.indQty}" min="1"  
															onchange="(this.value,${indDetail.indDId},${indent.indMId})"
															id="indQty${indDetail.indDId}"
															name="indQty${indDetail.indDId}"></td>
														<td  class="col-md-1"><input type="date" class="form-control "  id="indSchDays${indDetail.indDId}" name="indSchDays${indDetail.indDId}" value="${indDetail.indItemSchddt}"  /></td>
 

														<td  class="col-md-1"><input type="text" class="form-control" value="${indDetail.indRemark}"  id='indRemark${indDetail.indDId}' name="indRemark${indDetail.indDId}"  size="20" maxlength="20" ></td>

														<td  class="col-md-1">
															<%-- <input
															type="button" value="update"
															onclick="updateCall(${indDetail.indDId},${indent.indMId})"> --%>

															<c:choose>
																<c:when test="${ indDetail.indDStatus==7 || indDetail.indDStatus==9 }">

																	<a href="#" class="action_btn" title="Update" 
																		onclick="updateCall(${indDetail.indDId},${indent.indMId},0)"><i id="updateButton${indDetail.indDId}"
																		class="fa fa-edit"></i></a> &nbsp;&nbsp;<a href="#"
																		class="action_btn" title="Delete"
																		onclick="updateCall(${indDetail.indDId},${indent.indMId},1)"><i
																		class="fa fa-trash-o"></i></a>
																</c:when>
															</c:choose>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12" style="text-align: center">

										<c:choose>
											<c:when test="${indent.indMStatus==7 || indent.indMStatus==9}">
											<input type="submit" class="btn btn-info"
													value="Submit">
												
											</c:when>
											<c:otherwise>
											<input type="submit" class="btn btn-info"
													value="Submit" disabled>
 
											</c:otherwise>
										</c:choose>



									</div>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<p>2019 © MONGINIS</p>
		</footer>
	</div>
	<!-- END Main Content -->


	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/common.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	<script type="text/javascript">
		function insertIndent() {
			//alert("inside Indent Insetr");
			var form = document.getElementById("validation-form");
			form.action = "${pageContext.request.contextPath}/saveIndent";
			form.submit();

		}
	</script>
	
	<!-- 1 -->
	
	<script type="text/javascript">
	function getMoqQty() {
		 
		var itemId = $("#item_name").val();
		 
		$.getJSON('${getMoqQtyForValidation}', {
	  
			itemId : itemId, 
			ajax : 'true',

		}, function(data) {  
			   
			document.getElementById("moqQtyByItemId").value = data.maxLevel;
				document.getElementById("itemPendingMrnQty").value = data.poPending;
				document.getElementById("itemAvgIssueQty").value = (data.avgIssueQty).toFixed(2);
		});

	}
	
	function validation()
	{
		var itemId = $("#item_name").val();
		var qty = $("#quantity").val();
		var schDay = $("#sch_days").val();
		 
		var isValid = true;
		if(itemId=="" || itemId==null)
		{
		isValid = false;
		alert("Please Select Item ");
		}
		
		else if(isNaN(qty) || qty <= 0 || qty=="")
		{
		isValid = false;
		alert("Please enter Quantity");
		}
		
		else if(schDay=="" || itemId==null)
		{
		isValid = false;
		alert("Please enter Schedule Date ");
		}
		
	return isValid;
		
	}
		function insertIndentDetail() {
			//alert
			var itemId = $('#item_name').val();
			var qty = $('#quantity').val();
			var remark = $('#remark').val();
			var schDay = $('#sch_days').val();
			var itemName = $("#item_name option:selected").html();
			var indMId=${indent.indMId};
			//alert("item Name " +itemName);
			var indentDate = $('#indent_date').val();
			
			if(validation()==true){	
				
		
			$.getJSON('${getIndentDetailForEdit}', {
				itemId : itemId,
				qty : qty,
				remark : remark,
				itemName : itemName,
				schDay : schDay,
				indentDate : indentDate,
				indMId : indMId,
				key : -1,
				ajax : 'true',

			}, function(data) {
				//alert(data);
				var len = data.length;
				$('#table1 td').remove();
				$.each(data, function(key, trans) {
					
				//alert(trans.indRemark );
					if(trans.isDuplicate==1){
						alert("Item Already Added in Indent");
					}
					var tr = $('<tr></tr>');
					tr.append($('<td  width="2%"></td>').html(key + 1));
					tr.append($('<td  class="col-md-1"></td>').html(trans.itemCode));

					tr.append($('<td   "></td>').html(trans.itemDesc));
					tr.append($('<td  class="col-md-1"></td>').html(trans.itemUom));

					//tr.append($('<td></td>').html(trans.qty));
				tr
															.append($(
																	'<td class="col-md-1" ></td>')
																	.html(
																			"<input type=text style='text-align:right; width:90px' class=form-control  name=indQty"
																					+ trans.indDId
																					+ " id=indQty"
																					+ trans.indDId
																					+ " onchange='(this.value,"
																					+ trans.indDId
																					+ ","
																					+ trans.indMId
																					+ ")' value="
																					+ trans.indQty 
																					+ " />"));
					tr.append($('<td  class="col-md-1"></td>').html("<input type=date style='text-align:left; ' class=form-control  name=indSchDays"
							+ trans.indDId
							+ " id=indSchDays"
							+ trans.indDId
							+ " value="
							+ trans.indItemSchddt 
							+ " />"));
					 
					tr.append($('<td  class="col-md-1"></td>').html("<input type=text style='text-align:right; ' class=form-control size=20 maxlength=20  name=indRemark"
							+ trans.indDId
							+ " id=indRemark"
							+ trans.indDId
							+ " value='"
							+ trans.indRemark
							+ "' >"));					
					if(trans.indDStatus==0 || trans.indDStatus==7 || trans.indDStatus==9 )
					{
					tr
					.append($(
							'<td class="col-md-1" ></td>')
							.html(
									"<a href='#'  class='action_btn'onclick=updateCall("+trans.indDId+","+trans.indMId+",0)  title='Update'><i id='updateButton+"+trans.indMId+"' class='fa fa-edit'></i></a>&nbsp;&nbsp;<a href='#' class='action_btn'onclick=updateCall("+trans.indDId+","+trans.indMId+",1) title='Delete'><i class='fa fa-trash-o'></i></a>"));
				  	
					}
					
					
				else
					{
					tr
					.append($(
							'<td class="col-md-1" ></td>')
							.html(''));
				  	
					}
				

					$('#table1 tbody').append(tr);
				})
			});
			}
		}
	</script>
	<!--/1  -->
	
	<script>
	function updateCall(indDId,indMId,del) {
		if(del==1){
			
	var x=confirm("Are you Sure to Delete  " );
		
		if(x==true)
			getValue(0,indDId,indMId,0,0);
		else{
			
		}
		}
		else{
			//document.getElementById("indQty"+indDId).removeAttribute("readonly");
			//document.getElementById("sch_days"+indDId).removeAttribute("readonly");
			//document.getElementById("ind_remark"+indDId).removeAttribute("readonly");
			//$("#updateButton" + indDId).removeClass("fa fa-edit");
			//$("#updateButton" + indDId).addClass("fa fa-save");
			//document.getElementById("billQty1" + token + "" + key).disabled = false;
			var qty = $('#indQty'+indDId).val();
			var remark = $('#indRemark'+indDId).val();
			var schDays = $('#indSchDays'+indDId).val();
		//	alert("qty " +qty +"remark  " +remark + "schDays  " +schDays);
		if(isNaN(qty) || qty <= 0 || qty==""){
			alert("Enter Qty  ");
		}
		else{
			
			getValue(qty,indDId,indMId,remark,schDays);
		}
			
		}
		//var qty = $('#indQty'+indDId).val();
		//alert(qty);
		//window.open('${pageContext.request.contextPath}/updateIndDetail/'+indDId+'/'+indMId+'/'+qty,"_self");
		
	}
	
	function getValue(qty,indDId,indMId,remark,schDays)
	{
		
		$.getJSON('${updateIndDetail}', {
	
		qty : qty,
		indDId : indDId,
		indMId : indMId,
		remark : remark,
		schDays : schDays,
			ajax : 'true',

		}, function(data) {
			//alert("dif " +indDId);
		//	document.getElementById("indQty"+indDId).setAttribute("readonly");
			 //$('#indQty'+indDId).setAttribute("readonly");
		//	alert(data);
			//alert("In update call")
			//var len = data.length;
			$('#table1 td').remove();
			$.each(data, function(key, trans) {
			var tr = $('<tr></tr>');
				tr.append($('<td  width="2%"></td>').html(key + 1));
				tr.append($('<td  class="col-md-1"></td>').html(trans.itemCode));

				tr.append($('<td   ></td>').html(trans.itemDesc));
				tr.append($('<td  class="col-md-1"></td>').html(trans.itemUom));

				//tr.append($('<td></td>').html(trans.indQty));
				
				tr
			.append($(
					'<td class="col-md-1" ></td>')
					.html(
							"<input type='text' style='text-align:right; ' id='indQty"+trans.indDId+"' value="+trans.indQty+" class='form-control'onchange='(this.value,"+trans.indDId+","+trans.indMId+")' />"));
		  	
				tr.append($('<td  class="col-md-1"></td>').html("<input type=date style='text-align:left; ' class=form-control  name=indSchDays"
						+ trans.indDId
						+ " id=indSchDays"
						+ trans.indDId
						+ " value="
						+ trans.indItemSchddt 
						+ " />"));
				 
				tr.append($('<td  class="col-md-1"></td>').html("<input type=text style='text-align:left;' class=form-control size=20 maxlength=20  name=indRemark"
						+ trans.indDId
						+ " id=indRemark"
						+ trans.indDId
						+ " value='"+trans.indRemark+"'>"));					
				//tr.append($('<td></td>').html(trans.indMDate));
				
				if(trans.indDStatus==0 || trans.indDStatus==7 || trans.indDStatus==9)
					{
					tr
					.append($(
							'<td class="col-md-1" ></td>')
							.html(
									"<a href='#' class='action_btn'onclick=updateCall("+trans.indDId+","+trans.indMId+",0)><abbr title='Update'><i  id='updateButton+"+trans.indMId+"' class='fa fa-edit'></i></abbr></a>&nbsp;&nbsp;<a href='#' class='action_btn'onclick=updateCall("+trans.indDId+","+trans.indMId+",1)><abbr title='Delete'><i class='fa fa-trash-o'></i></abbr></a>"));
				  	
					}
				else
					{
					tr
					.append($(
							'<td class="col-md-1" ></td>')
							.html(''));
				  	
					}
				
				 
				$('#table1 tbody').append(tr);
			})
		});
	}
	</script>
	
	
	<script type="text/javascript">
		
	function showDept() {
			var mac_spec = document.getElementById("machine_specific").value;
			//alert("Machine Specific "+mac_spec);
			if (mac_spec == 1) {
				document.getElementById('deptDiv').style.display = "block";
			}
			if (mac_spec == 0) {
				document.getElementById('deptDiv').style.display = "none";
			}
		}
	
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$('#dept')
									.change(
											function() {

												$
														.getJSON(
																'${getSubDeptListByDeptId}',
																{
																	deptId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {

																	var len = data.length;

																	$(
																			'#sub_dept')
																			.find(
																					'option')
																			.remove()
																			.end()
																	// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
																	for (var i = 0; i < len; i++) {

																		$(
																				"#sub_dept")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										data[i].subDeptId)
																								.text(data[i].subDeptCode+" "+data[i].subDeptDesc));
																	}

																	$(
																			"#sub_dept")
																			.trigger(
																					"chosen:updated");
																});
											});
						});
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$('#group')
									.change(
											function() {

												$
														.getJSON(
																'${itemListByGroupId}',
																{
																	grpId : $(
																			this)
																			.val(),
																	ajax : 'true'
																},
																function(data) {

																	var len = data.length;

																	$(
																			'#item_name')
																			.find(
																					'option')
																			.remove()
																			.end()
																	// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
																	for (var i = 0; i < len; i++) {

																		$(
																				"#item_name")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										data[i].itemId)
																								.text(
																										data[i].itemDesc));
																	}

																	$(
																			"#item_name")
																			.trigger(
																					"chosen:updated");
																});
											});
						});
	</script>



	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							

												$
														.getJSON(
																'${getgroupListByCatId}',
																{
																	catId : ${indent.catId},
																	ajax : 'true',
																},
																function(data) {

																	var len = data.length;

																	$('#item_name')
																			.find(
																					'option')
																			.remove()
																			.end()
																	// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
																			var html = '<option value="">Select Item</option>';
												        			html += '</option>';
												        			$('#item_name').html(html);
																	for (var i = 0; i < len; i++) {
																		
																		if(data[i].itemIsCons==0){
																			$("#item_name").append($("<option></option>").attr("value",data[i].itemId)
																					.text(data[i].itemCode+' '+data[i].itemDesc));
																		} 
																	}

																	$("#item_name")
																			.trigger(
																					"chosen:updated");
																});
										
						});
	</script>

	
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table1");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
	
	
	<script type="text/javascript">
	function checkIndentDept(){
	var dept=$('#dept').val(); 
	var subDept=$('#subDeptDeptForCompare').val(); 
	if(dept==0){
		//alert("Dept is 0");
	}else{
		
		document.getElementById('deptDiv').style.display = "block";
		$
		.getJSON(
				'${getSubDeptListByDeptId}',
				{
					deptId : dept,
					ajax : 'true'
				},
				function(data) {

					var len = data.length;

					$(
							'#sub_dept')
							.find(
									'option')
							.remove()
							.end()
					// $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
					for (var i = 0; i < len; i++) {
						
						if(subDept==data[i].subDeptId){
							$(
							"#sub_dept")
							.append(
									$(
											"<option selected></option>")
											.attr(
													"value",
													data[i].subDeptId)
											.text(
													data[i].subDeptCode+" "+data[i].subDeptDesc));
						}
						else{
							$(
							"#sub_dept")
							.append(
									$(
											"<option></option>")
											.attr(
													"value",
													data[i].subDeptId)
											.text(
													data[i].subDeptCode+" "+data[i].subDeptDesc));
						}

						
					}

					$(
							"#sub_dept")
							.trigger(
									"chosen:updated");
				});
		
	}//end of else
	}
	
	</script>

</body>
</html>

