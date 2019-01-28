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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.Category;
import com.ats.tril.model.Company;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.GetRmRateVerificationRecord;
import com.ats.tril.model.ItemListByRateVerification;
import com.ats.tril.model.RmRateVerificationList;
import com.ats.tril.model.RmRateVerificationRecord;
import com.ats.tril.model.TaxForm;
import com.ats.tril.model.Vendor;
import com.ats.tril.model.VendorListForRateVarification;
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
public class RmRateVarificationController {
	
	List<GetItem> itemList = new ArrayList<>();
	RmRateVerificationList rmRateVerificationList = new RmRateVerificationList();
	Company companyInfo = new Company();

	public static Logger logger = LoggerFactory.getLogger(RmRateVarificationController.class);

	
	@RequestMapping(value = "/showRmRateVarificationRate", method = RequestMethod.GET)
	public ModelAndView showRmRateVarificationRate(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			RestTemplate rest = new RestTemplate();
			model = new ModelAndView("rmRateVarification/showRmRateVarificationRate");
			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);
			 
			Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
			model.addObject("categoryList", categoryList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/submitRmRateVerification", method = RequestMethod.POST)
	public String submitRmRateVerification(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		String ret = new String();
		try {
				int itemId = Integer.parseInt(request.getParameter("rm_id"));
				int suppId = Integer.parseInt(request.getParameter("supp_id"));
				String date = request.getParameter("curr_rate_date");
				float currRateTaxExtra = Float.parseFloat(request.getParameter("curr_rate_tax_extra"));
				float currRateTaxIncl = Float.parseFloat(request.getParameter("curr_rate_tax_incl"));
				int groupId = Integer.parseInt(request.getParameter("groupId"));
				int taxId = Integer.parseInt(request.getParameter("tax_id"));
				int isItem = Integer.parseInt(request.getParameter("isItem"));
				
				if(isItem==1) {
					ret="redirect:/showRmRateVarificationRate";
				}
				else {
					ret="redirect:/showRmRateVarificationRateByVendor";
				}
				
				rmRateVerificationList.setDate2(DateConvertor.convertToYMD(rmRateVerificationList.getDate1()));
				rmRateVerificationList.setRate2TaxExtra(rmRateVerificationList.getRate1TaxExtra());
				rmRateVerificationList.setRate2TaxIncl(rmRateVerificationList.getRate1TaxIncl());
				
				rmRateVerificationList.setDate1(DateConvertor.convertToYMD(rmRateVerificationList.getRateDate()));
				rmRateVerificationList.setRate1TaxExtra(rmRateVerificationList.getRateTaxExtra());
				rmRateVerificationList.setRate1TaxIncl(rmRateVerificationList.getRateTaxIncl());
				
				rmRateVerificationList.setRateDate(DateConvertor.convertToYMD(date));
				rmRateVerificationList.setRateTaxExtra(currRateTaxExtra);
				rmRateVerificationList.setRateTaxIncl(currRateTaxIncl);
				rmRateVerificationList.setGrpId(groupId);
				
				rmRateVerificationList.setSuppId(suppId);
				rmRateVerificationList.setRmId(itemId);
				rmRateVerificationList.setTaxId(taxId);
				
				RmRateVerificationList res = rest.postForObject(Constants.url + "/saveRmRateVarification",rmRateVerificationList, RmRateVerificationList.class);
				 
				logger.info("res " + res);
				
				if(res!=null) {
					RmRateVerificationRecord rmRateVerificationRecord = new RmRateVerificationRecord();
					
					rmRateVerificationRecord.setRateDate(DateConvertor.convertToYMD(date));
					rmRateVerificationRecord.setRateTaxExtra(currRateTaxExtra);
					rmRateVerificationRecord.setRateTaxIncl(currRateTaxIncl);
					rmRateVerificationRecord.setSuppId(suppId);
					rmRateVerificationRecord.setRmId(itemId);
					
					RmRateVerificationRecord resp = rest.postForObject(Constants.url + "/saveRateVarificationRecord",rmRateVerificationRecord, RmRateVerificationRecord.class);
					
					logger.info("resp " + resp);
					
				}
	 
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ret;
	}
	
	@RequestMapping(value = "/itemLIstByCatIdForItemVarification", method = RequestMethod.GET)
	public @ResponseBody List<GetItem>  itemLIstByCatIdForItemVarification(HttpServletRequest request, HttpServletResponse response) {

		 itemList = new ArrayList<>();
		try {
			
			int catId = Integer.parseInt(request.getParameter("catId"));
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			RestTemplate rest = new RestTemplate();
			map.add("catId", catId);
			GetItem[] getItem = rest.postForObject(Constants.url + "/itemListByCatId",map, GetItem[].class);
			itemList = new ArrayList<GetItem>(Arrays.asList(getItem));
 
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemList;
	}
	
	 @RequestMapping(value = "/getUomTax", method = RequestMethod.GET)
	public @ResponseBody TaxForm getUomTax(HttpServletRequest request, HttpServletResponse response) {

		 
		 TaxForm taxForm = new TaxForm();
		 try {
			 
			 int rmId = Integer.parseInt(request.getParameter("rmId"));
			 GetItem taxId = new GetItem();
			 
		 for(int i = 0 ; i<itemList.size() ; i++ ) {
			 if(itemList.get(i).getItemId()==rmId) {
				 
				 taxId=itemList.get(i);
				 break;
			 }
		 }
		  
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		RestTemplate rest = new RestTemplate();
		map.add("taxId", taxId.getItemIsCapital());
		taxForm = rest.postForObject(Constants.url + "/getTaxFormByTaxId", map, TaxForm.class);
  
		taxForm.setTaxDesc(taxId.getItemUom());
		taxForm.setCreatedIn(taxId.getGrpId());
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		return taxForm;
	}
	 
	 @RequestMapping(value = "/getVederListByItemId", method = RequestMethod.GET)
		public @ResponseBody List<VendorListForRateVarification> getVederListByItemId(HttpServletRequest request, HttpServletResponse response) {

			 
		 List<VendorListForRateVarification> vendorListByItemId = new ArrayList<>();
			 try {
				 
				 int rmId = Integer.parseInt(request.getParameter("rmId"));
				   
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate rest = new RestTemplate();
			map.add("itemId", rmId);
			VendorListForRateVarification[] vendor = rest.postForObject(Constants.url + "/getVendorListByItemIdForRateVerification", map, VendorListForRateVarification[].class);
			vendorListByItemId = new ArrayList<VendorListForRateVarification>(Arrays.asList(vendor));
			
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
			return vendorListByItemId;
		}
	 
	 @RequestMapping(value = "/getRmRateVerification", method = RequestMethod.GET)
		public @ResponseBody RmRateVerificationList getRmRateVerification(HttpServletRequest request, HttpServletResponse response) {

			 
		  rmRateVerificationList = new RmRateVerificationList();
			 try {
				 
				 int rmId = Integer.parseInt(request.getParameter("rm_id"));
				 int suppId = Integer.parseInt(request.getParameter("supp_id")); 
				 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate rest = new RestTemplate();
			map.add("itemId", rmId);
			map.add("vendId", suppId);
			
			 rmRateVerificationList = rest.postForObject(Constants.url + "/rmVarificationListByItemIdAndVendId", map, RmRateVerificationList.class);
			 
			 System.out.println(rmRateVerificationList);
			 }catch(Exception e) {
				 e.printStackTrace();
				 rmRateVerificationList = new RmRateVerificationList();
			 }
			return rmRateVerificationList;
		}
	 
	 @RequestMapping(value = "/showRmRateVarificationRecordList", method = RequestMethod.GET)
		public ModelAndView showRmRateVarificationRecordList(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = null;
			try {
				RestTemplate rest = new RestTemplate();
				model = new ModelAndView("rmRateVarification/showRmRateVarificationRecord");
				Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
				List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

				model.addObject("vendorList", vendorList);
				 
				GetItem[] item = rest.getForObject(Constants.url + "/getAllItems",  GetItem[].class); 
				List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item));
				model.addObject("itemList", itemList);
				
				if(request.getParameter("fromDate")!=null && request.getParameter("toDate")!=null) {
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
					String fromDate = request.getParameter("fromDate");
					String toDate = request.getParameter("toDate");
					int itemId = Integer.parseInt(request.getParameter("itemId"));
					int vendId = Integer.parseInt(request.getParameter("vendId"));
					
					map.add("fromDate", DateConvertor.convertToYMD(fromDate));
					map.add("toDate", DateConvertor.convertToYMD(toDate));
					map.add("itemId", itemId);
					map.add("vendId", vendId);
					
					GetRmRateVerificationRecord[] getRmRateVerificationRecord = rest.postForObject(Constants.url + "/getRateVerificationRecordListDateWise",map,  GetRmRateVerificationRecord[].class); 
					List<GetRmRateVerificationRecord> getRmRateVerificationRecordList = new ArrayList<GetRmRateVerificationRecord>(Arrays.asList(getRmRateVerificationRecord));
					model.addObject("getRmRateVerificationRecordList", getRmRateVerificationRecordList);
					
					model.addObject("fromDate", fromDate);
					model.addObject("toDate", toDate);
					model.addObject("itemId", itemId);
					model.addObject("vendId", vendId);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return model;
		}
	 
	 @RequestMapping(value = "/showRmRateVarificationRateByVendor", method = RequestMethod.GET)
		public ModelAndView showRmRateVarificationRateByVendor(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = null;
			try {
				RestTemplate rest = new RestTemplate();
				model = new ModelAndView("rmRateVarification/showRmRateVarificationRateByVendor");
				Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
				List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

				model.addObject("vendorList", vendorList);
				 
				Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
				List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
				model.addObject("categoryList", categoryList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return model;
		}
	 
	 @RequestMapping(value = "/getItemListByVendId", method = RequestMethod.GET)
		public @ResponseBody List<ItemListByRateVerification> getItemListByVendId(HttpServletRequest request, HttpServletResponse response) {

			 
		 List<ItemListByRateVerification> ItemListByVendId = new ArrayList<>();
			 try {
				 
				 int suppId = Integer.parseInt(request.getParameter("suppId"));
				   
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate rest = new RestTemplate();
			map.add("vendId", suppId);
			ItemListByRateVerification[] vendor = rest.postForObject(Constants.url + "/getItemListByVendId", map, ItemListByRateVerification[].class);
			ItemListByVendId = new ArrayList<ItemListByRateVerification>(Arrays.asList(vendor));
			
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
			return ItemListByVendId;
		}
	 
	 List<GetRmRateVerificationRecord> getRmRateVerificationRecordListForPdf =  new ArrayList<GetRmRateVerificationRecord>();
	 
	 @RequestMapping(value = "/getItemRateListByCatId", method = RequestMethod.GET)
		public ModelAndView getItemRateListByCatId(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = null;
			try {
				RestTemplate rest = new RestTemplate();
				model = new ModelAndView("rmRateVarification/getItemRateListByCatId");
			 
				Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
				List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
				model.addObject("categoryList", categoryList);
				
				if(request.getParameter("catId")!=null) {
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
					 
					int catId = Integer.parseInt(request.getParameter("catId")); 
					 
					map.add("catId", catId); 
					
					GetRmRateVerificationRecord[] getRmRateVerificationRecord = rest.postForObject(Constants.url + "/getItemRateListByCatId",map,  GetRmRateVerificationRecord[].class); 
					List<GetRmRateVerificationRecord> getRmRateVerificationRecordList = new ArrayList<GetRmRateVerificationRecord>(Arrays.asList(getRmRateVerificationRecord));
					model.addObject("getRmRateVerificationRecordList", getRmRateVerificationRecordList);
					model.addObject("catId", catId);
					getRmRateVerificationRecordListForPdf=getRmRateVerificationRecordList;
				}
				else {
					getRmRateVerificationRecordListForPdf =  new ArrayList<GetRmRateVerificationRecord>();
				}
				
				companyInfo = rest.getForObject(Constants.url + "getCompanyDetails",
						Company.class);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return model;
		}
	 
	 @RequestMapping(value = "/itemRateListByCatIdPdf/{catDesc}", method = RequestMethod.GET)
		public void materialShortRecievedReportPdf(@PathVariable String catDesc, HttpServletRequest request, HttpServletResponse response)
				throws FileNotFoundException {
			BufferedOutputStream outStream = null;
			try {
			Document document = new Document(PageSize.A4);
			DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
			String reportDate = DF.format(new Date());
	        document.addHeader("Date: ", reportDate);
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Calendar cal = Calendar.getInstance();

			System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
			String timeStamp = dateFormat.format(cal.getTime());
			String FILE_PATH = Constants.REPORT_SAVE;
			File file = new File(FILE_PATH);

			PdfWriter writer = null;

			FileOutputStream out = new FileOutputStream(FILE_PATH);
			try {
				writer = PdfWriter.getInstance(document, out);
			} catch (DocumentException e) {

				e.printStackTrace();
			}
		
			PdfPTable table = new PdfPTable(6);
			try {
				System.out.println("Inside PDF Table try");
				table.setWidthPercentage(100);
				table.setWidths(new float[] {0.6f, 2.5f,3.0f, 1.5f, 2.0f, 2.0f });
				Font headFont = new Font(FontFamily.TIMES_ROMAN, 9, Font.NORMAL, BaseColor.BLACK);
				Font headFont1 = new Font(FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.WHITE);
				Font f = new Font(FontFamily.TIMES_ROMAN, 11.0f, Font.UNDERLINE, BaseColor.BLUE);
				Font f1 = new Font(FontFamily.TIMES_ROMAN, 9.0f, Font.BOLD, BaseColor.DARK_GRAY);

				PdfPCell hcell = new PdfPCell();
				
				hcell.setPadding(4);
				hcell = new PdfPCell(new Phrase("SR", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);
				table.addCell(hcell);

				hcell = new PdfPCell(new Phrase("Item Name ", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);
				table.addCell(hcell);
				  
				hcell = new PdfPCell(new Phrase("Vendor Name", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);
				table.addCell(hcell);
				  
				hcell = new PdfPCell(new Phrase("Date", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);
				table.addCell(hcell);
				
				hcell = new PdfPCell(new Phrase("Rate Incl", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);
				table.addCell(hcell);
				
				hcell = new PdfPCell(new Phrase("Rate Extra", headFont1));
				hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				hcell.setBackgroundColor(BaseColor.PINK);
				table.addCell(hcell); 
				  
				int index = 0;
				if(!getRmRateVerificationRecordListForPdf.isEmpty()) {
						for (int k = 0; k < getRmRateVerificationRecordListForPdf.size(); k++) {
	                              
								index++; 
								PdfPCell cell;
								
								cell = new PdfPCell(new Phrase(""+index, headFont));
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setPadding(3);
								table.addCell(cell);

							
								cell = new PdfPCell(new Phrase(getRmRateVerificationRecordListForPdf.get(k).getItemDesc(), headFont));
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setPaddingRight(2);
								cell.setPadding(3);
								table.addCell(cell);
							 
								cell = new PdfPCell(new Phrase(""+getRmRateVerificationRecordListForPdf.get(k).getVendorName(), headFont));
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setPaddingRight(2);
								cell.setPadding(3);
								table.addCell(cell);
								 
								cell = new PdfPCell(new Phrase(""+getRmRateVerificationRecordListForPdf.get(k).getRateDate(), headFont));
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setPaddingRight(2);
								cell.setPadding(3);
								table.addCell(cell);
								
								cell = new PdfPCell(new Phrase(""+getRmRateVerificationRecordListForPdf.get(k).getRateTaxIncl(), headFont));
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
								cell.setPaddingRight(2);
								cell.setPadding(3);
								table.addCell(cell);
								
								cell = new PdfPCell(new Phrase(""+getRmRateVerificationRecordListForPdf.get(k).getRateTaxExtra(), headFont));
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
								cell.setPaddingRight(2);
								cell.setPadding(3);
								table.addCell(cell);
								 
								 
							 
						}
				}
				
				document.open();
				Paragraph company = new Paragraph(companyInfo.getCompanyName()+"\n", f);
				company.setAlignment(Element.ALIGN_CENTER);
				document.add(company);
				
					Paragraph heading1 = new Paragraph(
							companyInfo.getOfficeAdd(),f1);
					heading1.setAlignment(Element.ALIGN_CENTER);
					document.add(heading1);
					Paragraph ex2=new Paragraph("\n");
					document.add(ex2);

					Paragraph headingDate=new Paragraph(catDesc+" Rate List",f1);
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
	 
}
