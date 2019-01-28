package com.ats.tril.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.Category;
import com.ats.tril.model.Company;
import com.ats.tril.model.ExportToExcel;
import com.ats.tril.model.GetCurrentStock;
import com.ats.tril.model.MinAndRolLevelReport;
import com.ats.tril.model.StockDetail;
import com.ats.tril.model.StockHeader;
import com.ats.tril.model.StockValuationCategoryWise;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter; 

@Controller
@Scope("session")
public class StockController {
	
	List<GetCurrentStock> stockListForMonthEnd = new ArrayList<>();
	StockHeader stockHeader = new StockHeader();
	String fromDateForPdf;
	String toDateForPdf;
	
	RestTemplate rest = new RestTemplate();
	
	@RequestMapping(value = "/getCurrentStock", method = RequestMethod.GET)
	public ModelAndView getCurrentStock(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("stock/getCurrentStock");
		try {
		 
			String fromDate,toDate,monthName;
			StockHeader stockHeader = rest.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",StockHeader.class);
			
			String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		     
			 System.out.println(stockHeader);
			 
			 if(stockHeader.getStockHeaderId()!=0)
			 {
				 Date date = new Date();
				 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				 
				 fromDate=stockHeader.getYear()+"-"+stockHeader.getMonth()+"-"+"01";
				 toDate=sf.format(date);
				 monthName=monthNames[stockHeader.getMonth()-1];
				 System.out.println("monthName" + monthName);
			 }
			 else
			 {
				 Date date = new Date();
				 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				 
				 Calendar cal = Calendar.getInstance();
				 cal.setTime(date);
				 int year = cal.get(Calendar.YEAR);
				 int month = cal.get(Calendar.MONTH);
				  
				 fromDate=year+"-"+(month+1)+"-"+"01";
				 toDate=sf.format(date);
				 
				 monthName=monthNames[(month)];
			 }
			 System.out.println("fromDate" + fromDate);
			 System.out.println("toDate" + toDate);
			 
			 
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("fromDate", fromDate);
 			 map.add("toDate", toDate);
			 
 			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class);
 			
 			List<GetCurrentStock> stockList = new ArrayList<>(Arrays.asList(getCurrentStock));
 			
 			System.out.println(stockList);
 			model.addObject("stockList", stockList);
 			model.addObject("fromDate",DateConvertor.convertToDMY(fromDate));
 			model.addObject("toDate", DateConvertor.convertToDMY(toDate));
 			model.addObject("monthName", monthName);
			  
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/monthEndStock", method = RequestMethod.GET)
	public ModelAndView monthEndStock(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("stock/monthEndStock");
		try {
		 
			String fromDate,toDate,monthName;
			 stockHeader = rest.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",StockHeader.class);
			
			String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		    
			 
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			fromDate=stockHeader.getYear()+"-"+stockHeader.getMonth()+"-"+"01";
			monthName =  monthNames[stockHeader.getMonth()-1];
			 Date today = sf.parse(fromDate);  

		        Calendar calendar = Calendar.getInstance();  
		        calendar.setTime(today);  
		        calendar.add(Calendar.MONTH, 1);  
		        calendar.set(Calendar.DAY_OF_MONTH, 1);  
		        calendar.add(Calendar.DATE, -1);  

		        Date lastDayOfMonth = calendar.getTime();  

		         
		        System.out.println("Today            : " + sf.format(today));  
		        System.out.println("Last Day of Month: " + sf.format(lastDayOfMonth));  
				 
			
			toDate=sf.format(lastDayOfMonth);
			 
			 System.out.println("fromDate" + fromDate);
			 System.out.println("toDate" + toDate);
			 System.out.println("monthName" + monthName);
			 
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("fromDate", fromDate);
 			 map.add("toDate", toDate);
			 
 			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class);
 			
 			stockListForMonthEnd = new ArrayList<>(Arrays.asList(getCurrentStock));
 			
 			System.out.println(stockListForMonthEnd);
 			model.addObject("stockList", stockListForMonthEnd);
 			model.addObject("fromDate",DateConvertor.convertToDMY(fromDate));
 			model.addObject("toDate", DateConvertor.convertToDMY(toDate));
 			model.addObject("monthName", monthName);
 			
 			Date date = new Date();
 			
 			int isMonthEnd=0;
 			 
 			if(sf.format(date).compareTo(toDate)>0) 
 				isMonthEnd=1;
 			model.addObject("isMonthEnd", isMonthEnd);
			  
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	DecimalFormat df = new DecimalFormat("####0.00");
	
	@RequestMapping(value = "/submitMonthEnd", method = RequestMethod.POST)
	public String submitMonthEnd(HttpServletRequest request, HttpServletResponse response) {

		 try {
		  
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			 map.add("stockId", stockHeader.getStockHeaderId());
			 
			 StockDetail[] stockDetail = rest.postForObject(Constants.url + "/getStockDetailByStockId",map,StockDetail[].class); 
			 List<StockDetail> stockDetailList = new ArrayList<>(Arrays.asList(stockDetail));
 			 
			 for(int i = 0 ; i<stockDetailList.size() ; i++)
			 {
				 for(int j = 0 ; j<stockListForMonthEnd.size() ; j++)
				 {
					 if(stockDetailList.get(i).getItemId() == stockListForMonthEnd.get(j).getItemId())
					 {
						 stockDetailList.get(i).setApprovedQty(stockListForMonthEnd.get(j).getApproveQty());
						 stockDetailList.get(i).setApprovedQtyValue(stockListForMonthEnd.get(j).getApprovedQtyValue());
						 stockDetailList.get(i).setIssueQty(stockListForMonthEnd.get(j).getIssueQty());
						 stockDetailList.get(i).setIssueQtyValue(stockListForMonthEnd.get(j).getIssueQtyValue());
						 stockDetailList.get(i).setReturnIssueQty(stockListForMonthEnd.get(j).getReturnIssueQty());
						 stockDetailList.get(i).setDamageQty(stockListForMonthEnd.get(j).getDamageQty());
						 stockDetailList.get(i).setDamageValue(stockListForMonthEnd.get(j).getDamagValue());
						 
						 stockDetailList.get(i).setClosingQty(Float.valueOf(df.format(stockListForMonthEnd.get(j).getOpeningStock()+stockListForMonthEnd.get(j).getApproveQty()-stockListForMonthEnd.get(j).getIssueQty()
								 +stockListForMonthEnd.get(j).getReturnIssueQty()-stockListForMonthEnd.get(j).getDamageQty()-stockListForMonthEnd.get(j).getGatepassQty()
								 +stockListForMonthEnd.get(j).getGatepassReturnQty())));
						 stockDetailList.get(i).setCloasingValue(Float.valueOf(df.format(stockListForMonthEnd.get(j).getOpStockValue()+stockListForMonthEnd.get(j).getApprovedQtyValue()
								 -stockListForMonthEnd.get(j).getIssueQtyValue()-stockListForMonthEnd.get(j).getDamagValue())));
						 
						 //stockDetailList.get(i).setGatepassValue(stockListForMonthEnd.get(j).getGatepassQty());
						 stockDetailList.get(i).setGatepassReturnValue(Float.valueOf(df.format(stockListForMonthEnd.get(j).getOpLandingValue()+stockListForMonthEnd.get(j).getApprovedLandingValue()
								 -stockListForMonthEnd.get(j).getIssueLandingValue()-stockListForMonthEnd.get(j).getDamageLandingValue())));
					 }
				 }
			 }
			 
			 stockHeader.setStatus(1);
			 stockHeader.setStockDetailList(stockDetailList);
			 
			 StockHeader update = rest.postForObject(Constants.url + "/insertStock",stockHeader,StockHeader.class); 
			 System.out.println(update);
			 
			 if(update!=null)
			 {
				 List<StockDetail> insertNewList = new ArrayList<>();
				 String lastDate = request.getParameter("toDate");
				  SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
				  SimpleDateFormat dd = new SimpleDateFormat("dd-MM-yyyy");
				  int MILLIS_IN_DAY = 1000 * 60 * 60 * 24;
				  Date date = dd.parse(lastDate);
				   
				  String nextDate = dd.format(date.getTime() + MILLIS_IN_DAY);
				   
				  date = dd.parse(nextDate);
				  Calendar calendar = Calendar.getInstance();
				  calendar.setTime(date); 
				  System.out.println("next Date  "+yy.format(calendar.getTime()));
				  
				 StockHeader newEntry = new StockHeader();
				 newEntry.setDate(yy.format(calendar.getTime()));
				 newEntry.setMonth(calendar.get(Calendar.MONTH)+1);
				 newEntry.setYear(calendar.get(Calendar.YEAR));
				 newEntry.setDelStatus(1);
				 
				 for(int j = 0 ; j<stockListForMonthEnd.size() ; j++)
				 {
					 StockDetail stockDetail1 = new StockDetail();
					 stockDetail1.setItemId(stockListForMonthEnd.get(j).getItemId());
					 stockDetail1.setDelStatus(1);
					 stockDetail1.setOpStockQty(Float.valueOf(df.format(stockListForMonthEnd.get(j).getOpeningStock()+stockListForMonthEnd.get(j).getApproveQty()-stockListForMonthEnd.get(j).getIssueQty()
							 +stockListForMonthEnd.get(j).getReturnIssueQty()-stockListForMonthEnd.get(j).getDamageQty()-stockListForMonthEnd.get(j).getGatepassQty()
							 +stockListForMonthEnd.get(j).getGatepassReturnQty())));
					 stockDetail1.setOpStockValue(Float.valueOf(df.format(stockListForMonthEnd.get(j).getOpStockValue()+
							 stockListForMonthEnd.get(j).getApprovedQtyValue()-stockListForMonthEnd.get(j).getIssueQtyValue()-stockListForMonthEnd.get(j).getDamagValue())));
					 stockDetail1.setGatepassValue(Float.valueOf(df.format(stockListForMonthEnd.get(j).getOpLandingValue()+stockListForMonthEnd.get(j).getApprovedLandingValue()
							 -stockListForMonthEnd.get(j).getIssueLandingValue()-stockListForMonthEnd.get(j).getDamageLandingValue())));
					 
					 insertNewList.add(stockDetail1);
				 }
				 newEntry.setStockDetailList(insertNewList);
				 System.out.println("newEntry" + newEntry);
				 StockHeader insert = rest.postForObject(Constants.url + "/insertStock",newEntry,StockHeader.class); 
				 System.out.println(insert);
				  
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/monthEndStock";
	}
	
	List<GetCurrentStock> getStockBetweenDateForPdf = new ArrayList<>();
	
	@RequestMapping(value = "/stockBetweenDate", method = RequestMethod.GET)
	public ModelAndView stockBetweenDate(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("stock/stockBetweenDate");
		try {
			List<GetCurrentStock> getStockBetweenDate = new ArrayList<>();
			 
			if( request.getParameter("fromDate")==null || request.getParameter("toDate")==null) {
				
				SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dd = new SimpleDateFormat("dd-MM-yyyy");
				Date date = new Date();
				  Calendar calendar = Calendar.getInstance();
				  calendar.setTime(date);
				   
				 String firstDate = "01"+"-"+(calendar.get(Calendar.MONTH)+1)+"-"+calendar.get(Calendar.YEAR);
				
				 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				 map.add("fromDate",DateConvertor.convertToYMD(firstDate));
	 			 map.add("toDate",yy.format(date)); 
	 			 System.out.println(map);
	 			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class); 
	 			getStockBetweenDate = new ArrayList<GetCurrentStock>(Arrays.asList(getCurrentStock));
	 			
	 			 model.addObject("fromDate", firstDate);
					model.addObject("toDate", dd.format(date));
					model.addObject("stockList", getStockBetweenDate);
					model.addObject("selectedQty", 1);
					
					fromDateForPdf=firstDate;
					toDateForPdf=dd.format(date);
				 
			}
			else {
				String fromDate = request.getParameter("fromDate");
				String toDate = request.getParameter("toDate");
				int selectedQty = Integer.parseInt(request.getParameter("selectedQty"));
				
				SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dd = new SimpleDateFormat("dd-MM-yyyy");
				
				Date date = dd.parse(fromDate);
				  Calendar calendar = Calendar.getInstance();
				  calendar.setTime(date);
				   
				 String firstDate = "01"+"-"+(calendar.get(Calendar.MONTH)+1)+"-"+calendar.get(Calendar.YEAR);
				 
				 System.out.println(DateConvertor.convertToYMD(firstDate) + DateConvertor.convertToYMD(fromDate));
				 
				 if(DateConvertor.convertToYMD(firstDate).compareTo(DateConvertor.convertToYMD(fromDate))<0)
				 {
					 calendar.add(Calendar.DATE, -1);
					  String previousDate = yy.format(new Date(calendar.getTimeInMillis())); 
					 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					 map.add("fromDate",DateConvertor.convertToYMD(firstDate));
		 			 map.add("toDate",previousDate); 
		 			 System.out.println(map);
		 			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class); 
		 			List<GetCurrentStock> diffDateStock = new ArrayList<>(Arrays.asList(getCurrentStock));
		 			
		 			 calendar.add(Calendar.DATE, 1);
					  String addDay = yy.format(new Date(calendar.getTimeInMillis()));
		 			map = new LinkedMultiValueMap<>();
					 map.add("fromDate",addDay);
		 			 map.add("toDate",DateConvertor.convertToYMD(toDate)); 
		 			 System.out.println(map);
		 			GetCurrentStock[] getCurrentStock1 = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class); 
		 			 getStockBetweenDate = new ArrayList<GetCurrentStock>(Arrays.asList(getCurrentStock1));
		 			 
		 			 for(int i = 0 ; i< getStockBetweenDate.size() ; i++)
		 			 {
		 				 for(int j = 0 ; j< diffDateStock.size() ; j++)
			 			 {
		 					 if(getStockBetweenDate.get(i).getItemId()==diffDateStock.get(j).getItemId())
		 					 {
		 						getStockBetweenDate.get(i).setOpeningStock(diffDateStock.get(j).getOpeningStock()+diffDateStock.get(j).getApproveQty()-diffDateStock.get(j).getIssueQty()
								 +diffDateStock.get(j).getReturnIssueQty()-diffDateStock.get(j).getDamageQty()-diffDateStock.get(j).getGatepassQty()
								 +diffDateStock.get(j).getGatepassReturnQty());
		 						getStockBetweenDate.get(i).setOpStockValue(diffDateStock.get(j).getOpStockValue()+diffDateStock.get(j).getApprovedQtyValue()-diffDateStock.get(j).getIssueQtyValue()-diffDateStock.get(j).getDamagValue());
		 						break;
		 					 }
			 			 }
		 			 }
				 }
				 else
				 {
					 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					 map.add("fromDate",DateConvertor.convertToYMD(fromDate));
		 			 map.add("toDate",DateConvertor.convertToYMD(toDate)); 
		 			 System.out.println(map);
		 			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class); 
		 			getStockBetweenDate = new ArrayList<GetCurrentStock>(Arrays.asList(getCurrentStock));
				 }
				 
				 
				 model.addObject("fromDate", fromDate);
					model.addObject("toDate", toDate);
					model.addObject("stockList", getStockBetweenDate);
					model.addObject("selectedQty", selectedQty);
					fromDateForPdf=fromDate;
					toDateForPdf=toDate;
			}
			
			getStockBetweenDateForPdf=getStockBetweenDate;
			
			//----------------exel-------------------------
			
			
			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("SR. No");
			rowData.add("ITEM NAME");
			rowData.add("OP QTY");
			rowData.add("OP VALUE");
			rowData.add("MRN QTY");
			rowData.add("MRN VALUE");
			rowData.add("ISSUE QTY");
			rowData.add("ISSUE VALUE");
			rowData.add("DAMAGE QTY");
			rowData.add("DAMAGE VALUE");
			rowData.add("C\\L QTY");
			rowData.add("C\\L VALUE");
			

			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);
			for (int i = 0; i < getStockBetweenDate.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();

				rowData.add((i+1)+"");
				rowData.add(getStockBetweenDate.get(i).getItemCode());
				rowData.add(""+getStockBetweenDate.get(i).getOpeningStock());
				rowData.add(""+getStockBetweenDate.get(i).getOpStockValue());
				rowData.add(""+getStockBetweenDate.get(i).getApproveQty());
				rowData.add(""+getStockBetweenDate.get(i).getApprovedQtyValue());
				rowData.add(""+getStockBetweenDate.get(i).getIssueQty());
				rowData.add(""+getStockBetweenDate.get(i).getIssueQtyValue());
				rowData.add(""+getStockBetweenDate.get(i).getDamageQty());
				rowData.add(""+getStockBetweenDate.get(i).getDamagValue());
				
				float closingQty = getStockBetweenDate.get(i).getOpeningStock()+getStockBetweenDate.get(i).getApproveQty()-
						getStockBetweenDate.get(i).getIssueQty()-getStockBetweenDate.get(i).getDamageQty();
				
				float closingValue = getStockBetweenDate.get(i).getOpStockValue()+getStockBetweenDate.get(i).getApprovedQtyValue()-
						getStockBetweenDate.get(i).getIssueQtyValue()-getStockBetweenDate.get(i).getDamagValue();
				
				
				rowData.add(""+closingQty);
				rowData.add(""+closingValue);


				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);

			}

			HttpSession session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelName", "dateWiseStock");

			
			System.out.println(getStockBetweenDate);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/stockBetweenDateReportItemWisePDF", method = RequestMethod.GET)
	public void stockBetweenDateReportItemWisePDF(HttpServletRequest request, HttpServletResponse response)
			throws FileNotFoundException {
		BufferedOutputStream outStream = null;
		try {
		Document document = new Document(PageSize.A4.rotate(), 10f, 10f, 10f, 0f);
		DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
		String reportDate = DF.format(new Date());
        document.addHeader("Date: ", reportDate);
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Calendar cal = Calendar.getInstance();

		System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
		String timeStamp = dateFormat.format(cal.getTime());
		String FILE_PATH = Constants.REPORT_SAVE;
		File file = new File(FILE_PATH);
		DecimalFormat df = new DecimalFormat("####0.00");
		Company comp = rest.getForObject(Constants.url + "getCompanyDetails",
				Company.class);
		
		PdfWriter writer = null;

		FileOutputStream out = new FileOutputStream(FILE_PATH);
		try {
			writer = PdfWriter.getInstance(document, out);
		} catch (DocumentException e) {

			e.printStackTrace();
		}
	
		PdfPTable table = new PdfPTable(17);
		try {
			System.out.println("Inside PDF Table try");
			table.setWidthPercentage(100);
			table.setWidths(new float[] {0.7f, 2.7f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f});
			Font headFont = new Font(FontFamily.TIMES_ROMAN, 9, Font.NORMAL, BaseColor.BLACK);
			Font headFont1 = new Font(FontFamily.HELVETICA, 11, Font.BOLD, BaseColor.WHITE);
			Font f = new Font(FontFamily.TIMES_ROMAN, 11.0f, Font.UNDERLINE, BaseColor.BLUE);
			Font f1 = new Font(FontFamily.TIMES_ROMAN, 9.0f, Font.BOLD, BaseColor.DARK_GRAY);

			PdfPCell hcell = new PdfPCell();
			
			hcell.setPadding(4);
			hcell = new PdfPCell(new Phrase("SR", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("ITEM", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("OP QTY", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("OP VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("OP LAND VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("MRN QTY", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("MRN VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("MRN LAND VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("ISSUE QTY", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("ISSUE VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("ISSUE LAND VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("DAMAGE QTY", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("DAMAGE VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("DAMAGE LAND VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("C/L QTY", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("C/L VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("C/L LAND VALUE", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			
			int index = 0;
			if(!getStockBetweenDateForPdf.isEmpty()) {
					for (int k = 0; k < getStockBetweenDateForPdf.size(); k++) {
                            
						if(getStockBetweenDateForPdf.get(k).getOpeningStock()>0 || getStockBetweenDateForPdf.get(k).getOpStockValue()>0 
								|| getStockBetweenDateForPdf.get(k).getApproveQty()>0 || getStockBetweenDateForPdf.get(k).getApprovedQtyValue()>0
								|| getStockBetweenDateForPdf.get(k).getIssueQty()>0 || getStockBetweenDateForPdf.get(k).getIssueQtyValue()>0
								|| getStockBetweenDateForPdf.get(k).getDamageQty()>0 || getStockBetweenDateForPdf.get(k).getDamagValue()>0) {
							
						
							index++;
						
							PdfPCell cell;
							
							cell = new PdfPCell(new Phrase(""+index, headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_CENTER);
							cell.setPadding(3);
							table.addCell(cell);

						
							cell = new PdfPCell(new Phrase(getStockBetweenDateForPdf.get(k).getItemCode(), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
						
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getOpeningStock()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							 
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getOpStockValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getOpLandingValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getApproveQty()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							 
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getApprovedQtyValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getApprovedLandingValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getIssueQty()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getIssueQtyValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getIssueLandingValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getDamageQty()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getDamagValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(getStockBetweenDateForPdf.get(k).getDamageLandingValue()), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							float closingQty = getStockBetweenDateForPdf.get(k).getOpeningStock()+getStockBetweenDateForPdf.get(k).getApproveQty()-
									getStockBetweenDateForPdf.get(k).getIssueQty()-getStockBetweenDateForPdf.get(k).getDamageQty();
							
							float closingValue = getStockBetweenDateForPdf.get(k).getOpStockValue()+getStockBetweenDateForPdf.get(k).getApprovedQtyValue()-
									getStockBetweenDateForPdf.get(k).getIssueQtyValue()-getStockBetweenDateForPdf.get(k).getDamagValue();
							float closingLandingValue = getStockBetweenDateForPdf.get(k).getOpLandingValue()+getStockBetweenDateForPdf.get(k).getApprovedLandingValue()-
									getStockBetweenDateForPdf.get(k).getIssueLandingValue()-getStockBetweenDateForPdf.get(k).getDamageLandingValue();
							
							cell = new PdfPCell(new Phrase(""+df.format(closingQty), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(closingValue), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
							
							cell = new PdfPCell(new Phrase(""+df.format(closingLandingValue), headFont));
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setPaddingRight(2);
							cell.setPadding(3);
							table.addCell(cell);
						}
					}
			}
			
			document.open();
			Paragraph company = new Paragraph(comp.getCompanyName()+"\n", f);
			company.setAlignment(Element.ALIGN_CENTER);
			document.add(company);
			
				Paragraph heading1 = new Paragraph(
						comp.getFactoryAdd()+"",f1);
				heading1.setAlignment(Element.ALIGN_CENTER);
				document.add(heading1);
				 
				Paragraph headingDate=new Paragraph("Date Wise Stock Report , From Date: " + fromDateForPdf+"  To Date: "+toDateForPdf+"",f1);
				headingDate.setAlignment(Element.ALIGN_CENTER);
			document.add(headingDate);
			
			Paragraph ex3=new Paragraph("\n");
			document.add(ex3);
			table.setHeaderRows(1);
			document.add(table);
			
		
			int totalPages = writer.getPageNumber();

			System.out.println("Page no " + totalPages);

			document.close();
			// Atul Sir code to open a Pdf File
			if (file != null) {

				String mimeType = URLConnection.guessContentTypeFromName(file.getName());

				if (mimeType == null) {

					mimeType = "application/pdf";

				}

				response.setContentType(mimeType);

				response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

				response.setContentLength((int) file.length());

				InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

				try {
					FileCopyUtils.copy(inputStream, response.getOutputStream());
				} catch (IOException e) {
					System.out.println("Excep in Opening a Pdf File");
					e.printStackTrace();
				}
			}

		} catch (DocumentException ex) {

			System.out.println("Pdf Generation Error" + ex.getMessage());

			ex.printStackTrace();

		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	
	@RequestMapping(value = "/getStockBetweenDate", method = RequestMethod.GET) 
	public ModelAndView getStockBetweenDate(HttpServletRequest request, HttpServletResponse response) {

		List<GetCurrentStock> getStockBetweenDate = new ArrayList<>();
		ModelAndView model = new ModelAndView("stock/stockBetweenDate");
		try {
		 
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			 
			
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat dd = new SimpleDateFormat("dd-MM-yyyy");
			
			Date date = dd.parse(fromDate);
			  Calendar calendar = Calendar.getInstance();
			  calendar.setTime(date);
			   
			 String firstDate = "01"+"-"+(calendar.get(Calendar.MONTH)+1)+"-"+calendar.get(Calendar.YEAR);
			 
			 System.out.println(DateConvertor.convertToYMD(firstDate) + DateConvertor.convertToYMD(fromDate));
			 
			 if(DateConvertor.convertToYMD(firstDate).compareTo(DateConvertor.convertToYMD(fromDate))<0)
			 {
				 calendar.add(Calendar.DATE, -1);
				  String previousDate = yy.format(new Date(calendar.getTimeInMillis())); 
				 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				 map.add("fromDate",DateConvertor.convertToYMD(firstDate));
	 			 map.add("toDate",previousDate); 
	 			 System.out.println(map);
	 			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class); 
	 			List<GetCurrentStock> diffDateStock = new ArrayList<>(Arrays.asList(getCurrentStock));
	 			
	 			 calendar.add(Calendar.DATE, 1);
				  String addDay = yy.format(new Date(calendar.getTimeInMillis()));
	 			map = new LinkedMultiValueMap<>();
				 map.add("fromDate",addDay);
	 			 map.add("toDate",DateConvertor.convertToYMD(toDate)); 
	 			 System.out.println(map);
	 			GetCurrentStock[] getCurrentStock1 = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class); 
	 			 getStockBetweenDate = new ArrayList<>(Arrays.asList(getCurrentStock1));
	 			 
	 			 for(int i = 0 ; i< getStockBetweenDate.size() ; i++)
	 			 {
	 				 for(int j = 0 ; j< diffDateStock.size() ; j++)
		 			 {
	 					 if(getStockBetweenDate.get(i).getItemId()==diffDateStock.get(j).getItemId())
	 					 {
	 						getStockBetweenDate.get(i).setOpeningStock(diffDateStock.get(j).getOpeningStock()+diffDateStock.get(j).getApproveQty()-diffDateStock.get(j).getIssueQty()
							 +diffDateStock.get(j).getReturnIssueQty()-diffDateStock.get(j).getDamageQty()-diffDateStock.get(j).getGatepassQty()
							 +diffDateStock.get(j).getGatepassReturnQty());
	 						getStockBetweenDate.get(i).setOpStockValue(diffDateStock.get(j).getOpStockValue()+diffDateStock.get(j).getApprovedQtyValue()-diffDateStock.get(j).getIssueQtyValue()-diffDateStock.get(j).getDamagValue());
	 						break;
	 					 }
		 			 }
	 			 }
			 }
			 else
			 {
				 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				 map.add("fromDate",DateConvertor.convertToYMD(fromDate));
	 			 map.add("toDate",DateConvertor.convertToYMD(toDate)); 
	 			 System.out.println(map);
	 			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class); 
	 			getStockBetweenDate = new ArrayList<>(Arrays.asList(getCurrentStock));
			 }
			 
			 
			 model.addObject("fromDate", fromDate);
				model.addObject("toDate", toDate);
 			 
			  
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addObject("getStockBetweenDate", getStockBetweenDate);
		
		return model;
	}
	
	@RequestMapping(value = "/minAndRolQtyReport", method = RequestMethod.GET)
	public ModelAndView minAndRolQtyReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("report/minAndRolQtyReport");
		try {
		 
			Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category));
			model.addObject("categoryList", categoryList); 
			
			if(request.getParameter("selectedQty")!=null) {
				
				String fromDate,toDate;
				StockHeader stockHeader = rest.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",StockHeader.class);
				 
				int selectedQty = Integer.parseInt(request.getParameter("selectedQty"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				
				 System.out.println(stockHeader);
				 
				 if(stockHeader.getStockHeaderId()!=0)
				 {
					 Date date = new Date();
					 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					 
					 fromDate=stockHeader.getYear()+"-"+stockHeader.getMonth()+"-"+"01";
					 toDate=sf.format(date); 
				 }
				 else
				 {
					 Date date = new Date();
					 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					 
					 Calendar cal = Calendar.getInstance();
					 cal.setTime(date);
					 int year = cal.get(Calendar.YEAR);
					 int month = cal.get(Calendar.MONTH);
					  
					 fromDate=year+"-"+(month+1)+"-"+"01";
					 toDate=sf.format(date);
					  
				 }
				 
				 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				 map.add("fromDate", fromDate);
	 			 map.add("toDate", toDate);
	 			map.add("catId", catId);
	 			 System.out.println("map" + map); 
	 			MinAndRolLevelReport[] getCurrentStock = rest.postForObject(Constants.url + "/minQtyAndRolQtyLevelReport",map,MinAndRolLevelReport[].class);
	 			
	 			List<MinAndRolLevelReport> stockList = new ArrayList<MinAndRolLevelReport>(Arrays.asList(getCurrentStock));
	 			
	 			System.out.println(stockList);
	 			model.addObject("stockList", stockList); 
	 			model.addObject("selectedQty", selectedQty);
	 			model.addObject("catId", catId);
			}
			
			  
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}
