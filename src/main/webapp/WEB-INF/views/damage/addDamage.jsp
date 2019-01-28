<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 
 <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
	<body onload="disabledDate()">
	 
	  <script type="text/javascript">
	 function disabledDate () {
		 var c = document.getElementById("stockDateDDMMYYYY").value; 
			var toDateValue = c.split('-');
			 var dtToday = new Date();
			 dtToday.setFullYear(toDateValue[2],(toDateValue[1] - 1 ),toDateValue[0]); 
			  var month = dtToday.getMonth() + 1;     // getMonth() is zero-based
			  var day = dtToday.getDate();
			  var year = dtToday.getFullYear();
			  if(month < 10)
			      month = '0' + month.toString();
			  if(day < 10)
			      day = '0' + day.toString(); 
			  var maxDate = year + '-' + month + '-' + day;  
	  		$('#date').attr('min', maxDate);
	  		getInvoiceNo();
	  
	 }
 
 </script> 
	   <c:url var="getInvoiceNo" value="/getInvoiceNo"></c:url>  
	  <c:url var="getItemIdByGroupId" value="/getItemIdByGroupId"></c:url>  
      <c:url var="addItmeInDamageList" value="/addItmeInDamageList"></c:url> 
	  <c:url var="deleteDamageFromList" value="/deleteDamageFromList"></c:url>

	  <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


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
						<i class="fa fa-file-o"></i>Add Damage Material
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Add Damage Material
							</h3>
							
							<div class="box-tool">
								  <a href="${pageContext.request.contextPath}/getDamageList">Damage List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>  
							</div>
							
						</div>
						
						
						<div class="box-content">

							<form id="submitMaterialStore" onsubmit="return confirm('Do you really want to submit Damage ?');" action="${pageContext.request.contextPath}/submitDamageList" method="post" >
							 
							 
							<div class="box-content">
							
								<div class="col-md-2">Date*</div>
									<div class="col-md-3">
										<input id="date" class="form-control"
								 placeholder="Date" onchange="getInvoiceNo()"  name="date" type="date" value="${date}"  required> 
								 
								 
						<input id="stockDateDDMMYYYY" value="${stockDateDDMMYYYY}" name="stockDateDDMMYYYY" type="hidden"  >
									</div>
									
									<div class="col-md-2">Damage No*</div>
									<div class="col-md-3">
										<input id="damageNo" class="form-control"
								 placeholder="Damage No"  name="damageNo" type="text"    readonly> 
								 
								 
						<input id="stockDateDDMMYYYY" value="${stockDateDDMMYYYY}" name="stockDateDDMMYYYY" type="hidden"  >
									</div>
									  
							</div><br>
							 
							<hr/>
							
							<div class="box-content">
								
									<div class="col-md-2" >Select Group</div>
									<div class="col-md-3">
										<select   class="form-control chosen" name="groupId" onchange="getItemIdByGroupId()"  id="groupId" required >
											<option   value="">Select Group</option>
											
											<c:forEach items="${itemGroupList}" var="itemGroupList"> 
														<option value="${itemGroupList.grpId}"> ${itemGroupList.grpCode} &nbsp;&nbsp; ${itemGroupList.grpDesc} </option>
											 </c:forEach>
											</select>
									</div>
									<input type="hidden" name=editIndex id="editIndex"   />
									  
								</div><br> 
								
								<div class="box-content"> 
								
									<div class="col-md-2" >Select Item</div>
									<div class="col-md-10">
										<select   class="form-control chosen" name="itemId"  id="itemId"  required>
										 
											</select>
									</div> 
								</div><br> 
								
								<div class="box-content">
								 
									<div class="col-md-2">QTY</div>
									<div class="col-md-3">
										<input type="text" name="qty" id="qty"
											placeholder="Qty" class="form-control"
											 pattern="[+-]?([0-9]*[.])?[0-9]+"  required/>
										  
												 
									</div>
									<div class="col-md-1"> </div>
									<div class="col-md-2">Value</div>
									<div class="col-md-3">
										<input type="text" name="value" id="value" placeholder="Value" class="form-control" required/>
										  
												 
									</div>
									
								  
								</div><br> 
								
								<div class="box-content">
								 
									 
									<div class="col-md-2">Reason</div>
									<div class="col-md-3">
										<input type="text" name="reason" id="reason" placeholder="Reason" class="form-control" />
										  
												 
									</div>
									
								  
								</div><br> 
							
							
								
								<div class="box-content">
								 
									</div>
								 
							 <br>
							<!-- <div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="button" class="btn btn-primary" value="Add Item" onclick="addItem()">  
									</div>
								</div><br><br> -->
							
								<div align="center" id="loader" style="display: none">

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
						class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
					<span class="l-6"></span>
				</div>
											
							
							
							<!-- <div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label>

					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0">
						<table class="table table-advance" id="table_grid">  
									<thead>
									<tr class="bgpink">
										 
										<th class="col-sm-1">Sr no.</th> 
										<th class="col-md-4">Item Name</th> 
										<th class="col-md-1">QTY</th>
										<th class="col-md-1">Value</th>
										<th class="col-md-2">Reason</th>
										<th class="col-md-1">Action</th>
									</tr>
								</thead>
								<tbody>
 
								</tbody>

								</table>
								 
									<br> <br>
										 
					</div> -->
								
							<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="submit" class="btn btn-primary" value="Submit" id="submit" onclick="check();"  >
<!-- 										<button type="button" class="btn">Cancel</button>
 -->									</div>
								</div><br><br>
						
							
							

						</form>
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
		 
		
		function getItemIdByGroupId() {

			var grpId = document.getElementById("groupId").value;

			$.getJSON('${getItemIdByGroupId}', {

				grpId : grpId,
				ajax : 'true'
			}, function(data) {

				var html = '<option value="">Select Item </option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].itemId + '">'
							+ data[i].itemCode + '&nbsp;&nbsp;&nbsp;'+data[i].itemDesc+'</option>';
				}
				html += '</option>';
				$('#itemId').html(html);
				$("#itemId").trigger("chosen:updated");
			});
		}
		 
		function addItem() {
			  
			
				var itemId = $("#itemId").val();
				var itemName = $("#itemId option:selected").text(); 
				var qty = parseFloat($("#qty").val());
				var reason = $("#reason").val(); 
				var value = $("#value").val(); 
				var editIndex = $("#editIndex").val(); 
				
				if(validation()==true){
					 
				$('#loader').show();

				$
						.getJSON(
								'${addItmeInDamageList}',

								{
									 
									itemId : itemId, 
									qty : qty,
									reason : reason, 
									itemName : itemName,
									value : value,
									ajax : 'true'

								},
								function(data) {

									$('#table_grid td').remove();
									$('#loader').hide();

									if (data == "") {
										alert("No records found !!");
										document.getElementById("submit").disabled=true;
									}
								  
  
								  $.each(
												data,
												function(key, itemList) {
												

													var tr = $('<tr></tr>'); 
												  	tr.append($('<td class="col-sm-1"></td>').html(key+1)); 
												  	tr.append($('<td class="col-md-4"></td>').html(itemList.itemName)); 
												  	tr.append($('<td class="col-md-1"></td>').html(itemList.qty)); 
												  	tr.append($('<td class="col-md-1"></td>').html(itemList.value));
												  	tr.append($('<td class="col-md-2"></td>').html(itemList.reason));
												  	/* tr.append($('<td></td>').html('<span class="glyphicon glyphicon-edit" id="edit'+key+'" onclick="edit('+key+');"> </span><span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span>'));
												    */tr.append($('<td class="col-md-1"></td>').html('<span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span>'));
												     $('#table_grid tbody').append(tr);
												     document.getElementById("submit").disabled=false;
												})  
												
									document.getElementById("qty").value= "";
								 	document.getElementById("value").value= "";
								 	document.getElementById("reason").value= "";
									document.getElementById("groupId").value= "";
									$('#groupId').trigger("chosen:updated"); 
									document.getElementById("itemId").value= "";
									$('#itemId').trigger("chosen:updated"); 
									document.getElementById("editIndex").value="";
								});

					}
				  
			
	}
		
		function del(key)
		{
			
			var key=key;
			$('#loader').show();
			$
			.getJSON(
					'${deleteDamageFromList}',

					{
						 
						index : key,
						ajax : 'true'

					},
					function(data) {
						
						$('#table_grid td').remove();
						$('#loader').hide();

						if (data == "") {
							alert("No records found !!");
							document.getElementById("submit").disabled=true;
						}
					 

					  $.each(
									data,
									function(key, itemList) {
									 
										var tr = $('<tr></tr>'); 
									  	tr.append($('<td class="col-sm-1"></td>').html(key+1)); 
									  	tr.append($('<td class="col-md-4"></td>').html(itemList.itemName)); 
									  	tr.append($('<td class="col-md-1"></td>').html(itemList.qty)); 
									  	tr.append($('<td class="col-md-1"></td>').html(itemList.value));
									  	tr.append($('<td class="col-md-2"></td>').html(itemList.reason));
									  	/* tr.append($('<td></td>').html('<span class="glyphicon glyphicon-edit" id="edit'+key+'" onclick="edit('+key+');"> </span><span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span>'));
									    */tr.append($('<td class="col-md-1"></td>').html('<span class="glyphicon glyphicon-remove"  onclick="del('+key+')" id="del'+key+'"></span>'));
									     $('#table_grid tbody').append(tr);
									     document.getElementById("submit").disabled=false;
									})  
									
						document.getElementById("qty").value= "";
					  	document.getElementById("value").value= "";
					 	document.getElementById("reason").value= "";
						document.getElementById("groupId").value= "";
						$('#groupId').trigger("chosen:updated"); 
						document.getElementById("itemId").value= "";
						$('#itemId').trigger("chosen:updated"); 
						document.getElementById("editIndex").value=""; 
						
					});
			
			
		}
		
		function edit(key)
		{
			//alert(key);
			$('#loader').show();

			$
					.getJSON(
							'${editItemInIssueList}',

							{
								 
								index : key, 
								ajax : 'true'

							},
							function(data) {

								 
								$('#loader').hide();
								document.getElementById("editIndex").value=key;
								document.getElementById("qty").value=data.itemIssueQty;
								document.getElementById("previousQty").value=data.itemIssueQty;
								document.getElementById("groupId").value=data.itemGroupId;
								$('#groupId').trigger("chosen:updated");
								/* document.getElementById("deptId").value=data.deptId;
								$('#deptId').trigger("chosen:updated");
								document.getElementById("acc").value=data.accHead;
								$('#acc').trigger("chosen:updated"); */
								
								$.getJSON('${getItemIdByGroupId}', {

									grpId : data.itemGroupId,
									ajax : 'true'
								}, function(data1) {

									var html = '<option value="">Select ItemGroup</option>';

									var len = data1.length;
									for (var i = 0; i < len; i++) {
										if(data1[i].itemId==data.itemId)
											{
											html += '<option value="' + data1[i].itemId + '" selected>'
											+ data1[i].itemCode + '&nbsp;&nbsp;&nbsp;'+data1[i].itemDesc+'</option>';
											}
										else
											{
											html += '<option value="' + data1[i].itemId + '">'
											+ data1[i].itemCode + '&nbsp;&nbsp;&nbsp;'+data1[i].itemDesc+'</option>';
											}
										
									}
									html += '</option>';
									$('#itemId').html(html);
									$("#itemId").trigger("chosen:updated");
								});
								
								/* $.getJSON('${getSubDeptList}', {

									deptId : data.deptId,
									ajax : 'true'
								}, function(data2) {

									var html = '<option value="">Select Sub Department</option>';

									var len = data2.length;
									for (var i = 0; i < len; i++) {
										
										if(data2[i].subDeptId==data.subDeptId)
											{
											html += '<option value="' + data2[i].subDeptId + '" selected>'
											+ data2[i].subDeptCode + '</option>';
											}
										else
											{
											html += '<option value="' + data2[i].subDeptId + '">'
											+ data2[i].subDeptCode + '</option>';
											}
										
									}
									html += '</option>';
									$('#subDeptId').html(html);
									$("#subDeptId").trigger("chosen:updated");
								}); */
								
								$.getJSON('${getBatchByItemId}', {

									itemId : data.itemId,
									ajax : 'true'
								}, function(data3) {

									var html = '<option value="">Select Batch </option>';

									var len = data3.length;
									for (var i = 0; i < len; i++) {
										if(data3[i].mrnDetailId==data.mrnDetailId)
											{
											html += '<option value="' + data3[i].mrnDetailId + '" selected>'
											+ data3[i].batchNo + '&nbsp;&nbsp;&nbsp;'+ data3[i].remainingQty+'</option>';
											}
										else
											{
											html += '<option value="' + data3[i].mrnDetailId + '">'
											+ data3[i].batchNo + '&nbsp;&nbsp;&nbsp;'+ data3[i].remainingQty+'</option>';
											}
										
									}
									html += '</option>';
									$('#batchNo').html(html);
									$("#batchNo").trigger("chosen:updated");
									qtyValidation();
								});
								
								
							});
			 
		}
		
		 
		
	</script>
<script type="text/javascript">
function validation()
{
	var itemId = $("#itemId").val();
	var qty = $("#qty").val();
	var groupId = $("#groupId").val(); 
	var reason = $("#reason").val();
	var value = $("#value").val();
	var isValid = true;
	
	
	 if(groupId=="" || groupId==null)
	{
	isValid = false;
	alert("Please Select Group ");
	document.getElementById("groupId").focus();
	}
	
	 else if(itemId=="" || itemId==null)
	{
	isValid = false;
	alert("Please Select Item ");
	document.getElementById("itemId").focus();
	}
	  
	 else if(isNaN(qty) || qty < 0 || qty=="")
		{
		isValid = false;
		alert("Please enter Quantity");
		document.getElementById("qty").focus();
		}
	 else if(isNaN(value) || value < 0 || value=="")
		{
		isValid = false;
		alert("Please Enter Value");
		document.getElementById("value").focus();
		}
	 else if(reason=="" || reason==null)
		{
		isValid = false;
		alert("Enter Reason");
		document.getElementById("reason").focus();
		}
	 
return isValid;
	
}
 
</script>

<script>
function myFunction() {
  var input, filter, table, tr, td ,td1,td2, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table_grid");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1]; 
    if (td) {
    	
    	 if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      }
    	      else {
    	        tr[i].style.display = "none";
    	      }
       
    }  
    
     
  }
}
function getInvoiceNo() {
	
	var date = $("#date").val();  
	var toDateValue = date.split('-'); 
	var min = toDateValue[2]+"-"+(toDateValue[1] - 1 )+"-"+toDateValue[0];
	
	$.getJSON('${getInvoiceNo}', {

		catId:1,
		docId:10,
		date : min,
		typeId : 1,
		ajax : 'true',

	}, function(data) { 
	 
	document.getElementById("damageNo").value=data.code; 
	 
	});

}
</script>
	 
</body>
</html>