<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>

	<c:url var="getStockBetweenDateWithCatId" value="/getStockBetweenDateWithCatId"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>
	<c:url var="listForIssueAndMrnGraphCategoryWise" value="/listForIssueAndMrnGraphCategoryWise"></c:url>

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

						<i class="fa fa-file-o"></i>Issue & Mrn Summary

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Rate Verification List
							</h3>
							<div class="box-tool">
								<%-- <a href="${pageContext.request.contextPath}/addPurchaseOrder">
									Add PO</a> <a data-action="collapse" href="#"> --%><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						 <form id="submitPurchaseOrder" action="${pageContext.request.contextPath}/getItemRateListByCatId" method="get">
								<div class="box-content">
								
								 
								<%-- <div class="box-content">
							
								<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input id="fromDate" class="form-control date-picker"
								 placeholder="From Date"  value="${fromDate}" name="fromDate" type="text"  >


									</div>
									<div class="col-md-1"></div>
									<div class="col-md-2">To Date</div>
									<div class="col-md-3">
										<input id="toDate" class="form-control date-picker"
								 placeholder="To Date" value="${toDate}"  name="toDate" type="text"  >


									</div>
								
				 
							</div><br> --%>
							
							<div class="box-content">

									 
									<div class="col-md-2">Select Category*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="catId" id="catId"
											required>
											<option value="">Select Category</option>
											<c:forEach items="${categoryList}" var="categoryList">
											<c:choose>
												<c:when test="${categoryList.catId==catId}">
												<option value="${categoryList.catId}" selected>${categoryList.catDesc}</option> 
												</c:when>
												<c:otherwise>
												<option value="${categoryList.catId}">${categoryList.catDesc}</option> 
												</c:otherwise>
											</c:choose> 
													 
											</c:forEach>
										</select>

									</div>
								</div><br><br>
							
							<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-info"   value="Search">
								 <input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" />
								<%-- <c:choose>
												<c:when test="${fromDate!=null}">
									 
								 
											 
											 
											<input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" />
											 <input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" />&nbsp;
											 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" >
											&nbsp;
											      <input type="button" class="btn btn-primary" onclick="showChart()"  value="Graph">  
											 
											</c:when></c:choose> --%>
							</div>
						</div> <br>
							 
								
								<div align="center" id="loader" style="display: none">

								<span>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>
							<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label> 
					<br /> <br />
					<div class="clearfix"></div>
					<div class="table-responsive" style="border: 0" id="tbl">
						<table class="table table-advance" id="table1">  
									<thead>
									<tr class="bgpink">
										<th style="width:1%;">SR</th>
										<th class="col-md-3">Item Name</th> 
										<th class="col-md-3">Vendor Name</th>
										<th class="col-md-1">Date</th> 
										<th class="col-md-1">Rate Incl</th>
										<th class="col-md-1">Rate Extra</th> 
									</tr>
								</thead>
								<tbody>
								<c:set var="sr" value="0"> </c:set>
								<c:forEach items="${getRmRateVerificationRecordList}" var="getRmRateVerificationRecordList" varStatus="count">
							 
											<tr>
											
												 
												<td  ><c:out value="${sr+1}" /></td> 
												<c:set var="sr" value="${sr+1}" ></c:set>

												<td  ><c:out value="${getRmRateVerificationRecordList.itemDesc}" /></td> 
											<td  ><c:out value="${getRmRateVerificationRecordList.vendorName}" /></td> 
											<td  ><c:out value="${getRmRateVerificationRecordList.rateDate}" /></td> 
											<td  ><c:out value="${getRmRateVerificationRecordList.rateTaxIncl}" /></td> 
											<td  ><c:out value="${getRmRateVerificationRecordList.rateTaxExtra}" /></td> 
											</tr>
										 
										</c:forEach>
  
								</tbody>

								</table>
  
					</div> 
					 
					 <div id="chart" style="display: none"><br> <hr>
		<div id="chart_div" style="width:100%; height:500px" align="center"></div>
		
			<div   id="PiechartMrnValue" style="width:50%; height:300; float: Left;" ></div>
			<div   id="PiechartIssueValue" style="width:50%; height:300; float: right;" ></div>  
				 <br> <br> <br> <br> <br> <br> <br>  <br> <br> <br> <br> <br> <br> <br> 
				</div>
					 
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	 
function showChart(){
		
		document.getElementById('chart').style.display = "block";
		   document.getElementById("tbl").style="display:none";
		 
				$.getJSON('${listForIssueAndMrnGraphCategoryWise}',{
					
									 
									ajax : 'true',

								},
								function(data) {			
									//alert(data);
									 if (data == "") {
											alert("No records found !!");

									 }
									 var i=0;
									 //alert(data);
									 google.charts.load('current', {'packages':['corechart', 'bar']});
									 google.charts.setOnLoadCallback(drawStuff);
									 //alert(data);
									 function drawStuff() {
		 
									   var chartDiv = document.getElementById('chart_div');
									   document.getElementById("chart_div").style.border = "thin dotted red";
								       var dataTable = new google.visualization.DataTable();
								       
								       dataTable.addColumn('string', 'CATEGORY'); // Implicit domain column.
								     /*   dataTable.addColumn('number', 'Issue Qty');  */// Implicit data column.
								      // dataTable.addColumn({type:'string', role:'interval'});
								     //  dataTable.addColumn({type:'string', role:'interval'}); 
								       dataTable.addColumn('number', 'MRN Value');
								       dataTable.addColumn('number', 'ISSUE Value'); 
								       $.each(data,function(key, item) {

											//var tax=item.cgst + item.sgst;
											//var date= item.billDate+'\nTax : ' + item.tax_per + '%';
											 
										   dataTable.addRows([
											 
										             [item.catDesc,item.approvedQtyValue,item.issueQtyValue]
										           
										           ]);
										  
										     }) 
								    
		/*  var materialOptions = {
		          width: 600,
		          height:450,
		          chart: {
		            title: 'MRN & ISSUE CATEGORY VALUE',
		            subtitle: 'CATEGORY WISE'
		          },
		          series: {
		            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
		            1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
		          },
		          axes: {
		            y: {
		               distance: {label: 'Issue Quantity'}, // Left y-axis.  
		              brightness: {side: 'right', label: 'VALUE'} // Right y-axis.
		            },
		            textStyle: {
	                     color: '#1a237e',
	                     fontSize: 5,
	                     bold: true,
	                     italic: true

	                  },
	                  titleTextStyle: {
	                     color: '#1a237e',
	                     fontSize: 5,
	                     bold: true,
	                     italic: true

	                  }

		          }
		          
		          
		        }; */
								       
								       var materialOptions = {
								    		    legend: {position:'top'},
								    		    hAxis: {
								    		        title: 'CATEGORY', 
								    		        titleTextStyle: {color: 'black'}, 
								    		        count: -1, 
								    		        viewWindowMode: 'pretty', 
								    		        slantedText: true
								    		    },  
								    		    vAxis: {
								    		        title: 'VALUE', 
								    		        titleTextStyle: {color: 'black'}, 
								    		        count: -1, 
								    		        format: '#'
								    		    },
								    		    /* colors: ['#F1CA3A'] */
								    		  };
								       var materialChart = new google.charts.Bar(chartDiv);
								       
								       function selectHandler() {
									          var selectedItem = materialChart.getSelection()[0];
									          if (selectedItem) {
									            var topping = dataTable.getValue(selectedItem.row, 0);
									           // alert('The user selected ' + selectedItem.row,0);
									            i=selectedItem.row,0;
									            itemSellBill(data[i].deptCode);
									           // google.charts.setOnLoadCallback(drawBarChart);
									          }
									        }
								       
								       function drawMaterialChart() {
								          // var materialChart = new google.charts.Bar(chartDiv);
								           google.visualization.events.addListener(materialChart, 'select', selectHandler);    
								           materialChart.draw(dataTable, google.charts.Bar.convertOptions(materialOptions));
								          // button.innerText = 'Change to Classic';
								          // button.onclick = drawClassicChart;
								         }
								        
								        
								       function drawMrnValueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'CATEGORY');
											 dataTable.addColumn('number', 'MRN VALUE');
									
											   $.each(data,function(key, item) {

												//	var amt=item.cash + item.card + item.other;

												   dataTable.addRows([

												             [item.catDesc, item.approvedQtyValue,]

												           ]);
												   

												   }) 
										 var options = {'title':'CATEGORY MRN VALUE',
							                       'width':550,
							                       'height':250};
											   document.getElementById("PiechartMrnValue").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartMrnValue'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       function drawIssueChart() {
											 var dataTable = new google.visualization.DataTable();
											 dataTable.addColumn('string', 'CATEGORY');
											 dataTable.addColumn('number', 'ISSUE VALUE');
									
											   $.each(data,function(key, item) {

												//	var amt=item.cash + item.card + item.other;

												   dataTable.addRows([

												             [item.catDesc, item.issueQtyValue,]

												           ]);
												   

												   }) 
										 var options = {'title':'CATEGORY ISSUE VALUE',
							                       'width':550,
							                       'height':250};
											   document.getElementById("PiechartIssueValue").style.border = "thin dotted red";
										 var chart = new google.visualization.PieChart(document.getElementById('PiechartIssueValue'));
									           
									        chart.draw(dataTable, options);
									      }
								       
								       
										 
								      /*  var chart = new google.visualization.ColumnChart(
								                document.getElementById('chart_div'));
								       chart.draw(dataTable,
								          {width: 800, height: 600, title: 'Tax Summary Chart'}); */
								       drawMaterialChart();
								           
								          google.charts.setOnLoadCallback(drawIssueChart);
								           
								       google.charts.setOnLoadCallback(drawMrnValueChart);
									 };
									 
										
							  	});
			 
}
</script>

	<script type="text/javascript">
	function genPdf(){
		 var catDesc = $("#catId option:selected").text();
		window.open('${pageContext.request.contextPath}/itemRateListByCatIdPdf/'+catDesc);
	}
	function exportToExcel()
	{
		window.open("${pageContext.request.contextPath}/exportToExcel");
		document.getElementById("expExcel").disabled=true;
	}
	function search() {
		  
		
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		var catId = $("#catId").val();
		
		if(fromDate=="" || fromDate == null)
			alert("Select From Date");
		else if (toDate=="" || toDate == null)
			alert("Select To Date");
		 
		$('#loader').show();

		$
				.getJSON(
						'${getStockBetweenDateWithCatId}',

						{
							 
							fromDate : fromDate,
							toDate : toDate, 
							catId : catId,
							ajax : 'true'

						},
						function(data) {

							$('#table1 td').remove();
							$('#loader').hide();

							if (data == "") {
								alert("No records found !!");

							}
						 

						  $.each( data,
										function(key, itemList) {
											  
											var tr = $('<tr></tr>'); 
										  	tr.append($('<td></td>').html(key+1));
										  	tr.append($('<td></td>').html(itemList.itemCode));
										  	tr.append($('<td></td>').html(itemList.openingStock));  
										  	tr.append($('<td></td>').html(itemList.opStockValue)); 
										  	tr.append($('<td></td>').html(itemList.approveQty));
										  	tr.append($('<td></td>').html(itemList.approvedQtyValue));
										  	tr.append($('<td></td>').html(itemList.issueQty));
										  	tr.append($('<td></td>').html(itemList.issueQtyValue)); 
										  	tr.append($('<td></td>').html(itemList.damageQty));
										  	tr.append($('<td></td>').html(itemList.damagValue)); 
										  	tr.append($('<td></td>').html(itemList.openingStock+itemList.approveQty-itemList.issueQty+itemList.returnIssueQty-itemList.damageQty-itemList.gatepassQty+itemList.gatepassReturnQty));
											tr.append($('<td></td>').html(itemList.opStockValue+itemList.approvedQtyValue-itemList.issueQtyValue-itemList.damagValue)); 
										  	tr.append($('<td></td>').html("<a href='${pageContext.request.contextPath}/valueationReportDetail/"+itemList.itemId+"/"+itemList.openingStock+"' class='action_btn'> <abbr title='detailes'> <i class='fa fa-list' ></i></abbr>"));
										  	
										    $('#table1 tbody').append(tr); 
										})  
										
							 
						}); 
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
    if (td) {
    	
    	 if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
    	        tr[i].style.display = "";
    	      } else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
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