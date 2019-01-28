package com.ats.tril.controller;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.ats.tril.model.DeliveryTerms;
import com.ats.tril.model.DispatchMode;
import com.ats.tril.model.EnquiryDetail;
import com.ats.tril.model.ErrorMessage;
import com.ats.tril.model.FinancialYears;
import com.ats.tril.model.GetEnquiryHeader;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.GetPODetail;
import com.ats.tril.model.GetPoDetailList;
import com.ats.tril.model.GetPoHeaderList;
import com.ats.tril.model.ImportExcelForPo;
import com.ats.tril.model.IssueDetail;
import com.ats.tril.model.IssueHeader;
import com.ats.tril.model.PaymentTerms;
import com.ats.tril.model.PoDetail;
import com.ats.tril.model.RmRateVerificationList;
import com.ats.tril.model.SettingValue;
import com.ats.tril.model.TaxForm;
import com.ats.tril.model.Type;
import com.ats.tril.model.Vendor;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.doc.SubDocument;
import com.ats.tril.model.getqueryitems.GetPoQueryItem;
import com.ats.tril.model.indent.GetIndentByStatus;
import com.ats.tril.model.indent.GetIntendDetail;
import com.ats.tril.model.indent.IndentTrans;
import com.ats.tril.model.mrn.MrnDetail;
import com.ats.tril.model.mrn.MrnHeader;
import com.ats.tril.model.po.PoHeader;

@Controller
@Scope("session")
public class PurchaseOrderController {

	RestTemplate rest = new RestTemplate();
	List<GetIntendDetail> intendDetailList = new ArrayList<>();
	PoHeader PoHeader = new PoHeader();
	List<GetIntendDetail> getIntendDetailforJsp = new ArrayList<>();
	int isState;
	DecimalFormat df = new DecimalFormat("#.000");
	
	@RequestMapping(value = "/addPurchaseOrder", method = RequestMethod.GET)
	public ModelAndView addPurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/addPurchaseOrder");
		try {
			PoHeader = new PoHeader();
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");

			model.addObject("date", sf.format(date));

			/*Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			model.addObject("vendorList", vendorList);*/

			DispatchMode[] dispatchMode = rest.getForObject(Constants.url + "/getAllDispatchModesByIsUsed",
					DispatchMode[].class);
			List<DispatchMode> dispatchModeList = new ArrayList<DispatchMode>(Arrays.asList(dispatchMode));

			model.addObject("dispatchModeList", dispatchModeList);

			PaymentTerms[] paymentTermsLists = rest.getForObject(Constants.url + "/getAllPaymentTermsByIsUsed",
					PaymentTerms[].class);
			model.addObject("paymentTermsList", paymentTermsLists);

			DeliveryTerms[] deliveryTerms = rest.getForObject(Constants.url + "/getAllDeliveryTermsByIsUsed",
					DeliveryTerms[].class);
			List<DeliveryTerms> deliveryTermsList = new ArrayList<DeliveryTerms>(Arrays.asList(deliveryTerms));

			model.addObject("deliveryTermsList", deliveryTermsList);

			TaxForm[] taxFormList = rest.getForObject(Constants.url + "/getAllTaxForms", TaxForm[].class);
			model.addObject("taxFormList", taxFormList);
 
			model.addObject("quotationTemp", "-");
			model.addObject("remarkTemp", "-");
			model.addObject("quotationDateTemp", sf.format(date));
			model.addObject("isFromDashBoard", 0);
			model.addObject("orderValidityTemp", 1);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/getVendorListByIndentId", method = RequestMethod.GET)
	@ResponseBody
	public List<Vendor> getVendorListByIndentId(HttpServletRequest request, HttpServletResponse response) {

		List<Vendor> vendorList = new ArrayList<Vendor>();
		
		try {

			int indId = Integer.parseInt(request.getParameter("indId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>(); 
			map.add("indId", indId);
			Vendor[] vendorRes = rest.postForObject(Constants.url + "/getVendorByIndendId",map, Vendor[].class);
			 vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
		  
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vendorList;
	}
	
	@RequestMapping(value = "/addPurchaseOrderFromDashboard/{indMId}/{poType}", method = RequestMethod.GET)
	public ModelAndView addPurchaseOrderFromDashboard(@PathVariable int indMId, @PathVariable int poType, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/addPurchaseOrder");
		try {
			PoHeader = new PoHeader();
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");

			model.addObject("date", sf.format(date));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>(); 
			map.add("indId", indMId);
			Vendor[] vendorRes = rest.postForObject(Constants.url + "/getVendorByIndendId",map, Vendor[].class); 
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			model.addObject("vendorList", vendorList);

			DispatchMode[] dispatchMode = rest.getForObject(Constants.url + "/getAllDispatchModesByIsUsed",
					DispatchMode[].class);
			List<DispatchMode> dispatchModeList = new ArrayList<DispatchMode>(Arrays.asList(dispatchMode));

			model.addObject("dispatchModeList", dispatchModeList);

			PaymentTerms[] paymentTermsLists = rest.getForObject(Constants.url + "/getAllPaymentTermsByIsUsed",
					PaymentTerms[].class);
			model.addObject("paymentTermsList", paymentTermsLists);

			DeliveryTerms[] deliveryTerms = rest.getForObject(Constants.url + "/getAllDeliveryTermsByIsUsed",
					DeliveryTerms[].class);
			List<DeliveryTerms> deliveryTermsList = new ArrayList<DeliveryTerms>(Arrays.asList(deliveryTerms));

			model.addObject("deliveryTermsList", deliveryTermsList);

			TaxForm[] taxFormList = rest.getForObject(Constants.url + "/getAllTaxForms", TaxForm[].class);
			model.addObject("taxFormList", taxFormList);
 
			model.addObject("quotationTemp", "-");
			model.addObject("quotationDateTemp", sf.format(date)); 
			model.addObject("poTypeTemp", poType);
			model.addObject("indId", indMId);
			model.addObject("isFromDashBoard", 1);
			
			map = new LinkedMultiValueMap<>();
			map.add("status", "0,1");
			map.add("poType", poType);
			GetIndentByStatus[] inted = rest.postForObject(Constants.url + "/getIntendsByStatus", map,
					GetIndentByStatus[].class);
			List<GetIndentByStatus> intedList = new ArrayList<GetIndentByStatus>(Arrays.asList(inted));
			 
			model.addObject("intedList", intedList);
			
			String code = getInvoiceNo(1,2,sf.format(date),poType);
			model.addObject("code", code);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	
	@RequestMapping(value = "/addPurchaseOrderforGeneralPurchase", method = RequestMethod.GET)
	public ModelAndView addPurchaseOrderforGeneralPurchase( HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/addPurchaseOrder");
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("name", "autoMrn"); 
			System.out.println("map " + map);
			SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
			
			/*int flag=0;
			 String[] types = settingValue.getValue().split(",");
			 
			 for(int i = 0 ; i<types.length ; i++) {
				 
				 if(6==Integer.parseInt(types[i])) {
					  flag=1;
					  break;
				 }
			 }*/
			 
			   int poType=0;
				/* if(6==Integer.parseInt(settingValue.getValue())) {*/
					 
					 poType=Integer.parseInt(settingValue.getValue());
					 
			PoHeader = new PoHeader();
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");

			model.addObject("date", sf.format(date));

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			model.addObject("vendorList", vendorList);

			DispatchMode[] dispatchMode = rest.getForObject(Constants.url + "/getAllDispatchModesByIsUsed",
					DispatchMode[].class);
			List<DispatchMode> dispatchModeList = new ArrayList<DispatchMode>(Arrays.asList(dispatchMode));

			model.addObject("dispatchModeList", dispatchModeList);

			PaymentTerms[] paymentTermsLists = rest.getForObject(Constants.url + "/getAllPaymentTermsByIsUsed",
					PaymentTerms[].class);
			model.addObject("paymentTermsList", paymentTermsLists);

			DeliveryTerms[] deliveryTerms = rest.getForObject(Constants.url + "/getAllDeliveryTermsByIsUsed",
					DeliveryTerms[].class);
			List<DeliveryTerms> deliveryTermsList = new ArrayList<DeliveryTerms>(Arrays.asList(deliveryTerms));

			model.addObject("deliveryTermsList", deliveryTermsList);

			TaxForm[] taxFormList = rest.getForObject(Constants.url + "/getAllTaxForms", TaxForm[].class);
			model.addObject("taxFormList", taxFormList);
 
			model.addObject("quotationTemp", "-");
			model.addObject("quotationDateTemp", sf.format(date)); 
			model.addObject("poTypeTemp", poType); 
			model.addObject("isGeneralPurchase", 1); 
			map = new LinkedMultiValueMap<>();
			map.add("status", "0,1");
			map.add("poType", poType);
			GetIndentByStatus[] inted = rest.postForObject(Constants.url + "/getIntendsByStatus", map,
					GetIndentByStatus[].class);
			List<GetIndentByStatus> intedList = new ArrayList<GetIndentByStatus>(Arrays.asList(inted));
			 
			model.addObject("intedList", intedList);
			
			String code = getInvoiceNo(1,2,sf.format(date),poType);
			model.addObject("code", code);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);
				// }

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	public String getInvoiceNo(int catId,int docId,String date,int poType) {
        
		String invNo="";
		DocumentBean docBean=null;
		try {
			 
			if(date=="") {
						Date currDate = new Date();
						date= new SimpleDateFormat("yyyy-MM-dd").format(currDate);
						}
						
						MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
						map.add("docId",docId);
						map.add("catId", catId);
						map.add("date", DateConvertor.convertToYMD(date));
						map.add("typeId", poType);
			RestTemplate restTemplate = new RestTemplate();

			docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
			System.err.println("Doc"+docBean.toString());
			String indMNo=docBean.getSubDocument().getCategoryPrefix()+"";
			int counter=docBean.getSubDocument().getCounter();
			int counterLenth = String.valueOf(counter).length();
			counterLenth = 4 - counterLenth;
			StringBuilder code = new StringBuilder(indMNo);

			for (int i = 0; i < counterLenth; i++) {
				String j = "0";
				code.append(j);
			}
			code.append(String.valueOf(counter));
			invNo=""+code;
			docBean.setCode(invNo);
			System.err.println("invNo"+invNo);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return docBean.getCode();
	}
	
	@RequestMapping(value = "/getIntendListByPoType", method = RequestMethod.GET)
	@ResponseBody
	public List<GetIndentByStatus> getIntendListByPoType(HttpServletRequest request, HttpServletResponse response) {

		List<GetIndentByStatus> intedList = new ArrayList<GetIndentByStatus>();
		
		try {

			int poType = Integer.parseInt(request.getParameter("poType"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("status", "0,1");
			map.add("poType", poType);
			GetIndentByStatus[] inted = rest.postForObject(Constants.url + "/getIntendsByStatus", map,
					GetIndentByStatus[].class);
			 intedList = new ArrayList<GetIndentByStatus>(Arrays.asList(inted));
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return intedList;
	}
	
	@RequestMapping(value = "/getPreviousRecordOfPoItem", method = RequestMethod.GET)
	@ResponseBody
	public List<GetPoQueryItem> getPreviousRecordOfPoItem(HttpServletRequest request, HttpServletResponse response) {

		List<GetPoQueryItem> list = new ArrayList<GetPoQueryItem>();
		try {

			int itemId = Integer.parseInt(request.getParameter("itemId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("itemId", itemId);
			GetPoQueryItem[] getPoQueryItem = rest.postForObject(Constants.url + "/getPreviousRecordOfPoItem", map,
					GetPoQueryItem[].class);
			list = new ArrayList<GetPoQueryItem>(Arrays.asList(getPoQueryItem));
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@RequestMapping(value = "/geIntendDetailByIndId", method = RequestMethod.GET)
	@ResponseBody
	public List<GetIntendDetail> geIntendDetailByIndId(HttpServletRequest request, HttpServletResponse response) {

		try {

			int indIdForGetList = Integer.parseInt(request.getParameter("indId"));
			int vendId = Integer.parseInt(request.getParameter("vendId"));
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("indId", indIdForGetList);
			GetIntendDetail[] indentTrans = rest.postForObject(Constants.url + "/getIntendsDetailByIntendId", map,
					GetIntendDetail[].class);
			List<GetIntendDetail> intendDetailList1 = new ArrayList<GetIntendDetail>(Arrays.asList(indentTrans));
			
			intendDetailList = new ArrayList<GetIntendDetail>();
			
			 map = new LinkedMultiValueMap<String, Object>();
			map.add("vendId", vendId);
			RmRateVerificationList[] rmRateVerification = rest.postForObject(Constants.url + "/rmVarificationListByVendId", map,
					RmRateVerificationList[].class);
			List<RmRateVerificationList> rmRateVerificationList = new ArrayList<RmRateVerificationList>(Arrays.asList(rmRateVerification));
			
			//show Only those Item which supplier Give
			
			for(int i = 0 ;i<rmRateVerificationList.size() ; i++)
			{ 
					for(int j = 0 ;j<intendDetailList1.size() ; j++)
					{ 
						 
						if(intendDetailList1.get(j).getItemId()==rmRateVerificationList.get(i).getRmId())
						{ 
							intendDetailList1.get(j).setRate(rmRateVerificationList.get(i).getRateTaxExtra()); 
							intendDetailList1.get(j).setTaxPer(rmRateVerificationList.get(i).getRate1TaxExtra());
							intendDetailList1.get(j).setStateCode(rmRateVerificationList.get(i).getDate1());
							intendDetailList.add(intendDetailList1.get(j)); 
							
							//System.out.println("intendDetailList1 " + intendDetailList1.size() + " intendDetailList " + intendDetailList.size());
						}
					} 
			}
			
			
			
			
			if(indIdForGetList==PoHeader.getIndId())
			{
				for(int i = 0 ;i<PoHeader.getPoDetailList().size() ; i++)
				{
					for(int j = 0 ;j<intendDetailList.size() ; j++)
					{
						if(intendDetailList.get(j).getIndDId()==PoHeader.getPoDetailList().get(i).getIndId())
						{
							intendDetailList.get(j).setPoQty(PoHeader.getPoDetailList().get(i).getItemQty());
							intendDetailList.get(j).setRate(PoHeader.getPoDetailList().get(i).getItemRate());
							intendDetailList.get(j).setDisc(PoHeader.getPoDetailList().get(i).getDiscPer()); 
							break;
						}
					}
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return intendDetailList;
	}

	@RequestMapping(value = "/submitList", method = RequestMethod.POST)
	public ModelAndView submitEditEnquiry(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/addPurchaseOrder");

		try {
			PoHeader = new PoHeader();
			List<PoDetail> poDetailList = new ArrayList<>();

			getIntendDetailforJsp = new ArrayList<>();

			int indId = Integer.parseInt(request.getParameter("indMId"));
			String[] checkbox = request.getParameterValues("select_to_approve");

			try {
				int vendIdTemp = Integer.parseInt(request.getParameter("vendIdTemp"));
				model.addObject("vendIdTemp", vendIdTemp);
				PoHeader.setVendId(vendIdTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String quotationTemp = request.getParameter("quotationTemp");
				model.addObject("quotationTemp", quotationTemp);
			} catch (Exception e) {
				// TODO: handle exception
			} 
			try {
				int payIdTemp = Integer.parseInt(request.getParameter("payIdTemp"));
				model.addObject("payIdTemp", payIdTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				int deliveryIdTemp = Integer.parseInt(request.getParameter("deliveryIdTemp"));
				model.addObject("deliveryIdTemp", deliveryIdTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				int dispatchModeTemp = Integer.parseInt(request.getParameter("dispatchModeTemp"));
				model.addObject("dispatchModeTemp", dispatchModeTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String quotationDateTemp = request.getParameter("quotationDateTemp");
				model.addObject("quotationDateTemp", quotationDateTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String poDateTemp = request.getParameter("poDateTemp");
				model.addObject("date", poDateTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String remarkTemp = request.getParameter("remarkTemp");
				model.addObject("remarkTemp", remarkTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String poNoTemp = request.getParameter("poNoTemp");
				model.addObject("code", poNoTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String isFromDashBoard = request.getParameter("isFromDashBoard");
				model.addObject("isFromDashBoard", isFromDashBoard);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String isGeneralPurchase = request.getParameter("isGeneralPurchase");
				model.addObject("isGeneralPurchase", isGeneralPurchase);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String orderValidityTemp = request.getParameter("orderValidityTemp");
				model.addObject("orderValidityTemp", orderValidityTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			int poTypeTemp = Integer.parseInt(request.getParameter("poTypeTemp"));
			model.addObject("poTypeTemp", poTypeTemp);

			float poBasicValue = 0;
			float discValue = 0;
			float taxValue = 0;
			isState=0;
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>(); 
			map.add("indId", indId);
			Vendor[] vendorRes = rest.postForObject(Constants.url + "/getVendorByIndendId",map, Vendor[].class); 
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			model.addObject("vendorList", vendorList);

			DispatchMode[] dispatchMode = rest.getForObject(Constants.url + "/getAllDispatchModesByIsUsed",
					DispatchMode[].class);
			List<DispatchMode> dispatchModeList = new ArrayList<DispatchMode>(Arrays.asList(dispatchMode));

			model.addObject("dispatchModeList", dispatchModeList);

			PaymentTerms[] paymentTermsLists = rest.getForObject(Constants.url + "/getAllPaymentTermsByIsUsed",
					PaymentTerms[].class);
			model.addObject("paymentTermsList", paymentTermsLists);

			DeliveryTerms[] deliveryTerms = rest.getForObject(Constants.url + "/getAllDeliveryTermsByIsUsed",
					DeliveryTerms[].class);
			List<DeliveryTerms> deliveryTermsList = new ArrayList<DeliveryTerms>(Arrays.asList(deliveryTerms));

			model.addObject("deliveryTermsList", deliveryTermsList);

			 map = new LinkedMultiValueMap<>();
			map.add("status", "0,1");
			map.add("poType", poTypeTemp);
			GetIndentByStatus[] inted = rest.postForObject(Constants.url + "/getIntendsByStatus", map,
					GetIndentByStatus[].class);
			List<GetIndentByStatus> intedList = new ArrayList<GetIndentByStatus>(Arrays.asList(inted));
			model.addObject("intedList", intedList);

			TaxForm[] taxFormList = rest.getForObject(Constants.url + "/getAllTaxForms", TaxForm[].class);
			model.addObject("taxFormList", taxFormList);
			
			try {
			map = new LinkedMultiValueMap<String, Object>();
			map.add("name", "sameState"); 
			System.out.println("map " + map);
			SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
			
			if(intendDetailList.get(0).getStateCode().equals(settingValue.getValue())) {
				
				isState=1;
			}
				
			}catch(Exception e) {
				
			e.printStackTrace();	
			}
			
			
			
			
			Calendar c = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (int i = 0; i < intendDetailList.size(); i++) {
				for (int j = 0; j < checkbox.length; j++) {
					//System.out.println(checkbox[j] + intendDetailList.get(i).getIndDId());
					if (Integer.parseInt(checkbox[j]) == intendDetailList.get(i).getIndDId()) {
						PoDetail poDetail = new PoDetail();
						poDetail.setIndId(intendDetailList.get(i).getIndDId());
						poDetail.setSchDays(intendDetailList.get(i).getIndItemSchd());
						poDetail.setItemCode(intendDetailList.get(i).getItemCode());
						poDetail.setItemId(intendDetailList.get(i).getItemId());
						poDetail.setIndedQty(intendDetailList.get(i).getIndQty());
						poDetail.setItemUom(intendDetailList.get(i).getIndItemUom());
						poDetail.setStatus(9);
						poDetail.setItemQty(
								Float.parseFloat(request.getParameter("poQty" + intendDetailList.get(i).getIndDId())));
						poDetail.setPendingQty(
								Float.parseFloat(request.getParameter("poQty" + intendDetailList.get(i).getIndDId())));
						poDetail.setDiscPer(
								Integer.parseInt(request.getParameter("disc" + intendDetailList.get(i).getIndDId())));
						poDetail.setItemRate(
								Float.parseFloat(request.getParameter("rate" + intendDetailList.get(i).getIndDId())));
						poDetail.setSchRemark(request.getParameter("indRemark" + intendDetailList.get(i).getIndDId()));
						poDetail.setSchDays(Integer
								.parseInt(request.getParameter("indItemSchd" + intendDetailList.get(i).getIndDId())));
						poDetail.setSchDate(intendDetailList.get(i).getIndItemSchddt());
						poDetail.setBalanceQty(Float
								.parseFloat(request.getParameter("balanceQty" + intendDetailList.get(i).getIndDId())));
						c.setTime(sdf.parse(poDetail.getSchDate()));
						c.add(Calendar.DAY_OF_MONTH, poDetail.getSchDays());
						poDetail.setSchDate(sdf.format(c.getTime()));
						poDetail.setIndId(intendDetailList.get(i).getIndDId());
						poDetail.setIndMNo(intendDetailList.get(i).getIndMNo());
						poDetail.setBasicValue(Float.parseFloat(df.format(poDetail.getItemQty() * poDetail.getItemRate())));
						poDetail.setDiscValue(Float.parseFloat(df.format((poDetail.getDiscPer() / 100) * poDetail.getBasicValue())));
						if(isState==0) {
							poDetail.setIgst(intendDetailList.get(i).getTaxPer());
							
						}else {
							poDetail.setCgst(intendDetailList.get(i).getTaxPer()/2);
							poDetail.setSgst(intendDetailList.get(i).getTaxPer()/2);
						}
						poDetail.setTaxValue(Float.parseFloat(df.format((intendDetailList.get(i).getTaxPer()/100)*(poDetail.getItemQty() * poDetail.getItemRate() - poDetail.getDiscValue()))));
						poDetail.setLandingCost(Float.parseFloat(df.format(
								poDetail.getItemQty() * poDetail.getItemRate() - poDetail.getDiscValue() + poDetail.getTaxValue())));
						poBasicValue = poBasicValue + poDetail.getBasicValue();
						discValue = discValue + poDetail.getDiscValue();
						taxValue=taxValue+poDetail.getTaxValue();
						poDetailList.add(poDetail);

						intendDetailList.get(i).setPoQty(
								Float.parseFloat(request.getParameter("poQty" + intendDetailList.get(i).getIndDId())));
						intendDetailList.get(i).setIndFyr(Float
								.parseFloat(request.getParameter("balanceQty" + intendDetailList.get(i).getIndDId())));
						intendDetailList.get(i).setDisc(
								Float.parseFloat(request.getParameter("disc" + intendDetailList.get(i).getIndDId())));
						intendDetailList.get(i).setRate(
								Float.parseFloat(request.getParameter("rate" + intendDetailList.get(i).getIndDId())));
						/*intendDetailList.get(i)
								.setIndRemark(request.getParameter("indRemark" + intendDetailList.get(i).getIndDId()));
						intendDetailList.get(i).setIndItemSchd(Integer
								.parseInt(request.getParameter("indItemSchd" + intendDetailList.get(i).getIndDId())));*/
						getIntendDetailforJsp.add(intendDetailList.get(i));
						PoHeader.setIndNo(intendDetailList.get(i).getIndMNo());
					}

				}
			}
			System.out.println(poDetailList);
			
			PoHeader.setIndId(indId);
			PoHeader.setDiscValue(Float.parseFloat(df.format(discValue)));
			PoHeader.setPoBasicValue(Float.parseFloat(df.format(poBasicValue)));
			PoHeader.setPoDetailList(poDetailList);
			PoHeader.setPoTaxValue(taxValue);
			
			model.addObject("poDetailList", poDetailList);
			model.addObject("indId", indId);
			model.addObject("poHeader", PoHeader);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/calculatePurchaseHeaderValues", method = RequestMethod.GET)
	@ResponseBody
	public PoHeader calculatePurchaseHeaderValues(HttpServletRequest request, HttpServletResponse response) {

		try {
			float total = 0;
			float taxValue = 0;
			
			float packPer = Float.parseFloat(request.getParameter("packPer"));
			float packValue = Float.parseFloat(request.getParameter("packValue"));
			float insuPer = Float.parseFloat(request.getParameter("insuPer"));
			float insuValue = Float.parseFloat(request.getParameter("insuValue"));
			float freightPer = Float.parseFloat(request.getParameter("freightPer"));
			float freightValue = Float.parseFloat(request.getParameter("freightValue"));
			float otherPer = Float.parseFloat(request.getParameter("otherPer"));
			float otherValue = Float.parseFloat(request.getParameter("otherValue"));
			/*float taxPer = Float.parseFloat(request.getParameter("taxPer"));
			int taxId = Integer.parseInt(request.getParameter("taxId"));*/

			if (packPer != 0) {
				PoHeader.setPoPackPer(packPer);
				PoHeader.setPoPackVal(Float.parseFloat(df.format((packPer / 100) * PoHeader.getPoBasicValue())));
			} else {
				PoHeader.setPoPackPer(0);
				PoHeader.setPoPackVal(packValue);
			}

			if (insuPer != 0) {
				PoHeader.setPoInsuPer(insuPer);
				PoHeader.setPoInsuVal(Float.parseFloat(df.format((insuPer / 100) * PoHeader.getPoBasicValue())));
			} else {
				PoHeader.setPoInsuPer(0);
				PoHeader.setPoInsuVal(insuValue);
			}

			if (freightPer != 0) {
				PoHeader.setPoFrtPer(freightPer);
				PoHeader.setPoFrtVal(Float.parseFloat(df.format((freightPer / 100) * PoHeader.getPoBasicValue())));
			} else {
				PoHeader.setPoFrtPer(0);
				PoHeader.setPoFrtVal(freightValue);
			}

			total = PoHeader.getPoBasicValue() + PoHeader.getPoPackVal() + PoHeader.getPoInsuVal()
					+ PoHeader.getPoFrtVal() - PoHeader.getDiscValue();
			/*PoHeader.setPoTaxId(taxId);
			PoHeader.setPoTaxPer(taxPer);
			PoHeader.setPoTaxValue((taxPer / 100) * total);*/

			if (otherPer != 0) {
				total = PoHeader.getPoBasicValue() + PoHeader.getPoPackVal() + PoHeader.getPoInsuVal()
						+ PoHeader.getPoFrtVal() - PoHeader.getDiscValue() + PoHeader.getPoTaxValue();
				PoHeader.setOtherChargeAfter(Float.parseFloat(df.format((otherPer / 100) * total)));
			} else if (otherValue != 0) {
				PoHeader.setOtherChargeAfter(otherValue);
			} else {
				PoHeader.setOtherChargeAfter(0);
			}

			for (int i = 0; i < PoHeader.getPoDetailList().size(); i++) {
				float divFactor = (PoHeader.getPoDetailList().get(i).getBasicValue() / PoHeader.getPoBasicValue()) * 100;
				PoHeader.getPoDetailList().get(i).setPackValue(Float.parseFloat(df.format(divFactor * PoHeader.getPoPackVal() / 100)));
				PoHeader.getPoDetailList().get(i).setInsu(Float.parseFloat(df.format(divFactor * PoHeader.getPoInsuVal() / 100)));
				PoHeader.getPoDetailList().get(i).setFreightValue(Float.parseFloat(df.format(divFactor * PoHeader.getPoFrtVal() / 100)));
				if(isState==0) {
					
					PoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format((PoHeader.getPoDetailList().get(i).getIgst()/ 100)*(PoHeader.getPoDetailList().get(i).getBasicValue()-
							PoHeader.getPoDetailList().get(i).getDiscValue()+PoHeader.getPoDetailList().get(i).getPackValue()+PoHeader.getPoDetailList().get(i).getInsu()+
							PoHeader.getPoDetailList().get(i).getFreightValue()))));
					
				}else {
					PoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format(((PoHeader.getPoDetailList().get(i).getCgst()+PoHeader.getPoDetailList().get(i).getSgst())/ 100)*(PoHeader.getPoDetailList().get(i).getBasicValue()-
							PoHeader.getPoDetailList().get(i).getDiscValue()+PoHeader.getPoDetailList().get(i).getPackValue()+PoHeader.getPoDetailList().get(i).getInsu()+
							PoHeader.getPoDetailList().get(i).getFreightValue()))));
				}
				
				PoHeader.getPoDetailList().get(i)
						.setOtherChargesAfter(Float.parseFloat(df.format(divFactor * PoHeader.getOtherChargeAfter() / 100)));
				PoHeader.getPoDetailList().get(i).setLandingCost(Float.parseFloat(df.format(PoHeader.getPoDetailList().get(i).getBasicValue()
						- PoHeader.getPoDetailList().get(i).getDiscValue()
						+ PoHeader.getPoDetailList().get(i).getPackValue() + PoHeader.getPoDetailList().get(i).getInsu()
						+ PoHeader.getPoDetailList().get(i).getFreightValue()
						+ PoHeader.getPoDetailList().get(i).getTaxValue()
						+ PoHeader.getPoDetailList().get(i).getOtherChargesAfter())));
				taxValue=taxValue+PoHeader.getPoDetailList().get(i).getTaxValue();
			}

			PoHeader.setPoTaxValue(Float.parseFloat(df.format(Float.parseFloat(df.format(taxValue)))));
			System.out.println(PoHeader);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return PoHeader;
	}

	@RequestMapping(value = "/submitPurchaseOrder", method = RequestMethod.POST)
	public String submitPurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		try {

			int vendId = Integer.parseInt(request.getParameter("vendId"));
			String quotation = request.getParameter("quotation");
			int poType = Integer.parseInt(request.getParameter("poType"));
			int payId = Integer.parseInt(request.getParameter("payId"));
			int deliveryId = Integer.parseInt(request.getParameter("deliveryId"));
			int dispatchMode = Integer.parseInt(request.getParameter("dispatchMode"));
			int orderValidity = Integer.parseInt(request.getParameter("orderValidity"));
			String quotationDate = request.getParameter("quotationDate");
			String poDate = request.getParameter("poDate");
			String poNo = request.getParameter("poNo");

			String packRemark = request.getParameter("packRemark");
			String insuRemark = request.getParameter("insuRemark");
			String freghtRemark = request.getParameter("freghtRemark");
			String otherRemark = request.getParameter("otherRemark");
			String poRemark = request.getParameter("poRemark");
			
			// ----------------------------Inv No---------------------------------
			DocumentBean docBean = null;
			try {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 2);
				map.add("catId", 1);
				map.add("date", DateConvertor.convertToYMD(poDate));
				map.add("typeId", poType);
				RestTemplate restTemplate = new RestTemplate();

				docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
				String indMNo = docBean.getSubDocument().getCategoryPrefix() + "";
				int counter = docBean.getSubDocument().getCounter();
				int counterLenth = String.valueOf(counter).length();
				counterLenth = 4 - counterLenth;
				StringBuilder code = new StringBuilder(indMNo + "");

				for (int i = 0; i < counterLenth; i++) {
					String j = "0";
					code.append(j);
				}
				code.append(String.valueOf(counter));

				PoHeader.setPoNo("" + code);

				docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter() + 1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ----------------------------Inv No---------------------------------
			PoHeader.setVendId(vendId);
			PoHeader.setVendQuation(quotation);
			PoHeader.setPoType(poType);
			PoHeader.setPaymentTermId(payId);
			PoHeader.setDeliveryId(deliveryId);
			PoHeader.setDispatchId(dispatchMode);
			PoHeader.setVendQuationDate(DateConvertor.convertToYMD(quotationDate));
			PoHeader.setPoDate(DateConvertor.convertToYMD(poDate));

			PoHeader.setOtherChargeAfterRemark(otherRemark);
			PoHeader.setPoFrtRemark(freghtRemark);
			PoHeader.setPoInsuRemark(insuRemark);
			PoHeader.setPoPackRemark(packRemark);
			//PoHeader.setIndId(PoHeader.getPoDetailList().get(0).getIndId());
			PoHeader.setDelStatus(1);
			PoHeader.setPoRemark(poRemark);
			PoHeader.setPoStatus(9);
			PoHeader.setApprovStatus(orderValidity);
			System.out.println(PoHeader);
			PoHeader save = rest.postForObject(Constants.url + "/savePoHeaderAndDetail", PoHeader, PoHeader.class);
			System.out.println(save);
			if (save != null) {
				try {

					SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(),
							SubDocument.class);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (save != null  && getIntendDetailforJsp.size()>0) {
				for (int i = 0; i < getIntendDetailforJsp.size(); i++) {
					getIntendDetailforJsp.get(i)
							.setIndMDate(DateConvertor.convertToYMD(getIntendDetailforJsp.get(i).getIndMDate()));
					if (getIntendDetailforJsp.get(i).getIndFyr() == 0)
						getIntendDetailforJsp.get(i).setIndDStatus(2);
					else if (getIntendDetailforJsp.get(i).getIndFyr() > 0
							&& getIntendDetailforJsp.get(i).getIndFyr() < getIntendDetailforJsp.get(i).getIndQty())
						getIntendDetailforJsp.get(i).setIndDStatus(1);
					else
						getIntendDetailforJsp.get(i).setIndDStatus(0);
				}
				ErrorMessage errorMessage = rest.postForObject(Constants.url + "/updateIndendPendingQty",
						getIntendDetailforJsp, ErrorMessage.class);
				System.out.println(errorMessage);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfPurachaseOrder";
	}

	@RequestMapping(value = "/listOfPurachaseOrder", method = RequestMethod.GET)
	public ModelAndView listOfPurachaseOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/purchaseOrderList");
		try {

			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat display = new SimpleDateFormat("dd-MM-yyyy");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			
			if (request.getParameter("fromDate") == null || request.getParameter("toDate") == null) {
				
				map.add("fromDate", sf.format(date));
				map.add("toDate", sf.format(date));
				map.add("catId",0);
				map.add("typeId",0);
				
				model.addObject("fromDate", display.format(date));
				model.addObject("toDate", display.format(date));
				model.addObject("catId",0);
				model.addObject("typeId",0);
			}
			else {
				
				String fromDate = request.getParameter("fromDate");
				String toDate = request.getParameter("toDate");
				int catId = Integer.parseInt(request.getParameter("catId"));
				int typeId = Integer.parseInt(request.getParameter("typeId"));
				
				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("catId",catId);
				map.add("typeId",typeId);
				
				model.addObject("fromDate", fromDate);
				model.addObject("toDate", toDate);
				model.addObject("catId", catId);
				model.addObject("typeId",typeId);
			}
			

			GetPoHeaderList[] list = rest.postForObject(Constants.url + "/getPoHeaderListBetweenDate", map,
					GetPoHeaderList[].class);
			List<GetPoHeaderList> poList = new ArrayList<GetPoHeaderList>(Arrays.asList(list));

			model.addObject("poList", poList);
			
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);
			
			Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
			model.addObject("categoryList", categoryList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getPoListByDate", method = RequestMethod.GET)
	@ResponseBody
	public List<GetPoHeaderList> getPoListByDate(HttpServletRequest request, HttpServletResponse response) {

		List<GetPoHeaderList> poList = new ArrayList<GetPoHeaderList>();
		try {

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			GetPoHeaderList[] list = rest.postForObject(Constants.url + "/getPoHeaderListBetweenDate", map,
					GetPoHeaderList[].class);
			poList = new ArrayList<GetPoHeaderList>(Arrays.asList(list));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return poList;
	}

	@RequestMapping(value = "/deletePurchaseOrder/{poId}", method = RequestMethod.GET)
	public String deleteEnquiry(@PathVariable int poId, HttpServletRequest request, HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("poId", poId);
			GetPoHeaderList purchaseOrder = rest.postForObject(Constants.url + "/getPoHeaderAndDetailByHeaderId", map,
					GetPoHeaderList.class);

			map = new LinkedMultiValueMap<>();
			map.add("indId", purchaseOrder.getIndId());
			GetIntendDetail[] GetIntendDetail = rest.postForObject(Constants.url + "/getIntendsDetailByIntendId", map,
					GetIntendDetail[].class);
			List<GetIntendDetail> updateIntendQty = new ArrayList<>(Arrays.asList(GetIntendDetail));

			for (int i = 0; i < updateIntendQty.size(); i++) {
				for (int j = 0; j < purchaseOrder.getPoDetailList().size(); j++) {
					if (purchaseOrder.getPoDetailList().get(j).getIndId() == updateIntendQty.get(i).getIndDId()) {
						updateIntendQty.get(i).setIndFyr(purchaseOrder.getPoDetailList().get(j).getItemQty()
								+ updateIntendQty.get(i).getIndFyr());
						break;
					}

				}
				updateIntendQty.get(i).setIndMDate(DateConvertor.convertToYMD(updateIntendQty.get(i).getIndMDate()));
				if (updateIntendQty.get(i).getIndFyr() == 0)
					updateIntendQty.get(i).setIndDStatus(2);
				else if (updateIntendQty.get(i).getIndFyr() > 0 && updateIntendQty.get(i).getIndFyr() < updateIntendQty.get(i).getIndQty())
					updateIntendQty.get(i).setIndDStatus(1);
				else
					updateIntendQty.get(i).setIndDStatus(0);

			}
			map = new LinkedMultiValueMap<>();
			map.add("poId", poId);
			
			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deletePo", map, ErrorMessage.class);
			System.out.println(errorMessage);

			if (errorMessage.isError() == false && updateIntendQty.size()>0) {
				 
				 errorMessage = rest.postForObject(Constants.url + "/updateIndendPendingQty", updateIntendQty,
							ErrorMessage.class);
					System.out.println(errorMessage);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfPurachaseOrder";
	}

	GetPoHeaderList getPoHeader = new GetPoHeaderList();
	List<GetIntendDetail> getIntendDetailListforEdit = new ArrayList<>();

	@RequestMapping(value = "/editPurchaseOrder/{poId}", method = RequestMethod.GET)
	public ModelAndView editPurchaseOrder(@PathVariable int poId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/editPurchaseOrder");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("poId", poId);
			getPoHeader = rest.postForObject(Constants.url + "/getPoHeaderAndDetailByHeaderId", map,
					GetPoHeaderList.class);
			model.addObject("getPoHeader", getPoHeader);

			map = new LinkedMultiValueMap<>();
			map.add("indId", getPoHeader.getIndId());
			GetIntendDetail[] GetIntendDetail = rest.postForObject(Constants.url + "/getIntendsDetailByIntendId", map,
					GetIntendDetail[].class);
			getIntendDetailListforEdit = new ArrayList<>(Arrays.asList(GetIntendDetail));
 
			for (int j = 0; j < getPoHeader.getPoDetailList().size(); j++) {
				for (int i = 0; i < getIntendDetailListforEdit.size(); i++) {
					if (getPoHeader.getPoDetailList().get(j).getIndId() == getIntendDetailListforEdit.get(i)
							.getIndDId()) {
						getPoHeader.getPoDetailList().get(j)
								.setBalanceQty(getIntendDetailListforEdit.get(i).getIndFyr());
						getPoHeader.getPoDetailList().get(j)
								.setSchDate(DateConvertor.convertToYMD(DateConvertor.convertToDMY(getIntendDetailListforEdit.get(i).getIndItemSchddt())));
					}
				}
			}
 
			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			model.addObject("vendorList", vendorList);

			DispatchMode[] dispatchMode = rest.getForObject(Constants.url + "/getAllDispatchModesByIsUsed",
					DispatchMode[].class);
			List<DispatchMode> dispatchModeList = new ArrayList<DispatchMode>(Arrays.asList(dispatchMode));

			model.addObject("dispatchModeList", dispatchModeList);

			PaymentTerms[] paymentTermsLists = rest.getForObject(Constants.url + "/getAllPaymentTermsByIsUsed",
					PaymentTerms[].class);
			model.addObject("paymentTermsList", paymentTermsLists);

			DeliveryTerms[] deliveryTerms = rest.getForObject(Constants.url + "/getAllDeliveryTermsByIsUsed",
					DeliveryTerms[].class);
			List<DeliveryTerms> deliveryTermsList = new ArrayList<DeliveryTerms>(Arrays.asList(deliveryTerms));

			model.addObject("deliveryTermsList", deliveryTermsList);

			TaxForm[] taxFormList = rest.getForObject(Constants.url + "/getAllTaxForms", TaxForm[].class);
			model.addObject("taxFormList", taxFormList);

			/*map = new LinkedMultiValueMap<>();
			map.add("status", "0,1");
			map.add("poType", getPoHeader.getPoType());
			GetIndentByStatus[] inted = rest.postForObject(Constants.url + "/getIntendsByStatus", map,
					GetIndentByStatus[].class);
			List<GetIndentByStatus> intedList = new ArrayList<GetIndentByStatus>(Arrays.asList(inted));
			model.addObject("intedList", intedList);*/
			 
				Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
				List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));

				model.addObject("typeList", typeList);
				
				/*map = new LinkedMultiValueMap<>();
				map.add("name", "autoMrn"); 
				System.out.println("map " + map);
				SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
				
				int flag=0;
				 String[] types = settingValue.getValue().split(",");
				 
				 for(int i = 0 ; i<types.length ; i++) {
					 
					 if(getPoHeader.getPoType()==Integer.parseInt(types[i])) {
						  flag=1;
						  break;
					 }
				 }
				 if(flag==1)
					 model.addObject("autoMrn", 1);
				 else*/  
					 model.addObject("autoMrn", 0);
						 
				
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/geIntendDetailByIndIdInEditPo", method = RequestMethod.GET)
	@ResponseBody
	public List<GetIntendDetail> geIntendDetailByIndIdInEditPo(HttpServletRequest request, HttpServletResponse response) {

		try {

			int indIdForGetList = Integer.parseInt(request.getParameter("indId"));
			int vendId = Integer.parseInt(request.getParameter("vendId"));
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("indId", indIdForGetList);
			GetIntendDetail[] indentTrans = rest.postForObject(Constants.url + "/getIntendsDetailByIntendId", map,
					GetIntendDetail[].class);
			List<GetIntendDetail> intendDetailList1 = new ArrayList<GetIntendDetail>(Arrays.asList(indentTrans));
			intendDetailList = new ArrayList<GetIntendDetail>();
			
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("vendId", vendId);
			RmRateVerificationList[] rmRateVerification = rest.postForObject(Constants.url + "/rmVarificationListByVendId", map,
						RmRateVerificationList[].class);
			List<RmRateVerificationList> rmRateVerificationList = new ArrayList<RmRateVerificationList>(Arrays.asList(rmRateVerification));
				
			for(int i = 0 ;i<rmRateVerificationList.size() ; i++)
			{ 
					for(int j = 0 ;j<intendDetailList1.size() ; j++)
					{ 
						 
						if(intendDetailList1.get(j).getItemId()==rmRateVerificationList.get(i).getRmId())
						{ 
							intendDetailList1.get(j).setRate(rmRateVerificationList.get(i).getRateTaxExtra()); 
							intendDetailList1.get(j).setTaxPer(rmRateVerificationList.get(i).getRate1TaxExtra());
							intendDetailList1.get(j).setStateCode(rmRateVerificationList.get(i).getDate1());
							intendDetailList.add(intendDetailList1.get(j)); 
						}
					} 
			}
			
			for(int j = 0; j<getPoHeader.getPoDetailList().size() ; j++)
			{
				for(int i = 0; i<intendDetailList.size() ; i++)
				{
					if(getPoHeader.getPoDetailList().get(j).getIndId()==intendDetailList.get(i).getIndDId())
					{
						intendDetailList.remove(i);
						break;
					}
				}
			}
			 
			System.out.println(intendDetailList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return intendDetailList;
	}
	
	@RequestMapping(value = "/submitPoDetailListInPoEditList", method = RequestMethod.POST)
	public String submitPoDetailListInPoEditList(HttpServletRequest request, HttpServletResponse response) {

		 
		try {
			 
			float total = 0;
			float poBasicValue = 0;
			float poDiscValue = 0;
			float poTaxValue = 0;
			isState=0;
			
			try {
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("name", "sameState"); 
				System.out.println("map " + map);
				SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
				
				if(intendDetailList.get(0).getStateCode().equals(settingValue.getValue())) {
					
					isState=1;
				}
			}catch(Exception e) {
				
			}
				

			getIntendDetailforJsp = new ArrayList<>();
 
			String[] checkbox = request.getParameterValues("select_to_approve");
 
			System.out.println("getPoHeader befor Calculation  "+getPoHeader.getPoDetailList()); 
			Calendar c = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (int i = 0; i < intendDetailList.size(); i++) {
				for (int j = 0; j < checkbox.length; j++) {
					 
					if (Integer.parseInt(checkbox[j]) == intendDetailList.get(i).getIndDId()) {
						GetPoDetailList poDetail = new GetPoDetailList();
						poDetail.setIndId(intendDetailList.get(i).getIndDId());
						poDetail.setSchDays(intendDetailList.get(i).getIndItemSchd());
						poDetail.setItemCode(intendDetailList.get(i).getItemCode());
						poDetail.setItemId(intendDetailList.get(i).getItemId());
						poDetail.setIndedQty(intendDetailList.get(i).getIndQty());
						poDetail.setItemUom(intendDetailList.get(i).getIndItemUom());
						poDetail.setItemQty(
								Float.parseFloat(request.getParameter("poQtyAdd" + intendDetailList.get(i).getIndDId())));
						poDetail.setPendingQty(
								Float.parseFloat(request.getParameter("poQtyAdd" + intendDetailList.get(i).getIndDId())));
						poDetail.setDiscPer(
								Integer.parseInt(request.getParameter("discAdd" + intendDetailList.get(i).getIndDId())));
						poDetail.setItemRate(
								Float.parseFloat(request.getParameter("rateAdd" + intendDetailList.get(i).getIndDId())));
						poDetail.setSchRemark(request.getParameter("indRemarkAdd" + intendDetailList.get(i).getIndDId()));
						poDetail.setSchDays(Integer
								.parseInt(request.getParameter("indItemSchdAdd" + intendDetailList.get(i).getIndDId())));
						poDetail.setSchDate(intendDetailList.get(i).getIndItemSchddt());
						poDetail.setBalanceQty(Float
								.parseFloat(request.getParameter("balanceQtyAdd" + intendDetailList.get(i).getIndDId())));
						c.setTime(sdf.parse(poDetail.getSchDate()));
						c.add(Calendar.DAY_OF_MONTH, poDetail.getSchDays());
						poDetail.setSchDate(sdf.format(c.getTime()));
						poDetail.setIndId(intendDetailList.get(i).getIndDId());
						//poDetail.setIndMNo(intendDetailList.get(i).getIndMNo());
						if(isState==0) {
							poDetail.setIgst(intendDetailList.get(i).getTaxPer());
							
						}else {
							poDetail.setCgst(intendDetailList.get(i).getTaxPer()/2);
							poDetail.setSgst(intendDetailList.get(i).getTaxPer()/2);
						}
						poDetail.setStatus(9);//settaxValue	
						poDetail.setBasicValue(Float.parseFloat(df.format(poDetail.getItemQty() * poDetail.getItemRate())));
						poDetail.setDiscValue(Float.parseFloat(df.format((poDetail.getDiscPer() / 100) * poDetail.getBasicValue())));
						poDetail.setTaxValue(Float.parseFloat(df.format((intendDetailList.get(i).getTaxPer()/100)*(poDetail.getItemQty() * poDetail.getItemRate() - poDetail.getDiscValue()))));
						poDetail.setLandingCost(Float.parseFloat(df.format(
								poDetail.getItemQty() * poDetail.getItemRate() - poDetail.getDiscValue() + poDetail.getTaxValue())));
					 
						getPoHeader.getPoDetailList().add(poDetail);

						intendDetailList.get(i).setPoQty(
								Float.parseFloat(request.getParameter("poQtyAdd" + intendDetailList.get(i).getIndDId())));
						intendDetailList.get(i).setIndFyr(Float
								.parseFloat(request.getParameter("balanceQtyAdd" + intendDetailList.get(i).getIndDId())));
						intendDetailList.get(i).setDisc(
								Float.parseFloat(request.getParameter("discAdd" + intendDetailList.get(i).getIndDId())));
						intendDetailList.get(i).setRate(
								Float.parseFloat(request.getParameter("rateAdd" + intendDetailList.get(i).getIndDId())));
						/*intendDetailList.get(i)
								.setIndRemark(request.getParameter("indRemarkAdd" + intendDetailList.get(i).getIndDId()));
						intendDetailList.get(i).setIndItemSchd(Integer
								.parseInt(request.getParameter("indItemSchdAdd" + intendDetailList.get(i).getIndDId())));*/
						getIntendDetailforJsp.add(intendDetailList.get(i));
						 
					}

				}
			}
			
			System.out.println("poDetailList befor Calculation  " +getPoHeader.getPoDetailList());
			 
			for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
				poBasicValue = poBasicValue + getPoHeader.getPoDetailList().get(i).getBasicValue();
				poDiscValue = poDiscValue + getPoHeader.getPoDetailList().get(i).getDiscValue();
			}

			getPoHeader.setPoBasicValue(Float.parseFloat(df.format(poBasicValue)));
			getPoHeader.setDiscValue(Float.parseFloat(df.format(poDiscValue)));
			
			if (getPoHeader.getPoPackPer() != 0) {
				getPoHeader.setPoPackVal(Float.parseFloat(df.format((getPoHeader.getPoPackPer() / 100) * getPoHeader.getPoBasicValue())));
			}

			if (getPoHeader.getPoInsuPer() != 0) {
				getPoHeader.setPoInsuVal(Float.parseFloat(df.format((getPoHeader.getPoInsuPer() / 100) * getPoHeader.getPoBasicValue())));
			}

			if (getPoHeader.getPoFrtPer() != 0) {
				getPoHeader.setPoFrtVal(Float.parseFloat(df.format((getPoHeader.getPoFrtPer() / 100) * getPoHeader.getPoBasicValue())));
			}

			total = getPoHeader.getPoBasicValue() + getPoHeader.getPoPackVal() + getPoHeader.getPoInsuVal()
					+ getPoHeader.getPoFrtVal() - getPoHeader.getDiscValue();
			//getPoHeader.setPoTaxValue((getPoHeader.getPoTaxPer() / 100) * total);

			for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
				float divFactor = getPoHeader.getPoDetailList().get(i).getBasicValue() / getPoHeader.getPoBasicValue()
						* 100;
				getPoHeader.getPoDetailList().get(i).setPackValue(divFactor * getPoHeader.getPoPackVal() / 100);
				getPoHeader.getPoDetailList().get(i).setInsu(divFactor * getPoHeader.getPoInsuVal() / 100);
				getPoHeader.getPoDetailList().get(i).setFreightValue(divFactor * getPoHeader.getPoFrtVal() / 100);
				
				if(getPoHeader.getPoDetailList().get(i).getIgst()>0) {
					
					getPoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format((getPoHeader.getPoDetailList().get(i).getIgst()/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
							getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
							getPoHeader.getPoDetailList().get(i).getFreightValue()))));
					
				}else {
					getPoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format(((getPoHeader.getPoDetailList().get(i).getCgst()+getPoHeader.getPoDetailList().get(i).getSgst())/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
							getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
							getPoHeader.getPoDetailList().get(i).getFreightValue()))));
				}
				
				//getPoHeader.getPoDetailList().get(i).setTaxValue(divFactor * getPoHeader.getPoTaxValue() / 100);
				getPoHeader.getPoDetailList().get(i)
						.setOtherChargesAfter(Float.parseFloat(df.format(divFactor * getPoHeader.getOtherChargeAfter() / 100)));
				getPoHeader.getPoDetailList().get(i)
						.setLandingCost(Float.parseFloat(df.format(getPoHeader.getPoDetailList().get(i).getBasicValue()
								- getPoHeader.getPoDetailList().get(i).getDiscValue()
								+ getPoHeader.getPoDetailList().get(i).getPackValue()
								+ getPoHeader.getPoDetailList().get(i).getInsu()
								+ getPoHeader.getPoDetailList().get(i).getFreightValue()
								+ getPoHeader.getPoDetailList().get(i).getTaxValue()
								+ getPoHeader.getPoDetailList().get(i).getOtherChargesAfter())));
				poTaxValue=poTaxValue+getPoHeader.getPoDetailList().get(i).getTaxValue();
			}
			getPoHeader.setVendQuationDate(DateConvertor.convertToYMD(getPoHeader.getVendQuationDate()));
			getPoHeader.setPoDate(DateConvertor.convertToYMD(getPoHeader.getPoDate()));
			getPoHeader.setPoTaxValue(Float.parseFloat(df.format(poTaxValue)));
			 
			PoHeader save = rest.postForObject(Constants.url + "/savePoHeaderAndDetail", getPoHeader, PoHeader.class);
			System.out.println(save);
			
			
			if(save!=null && getIntendDetailforJsp.size()>0)
			{
				 
				for (int i = 0; i < getIntendDetailforJsp.size(); i++) {
					 
					getIntendDetailforJsp.get(i)
							.setIndMDate(DateConvertor.convertToYMD(getIntendDetailforJsp.get(i).getIndMDate()));
					if (getIntendDetailforJsp.get(i).getIndFyr() == 0)
						getIntendDetailforJsp.get(i).setIndDStatus(2);
					else if (getIntendDetailforJsp.get(i).getIndFyr() > 0 && getIntendDetailforJsp.get(i)
							.getIndFyr() < getIntendDetailforJsp.get(i).getIndQty())
						getIntendDetailforJsp.get(i).setIndDStatus(1);
					else
						getIntendDetailforJsp.get(i).setIndDStatus(0);
	
				}
				
				System.out.println("getPoHeader after Calculation  "+getPoHeader); 
				System.out.println("getIntendDetailforJsp after Calculation  " +getIntendDetailforJsp);
				 ErrorMessage errorMessage = rest.postForObject(Constants.url + "/updateIndendPendingQty",
						 getIntendDetailforJsp, ErrorMessage.class);
				System.out.println(errorMessage); 
				//getPoHeader.setPoDetailList(poDetailList);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/editPurchaseOrder/"+getPoHeader.getPoId();
	}
	
	@RequestMapping(value = "/deletePoItemInEditPo/{poDetailId}", method = RequestMethod.GET)
	public String deletePoItemInEditPo(@PathVariable int poDetailId, HttpServletRequest request,
			HttpServletResponse response) {

		//ModelAndView model = new ModelAndView("purchaseOrder/editPurchaseOrder");
		try {

			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("poDetailId", poDetailId);
			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deletePoItem", map,
					ErrorMessage.class);
			System.out.println(errorMessage);
			
			if(errorMessage.isError()==false)
			{ 
				float total = 0;
				float poBasicValue = 0;
				float poDiscValue = 0;
				float poTaxValue = 0;
				System.out.println(getPoHeader);
				
				for (int i = 0; i < getIntendDetailListforEdit.size(); i++) {
					for (int j = 0; j < getPoHeader.getPoDetailList().size(); j++) {
						if (getPoHeader.getPoDetailList().get(j).getIndId() == getIntendDetailListforEdit.get(i)
								.getIndDId() && getPoHeader.getPoDetailList().get(j).getPoDetailId()==poDetailId) {
							System.out.println("in if   "+getIntendDetailListforEdit.get(i));
							getIntendDetailListforEdit.get(i)
									.setIndFyr(getIntendDetailListforEdit.get(i).getIndFyr()+getPoHeader.getPoDetailList().get(j).getItemQty());
							System.out.println("in if   "+getIntendDetailListforEdit.get(i));
							getPoHeader.getPoDetailList().remove(j); 
							break;
						}

					}
					getIntendDetailListforEdit.get(i)
							.setIndMDate(DateConvertor.convertToYMD(getIntendDetailListforEdit.get(i).getIndMDate()));
					if (getIntendDetailListforEdit.get(i).getIndFyr() == 0)
						getIntendDetailListforEdit.get(i).setIndDStatus(2);
					else if (getIntendDetailListforEdit.get(i).getIndFyr() > 0 && getIntendDetailListforEdit.get(i)
							.getIndFyr() < getIntendDetailListforEdit.get(i).getIndQty())
						getIntendDetailListforEdit.get(i).setIndDStatus(1);
					else
						getIntendDetailListforEdit.get(i).setIndDStatus(0);

				}
				 
				for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
					poBasicValue = poBasicValue + getPoHeader.getPoDetailList().get(i).getBasicValue();
					poDiscValue = poDiscValue + getPoHeader.getPoDetailList().get(i).getDiscValue();
				}

				getPoHeader.setPoBasicValue(poBasicValue);
				getPoHeader.setDiscValue(poDiscValue);
				
				if (getPoHeader.getPoPackPer() != 0) {
					getPoHeader.setPoPackVal((getPoHeader.getPoPackPer() / 100) * getPoHeader.getPoBasicValue());
				}

				if (getPoHeader.getPoInsuPer() != 0) {
					getPoHeader.setPoInsuVal((getPoHeader.getPoInsuPer() / 100) * getPoHeader.getPoBasicValue());
				}

				if (getPoHeader.getPoFrtPer() != 0) {
					getPoHeader.setPoFrtVal((getPoHeader.getPoFrtPer() / 100) * getPoHeader.getPoBasicValue());
				}

				total = getPoHeader.getPoBasicValue() + getPoHeader.getPoPackVal() + getPoHeader.getPoInsuVal()
						+ getPoHeader.getPoFrtVal() - getPoHeader.getDiscValue();
				//getPoHeader.setPoTaxValue((getPoHeader.getPoTaxPer() / 100) * total);

				for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
					float divFactor = getPoHeader.getPoDetailList().get(i).getBasicValue() / getPoHeader.getPoBasicValue()
							* 100;
					getPoHeader.getPoDetailList().get(i).setPackValue(divFactor * getPoHeader.getPoPackVal() / 100);
					getPoHeader.getPoDetailList().get(i).setInsu(divFactor * getPoHeader.getPoInsuVal() / 100);
					getPoHeader.getPoDetailList().get(i).setFreightValue(divFactor * getPoHeader.getPoFrtVal() / 100);
					
					if(getPoHeader.getPoDetailList().get(i).getIgst()>0) {
						
						getPoHeader.getPoDetailList().get(i).setTaxValue((getPoHeader.getPoDetailList().get(i).getIgst()/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
								getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
								getPoHeader.getPoDetailList().get(i).getFreightValue()));
						
					}else {
						getPoHeader.getPoDetailList().get(i).setTaxValue(((getPoHeader.getPoDetailList().get(i).getCgst()+getPoHeader.getPoDetailList().get(i).getSgst())/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
								getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
								getPoHeader.getPoDetailList().get(i).getFreightValue()));
					}
					
					//getPoHeader.getPoDetailList().get(i).setTaxValue(divFactor * getPoHeader.getPoTaxValue() / 100);
					getPoHeader.getPoDetailList().get(i)
							.setOtherChargesAfter(divFactor * getPoHeader.getOtherChargeAfter() / 100);
					getPoHeader.getPoDetailList().get(i)
							.setLandingCost(getPoHeader.getPoDetailList().get(i).getBasicValue()
									- getPoHeader.getPoDetailList().get(i).getDiscValue()
									+ getPoHeader.getPoDetailList().get(i).getPackValue()
									+ getPoHeader.getPoDetailList().get(i).getInsu()
									+ getPoHeader.getPoDetailList().get(i).getFreightValue()
									+ getPoHeader.getPoDetailList().get(i).getTaxValue()
									+ getPoHeader.getPoDetailList().get(i).getOtherChargesAfter());
					poTaxValue=poTaxValue+getPoHeader.getPoDetailList().get(i).getTaxValue();
				}
				getPoHeader.setVendQuationDate(DateConvertor.convertToYMD(getPoHeader.getVendQuationDate()));
				getPoHeader.setPoDate(DateConvertor.convertToYMD(getPoHeader.getPoDate()));
				getPoHeader.setPoTaxValue(poTaxValue);
				System.out.println(getPoHeader);
				
				 PoHeader save = rest.postForObject(Constants.url + "/savePoHeaderAndDetail", getPoHeader, PoHeader.class);
				System.out.println(save);
				
				errorMessage = rest.postForObject(Constants.url + "/updateIndendPendingQty",
						getIntendDetailListforEdit, ErrorMessage.class);
				System.out.println(errorMessage);
			} 
			  
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/editPurchaseOrder/"+getPoHeader.getPoId();
	}

	@RequestMapping(value = "/changeItemRate", method = RequestMethod.GET)
	@ResponseBody
	public GetPoHeaderList changeItemRate(HttpServletRequest request, HttpServletResponse response) {

		try {
			float total = 0;
			float poBasicValue = 0;
			float poDiscValue = 0;
			float poTaxValue = 0;
			
			float rate = Float.parseFloat(request.getParameter("rate"));
			float disc = Float.parseFloat(request.getParameter("disc"));
			int key = Integer.parseInt(request.getParameter("key"));
			float poQty = Float.parseFloat(request.getParameter("poQty"));
			float balanceQty = Float.parseFloat(request.getParameter("balanceQty"));

			getPoHeader.getPoDetailList().get(key).setItemRate(rate);
			getPoHeader.getPoDetailList().get(key).setDiscPer(disc);
			getPoHeader.getPoDetailList().get(key).setItemQty(poQty);
			getPoHeader.getPoDetailList().get(key).setPendingQty(poQty);
			getPoHeader.getPoDetailList().get(key).setBalanceQty(balanceQty);

			getPoHeader.getPoDetailList().get(key).setBasicValue(getPoHeader.getPoDetailList().get(key).getItemRate()
					* getPoHeader.getPoDetailList().get(key).getItemQty());
			getPoHeader.getPoDetailList().get(key)
					.setDiscValue((getPoHeader.getPoDetailList().get(key).getDiscPer() / 100)
							* getPoHeader.getPoDetailList().get(key).getBasicValue());

			for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
				poBasicValue = poBasicValue + getPoHeader.getPoDetailList().get(i).getBasicValue();
				poDiscValue = poDiscValue + getPoHeader.getPoDetailList().get(i).getDiscValue();
			}

			getPoHeader.setPoBasicValue(Float.parseFloat(df.format(poBasicValue)));
			getPoHeader.setDiscValue(Float.parseFloat(df.format(poDiscValue)));

			if (getPoHeader.getPoPackPer() != 0) {
				getPoHeader.setPoPackVal(Float.parseFloat(df.format((getPoHeader.getPoPackPer() / 100) * getPoHeader.getPoBasicValue())));
			}

			if (getPoHeader.getPoInsuPer() != 0) {
				getPoHeader.setPoInsuVal(Float.parseFloat(df.format((getPoHeader.getPoInsuPer() / 100) * getPoHeader.getPoBasicValue())));
			}

			if (getPoHeader.getPoFrtPer() != 0) {
				getPoHeader.setPoFrtVal(Float.parseFloat(df.format((getPoHeader.getPoFrtPer() / 100) * getPoHeader.getPoBasicValue())));
			}

			total = getPoHeader.getPoBasicValue() + getPoHeader.getPoPackVal() + getPoHeader.getPoInsuVal()
					+ getPoHeader.getPoFrtVal() - getPoHeader.getDiscValue();
			//getPoHeader.setPoTaxValue((getPoHeader.getPoTaxPer() / 100) * total);

			for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
				float divFactor = getPoHeader.getPoDetailList().get(i).getBasicValue() / getPoHeader.getPoBasicValue()
						* 100;
				getPoHeader.getPoDetailList().get(i).setPackValue(Float.parseFloat(df.format(divFactor * getPoHeader.getPoPackVal() / 100)));
				getPoHeader.getPoDetailList().get(i).setInsu(Float.parseFloat(df.format(divFactor * getPoHeader.getPoInsuVal() / 100)));
				getPoHeader.getPoDetailList().get(i).setFreightValue(Float.parseFloat(df.format(divFactor * getPoHeader.getPoFrtVal() / 100)));
				
				if(getPoHeader.getPoDetailList().get(i).getIgst()>0) {
					
					getPoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format((getPoHeader.getPoDetailList().get(i).getIgst()/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
							getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
							getPoHeader.getPoDetailList().get(i).getFreightValue()))));
					
				}else {
					getPoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format(((getPoHeader.getPoDetailList().get(i).getCgst()+getPoHeader.getPoDetailList().get(i).getSgst())/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
							getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
							getPoHeader.getPoDetailList().get(i).getFreightValue()))));
				}
				
				//getPoHeader.getPoDetailList().get(i).setTaxValue(divFactor * getPoHeader.getPoTaxValue() / 100);
				getPoHeader.getPoDetailList().get(i)
						.setOtherChargesAfter(Float.parseFloat(df.format(divFactor * getPoHeader.getOtherChargeAfter() / 100)));
				getPoHeader.getPoDetailList().get(i)
						.setLandingCost(Float.parseFloat(df.format(getPoHeader.getPoDetailList().get(i).getBasicValue()
								- getPoHeader.getPoDetailList().get(i).getDiscValue()
								+ getPoHeader.getPoDetailList().get(i).getPackValue()
								+ getPoHeader.getPoDetailList().get(i).getInsu()
								+ getPoHeader.getPoDetailList().get(i).getFreightValue()
								+ getPoHeader.getPoDetailList().get(i).getTaxValue()
								+ getPoHeader.getPoDetailList().get(i).getOtherChargesAfter())));
				
				poTaxValue=poTaxValue+getPoHeader.getPoDetailList().get(i).getTaxValue();
			}
			getPoHeader.setPoTaxValue(Float.parseFloat(df.format(poTaxValue)));
			System.out.println("getPoHeader" + getPoHeader);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getPoHeader;
	}

	@RequestMapping(value = "/calculatePurchaseHeaderValuesInEdit", method = RequestMethod.GET)
	@ResponseBody
	public GetPoHeaderList calculatePurchaseHeaderValuesInEdit(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			float total = 0; 
			float poTaxValue = 0;
			
			float packPer = Float.parseFloat(request.getParameter("packPer"));
			float packValue = Float.parseFloat(request.getParameter("packValue"));
			float insuPer = Float.parseFloat(request.getParameter("insuPer"));
			float insuValue = Float.parseFloat(request.getParameter("insuValue"));
			float freightPer = Float.parseFloat(request.getParameter("freightPer"));
			float freightValue = Float.parseFloat(request.getParameter("freightValue"));
			float otherPer = Float.parseFloat(request.getParameter("otherPer"));
			float otherValue = Float.parseFloat(request.getParameter("otherValue"));
			/*float taxPer = Float.parseFloat(request.getParameter("taxPer"));
			int taxId = Integer.parseInt(request.getParameter("taxId"));*/

			if (packPer != 0) {
				getPoHeader.setPoPackPer(packPer);
				getPoHeader.setPoPackVal(Float.parseFloat(df.format((packPer / 100) * getPoHeader.getPoBasicValue())));
			} else {
				getPoHeader.setPoPackPer(0);
				getPoHeader.setPoPackVal(packValue);
			}

			if (insuPer != 0) {
				getPoHeader.setPoInsuPer(insuPer);
				getPoHeader.setPoInsuVal(Float.parseFloat(df.format((insuPer / 100) * getPoHeader.getPoBasicValue())));
			} else {
				getPoHeader.setPoInsuPer(0);
				getPoHeader.setPoInsuVal(insuValue);
			}

			if (freightPer != 0) {
				getPoHeader.setPoFrtPer(freightPer);
				getPoHeader.setPoFrtVal(Float.parseFloat(df.format((freightPer / 100) * getPoHeader.getPoBasicValue())));
			} else {
				getPoHeader.setPoFrtPer(0);
				getPoHeader.setPoFrtVal(freightValue);
			}

			total = getPoHeader.getPoBasicValue() + getPoHeader.getPoPackVal() + getPoHeader.getPoInsuVal()
					+ getPoHeader.getPoFrtVal() - getPoHeader.getDiscValue();
			/*getPoHeader.setPoTaxId(taxId);
			getPoHeader.setPoTaxPer(taxPer);
			getPoHeader.setPoTaxValue((taxPer / 100) * total);*/

			if (otherPer != 0) {
				total = getPoHeader.getPoBasicValue() + getPoHeader.getPoPackVal() + getPoHeader.getPoInsuVal()
						+ getPoHeader.getPoFrtVal() - getPoHeader.getDiscValue() + getPoHeader.getPoTaxValue();
				getPoHeader.setOtherChargeAfter(Float.parseFloat(df.format((otherPer / 100) * total)));
			} else if (otherValue != 0) {
				getPoHeader.setOtherChargeAfter(otherValue);
			} else {
				getPoHeader.setOtherChargeAfter(0);
			}

			for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
				float divFactor = getPoHeader.getPoDetailList().get(i).getBasicValue() / getPoHeader.getPoBasicValue()
						* 100;
				getPoHeader.getPoDetailList().get(i).setPackValue(Float.parseFloat(df.format(divFactor * getPoHeader.getPoPackVal() / 100)));
				getPoHeader.getPoDetailList().get(i).setInsu(Float.parseFloat(df.format(divFactor * getPoHeader.getPoInsuVal() / 100)));
				getPoHeader.getPoDetailList().get(i).setFreightValue(Float.parseFloat(df.format(divFactor * getPoHeader.getPoFrtVal() / 100)));
				
				if(getPoHeader.getPoDetailList().get(i).getIgst()>0) {
					
					getPoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format((getPoHeader.getPoDetailList().get(i).getIgst()/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
							getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
							getPoHeader.getPoDetailList().get(i).getFreightValue()))));
					
				}else {
					getPoHeader.getPoDetailList().get(i).setTaxValue(Float.parseFloat(df.format(((getPoHeader.getPoDetailList().get(i).getCgst()+getPoHeader.getPoDetailList().get(i).getSgst())/ 100)*(getPoHeader.getPoDetailList().get(i).getBasicValue()-
							getPoHeader.getPoDetailList().get(i).getDiscValue()+getPoHeader.getPoDetailList().get(i).getPackValue()+getPoHeader.getPoDetailList().get(i).getInsu()+
							getPoHeader.getPoDetailList().get(i).getFreightValue()))));
				}
				
				//getPoHeader.getPoDetailList().get(i).setTaxValue(divFactor * getPoHeader.getPoTaxValue() / 100);
				getPoHeader.getPoDetailList().get(i)
						.setOtherChargesAfter(Float.parseFloat(df.format(divFactor * getPoHeader.getOtherChargeAfter() / 100)));
				getPoHeader.getPoDetailList().get(i)
						.setLandingCost(Float.parseFloat(df.format(getPoHeader.getPoDetailList().get(i).getBasicValue()
								- getPoHeader.getPoDetailList().get(i).getDiscValue()
								+ getPoHeader.getPoDetailList().get(i).getPackValue()
								+ getPoHeader.getPoDetailList().get(i).getInsu()
								+ getPoHeader.getPoDetailList().get(i).getFreightValue()
								+ getPoHeader.getPoDetailList().get(i).getTaxValue()
								+ getPoHeader.getPoDetailList().get(i).getOtherChargesAfter())));
				poTaxValue=poTaxValue+getPoHeader.getPoDetailList().get(i).getTaxValue();
			}

			getPoHeader.setPoTaxValue(Float.parseFloat(df.format(poTaxValue)));
			System.out.println(getPoHeader);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getPoHeader;
	}

	@RequestMapping(value = "/submitEditPurchaseOrder", method = RequestMethod.POST)
	public String submitEditPurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		try {
			Calendar c = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			int vendId = Integer.parseInt(request.getParameter("vendId"));
			String quotation = request.getParameter("quotation");
			int poType = Integer.parseInt(request.getParameter("poType"));
			int payId = Integer.parseInt(request.getParameter("payId"));
			int deliveryId = Integer.parseInt(request.getParameter("deliveryId"));
			int dispatchMode = Integer.parseInt(request.getParameter("dispatchMode"));
			int orderValidity = Integer.parseInt(request.getParameter("orderValidity"));
			String quotationDate = request.getParameter("quotationDate");
			String poDate = request.getParameter("poDate");
			String poNo = request.getParameter("poNo");

			String packRemark = request.getParameter("packRemark");
			String insuRemark = request.getParameter("insuRemark");
			String freghtRemark = request.getParameter("freghtRemark");
			String otherRemark = request.getParameter("otherRemark");
			String poRemark = request.getParameter("poRemark");

			getPoHeader.setVendId(vendId);
			getPoHeader.setVendQuation(quotation);
			getPoHeader.setPoType(poType);
			getPoHeader.setPaymentTermId(payId);
			getPoHeader.setDeliveryId(deliveryId);
			getPoHeader.setDispatchId(dispatchMode);
			getPoHeader.setVendQuationDate(DateConvertor.convertToYMD(quotationDate));
			getPoHeader.setPoDate(DateConvertor.convertToYMD(poDate));
			getPoHeader.setPoNo(poNo);
			getPoHeader.setOtherChargeAfterRemark(otherRemark);
			getPoHeader.setPoFrtRemark(freghtRemark);
			getPoHeader.setPoInsuRemark(insuRemark);
			getPoHeader.setPoPackRemark(packRemark);
			getPoHeader.setDelStatus(1);
			getPoHeader.setPoRemark(poRemark);
			getPoHeader.setApprovStatus(orderValidity);
			
			System.out.println(getPoHeader);

			for (int i = 0; i < getPoHeader.getPoDetailList().size(); i++) {
				getPoHeader.getPoDetailList().get(i).setSchRemark(request.getParameter("indRemark" + i));
 
				c.setTime(sdf.parse(getPoHeader.getPoDetailList().get(i).getSchDate()));
				getPoHeader.getPoDetailList().get(i)
						.setSchDays(Integer.parseInt(request.getParameter("indItemSchd" + i)));
				c.add(Calendar.DAY_OF_MONTH, getPoHeader.getPoDetailList().get(i).getSchDays());
				getPoHeader.getPoDetailList().get(i).setSchDate(sdf.format(c.getTime())); 
			}
			 PoHeader save = rest.postForObject(Constants.url + "/savePoHeaderAndDetail", getPoHeader, PoHeader.class);
			System.out.println(save);

			if (save != null) { 
				for (int i = 0; i < getIntendDetailListforEdit.size(); i++) {
					for (int j = 0; j < getPoHeader.getPoDetailList().size(); j++) {
						if (getPoHeader.getPoDetailList().get(j).getIndId() == getIntendDetailListforEdit.get(i)
								.getIndDId()) {
							getIntendDetailListforEdit.get(i)
									.setIndFyr(getPoHeader.getPoDetailList().get(j).getBalanceQty());
							break;
						}

					}
					getIntendDetailListforEdit.get(i)
							.setIndMDate(DateConvertor.convertToYMD(getIntendDetailListforEdit.get(i).getIndMDate()));
					if (getIntendDetailListforEdit.get(i).getIndFyr() == 0)
						getIntendDetailListforEdit.get(i).setIndDStatus(2);
					else if (getIntendDetailListforEdit.get(i).getIndFyr() > 0 && getIntendDetailListforEdit.get(i)
							.getIndFyr() < getIntendDetailListforEdit.get(i).getIndQty())
						getIntendDetailListforEdit.get(i).setIndDStatus(1);
					else
						getIntendDetailListforEdit.get(i).setIndDStatus(0);

				}
				 
				 ErrorMessage errorMessage = rest.postForObject(Constants.url + "/updateIndendPendingQty",
						getIntendDetailListforEdit, ErrorMessage.class);
				System.out.println(errorMessage);
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfPurachaseOrder";
	}
	
	@RequestMapping(value = "/firstApprovePurchaseOrder", method = RequestMethod.GET)
	public ModelAndView firstApprovePurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/approvePO");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", "7,9");
			GetPoHeaderList[] list = rest.postForObject(Constants.url + "/getPoHeaderListForApprove" ,map,
					GetPoHeaderList[].class);
			List<GetPoHeaderList> poList = new ArrayList<GetPoHeaderList>(Arrays.asList(list));

			model.addObject("poList", poList);
			model.addObject("approve", 1);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/secondApprovePurchaseOrder", method = RequestMethod.GET)
	public ModelAndView secondApprovePurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/approvePO");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", "7");
			GetPoHeaderList[] list = rest.postForObject(Constants.url + "/getPoHeaderListForApprove" ,map,
					GetPoHeaderList[].class);
			List<GetPoHeaderList> poList = new ArrayList<GetPoHeaderList>(Arrays.asList(list));

			model.addObject("poList", poList);
			model.addObject("approve", 2);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	GetPoHeaderList poHeaderForApprove = new GetPoHeaderList();
	
	@RequestMapping(value = "/approvePoDetail/{poId}/{approve}", method = RequestMethod.GET)
	public ModelAndView approvePoDetail(@PathVariable int poId,@PathVariable int approve, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("purchaseOrder/approvePoDetail");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("poId", poId);
			 poHeaderForApprove = rest.postForObject(Constants.url + "/getPoHeaderAndDetailByHeaderId", map,
					GetPoHeaderList.class);
			model.addObject("poHeaderForApprove", poHeaderForApprove);
			model.addObject("approve", approve);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/submitPoApprove", method = RequestMethod.POST)
	public String submitApprove(HttpServletRequest request, HttpServletResponse response) {

		String ret = null;
		int approve = Integer.parseInt(request.getParameter("approve"));
		try {
			getIntendDetailforJsp = new ArrayList<>();
			
			String poDetalId = new String();
			int poId = 0 ;
			int status = 9;
			
			
			if(approve==1) {
				
				poHeaderForApprove.setPoStatus(7);
				poId=poHeaderForApprove.getPoId();
				String[] checkbox = request.getParameterValues("select_to_approve");
				status=7;
				for(int i=0 ; i<checkbox.length ;i++) {
					
					for(int j=0 ; j<poHeaderForApprove.getPoDetailList().size() ; j++) {
						
						if(Integer.parseInt(checkbox[i])==poHeaderForApprove.getPoDetailList().get(j).getPoDetailId()) {
							poHeaderForApprove.getPoDetailList().get(j).setStatus(7);
							poDetalId=poDetalId+","+poHeaderForApprove.getPoDetailList().get(j).getPoDetailId();
							break;
						}
					}
				}
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("poId", poId);
				map.add("poDetalId", poDetalId.substring(1, poDetalId.length()));
				map.add("status", status);
				System.out.println("map " + map);
				ErrorMessage approved = rest.postForObject(Constants.url + "/updateStatusWhileApprov", map, ErrorMessage.class);
				
			}
			else if(approve==2){
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map = new LinkedMultiValueMap<>();
				map.add("indId", poHeaderForApprove.getIndId());
				GetIntendDetail[] GetIntendDetail = rest.postForObject(Constants.url + "/getIntendsDetailByIntendId", map,
						GetIntendDetail[].class);
				getIntendDetailListforEdit = new ArrayList<>(Arrays.asList(GetIntendDetail));
	 
				map = new LinkedMultiValueMap<String, Object>();
				map.add("name", "autoMrn"); 
				System.out.println("map " + map);
				SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
				
				int flag=0;
				 String[] type = settingValue.getValue().split(",");
				 
				 for(int i = 0 ; i<type.length ; i++) {
					 
					 if(poHeaderForApprove.getPoType()==Integer.parseInt(type[i])) {
						  flag=1;
						  break;
					 }
				 }
				
				 if(flag==1) {
					 	poHeaderForApprove.setPoStatus(2);
					}
					else {
						poHeaderForApprove.setPoStatus(0);
					} 
				
				poId=poHeaderForApprove.getPoId();
				String[] checkbox = request.getParameterValues("select_to_approve");
				status=0;
				 
					for(int i=0 ; i<checkbox.length ;i++) {
						
						for(int j=0 ; j<poHeaderForApprove.getPoDetailList().size() ; j++) {
							
							if(Integer.parseInt(checkbox[i])==poHeaderForApprove.getPoDetailList().get(j).getPoDetailId()) {
								if(flag==1) {
									poHeaderForApprove.getPoDetailList().get(j).setStatus(2);
									//poHeaderForApprove.getPoDetailList().get(j).setPendingQty(0);
								}
								else {
									poHeaderForApprove.getPoDetailList().get(j).setStatus(0);
								} 
								poDetalId=poDetalId+","+poHeaderForApprove.getPoDetailList().get(j).getPoDetailId();
								break;
							}
						}
					}
				  
				float total = 0;
				float poBasicValue = 0;
				float poDiscValue = 0;
				float poTaxValue = 0;
				
				System.out.println(poHeaderForApprove);
				 
				 
				for (int i = 0; i < poHeaderForApprove.getPoDetailList().size(); i++) {
					if(poHeaderForApprove.getPoDetailList().get(i).getStatus()==0 || poHeaderForApprove.getPoDetailList().get(i).getStatus()==2) {
						poBasicValue = poBasicValue + poHeaderForApprove.getPoDetailList().get(i).getBasicValue();
						poDiscValue = poDiscValue + poHeaderForApprove.getPoDetailList().get(i).getDiscValue();
						poHeaderForApprove.getPoDetailList().get(i).setSchDate(DateConvertor.convertToYMD(poHeaderForApprove.getPoDetailList().get(i).getSchDate()));
					}
					else {
						poHeaderForApprove.getPoDetailList().get(i).setSchDate(DateConvertor.convertToYMD(poHeaderForApprove.getPoDetailList().get(i).getSchDate()));
					}
				}

				poHeaderForApprove.setPoBasicValue(poBasicValue);
				poHeaderForApprove.setDiscValue(poDiscValue);
				
				if (poHeaderForApprove.getPoPackPer() != 0) {
					poHeaderForApprove.setPoPackVal((poHeaderForApprove.getPoPackPer() / 100) * poHeaderForApprove.getPoBasicValue());
				}

				if (poHeaderForApprove.getPoInsuPer() != 0) {
					poHeaderForApprove.setPoInsuVal((poHeaderForApprove.getPoInsuPer() / 100) * poHeaderForApprove.getPoBasicValue());
				}

				if (poHeaderForApprove.getPoFrtPer() != 0) {
					poHeaderForApprove.setPoFrtVal((poHeaderForApprove.getPoFrtPer() / 100) * poHeaderForApprove.getPoBasicValue());
				}

				total = poHeaderForApprove.getPoBasicValue() + poHeaderForApprove.getPoPackVal() + poHeaderForApprove.getPoInsuVal()
						+ poHeaderForApprove.getPoFrtVal() - poHeaderForApprove.getDiscValue();
				//getPoHeader.setPoTaxValue((poHeaderForApprove.getPoTaxPer() / 100) * total);
 
				for (int i = 0; i < poHeaderForApprove.getPoDetailList().size(); i++) {
					if(poHeaderForApprove.getPoDetailList().get(i).getStatus()==0 || poHeaderForApprove.getPoDetailList().get(i).getStatus()==2) {
					float divFactor = poHeaderForApprove.getPoDetailList().get(i).getBasicValue() / poHeaderForApprove.getPoBasicValue()
							* 100;
					poHeaderForApprove.getPoDetailList().get(i).setPackValue(divFactor * poHeaderForApprove.getPoPackVal() / 100);
					poHeaderForApprove.getPoDetailList().get(i).setInsu(divFactor * poHeaderForApprove.getPoInsuVal() / 100);
					poHeaderForApprove.getPoDetailList().get(i).setFreightValue(divFactor * poHeaderForApprove.getPoFrtVal() / 100);
					 
					if(poHeaderForApprove.getPoDetailList().get(i).getIgst()>0) {
						
						poHeaderForApprove.getPoDetailList().get(i).setTaxValue((poHeaderForApprove.getPoDetailList().get(i).getIgst()/ 100)*(poHeaderForApprove.getPoDetailList().get(i).getBasicValue()-
								poHeaderForApprove.getPoDetailList().get(i).getDiscValue()+poHeaderForApprove.getPoDetailList().get(i).getPackValue()+poHeaderForApprove.getPoDetailList().get(i).getInsu()+
								poHeaderForApprove.getPoDetailList().get(i).getFreightValue()));
						
					}else {
						poHeaderForApprove.getPoDetailList().get(i).setTaxValue(((poHeaderForApprove.getPoDetailList().get(i).getCgst()+poHeaderForApprove.getPoDetailList().get(i).getSgst())/ 100)*(poHeaderForApprove.getPoDetailList().get(i).getBasicValue()-
								poHeaderForApprove.getPoDetailList().get(i).getDiscValue()+poHeaderForApprove.getPoDetailList().get(i).getPackValue()+poHeaderForApprove.getPoDetailList().get(i).getInsu()+
								poHeaderForApprove.getPoDetailList().get(i).getFreightValue()));
					}

					//poHeaderForApprove.getPoDetailList().get(i).setTaxValue(divFactor * poHeaderForApprove.getPoTaxValue() / 100);
					poHeaderForApprove.getPoDetailList().get(i)
							.setOtherChargesAfter(divFactor * poHeaderForApprove.getOtherChargeAfter() / 100);
					poHeaderForApprove.getPoDetailList().get(i)
							.setLandingCost(poHeaderForApprove.getPoDetailList().get(i).getBasicValue()
									- poHeaderForApprove.getPoDetailList().get(i).getDiscValue()
									+ poHeaderForApprove.getPoDetailList().get(i).getPackValue()
									+ poHeaderForApprove.getPoDetailList().get(i).getInsu()
									+ poHeaderForApprove.getPoDetailList().get(i).getFreightValue()
									+ poHeaderForApprove.getPoDetailList().get(i).getTaxValue()
									+ poHeaderForApprove.getPoDetailList().get(i).getOtherChargesAfter());
					poTaxValue=poTaxValue+poHeaderForApprove.getPoDetailList().get(i).getTaxValue();
					}
				}
				poHeaderForApprove.setVendQuationDate(DateConvertor.convertToYMD(poHeaderForApprove.getVendQuationDate()));
				poHeaderForApprove.setPoDate(DateConvertor.convertToYMD(poHeaderForApprove.getPoDate()));
				poHeaderForApprove.setPoTaxValue(poTaxValue);
				System.out.println(poHeaderForApprove);
				
				 PoHeader save = rest.postForObject(Constants.url + "/savePoHeaderAndDetail", poHeaderForApprove, PoHeader.class);
				System.out.println(save);
				 
				if(save!=null) {
					
					for (int j = 0; j < poHeaderForApprove.getPoDetailList().size(); j++) {
						if (poHeaderForApprove.getPoDetailList().get(j).getStatus()==7 || poHeaderForApprove.getPoDetailList().get(j).getStatus()==9) {
							 
								for (int i = 0; i < getIntendDetailListforEdit.size(); i++) {
									if (poHeaderForApprove.getPoDetailList().get(j).getIndId() == getIntendDetailListforEdit.get(i).getIndDId()) {
										getIntendDetailListforEdit.get(i).setIndFyr(getIntendDetailListforEdit.get(i).getIndFyr()+poHeaderForApprove.getPoDetailList().get(j).getItemQty());
										getIntendDetailListforEdit.get(i).setIndMDate(DateConvertor.convertToYMD(getIntendDetailListforEdit.get(i).getIndMDate()));
										if (getIntendDetailListforEdit.get(i).getIndFyr() == 0)
											getIntendDetailListforEdit.get(i).setIndDStatus(2);
										else if (getIntendDetailListforEdit.get(i).getIndFyr() > 0 && getIntendDetailListforEdit.get(i).getIndFyr() < getIntendDetailListforEdit.get(i).getIndQty())
											getIntendDetailListforEdit.get(i).setIndDStatus(1);
										else
											getIntendDetailListforEdit.get(i).setIndDStatus(0);
										getIntendDetailforJsp.add(getIntendDetailListforEdit.get(i));
										
										break;
									}
								}
						}
					}
					
					System.out.println(getIntendDetailforJsp);
					if(getIntendDetailforJsp.size()>0) {
						
						 ErrorMessage errorMessage = rest.postForObject(Constants.url + "/updateIndendPendingQty",
								 getIntendDetailforJsp, ErrorMessage.class);
						 System.out.println("After Approve    " + errorMessage);
					}
					
					
					
					//----------------auto MRN--------------------------------------
					  
						 if(flag==1) {
							 
							  map = new LinkedMultiValueMap<>();
								map.add("poId", poHeaderForApprove.getPoId());
								GetPoHeaderList	 poHeaderForAutoMrn = rest.postForObject(Constants.url + "/getPoHeaderAndDetailByHeaderId", map,
										GetPoHeaderList.class); 
							 MrnHeader mrnHeader = new MrnHeader();
								//----------------------------Inv No---------------------------------
								DocumentBean docBean=null;
								 
								try {
									
									map = new LinkedMultiValueMap<String, Object>();
									map.add("docId", 3);
									map.add("catId", 1);
									map.add("date", DateConvertor.convertToYMD(poHeaderForAutoMrn.getPoDate()));
									map.add("typeId", poHeaderForAutoMrn.getPoType());
									RestTemplate restTemplate = new RestTemplate();

									 docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
									String indMNo=docBean.getSubDocument().getCategoryPrefix()+"";
									int counter=docBean.getSubDocument().getCounter();
									int counterLenth = String.valueOf(counter).length();
									counterLenth = 4 - counterLenth;
									StringBuilder code = new StringBuilder(indMNo+"");

									for (int i = 0; i < counterLenth; i++) {
										String j = "0";
										code.append(j);
									}
									code.append(String.valueOf(counter));
									
									mrnHeader.setMrnNo(""+code);
									
									docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter()+1);
								}catch (Exception e) {
									e.printStackTrace();
								}
								
								List<MrnDetail> mrnDetailList = new ArrayList<MrnDetail>();

								mrnHeader.setBillDate(DateConvertor.convertToYMD(poHeaderForAutoMrn.getVendQuationDate()));
								mrnHeader.setBillNo(poHeaderForAutoMrn.getVendQuation());
								mrnHeader.setDelStatus(1);
								mrnHeader.setDocDate(DateConvertor.convertToYMD(poHeaderForAutoMrn.getVendQuationDate())); 
								mrnHeader.setGateEntryDate(DateConvertor.convertToYMD(poHeaderForAutoMrn.getVendQuationDate())); 
								mrnHeader.setLrDate(DateConvertor.convertToYMD(poHeaderForAutoMrn.getVendQuationDate())); 
								mrnHeader.setMrnDate(DateConvertor.convertToYMD(poHeaderForAutoMrn.getVendQuationDate())); 
								mrnHeader.setMrnStatus(2);
								mrnHeader.setMrnType(poHeaderForAutoMrn.getPoType());
								mrnHeader.setRemark1("-");
								mrnHeader.setRemark2("def"); 
								mrnHeader.setUserId(1);
								mrnHeader.setVendorId(poHeaderForAutoMrn.getVendId());
								
								for (GetPoDetailList detail : poHeaderForAutoMrn.getPoDetailList()) {
									
									if(detail.getStatus()==2) {
 
										MrnDetail mrnDetail = new MrnDetail(); 
										mrnDetail.setIndentQty(detail.getIndedQty()); 
										mrnDetail.setPoQty(detail.getItemQty()); 
										mrnDetail.setMrnQty(detail.getItemQty()); 
										mrnDetail.setItemId(detail.getItemId()); 
										mrnDetail.setPoId(detail.getPoId()); 
										mrnDetail.setPoNo(poHeaderForAutoMrn.getPoNo()); 
										mrnDetail.setMrnDetailStatus(1); 
										mrnDetail.setBatchNo("Default Batch KKKK-00456");
										mrnDetail.setDelStatus(1); 
										mrnDetail.setPoDetailId(detail.getPoDetailId()); 
										mrnDetail.setChalanQty(detail.getItemQty()); 
										mrnDetail.setRemainingQty(detail.getItemQty());
										mrnDetail.setApproveQty(detail.getItemQty());
										mrnDetail.setMrnQtyBeforeEdit(-1); 
										mrnDetailList.add(mrnDetail); 
									}
									 
								}

								mrnHeader.setMrnDetailList(mrnDetailList);
								MrnHeader mrnHeaderRes = rest.postForObject(Constants.url + "/saveMrnHeadAndDetail", mrnHeader,
											MrnHeader.class);
								
							  SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(), SubDocument.class);
 
						 }
					
				}
				 
			}
			
			/*System.out.println(poHeaderForApprove);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("poId", poId);
			map.add("poDetalId", poDetalId.substring(1, poDetalId.length()));
			map.add("status", status);
			System.out.println("map " + map);
			ErrorMessage approved = rest.postForObject(Constants.url + "/updateStatusWhileApprov", map, ErrorMessage.class);*/
 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(approve==1) {
			ret = "redirect:/firstApprovePurchaseOrder";
		}
		else {
			ret = "redirect:/secondApprovePurchaseOrder";
		}

		return ret;
	}
	
	
	
	@RequestMapping(value = "/exportExcelforPo", method = RequestMethod.GET)
	@ResponseBody
	public List<ImportExcelForPo> exportExcelforPo(HttpServletRequest request, HttpServletResponse response) {

		
		List<ImportExcelForPo> list = new ArrayList<>();
		try {
			  
			//String excelFilePath = "C:/pdf/Books.xlsx";
			//String excelFilePath = "http://132.148.143.124:8080/triluploads/Books.xlsx";
			String excelFilePath = "/opt/tomcat-latest/webapps/uploads/Books.xlsx";
			//String excelFilePath = "/home/lenovo/Downloads/Books.xlsx";
	        FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
	         
	        Workbook workbook = new XSSFWorkbook(inputStream);
	        Sheet firstSheet = workbook.getSheetAt(0);
	        Iterator<Row> iterator = firstSheet.iterator();
	         
	        DataFormatter formatter = new DataFormatter(Locale.US);
	        
	        while (iterator.hasNext()) {
	            Row nextRow = iterator.next();
	            Iterator<Cell> cellIterator = nextRow.cellIterator();
	             
	            int index=0;
	            ImportExcelForPo importExcelForPo = new ImportExcelForPo();
	            
	            while (cellIterator.hasNext()) {
	                Cell cell = cellIterator.next();
	                
	                try {
	                	 
	                //importExcelForPo.setItemId(Integer.parseInt(cell.getStringCellValue()));
	                 switch (cell.getCellType()) {
	                 
	                    case Cell.CELL_TYPE_STRING:
	                        System.out.print(cell.getStringCellValue());
	                        break;
	                    case Cell.CELL_TYPE_BOOLEAN:
	                        System.out.print(cell.getBooleanCellValue());
	                        break;
	                    case Cell.CELL_TYPE_NUMERIC:
	                        System.out.print(cell.getNumericCellValue());
	                        break; 
	               }
	                 
	                 if(index==0)
		                	importExcelForPo.setItemId(Integer.parseInt(formatter.formatCellValue(cell)));
		                else if(index==1)
		                	importExcelForPo.setQty(Float.parseFloat(formatter.formatCellValue(cell)));
		                else if(index==2)
		                	importExcelForPo.setRate(Float.parseFloat(formatter.formatCellValue(cell)));
	                
	                index++;
	                
	                System.out.print(" - ");
	                } catch (Exception e) {
	        			 
	        		}
	            }
	            
	            list.add(importExcelForPo);
	            System.out.println();
	        }
	         
	        workbook.close();
	        inputStream.close();
	    
	        
	        
	        for(int i=0 ; i<intendDetailList.size() ; i++) {
	        	
	        	for(int j=0 ; j< list.size() ; j++) {
	        		
	        		if(intendDetailList.get(i).getItemId()==list.get(j).getItemId()) {
	        			
	        			list.get(j).setIndDetailId(intendDetailList.get(i).getIndDId());
	        		}
	        		
	        	}
	        	
	        } 
	        
	        System.out.println("list---------" + list);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
