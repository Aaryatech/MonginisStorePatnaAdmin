<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<body>


	<c:url var="getMrnListByMrnId" value="/getMrnListByMrnId"></c:url>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<c:url var="editMemoQty" value="/editMemoQty"></c:url>

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
						<i class="fa fa-file-o"></i>Edit Rejection Memo
					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Approve<c:choose>
								<c:when test="${approve==1}">1</c:when><c:when test="${approve==2}">2</c:when>
								</c:choose> Issue Detail
							</h3>

							<%-- <div class="box-tool">
								<a href="${pageContext.request.contextPath}/listOfRejectionMemo">Rejection
									List </a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
 --%>
						</div>


						<div class="box-content">

							<form id="submitMaterialStore"
								action="${pageContext.request.contextPath}/submitIssueApprove"
								method="post">

								<div class="box-content">

									<div class="col-md-2">Type:</div>
									<div class="col-md-3">
									
									<c:forEach items="${typeList}" var="typeList"> 
															<c:choose>
																<c:when test="${typeList.typeId==issueForApprove.itemCategory}">
																	${typeList.typeName}
																</c:when>
																 
															</c:choose> 
														</c:forEach>
									 
									</div>

									<div class="col-md-2">Issue Date:</div>
									<div class="col-md-3">
									${issueForApprove.issueDate}
										<%-- <input class="form-control" id="rejectionNo"
											placeholder="Rejection No" type="text" name="rejectionNo"   value="${editRejection.rejectionNo}"/> --%>
									</div>
								</div>
								<br>
								 
									
									<div class="box-content">
									
									<div class="col-md-2">Issue No:</div>
									<div class="col-md-3">
									${issueForApprove.issueNo}
 
									</div>
 
										<%-- <div class="col-md-2">Indent No:</div>
									<div class="col-md-3">
									${poHeaderForApprove.indNo}
 
									</div> --%>
									</div>
									<br>

									  
									<%-- <div class="box-content">



										<div class="col-md-2">Remark:</div>
										<div class="col-md-3">
										${issueForApprove.remark1}
											<input type="text" name="remark" id="remark"
												placeholder="Remark" class="form-control"  value="${editRejection.rejectionRemark}"/>

										</div>
										 
									</div> --%>

									<br>
									
									<br>
								
								<c:choose>
										<c:when test="${approve==1}"> 
												 
													 
														<div class="table-responsive" style="border: 0">
																<table class="table table-advance" id="table1">
																<thead>
																	<tr>
																	
																	<th  ><input type="checkbox" id="allCheckTable1"   onClick="selectAll(this)"  />All</th>
																		<th style="width:2%;">Sr.No.</th>
																		<th>Item Name</th>
																		<th class="col-md-2">Issue Qty</th> 
				 
																	</tr>
																</thead>
				
																<tbody>
				
																	<c:forEach items="${issueForApprove.issueDetailList}" var="issueDetailList"
																		varStatus="count">
																		<tr>
																		<td  > 
																		<c:choose>
																			<c:when test="${issueDetailList.status==1}">
																			<input type="checkbox" id="select_to_approve${issueDetailList.issueDetailId}"
															name="select_to_approve" value="${issueDetailList.issueDetailId}" checked/>
																			</c:when>
																			<c:otherwise>
																			<input type="checkbox" id="select_to_approve${issueDetailList.issueDetailId}"
															name="select_to_approve" value="${issueDetailList.issueDetailId}"  />
																			
																			</c:otherwise>
																		</c:choose> </td>
																			<td  ><c:out value="${count.index+1}" /></td>
				 
																			<td  ><c:out
																					value="${issueDetailList.itemCode}" /></td>
				
																			<td  >${issueDetailList.itemIssueQty}</td> 
				 
																		</tr>
																	</c:forEach>
				
				
																</tbody>
															</table>
														</div>
													 
												 
										</c:when>
										<c:when test="${approve==2}">
														  
														<div class="table-responsive" style="border: 0">
																<table class="table table-advance" id="table1">
																<thead>
																	<tr>
																	
																	<th  ><input type="checkbox" id="allCheckTable1"   onClick="selectAll(this)"  />All</th>
																		<th style="width:2%;">Sr.No.</th>
																		<th>Item Name</th>
																		<th class="col-md-2">Issue Qty</th> 
				 
																	</tr>
																</thead>
				
																<tbody>
				
																	<c:forEach items="${issueForApprove.issueDetailList}" var="issueDetailList"
																		varStatus="count">
																		<tr>
																		<td  > 
																		<c:choose>
																			<c:when test="${issueDetailList.status==1}">
																			<input type="checkbox" id="select_to_approve${issueDetailList.issueDetailId}"
															name="select_to_approve" value="${issueDetailList.issueDetailId}" checked/>
																			</c:when>
																			<c:otherwise>
																			<input type="checkbox" id="select_to_approve${issueDetailList.issueDetailId}"
															name="select_to_approve" value="${issueDetailList.issueDetailId}"  disabled/>
																			
																			</c:otherwise>
																		</c:choose> </td>
																			<td  ><c:out value="${count.index+1}" /></td>
				 
																			<td  ><c:out
																					value="${issueDetailList.itemCode}" /></td>
				
																			<td  >${issueDetailList.itemIssueQty}</td> 
				 
																		</tr>
																	</c:forEach>
				
				
																</tbody>
															</table>
														</div>
													 
										 
										 </c:when>
								</c:choose>
								
								
								<%-- <c:choose>
										<c:when test="${approve==1}">  --%>
										
										<div class="row">
												<div class="col-md-12" style="text-align: center">
												<input type="hidden" name="approve" id="approve" value="${approve}">
													<%-- <a href="${pageContext.request.contextPath}/submitApprove/${approve}"> --%><input type="submit" class="btn btn-info" value="Submit"  ><!-- </a> -->
						 
												</div>
										</div>
										<%-- </c:when>
										<c:when test="${approve==2}"> 
										
										<div class="row">
												<div class="col-md-12" style="text-align: center">
												
													<a href="${pageContext.request.contextPath}/submitSecondApprove/${approve}"></a><input type="button" class="btn btn-info" value="Submit" onclick="checkIndId()">
						 
												</div>
										</div>
										
										</c:when>
								</c:choose> --%>

								<!-- <div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="submit" class="btn btn-primary" value="Submit">

									</div>
								</div>
								<br> <br> -->




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
	  
	<script type="text/javascript">
		function search() {

			alert("hi");
			var mrnId = $("#mrnId").val();
			$('#loader').show();

			$
					.getJSON(
							'${getMrnListByMrnId}',

							{
								mrnId : mrnId,

								ajax : 'true'

							},
							function(data) {

								$('#table_grid td').remove();
								$('#loader').hide();

								alert(data);
								if (data == "") {
									alert("No records found !!");

								}

								for (var i = 0; i < data.length; i++) {
									for (var j = 0; j < data[i].getMrnDetailList.length; j++) {

										var tr = $('<tr></tr>');
										tr.append($('<td></td>').html(j + 1));
										tr
												.append($('<td></td>')
														.html(
																data[i].getMrnDetailList[j].itemCode));

										tr
												.append($('<td></td>')
														.html(
																data[i].getMrnDetailList[j].rejectQty));

										tr
												.append($('<td > <input type=number  id= memoQty'+
												  data[i].getMrnDetailList[j].mrnId+ ' name=memoQty'+ data[i].getMrnDetailList[j].mrnId+ '></td>'));

										$('#table_grid tbody').append(tr);
									}

								}

							});
		}
	</script>
	
	<script type="text/javascript">
	function editMemoQty(memoQty,rejDetailId){
	

		 $.getJSON('${editMemoQty}',{

			 rejDetailId : rejDetailId,
			 memoQty : memoQty,
		    	ajax : 'true',

		    }, function(data) {
				
			    $("#loader").hide();

			});
		
	}
	</script>


</body>
</html>