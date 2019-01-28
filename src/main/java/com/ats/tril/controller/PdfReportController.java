package com.ats.tril.controller;

import java.awt.Dimension;
import java.awt.Insets;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.AccountHead;
import com.ats.tril.model.Category;
import com.ats.tril.model.Company;
import com.ats.tril.model.EnquiryDetail;
import com.ats.tril.model.GetEnquiryDetail;
import com.ats.tril.model.GetEnquiryHeader;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.GetPoHeaderList;
import com.ats.tril.model.SettingValue;
import com.ats.tril.model.Type;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.doc.GatePassReport;
import com.ats.tril.model.doc.IndentReport;
import com.ats.tril.model.doc.IssueReport;
import com.ats.tril.model.doc.MrnReport;
import com.ats.tril.model.doc.POReport;
import com.ats.tril.model.doc.RejectionReport;

@Controller
@Scope("session")
public class PdfReportController {

	List<GetEnquiryDetail> addItemInEditEnquiryDetail = new ArrayList<GetEnquiryDetail>();

	
	
	//
	
	/*@RequestMapping(value = "/poPdf/{id}", method = RequestMethod.GET)
	public ModelAndView poPdf ( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView model = new ModelAndView("docs/po");
		try {
		System.out.println("PO List ids " + id);
		 
		
		RestTemplate restTemplate = new RestTemplate();

	    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	    List<Integer> integersList = new ArrayList<Integer>();

		for (int i = 0; i < id.length; i++) {

			if (id[i] > 0) {

				integersList.add(id[i]);
			}
		}

		String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
    
	    
		map.add("poIdList", listOfIds);
		
		POReport[] reportarray =restTemplate.postForObject(Constants.url + "/getAllPoListHeaderDetailReport", map,POReport[].class );
		
		List<POReport>reportsList=new ArrayList<POReport>(Arrays.asList(reportarray));
		
		System.out.println("PO Report data " + reportsList.toString());
		
		model.addObject("list", reportsList);
		
		Company company = restTemplate.getForObject(Constants.url + "getCompanyDetails",
				Company.class);
		model.addObject("company", company);
		
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		 map = new LinkedMultiValueMap<String, Object>();
		 map.add("docId", 2);
		 map.add("date", sf.format(date));
		DocumentBean documentBean = restTemplate.postForObject(Constants.url + "getDocumentInfo",map,
				DocumentBean.class);
		model.addObject("documentBean", documentBean);
		
		}catch (Exception e) {
			e.printStackTrace();
						
		}
		
		return model;
	}*/
	
	@RequestMapping(value = "/pdf/poPdf/{id}", method = RequestMethod.GET)
	public ModelAndView poPdf ( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView model = new ModelAndView("docs/po");
		try {
		System.out.println("PO List ids " + id);
		 
		
		RestTemplate restTemplate = new RestTemplate();

	    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	    List<Integer> integersList = new ArrayList<Integer>();

		for (int i = 0; i < id.length; i++) {

			if (id[i] > 0) {

				integersList.add(id[i]);
			}
		}

		String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
    
	    
		map.add("poIdList", listOfIds);
		
		POReport[] reportarray =restTemplate.postForObject(Constants.url + "/getAllPoListHeaderDetailReport", map,POReport[].class );
		
		List<POReport>reportsList=new ArrayList<POReport>(Arrays.asList(reportarray));
		
		System.out.println("PO Report data " + reportsList.toString());
		
		model.addObject("list", reportsList);
		
		Company company = restTemplate.getForObject(Constants.url + "getCompanyDetails",
				Company.class);
		model.addObject("company", company);
		
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		 map = new LinkedMultiValueMap<String, Object>();
		 map.add("docId", 2);
		 map.add("date", sf.format(date));
		DocumentBean documentBean = restTemplate.postForObject(Constants.url + "getDocumentInfo",map,
				DocumentBean.class);
		model.addObject("documentBean", documentBean);
		
		}catch (Exception e) {
			e.printStackTrace();
						
		}
		
		return model;
	}
	
	@RequestMapping(value = "/poSummuryRegister", method = RequestMethod.GET)
	public ModelAndView poSummuryRegister(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/poSummuryRegister");
		try {
			RestTemplate restTemplate = new RestTemplate();
			/*Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat display = new SimpleDateFormat("dd-MM-yyyy");

			 
				model.addObject("fromDate", display.format(date));
				model.addObject("toDate", display.format(date));*/
			
			Category[] category = restTemplate.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
			model.addObject("categoryList", categoryList);
			 
			  
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/pdf/poSummuryRegisterPdf/{fromDate}/{toDate}/{catId}", method = RequestMethod.GET)
	public ModelAndView poSummuryRegister ( @PathVariable String fromDate,@PathVariable String toDate,
			@PathVariable int catId, HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView model = new ModelAndView("docs/poSummuryRegister");
		try {
		 
		  
		RestTemplate restTemplate = new RestTemplate();

	    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
 
		map.add("fromDate", DateConvertor.convertToYMD(fromDate));
		map.add("toDate", DateConvertor.convertToYMD(toDate));
		map.add("catId", catId);
		
		POReport[] reportarray =restTemplate.postForObject(Constants.url + "/getAllPoListHeaderDetailReportByDate", map,POReport[].class );
		
		List<POReport>reportsList=new ArrayList<POReport>(Arrays.asList(reportarray));
		 
		model.addObject("list", reportsList);
		model.addObject("fromDate", fromDate);
		model.addObject("toDate", toDate);
		 
		}catch (Exception e) {
			e.printStackTrace();
						
		}
		
		return model;
	}
	
	// Indent Doc

	@RequestMapping(value = "/pdf/indentPdfDoc/{indId}", method = RequestMethod.GET)
	public ModelAndView showIndentDocs(@PathVariable int[] indId, HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("Doc indent for " + indId.toString());

		ModelAndView model = new ModelAndView("docs/indent");

		
		try {
			
		RestTemplate restTemplate = new RestTemplate();
		
	    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	    List<Integer> integersList = new ArrayList<Integer>();

		for (int i = 0; i < indId.length; i++) {

			if (indId[i] > 0) {

				integersList.add(indId[i]);
			}
		}

		String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));

		
		
		System.out.println("Doc indent ids " + integersList.toString());

		map.add("indentIdList", listOfIds);

		IndentReport[] reports = restTemplate.postForObject(Constants.url + "getIndentListHeaderDetailReport", map,
				IndentReport[].class);
		
		List<IndentReport> indentReportList = new ArrayList<IndentReport>(Arrays.asList(reports));

		System.out.println("Report Data " + indentReportList.toString());
		
		model.addObject("list", indentReportList);
		
		Company company = restTemplate.getForObject(Constants.url + "getCompanyDetails",
				Company.class);
		model.addObject("company", company);
		
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		 map = new LinkedMultiValueMap<String, Object>();
		 map.add("docId", 1);
		 map.add("date", sf.format(date));
		DocumentBean documentBean = restTemplate.postForObject(Constants.url + "getDocumentInfo",map,
				DocumentBean.class);
		model.addObject("documentBean", documentBean);
		
		}catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		return model;
	}

	
	// GRN
	
	@RequestMapping(value = "/pdf/grnPdf/{id}", method = RequestMethod.GET)
	public ModelAndView addCategory ( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView model = new ModelAndView("docs/grn");
		try {
		System.out.println("GRN Report ids " + id);
		
		
		RestTemplate restTemplate = new RestTemplate();

	    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	    List<Integer> integersList = new ArrayList<Integer>();

		for (int i = 0; i < id.length; i++) {

			if (id[i] > 0) {

				integersList.add(id[i]);
			}
		}

		String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
    
	    
		map.add("mrnIdList", listOfIds);
		
		MrnReport[] reportarray =restTemplate.postForObject(Constants.url + "/getAllMrnListHeaderDetailReport", map,MrnReport[].class );
		
		List<MrnReport>reportsList=new ArrayList<MrnReport>(Arrays.asList(reportarray));
		
		System.out.println("GRN Report data " + reportsList.toString());

		
		model.addObject("list", reportsList);
		
		Company company = restTemplate.getForObject(Constants.url + "getCompanyDetails",
				Company.class);
		model.addObject("company", company);
		
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		 map = new LinkedMultiValueMap<String, Object>();
		 map.add("docId", 3);
		 map.add("date", sf.format(date));
		DocumentBean documentBean = restTemplate.postForObject(Constants.url + "getDocumentInfo",map,
				DocumentBean.class);
		model.addObject("documentBean", documentBean);
		
		}catch (Exception e) {
			
			e.printStackTrace();
						
		}
		return model;
	}
	
	@RequestMapping(value = "/pdf/grnInspectionPdf/{id}", method = RequestMethod.GET)
	public ModelAndView grnInspectionPdf ( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView model = new ModelAndView("docs/grnInspection");
		try {
		System.out.println("GRN Report ids " + id);
		
		
		RestTemplate restTemplate = new RestTemplate();

	    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	    List<Integer> integersList = new ArrayList<Integer>();

		for (int i = 0; i < id.length; i++) {

			if (id[i] > 0) {

				integersList.add(id[i]);
			}
		}

		String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
    
	    
		map.add("mrnIdList", listOfIds);
		
		MrnReport[] reportarray =restTemplate.postForObject(Constants.url + "/getAllMrnListHeaderDetailReport", map,MrnReport[].class );
		
		List<MrnReport>reportsList=new ArrayList<MrnReport>(Arrays.asList(reportarray));
		
		System.out.println("GRN Report data " + reportsList.toString());

		
		model.addObject("list", reportsList);
		
		Company company = restTemplate.getForObject(Constants.url + "getCompanyDetails",
				Company.class);
		model.addObject("company", company);
		
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		 map = new LinkedMultiValueMap<String, Object>();
		 map.add("docId", 3);
		 map.add("date", sf.format(date));
		DocumentBean documentBean = restTemplate.postForObject(Constants.url + "getDocumentInfo",map,
				DocumentBean.class);
		model.addObject("documentBean", documentBean);
		
		}catch (Exception e) {
			
			e.printStackTrace();
						
		}
		return model;
	}

	
	// ISSUE
	
	@RequestMapping(value = "/pdf/issueListDoc/{id}", method = RequestMethod.GET)
	public ModelAndView itemIssueSlipDoc ( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView model = new ModelAndView("docs/itemIssueSlip");
		try {
		System.out.println("Issue List ids " + id);
		
		
		RestTemplate restTemplate = new RestTemplate();

	    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	    List<Integer> integersList = new ArrayList<Integer>();

		for (int i = 0; i < id.length; i++) {

			if (id[i] > 0) {

				integersList.add(id[i]);
			}
		}

		String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
    
	    
		map.add("issueIdList", listOfIds);
		
		IssueReport[] reportarray =restTemplate.postForObject(Constants.url + "/getIssueHeaderDetailReport", map,IssueReport[].class );
		
		List<IssueReport>reportsList=new ArrayList<IssueReport>(Arrays.asList(reportarray));
		
		System.out.println("Issue Report data " + reportsList.toString());

		
		model.addObject("list", reportsList);
		
		Company company = restTemplate.getForObject(Constants.url + "getCompanyDetails",
				Company.class);
		model.addObject("company", company);
		
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		 map = new LinkedMultiValueMap<String, Object>();
		 map.add("docId", 6);
		 map.add("date", sf.format(date));
		DocumentBean documentBean = restTemplate.postForObject(Constants.url + "getDocumentInfo",map,
				DocumentBean.class);
		model.addObject("documentBean", documentBean);
		
		}catch (Exception e) {
			
			e.printStackTrace();
						
		}
		return model;
	}

	
	// REJECTION MEMO
		
	@RequestMapping(value = "/pdf/rejectionMemoDoc/{id}", method = RequestMethod.GET)
	public ModelAndView rejectionMemoDoc( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("docs/rejectionMemo");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			
			  List<Integer> integersList = new ArrayList<Integer>();

				for (int i = 0; i < id.length; i++) {

					if (id[i] > 0) {

						integersList.add(id[i]);
					}
				}

				String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
		    
			    
			map.add("rejectionIdList", listOfIds);

			RestTemplate rest = new RestTemplate();
			
			RejectionReport[] item = rest.postForObject(Constants.url + "/getAllRejectionListReport", map,RejectionReport[].class);
			List<RejectionReport> itemList = new ArrayList<RejectionReport>(Arrays.asList(item));
			model.addObject("list", itemList);
			
			Company company = rest.getForObject(Constants.url + "getCompanyDetails",
					Company.class);
			model.addObject("company", company);
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			 map = new LinkedMultiValueMap<String, Object>();
			 map.add("docId", 9);
			 map.add("date", sf.format(date));
			DocumentBean documentBean = rest.postForObject(Constants.url + "getDocumentInfo",map,
					DocumentBean.class);
			model.addObject("documentBean", documentBean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	
	// Non Returnable Gate Pass
			
	@RequestMapping(value = "/pdf/nonReturnableGPDoc/{id}", method = RequestMethod.GET)
	public ModelAndView nonReturnableGPDoc( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("docs/nonReturnableGatePass");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			
			  List<Integer> integersList = new ArrayList<Integer>();

				for (int i = 0; i < id.length; i++) {

					if (id[i] > 0) {

						integersList.add(id[i]);
					}
				}

				String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
		    
			    
			map.add("gpIdList", listOfIds);

			RestTemplate rest = new RestTemplate();
			
			GatePassReport[] item = rest.postForObject(Constants.url + "/getGatepassListReport", map,GatePassReport[].class);
			List<GatePassReport> itemList = new ArrayList<GatePassReport>(Arrays.asList(item));
			model.addObject("list", itemList);
			
			Company company = rest.getForObject(Constants.url + "getCompanyDetails",
					Company.class);
			model.addObject("company", company);
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			 map = new LinkedMultiValueMap<String, Object>();
			 map.add("docId", 5);
			 map.add("date", sf.format(date));
			DocumentBean documentBean = rest.postForObject(Constants.url + "getDocumentInfo",map,
					DocumentBean.class);
			model.addObject("documentBean", documentBean);
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("name", "oneTimeItem"); 
			System.out.println("map " + map);
			SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
			 String[] oneTimeItem = settingValue.getValue().split(",");
				model.addObject("oneTimeItem", oneTimeItem);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	
	// RETURNABLE GATE PASS
	
	@RequestMapping(value = "/pdf/returnableGPDoc/{id}", method = RequestMethod.GET)
	public ModelAndView returnableGPDoc( @PathVariable int[] id, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("docs/returnableGatePass");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			
			  List<Integer> integersList = new ArrayList<Integer>();

				for (int i = 0; i < id.length; i++) {

					if (id[i] > 0) {

						integersList.add(id[i]);
					}
				}

				String listOfIds = integersList.stream().map(Object::toString).collect(Collectors.joining(","));
		    
			    
			map.add("gpIdList", listOfIds);

			RestTemplate rest = new RestTemplate();
			
			GatePassReport[] item = rest.postForObject(Constants.url + "/getGatepassListReturnableReport", map,GatePassReport[].class);
			List<GatePassReport> itemList = new ArrayList<GatePassReport>(Arrays.asList(item));
			model.addObject("list", itemList);
			
			Company company = rest.getForObject(Constants.url + "getCompanyDetails",
					Company.class);
			model.addObject("company", company);
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			 map = new LinkedMultiValueMap<String, Object>();
			 map.add("docId", 4);
			 map.add("date", sf.format(date));
			DocumentBean documentBean = rest.postForObject(Constants.url + "getDocumentInfo",map,
					DocumentBean.class);
			model.addObject("documentBean", documentBean);
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("name", "oneTimeItem"); 
			System.out.println("map " + map);
			SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
			 String[] oneTimeItem = settingValue.getValue().split(",");
			model.addObject("oneTimeItem", oneTimeItem);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	
	
	// ENQUIRY

	@RequestMapping(value = "/pdf/enquiryPdf/{enqId}", method = RequestMethod.GET)
	public ModelAndView editEnquiry(@PathVariable int enqId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("docs/enquiry");
		try {

			System.out.println("in fuc");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("enqId", enqId);

			RestTemplate rest = new RestTemplate();
			GetEnquiryHeader editEnquiry = new GetEnquiryHeader();

			editEnquiry = rest.postForObject(Constants.url + "/getEnquiryHeaderAndDetailForPdf", map, GetEnquiryHeader.class);
			addItemInEditEnquiryDetail = editEnquiry.getEnquiryDetailList();

			/*GetItem[] item = rest.getForObject(Constants.url + "/getAllItems", GetItem[].class);
			List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item));
			model.addObject("itemList", itemList);*/

			System.out.println(editEnquiry.getEnquiryDetailList());
			model.addObject("editEnquiry", editEnquiry);
			
			Company company = rest.getForObject(Constants.url + "getCompanyDetails",
					Company.class);
			model.addObject("company", company);
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			 map = new LinkedMultiValueMap<String, Object>();
			 map.add("docId", 8);
			 map.add("date", sf.format(date));
			DocumentBean documentBean = rest.postForObject(Constants.url + "getDocumentInfo",map,
					DocumentBean.class);
			model.addObject("documentBean", documentBean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	// pdf function

	private Dimension format = PD4Constants.A4;
	private boolean landscapeValue = false;
	private int topValue = 8;
	private int leftValue = 0;
	private int rightValue = 0;
	private int bottomValue = 8;
	private String unitsValue = "m";
	private String proxyHost = "";
	private int proxyPort = 0;

	private int userSpaceWidth = 850;
	private static int BUFFER_SIZE = 1024;

	@RequestMapping(value = "/pdfForReport", method = RequestMethod.GET)
	public void showPDF(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Inside PDf For Report URL ");
		String url = request.getParameter("url");
		// String url="/showEditViewIndentDetail/1";
		System.out.println("URL " + url);

		File f = new File("/report.pdf");
		//File f = new File("C:/pdf/report.pdf");
		//File f =new File("/home/lenovo/Documents/pdf/Report.pdf");
		try {
			runConverter(Constants.ReportURL + url, f, request, response);
			// runConverter("www.google.com", f,request,response);

		} catch (IOException e) {

			System.out.println("Pdf conversion exception " + e.getMessage());
		}

		// get absolute path of the application
		ServletContext context = request.getSession().getServletContext();
		String appPath = context.getRealPath("");
		String filePath = "/report.pdf";

		//String filePath ="C:/pdf/report.pdf";
		//String filePath ="/home/lenovo/Documents/pdf/Report.pdf";
		// construct the complete absolute path of the file
		String fullPath = appPath + filePath;
		File downloadFile = new File(filePath);
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			// get MIME type of the file
			String mimeType = context.getMimeType(fullPath);
			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/pdf";
			}
			System.out.println("MIME type: " + mimeType);

			String headerKey = "Content-Disposition";

			// response.addHeader("Content-Disposition", "attachment;filename=report.pdf");
			response.setContentType("application/pdf");

			OutputStream outStream;

			outStream = response.getOutputStream();

			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void runConverter(String urlstring, File output, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		if (urlstring.length() > 0) {
			if (!urlstring.startsWith("http://") && !urlstring.startsWith("file:")) {
				urlstring = "http://" + urlstring;
			}
			System.out.println("PDF URL " + urlstring);
			java.io.FileOutputStream fos = new java.io.FileOutputStream(output);

			PD4ML pd4ml = new PD4ML();

			try {

				PD4PageMark footer = new PD4PageMark();
				pd4ml.enableSmartTableBreaks(true);
				footer.setPageNumberTemplate("page $[page] of $[total]");
				footer.setTitleAlignment(PD4PageMark.LEFT_ALIGN);
				footer.setPageNumberAlignment(PD4PageMark.RIGHT_ALIGN);
				footer.setInitialPageNumber(1);
				footer.setFontSize(8);
				footer.setAreaHeight(15);

				pd4ml.setPageFooter(footer);

			} catch (Exception e) {
				System.out.println("Pdf conversion method excep " + e.getMessage());
			}
			try {
				pd4ml.setPageSize(landscapeValue ? pd4ml.changePageOrientation(format) : format);
				//pd4ml.setPageSize(new java.awt.Dimension(15*72, 11*72));
			} catch (Exception e) {
				System.out.println("Pdf conversion ethod excep " + e.getMessage());
			}

			if (unitsValue.equals("mm")) {
				pd4ml.setPageInsetsMM(new Insets(topValue, leftValue, bottomValue, rightValue));
			} else {
				pd4ml.setPageInsets(new Insets(topValue, leftValue, bottomValue, rightValue));
			}

			pd4ml.setHtmlWidth(userSpaceWidth);

			pd4ml.render(urlstring, fos);

		}
	}

}
