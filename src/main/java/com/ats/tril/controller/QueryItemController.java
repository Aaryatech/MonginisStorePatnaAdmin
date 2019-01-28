package com.ats.tril.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.getqueryitems.GetDamageQueryItem;
import com.ats.tril.model.getqueryitems.GetEnquiryQueryItem;
import com.ats.tril.model.getqueryitems.GetIndentQueryItem;
import com.ats.tril.model.getqueryitems.GetIssueQueryItem;
import com.ats.tril.model.getqueryitems.GetMrnQueryItem;
import com.ats.tril.model.getqueryitems.GetPoQueryItem;
import com.ats.tril.model.getqueryitems.GetRejMemoQueryItem;
import com.ats.tril.model.getqueryitems.GetRetNonRetQueryItem;

@Controller
@Scope("session")


public class QueryItemController {
	
	List<GetDamageQueryItem> damagedItemList;
	
	List<GetEnquiryQueryItem> enquiryItemList;
	
	List<GetIndentQueryItem> indentItemList;
	
	List<GetIssueQueryItem> issueItemList;
	
	List<GetMrnQueryItem> mrnItemList;
	
	List<GetPoQueryItem> poItemList;
	
	List<GetRejMemoQueryItem> rejMemoItemList;
	
	List<GetRetNonRetQueryItem> retNonRetItemList;
	
	List<GetItem> itemList;
	
	
	RestTemplate rest = new RestTemplate();
	@RequestMapping(value = "/getQueryItemList", method = RequestMethod.GET)
	public ModelAndView getItemList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("showqueryitems");
		try {

			GetItem[] item = rest.getForObject(Constants.url + "/getAllItems",  GetItem[].class); 
			 itemList = new ArrayList<GetItem>(Arrays.asList(item));
			model.addObject("itemList", itemList);

			
			ZoneId z = ZoneId.of("Asia/Calcutta");

			LocalDate date = LocalDate.now(z);
			DateTimeFormatter formatters = DateTimeFormatter.ofPattern("d-MM-uuuu");
			String todaysDate = date.format(formatters);
			model.addObject("date", todaysDate);
			
		} catch (Exception e) {
			
			System.err.println("Exception in getting getQueryItemList" +e.getMessage());
			
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/getItemFromItemListforQuery", method = RequestMethod.GET)
	@ResponseBody
	public GetItem getItemFromItemListforQuery(HttpServletRequest request, HttpServletResponse response) {

		GetItem getItem = new GetItem();
		
		try {

			int itemId = Integer.parseInt(request.getParameter("itemId"));
			
			 for(int i=0 ; i<itemList.size();i++) {
				 
				 if(itemList.get(i).getItemId()==itemId) {
					 
					 getItem=itemList.get(i);
					 break;
				 }
			 }
 
			System.out.println(getItem);
		} catch (Exception e) {
			
			System.err.println("Exception in getting getQueryItemList" +e.getMessage());
			
			e.printStackTrace();
		}

		return getItem;
	}
	
	//
	@RequestMapping(value = "/getQueryItemDetail", method = RequestMethod.POST)
	public ModelAndView getIndentQueryItems(HttpServletRequest request, HttpServletResponse response) {

	int docId = Integer.parseInt(request.getParameter("docType"));
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	String docName="";
	String date = request.getParameter("date");
	ModelAndView model=null;
	try {
		
		
	System.err.println("item Id  "+itemId);
	DocumentBean docBean = null;
	 model = new ModelAndView("queryItemList");
	if (date == "" || date==null) {
		Date currDate = new Date();
		//date = new SimpleDateFormat("yyyy-MM-dd").format(currDate);
	}

	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	map.add("docId", docId);
	map.add("date", DateConvertor.convertToYMD(date));

	RestTemplate restTemplate = new RestTemplate();

	docBean = restTemplate.postForObject(Constants.url + "getDocumentInfo", map, DocumentBean.class);
	System.err.println("Doc" + docBean.toString());
	
	map = new LinkedMultiValueMap<String, Object>();
	
	map.add("itemId", itemId);
	map.add("fromDate", DateConvertor.convertToDMY(docBean.getFromDate()));
	
	if(docId==1) {
		//Indent
		docName="Indent";
		GetIndentQueryItem[] indentItems=restTemplate.postForObject(Constants.url + "getIndentQueryItems", map, GetIndentQueryItem[].class);
		
		indentItemList=new ArrayList<GetIndentQueryItem>(Arrays.asList(indentItems));
		
		model.addObject("itemList",indentItemList);

	}
	
	if(docId==2) {
		//PO
		docName="PO";
		GetPoQueryItem[] poItems=restTemplate.postForObject(Constants.url + "getPoQueryItem", map, GetPoQueryItem[].class);
		
		poItemList=new ArrayList<GetPoQueryItem>(Arrays.asList(poItems));
		model.addObject("itemList",poItemList);

	}
	
	if(docId==3) {
		//MRN
		docName="MRN";
		GetMrnQueryItem[] mrnItems=restTemplate.postForObject(Constants.url + "getMrnQueryItem", map, GetMrnQueryItem[].class);
		
		mrnItemList=new ArrayList<GetMrnQueryItem>(Arrays.asList(mrnItems));
		model.addObject("itemList",mrnItemList);

	}
	//done upto this
	
	if(docId==5|| docId==4) {
		//Ret Non Ret
		
		docName="Retunable/NonReturnable";
		GetRetNonRetQueryItem[] retNonRetItems=restTemplate.postForObject(Constants.url + "getRetNonRetQueryItem", map, GetRetNonRetQueryItem[].class);
		
		retNonRetItemList=new ArrayList<GetRetNonRetQueryItem>(Arrays.asList(retNonRetItems));
		model.addObject("itemList",retNonRetItemList);

	}
	
	if(docId==6) {
		//Issue
		docName="Issue";
		GetIssueQueryItem[] issueItems=restTemplate.postForObject(Constants.url + "getIssueQueryItem", map, GetIssueQueryItem[].class);
		
		issueItemList=new ArrayList<GetIssueQueryItem>(Arrays.asList(issueItems));
		model.addObject("itemList",issueItemList);

	}
	
	
	if(docId==8) {
		//Enquiry
		docName="Enquiry";
		GetEnquiryQueryItem[] enquiryItems=restTemplate.postForObject(Constants.url + "getEnquiryQueryItem", map, GetEnquiryQueryItem[].class);
		
		enquiryItemList=new ArrayList<GetEnquiryQueryItem>(Arrays.asList(enquiryItems));
		
		model.addObject("itemList",enquiryItemList);

	}
	
	//ask for these two 
	if(docId==9) {
		// rej memo
		docName="Rejection Memo";
		GetRejMemoQueryItem[] rejMemoItems=restTemplate.postForObject(Constants.url + "getRejMemoQueryItem", map, GetRejMemoQueryItem[].class);
		
		rejMemoItemList=new ArrayList<GetRejMemoQueryItem>(Arrays.asList(rejMemoItems));
		
		model.addObject("itemList",rejMemoItemList);

	}
	
	if(docId==10) {
		//damaged
		docName="Damage";
		GetDamageQueryItem[] damageItems=restTemplate.postForObject(Constants.url + "getDamageQueryItem", map, GetDamageQueryItem[].class);
		
		damagedItemList=new ArrayList<GetDamageQueryItem>(Arrays.asList(damageItems));
		
		model.addObject("itemList",damagedItemList);

	}
	
	
	}catch (Exception e) {
		
		System.err.println("Exce in /getQueryItemDetail   "+e.getMessage());
		
		e.printStackTrace();
	}
	//
	
	
	
	
	model.addObject("docType",docName);
	model.addObject("docId",docId);
	
	return model;
	
	}
	
}
