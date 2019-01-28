<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getPoListByDate" value="/getPoListByDate"></c:url>
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

						<i class="fa fa-file-o"></i>PO List

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Approve<c:choose>
								<c:when test="${approve==1}">1</c:when><c:when test="${approve==2}">2</c:when>
								</c:choose> Mrn
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/addPurchaseOrder">
									Add PO</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
			<form action="${pageContext.request.contextPath}/listOfPurachaseOrder"
								class="form-horizontal" id="validation-form" method="get">
						<div class="box-content">

							  
							 

							 <c:choose>
								<c:when test="${approve==1}"> 
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
										 
											<th style="width:2%;">SR</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Issue No</th>
											<th class="col-md-1">Issue TYPE</th> 
											<th class="col-md-1">Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${getIssueHeaderList}" var="list" varStatus="count">
											<tr>
											
												 
												<td style="width:2%;"><c:out value="${count.index+1}" /></td>


												<td class="col-md-1"><c:out value="${list.issueDate}" /></td>
												 
												<td class="col-md-1"><c:out value="${list.issueNo}" /></td>
												<c:set var="type"></c:set>
												<c:forEach items="${typeList}" var="typeList"> 
															<c:choose>
																<c:when test="${typeList.typeId==list.itemCategory}">
																	<c:set var="type" value="${typeList.typeName}"></c:set>
																</c:when>
																 
															</c:choose> 
														</c:forEach>
												
												<td class="col-md-1"><c:out value="${type}" /></td>
												 
												<td> 
													<a href="${pageContext.request.contextPath}/approveIssueDetail/${list.issueId}/${approve}"><abbr
														title="Detail"><i class="fa fa-list"></i></abbr></a>
														 
														 </td>

											</tr>
										</c:forEach>

									</tbody>

								</table>
<br> <br>
										 
							</div>
								
								</c:when>
								<c:when test="${approve==2}"> 
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
										 
											<th style="width:2%;">SR</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Issue No</th>
											<th class="col-md-1">Issue TYPE</th> 
											<th class="col-md-1">Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${getIssueHeaderList}" var="list" varStatus="count">
											<tr>
											
												 
												<td style="width:2%;"><c:out value="${count.index+1}" /></td>


												<td class="col-md-1"><c:out value="${list.issueDate}" /></td>
												 
												<td class="col-md-1"><c:out value="${list.issueNo}" /></td>
												<c:set var="type"></c:set>
												<c:forEach items="${typeList}" var="typeList"> 
															<c:choose>
																<c:when test="${typeList.typeId==list.itemCategory}">
																	<c:set var="type" value="${typeList.typeName}"></c:set>
																</c:when>
																 
															</c:choose> 
														</c:forEach>
												
												<td class="col-md-1"><c:out value="${type}" /></td>
												 
												<td> 
													<a href="${pageContext.request.contextPath}/approveIssueDetail/${list.issueId}/${approve}"><abbr
														title="Detail"><i class="fa fa-list"></i></abbr></a>
														 
														 </td>

											</tr>
										</c:forEach>

									</tbody>

								</table>
<br> <br>
									 
								
							</div>
								
								
								</c:when>
							</c:choose>
							
						</div>

</form>

					</div>

				</div>

			</div>
			<footer>
				<p>2019 © MONGINIS</p>
			</footer>
		</div>


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
	function search() {
		  
		
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		
		if(fromDate=="" || fromDate == null)
			alert("Select From Date");
		else if (toDate=="" || toDate == null)
			alert("Select To Date");
		 
		$('#loader').show();

		$
				.getJSON(
						'${getPoListByDate}',

						{
							 
							fromDate : fromDate,
							toDate : toDate, 
							ajax : 'true'

						},
						function(data) {

							$('#table1 td').remove();
							$('#loader').hide();

							if (data == "") {
								alert("No records found !!");

							}
						 

						  $.each(
										data,
										function(key, itemList) {
										

											var tr = $('<tr></tr>');
											
											 tr.append($('<td style="width:2%;"></td>')
														.html('<input type="checkbox"  name="name1" value="'+itemList.poId +'"/>'));
											
										  	tr.append($('<td></td>').html(key+1));
										  	tr.append($('<td></td>').html(itemList.poDate));
										  	tr.append($('<td></td>').html(itemList.poNo));
										  	
										  	var type;
										  	
										  	if(itemList.poType==1){
										  		
										  		type="Regular";
										  		
										  	}
										  	else if(itemList.poType==2){
										  		type="Job Work";
										  	}
											else if(itemList.poType==3){
												type="General";
										  	}
											else{
												type="Other";
										  	}
										  	tr.append($('<td></td>').html(type));
										  	tr.append($('<td></td>').html(itemList.vendorName));
										  	tr.append($('<td></td>').html(itemList.indNo));
										  	if(itemList.poStatus==0) {
										  		tr.append($('<td></td>').html('<a href="javascript:genPdf('+itemList.poId+');"><abbr'+
														'title="PDF"><i class="glyphicon glyphicon glyphicon-file"></i></abbr></a> <a href="${pageContext.request.contextPath}/editPurchaseOrder/'+itemList.poId+'"><abbr'+
														'title="Edit"><i class="fa fa-edit"></i></abbr></a> <a href="${pageContext.request.contextPath}/deletePurchaseOrder/'+itemList.poId+'"'+
														'onClick="return confirm("Are you sure want to delete this record");"><span class="glyphicon glyphicon-remove"></span></a>'));
										  		}
										  	else
										  		{
										  		tr.append($('<td></td>').html('<a href="javascript:genPdf('+itemList.poId+');"><abbr'+
														'title="PDF"><i class="glyphicon glyphicon glyphicon-file"></i></abbr></a> <a href="${pageContext.request.contextPath}/editPurchaseOrder/'+itemList.poId+'"><abbr'+
														'title="Edit"><i class="fa fa-edit"></i></abbr></a> '));
										  		}
										  	
										    $('#table1 tbody').append(tr); 
										})  
										
							 
						}); 
}
	</script>


<script type="text/javascript">
			function genPdf(id) {
				alert(id);
		
				window.open('poPdf/'
						+ id );

			}
			
			function commonPdf() {

				var list = [];

				$("input:checkbox[name=name1]:checked").each(function() {
					list.push($(this).val());
				});

				window.open('poPdf/' + list);

			}
			
		</script>

<script>
function myFunction() {
  var input, filter, table, tr, td ,td1,td2, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[5];
    td1 = tr[i].getElementsByTagName("td")[3];
    td2 = tr[i].getElementsByTagName("td")[4];
    if (td || td1 || td2) {
    	
    	 if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      }else if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      }
    	      else {
    	        tr[i].style.display = "none";
    	      }
       
    }  
    
     
  }
}
 
</script>

</body>
</html>