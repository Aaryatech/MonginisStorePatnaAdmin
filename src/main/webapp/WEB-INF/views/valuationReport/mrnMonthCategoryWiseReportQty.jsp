<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body onload="getSubDeptList()">

	<c:url var="getStockBetweenDateWithCatId" value="/getStockBetweenDateWithCatId"></c:url>
	<c:url var="listForMrnGraphCategoryMonthWise" value="/listForMrnGraphCategoryMonthWise"></c:url>
<c:url var="getSubDeptList" value="/getSubDeptList"></c:url>
  <c:url var="getCatListForGraph" value="/getCatListForGraph"></c:url>
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

						<i class="fa fa-file-o"></i>Mrn Category Month Wise Report  

					</h1>
				</div>
			</div> --><br>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Mrn Category Month Qty Wise Report   
							</h3>
							<div class="box-tool">
								 <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>
						 <form id="submitPurchaseOrder" action="${pageContext.request.contextPath}/mrnMonthCategoryWieReportQty" method="get">
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

									<div class="col-md-2">Select Type*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="typeId" id="typeId"
											required>
											<option value="0">All</option>
											<c:forEach items="${typeList}" var="typeList">
											<c:choose>
												<c:when test="${typeList.typeId==typeId}">
												<option value="${typeList.typeId}" selected>${typeList.typeName}</option> 
												</c:when>
												<c:otherwise>
												<option value="${typeList.typeId}">${typeList.typeName}</option> 
												</c:otherwise>
											</c:choose> 
													 
											</c:forEach>
										</select>

									</div>
									<%-- <div class="col-md-1"></div>
									<div class="col-md-2">Is Development*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="isDev" id="isDev"
											required>
											<c:choose>
												<c:when test="${isDevelompent==-1}">
													<option value="-1" selected>All</option>
													 <option value="0">No</option>
													 <option value="1">Yes</option>
												</c:when>
												<c:when test="${isDevelompent==0}">
													<option value="-1" >All</option>
													 <option value="0" selected>No</option>
													 <option value="1">Yes</option>
												</c:when>
											
											 <c:when test="${isDevelompent==1}">
													<option value="-1" >All</option>
													 <option value="0"  >No</option>
													 <option value="1"selected>Yes</option>
												</c:when>  
												<c:otherwise>
												<option value="-1" >All</option>
													 <option value="0"  >No</option>
													 <option value="1" >Yes</option>
												</c:otherwise>
												</c:choose>
										</select>

									</div> --%>
								</div><br> 
								<input id="deptId" value="0"  name="deptId" type="hidden"  >
								 <input id="subDeptId" value="0"  name="subDeptId" type="hidden"  >
								 <input id="isDev" value="-1"  name="isDev" type="hidden"  >
								<%-- <div class="box-content">
								

									<div class="col-md-2">Select Department*</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="deptId" id="deptId"
											onchange="getSubDeptList()" required>
											<option value="0">All</option>
											<c:forEach items="${deparmentList}" var="deparmentList">
											<c:choose>
												<c:when test="${deparmentList.deptId==deptId}">
												<option value="${deparmentList.deptId}" selected>${deparmentList.deptCode} &nbsp; ${deparmentList.deptDesc}</option> 
												</c:when>
												<c:otherwise>
												<option value="${deparmentList.deptId}" >${deparmentList.deptCode} &nbsp; ${deparmentList.deptDesc}</option> 
												</c:otherwise>
											</c:choose> 
													 
											</c:forEach>
										</select>

									</div>
									<div class="col-md-1"></div>
									<input type="hidden"    value="${subDeptId}" id="subDeptIds"> 
									<div class="col-md-2">Select Sub Dept *</div>
									<div class="col-md-3">
										<select class="form-control chosen" name="subDeptId" id="subDeptId"  required>
											 
										</select>

									</div>
									 
								</div><br>  --%>
								 <br>
							
							<div class="row">
							<div class="col-md-12" style="text-align: center">
								<input type="submit" class="btn btn-primary"   value="Search"> 
								<input type="button" value="PDF" class="btn btn-primary"
													onclick="genPdf()" />&nbsp;
											 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" >
							 <input type="button" class="btn btn-primary" onclick="showChart()"  value="Graph">  
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
					<div style="overflow:scroll;height:100%;width:100%;overflow:auto" id="tbl">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%" id="table_grid">
									<thead>
									<!-- <tr class="bgpink">
										<th style="width:1%;">SR</th>
										<th class="col-md-4">CATEGORY NAME</th>  
										<th class="col-md-1" colspan="2">APR</th>
										<th class="col-md-1" colspan="2">MAY</th>   
										<th class="col-md-1" colspan="2">JUN</th>
										<th class="col-md-1" colspan="2">JUL</th>
										<th class="col-md-1" colspan="2">AUG</th>
										<th class="col-md-1" colspan="2">SEP</th>
										<th class="col-md-1" colspan="2">OCT</th>
										<th class="col-md-1" colspan="2">NOV</th>
										<th class="col-md-1" colspan="2">DEC</th>
										<th class="col-md-1" colspan="2">JAN</th>
										<th class="col-md-1" colspan="2">FEB</th>
										<th class="col-md-1" colspan="2">MAR</th>
										<th class="col-md-1">Action</th> 
									</tr>
									<tr class="bgpink">
										  <th style="width:1%;"></th>
											<th class="col-md-4"></th>
												 
											<th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1">Qty</th>
											 <th class="col-md-1">Value</th>
											 <th class="col-md-1"></th>
										</tr> -->
										
										<tr class="bgpink">
										<th style="width:1%;">SR</th>
										<th class="col-md-4">CATEGORY NAME</th>  
										<th class="col-md-1"  style="text-align: right">APR</th>
										<th class="col-md-1"  style="text-align: right">MAY</th>   
										<th class="col-md-1"  style="text-align: right">JUN</th>
										<th class="col-md-1"  style="text-align: right">JUL</th>
										<th class="col-md-1"  style="text-align: right">AUG</th>
										<th class="col-md-1"  style="text-align: right">SEP</th>
										<th class="col-md-1"  style="text-align: right">OCT</th>
										<th class="col-md-1"  style="text-align: right">NOV</th>
										<th class="col-md-1"  style="text-align: right">DEC</th>
										<th class="col-md-1"  style="text-align: right">JAN</th>
										<th class="col-md-1"  style="text-align: right">FEB</th>
										<th class="col-md-1"  style="text-align: right">MAR</th>
										<th class="col-md-1" style="text-align: right">Action</th> 
									</tr>
								</thead>
								<tbody>
								
								<c:forEach items="${categoryList}" var="categoryList" varStatus="count">
											<tr> 
												<td  ><c:out value="${count.index+1}" /></td>
 
												<td  ><c:out value="${categoryList.catDesc}" /></td>  
												<c:forEach items="${list}" var="list" varStatus="count">
												 <c:forEach items="${list.monthList}" var="monthList" varStatus="count">
												 <c:choose>
												 <c:when test="${monthList.catId==categoryList.catId}">
												<%-- <td ><c:out value="${monthList.approveQty}" /></td> --%> 
														<td style="text-align: right"><fmt:formatNumber type = "number"  maxFractionDigits = "2" minFractionDigits="2" value="${monthList.approveQty}" /></td> 
														
														 </c:when>
														</c:choose> 
														</c:forEach> 
												</c:forEach>
												<td><a href="${pageContext.request.contextPath}/mrnMonthItemQtyWiseReportBycatId/${categoryList.catId}" class='action_btn'> <abbr title='detailes'> <i class='fa fa-list' ></i></abbr></a>
											
											</tr>
										</c:forEach>
										 <%-- <c:forEach items="${list}" var="list" varStatus="count">
													 
														 <c:forEach items="${list.monthList}" var="monthList" varStatus="count">
														 
														<td ><c:out value="${monthList.monthNo} ${monthList.issueQty}" /></td>  
														</c:forEach> 
												 
													 
												</c:forEach> --%>
										
  
								</tbody>

								</table>
  
					</div> 
					
					<div id="chart" style="display: none"><br> <hr>
		<div id="chart_div" style="width:100%; height:500px" align="center"></div>
		
			<div   id="PiechartApr" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartMay" style="width:25%; height:300; float: Left;" ></div> 
			<div   id="PiechartJun" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartJul" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartAug" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartSep" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartOct" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartNov" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartDec" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartJan" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartFeb" style="width:25%; height:300; float: Left;" ></div>
			<div   id="PiechartMar" style="width:25%; height:300; float: Left;" ></div> 
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
			   
			   $.getJSON('${getCatListForGraph}',{
					
					 
					ajax : 'true',

				},
				function(data1) {
					 
				 
					$.getJSON('${listForMrnGraphCategoryMonthWise}',{
						
										 
										ajax : 'true',

									},
									function(data) {			
										
										 if (data == "") {
												alert("No records found !!");

										 }
										 var i=0;
										 
										 google.charts.load('current', {'packages':['corechart', 'bar']});
										 
										 google.charts.setOnLoadCallback(drawStuff); 
										 function drawStuff() {
			 
										   var chartDiv = document.getElementById('chart_div');
										   document.getElementById("chart_div").style.border = "thin dotted red";
									       var dataTable = new google.visualization.DataTable();
									        
									       dataTable.addColumn('string', 'CATEGORY'); // Implicit domain column.
									     /*   dataTable.addColumn('number', 'Issue Qty');  */// Implicit data column.
									      // dataTable.addColumn({type:'string', role:'interval'});
									     //  dataTable.addColumn({type:'string', role:'interval'}); 
									       dataTable.addColumn('number', 'APR '); 
									       dataTable.addColumn('number', 'MAY '); 
									        dataTable.addColumn('number', 'JUN ');
									       dataTable.addColumn('number', 'JUL ');
									       dataTable.addColumn('number', 'AUG ');
									       dataTable.addColumn('number', 'SEP ');
									       dataTable.addColumn('number', 'OCT ');
									       dataTable.addColumn('number', 'NOV ');
									       dataTable.addColumn('number', 'DEC ');
									       dataTable.addColumn('number', 'JAN ');
									       dataTable.addColumn('number', 'FEB ');
									       dataTable.addColumn('number', 'MAR ');   
									       
									         for(var i = 0 ; i<data1.length ;i++){
									        	 var arry=[];
									        	
									        	 arry.push(data1[i].catDesc);
									        	   
									        	 
									    	   for(var j=0 ; j<data.length ;j++){
									    		   
									    		   for(var k=0 ; k<data[j].monthList.length ;k++){
									    			   
									    			   if(data1[i].catId==data[j].monthList[k].catId){
									    				   
									    				   arry.push(data[j].monthList[k].approveQty);
									    				    
									    			   }
									    		   }
									    		   
									    	   }
									    	    
									    	   dataTable.addRows([
													 
										             [arry[0],arry[1],arry[2],arry[3],arry[4],arry[5],arry[6],arry[7],arry[8],arry[9],arry[10],
										            	 arry[11],arry[12],]
										           
										           ]);
									    	   
									       }  
									      
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
									        
									       function drawAprValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==4){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'APR VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartApr").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartApr'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawMayValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==5){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'MAY VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartMay").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartMay'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawJunValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==6){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'JUN VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartJun").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartJun'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawJulValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==7){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'JUL VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartJul").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartJul'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawAugValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==8){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'AUG VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartAug").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartAug'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawSepValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==9){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'SEP VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartSep").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartSep'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawOctValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==10){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'OCT VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartOct").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartOct'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawNovValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==11){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'NOV VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartNov").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartNov'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawDecValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==12){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'DEC VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartDec").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartDec'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawJanValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==1){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'JAN VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartJan").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartJan'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawFebValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==2){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'FEB VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartFeb").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartFeb'));
										           
										        chart.draw(dataTable, options);
										      }
									       
									       function drawMarValueChart() {
												 var dataTable = new google.visualization.DataTable();
												 dataTable.addColumn('string', 'CATEGORY');
												 dataTable.addColumn('number', 'MONTHWISE VALUE');
										
												 
												 for(var i = 0 ; i<data1.length ;i++){
										        	 var arry=[];
										        	 var approvedQtyValue=0;
										        	 arry.push(data1[i].catDesc);
										        	   
										        	 
										    	   for(var j=0 ; j<data.length ;j++){
										    		   
										    		   for(var k=0 ; k<data[j].monthList.length ;k++){
										    			   
										    			   if(data1[i].catId==data[j].monthList[k].catId && data[j].monthList[k].monthNo==3){
										    				   
										    				   approvedQtyValue=approvedQtyValue+data[j].monthList[k].approveQty;
										    				   /* arry.push(data[j].monthList[k].approvedQtyValue); */
										    				    
										    			   }
										    		   }
										    		   
										    	   }
										    	   
										    	   dataTable.addRows([
														 
											             [arry[0],approvedQtyValue,]
											           
											           ]);
										    	    
										       }  
												    
											 var options = {'title':'MAR VALUE',
								                       'width':275,
								                       'height':250};
												   document.getElementById("PiechartMar").style.border = "thin dotted red";
											 var chart = new google.visualization.PieChart(document.getElementById('PiechartMar'));
										           
										        chart.draw(dataTable, options);
										      }
									      /*  var chart = new google.visualization.ColumnChart(
									                document.getElementById('chart_div'));
									       chart.draw(dataTable,
									          {width: 800, height: 600, title: 'Tax Summary Chart'}); */
									       drawMaterialChart();
									       google.charts.setOnLoadCallback(drawAprValueChart);
									       google.charts.setOnLoadCallback(drawMayValueChart);
									       google.charts.setOnLoadCallback(drawJunValueChart);
									       google.charts.setOnLoadCallback(drawJulValueChart);
									       google.charts.setOnLoadCallback(drawAugValueChart);
									       google.charts.setOnLoadCallback(drawSepValueChart);
									       google.charts.setOnLoadCallback(drawOctValueChart);
									       google.charts.setOnLoadCallback(drawNovValueChart);
									       google.charts.setOnLoadCallback(drawDecValueChart);
									       google.charts.setOnLoadCallback(drawJanValueChart);
									       google.charts.setOnLoadCallback(drawFebValueChart);
									       google.charts.setOnLoadCallback(drawMarValueChart);
										 };
										 
											
								  	});
				});
	}
	
	</script>
	<script type="text/javascript">
	function genPdf(){
		window.open('${pageContext.request.contextPath}/mrnCategoryMonthQtyWiseReportPdf/');
	}
	function exportToExcel()
	{
		window.open("${pageContext.request.contextPath}/exportToExcel");
		document.getElementById("expExcel").disabled=true;
	}
	function getSubDeptList() {
		
		var deptId = document.getElementById("deptId").value;
		var subDeptIds = document.getElementById("subDeptIds").value;
		$.getJSON('${getSubDeptList}', {

			deptId : deptId,
			ajax : 'true'
		}, function(data) {

			var html = '<option value="0">All</option>';

			var len = data.length;
			for (var i = 0; i < len; i++) {
				
				if(subDeptIds==data[i].subDeptId){
					html += '<option value="' + data[i].subDeptId + '" selected>'
					+ data[i].subDeptCode +'&nbsp;&nbsp;&nbsp;s'+data[i].subDeptDesc+'</option>';
				}
				else{
					html += '<option value="' + data[i].subDeptId + '">'
					+ data[i].subDeptCode +'&nbsp;&nbsp;&nbsp;s'+data[i].subDeptDesc+'</option>';
				}
				
			}
			html += '</option>';
			$('#subDeptId').html(html);
			$("#subDeptId").trigger("chosen:updated");
		});
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
  table = document.getElementById("table_grid");
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

</body>
</html>