package com.ats.tril.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.Category;
import com.ats.tril.model.EnquiryDetail;
import com.ats.tril.model.EnquiryHeader;
import com.ats.tril.model.ErrorMessage;
import com.ats.tril.model.GetEnquiryDetail;
import com.ats.tril.model.GetEnquiryHeader;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.GetQuatationDetail;
import com.ats.tril.model.GetQuatationHeader;
import com.ats.tril.model.Item;
import com.ats.tril.model.QuatationDetail;
import com.ats.tril.model.QuatationHeader;
import com.ats.tril.model.Vendor;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.doc.SubDocument;
import com.ats.tril.model.indent.GetIndentByStatus;
import com.ats.tril.model.indent.GetIntendDetail;

@Controller
@Scope("session")
public class EnquiryController {
	
	List<EnquiryDetail> addItemInEnquiryDetail = new ArrayList<EnquiryDetail>();
	List<GetQuatationDetail> addItemInEditEnquiryDetail = new ArrayList<GetQuatationDetail>();
	GetQuatationHeader editEnquiry = new GetQuatationHeader();
	
	RestTemplate rest = new RestTemplate();
	
	@RequestMapping(value = "/addEnquiry", method = RequestMethod.GET)
	public ModelAndView addCategory(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/addEnquiry");
		try {
			addItemInEnquiryDetail = new ArrayList<EnquiryDetail>();
			/*Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			
			model.addObject("vendorList", vendorList);*/
			
			GetItem[] item = rest.getForObject(Constants.url + "/getAllItems",  GetItem[].class); 
			List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item));
			model.addObject("itemList", itemList);
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			model.addObject("date", sf.format(date));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/addItmeInEnquiryList", method = RequestMethod.GET)
	@ResponseBody
	public List<EnquiryDetail> addItmeInEnquiryList(HttpServletRequest request, HttpServletResponse response) {

		
		try {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			float qty = Float.parseFloat(request.getParameter("qty"));
			String enqItemDate =  request.getParameter("enqItemDate"); 
			String itemRemark = request.getParameter("itemRemark");
			String editIndex = request.getParameter("editIndex");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("itemId", itemId);
			GetItem  item = rest.postForObject(Constants.url + "/getItemByItemId",map, GetItem .class);
			  
			if(editIndex.equalsIgnoreCase("") || editIndex.equalsIgnoreCase(null))
			  {
					EnquiryDetail enquiryDetail = new EnquiryDetail();
					enquiryDetail.setItemId(itemId);
					enquiryDetail.setEnqQty(qty);
					enquiryDetail.setEnqRemark(itemRemark);
					enquiryDetail.setEnqDetailDate(enqItemDate);
					enquiryDetail.setItemCode(item.getItemCode()+"-"+item.getItemDesc());
					enquiryDetail.setDelStatus(1);
					addItemInEnquiryDetail.add(enquiryDetail);
			  }
			 else
			  {
				 	int index = Integer.parseInt(editIndex); 
				 	addItemInEnquiryDetail.get(index).setItemId(itemId);
				 	addItemInEnquiryDetail.get(index).setEnqQty(qty);
				 	addItemInEnquiryDetail.get(index).setEnqRemark(itemRemark);
				 	addItemInEnquiryDetail.get(index).setEnqDetailDate(enqItemDate);
				 	addItemInEnquiryDetail.get(index).setItemCode(item.getItemCode()+"-"+item.getItemDesc()); 
			  }
			
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addItemInEnquiryDetail;
	}
	
	@RequestMapping(value = "/deleteItemFromEnquiry", method = RequestMethod.GET)
	@ResponseBody
	public List<EnquiryDetail> deleteItemFromEnquiry(HttpServletRequest request, HttpServletResponse response) {

		
		try {
			
			int index = Integer.parseInt(request.getParameter("index"));  
			 
			addItemInEnquiryDetail.remove(index);
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addItemInEnquiryDetail;
	}
	
	@RequestMapping(value = "/editItemInAddEnquiry", method = RequestMethod.GET)
	@ResponseBody
	public EnquiryDetail editItemInAddEnquiry(HttpServletRequest request, HttpServletResponse response) {

		EnquiryDetail edit = new EnquiryDetail();
		
		try {
			
			int index = Integer.parseInt(request.getParameter("index"));  
			 
			edit = addItemInEnquiryDetail.get(index);
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return edit;
	}
	
	@RequestMapping(value = "/insertEnquiry", method = RequestMethod.POST) 
	public String insertEnquiry(HttpServletRequest request, HttpServletResponse response) {

		 
		
		try {
			
			 
			
			 
			String enqRemark = request.getParameter("enqRemark"); 
			String enqDate = request.getParameter("enqDate"); 
			
			String Date = DateConvertor.convertToYMD(enqDate);
			
			DocumentBean docBean = null;
			
			try {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 11);
				map.add("catId", 1);
				map.add("date", DateConvertor.convertToYMD(enqDate));
				map.add("typeId", 1);
				RestTemplate restTemplate = new RestTemplate();

				docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
				 
			} catch (Exception e) {
				e.printStackTrace();
			}
			 
			 
				 
			QuatationHeader enquiryHeader = new QuatationHeader();
				 
				 try {
					 
						String indMNo = docBean.getSubDocument().getCategoryPrefix() + "";
						int counter = docBean.getSubDocument().getCounter();
						int counterLenth = String.valueOf(counter).length();
						counterLenth = 4 - counterLenth;
						StringBuilder code = new StringBuilder(indMNo + "");

						for (int k = 0; k < counterLenth; k++) {
							String j = "0";
							code.append(j);
						}
						code.append(String.valueOf(counter));

						enquiryHeader.setEnqNo("" + code);

						docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter() + 1); 
					} catch (Exception e) {
						e.printStackTrace();
					}
				 
				 
				 enquiryHeader.setEnqRemark(enqRemark);
				 enquiryHeader.setEnqDate(Date);
				 enquiryHeader.setDelStatus(1);
				 List<QuatationDetail> detailList = new ArrayList<QuatationDetail>();
				 
				 for(int i=0 ; i<addItemInEnquiryDetail.size() ; i++) {
					 QuatationDetail quatationDetail = new QuatationDetail();
					 quatationDetail.setEnqDetailDate(DateConvertor.convertToYMD(addItemInEnquiryDetail.get(i).getEnqDetailDate()));
					 quatationDetail.setItemId(addItemInEnquiryDetail.get(i).getItemId());
					 quatationDetail.setEnqQty(addItemInEnquiryDetail.get(i).getEnqQty());
					 quatationDetail.setEnqRemark(addItemInEnquiryDetail.get(i).getEnqRemark());
					 quatationDetail.setDelStatus(1);
					 detailList.add(quatationDetail);
				 }
				 
				 enquiryHeader.setQuatationDetailList(detailList);
				  
			 
				 QuatationHeader res = rest.postForObject(Constants.url + "/saveQuatationHeaderAndDetail", enquiryHeader, QuatationHeader.class);
			System.out.println(res);
			
			if (res != null) {
			 
						SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(),
								SubDocument.class);
					 
			}
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfEnquiry";
	}
	
	
	@RequestMapping(value = "/listOfEnquiry", method = RequestMethod.GET)
	public ModelAndView listOfEnquiry(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/listOfEnquiry");
		try {
			
			Date date = new Date();
			SimpleDateFormat  sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat  display = new SimpleDateFormat("dd-MM-yyyy");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			
			if(request.getParameter("fromDate")==null || request.getParameter("toDate")==null)
			{
				map.add("fromDate", sf.format(date));
				map.add("toDate", sf.format(date)); 
				GetQuatationHeader[] list = rest.postForObject(Constants.url + "/getQuatationHeaderListBetweenDate",map, GetQuatationHeader[].class);
				List<GetQuatationHeader> enquiryList = new ArrayList<GetQuatationHeader>(Arrays.asList(list));
				
				model.addObject("enquiryList", enquiryList);
				model.addObject("fromDate", display.format(date));
				model.addObject("toDate", display.format(date));
			}
			else
			{
				String fromDate = request.getParameter("fromDate");
				String toDate = request.getParameter("toDate");
				
				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate)); 
				GetQuatationHeader[] list = rest.postForObject(Constants.url + "/getQuatationHeaderListBetweenDate",map, GetQuatationHeader[].class);
				List<GetQuatationHeader> enquiryList = new ArrayList<GetQuatationHeader>(Arrays.asList(list));
				
				model.addObject("enquiryList", enquiryList);
				model.addObject("fromDate", fromDate);
				model.addObject("toDate", toDate);
			}
			
			
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/getEnquiryListByDate", method = RequestMethod.GET)
	@ResponseBody
	public List<GetEnquiryHeader> getEnquiryListByDate(HttpServletRequest request, HttpServletResponse response) {

		List<GetEnquiryHeader> enquiryList = new ArrayList<GetEnquiryHeader>();
		try {
			
			 String fromDate = request.getParameter("fromDate");
			 String toDate = request.getParameter("toDate");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate",DateConvertor.convertToYMD(toDate));
			 
			GetEnquiryHeader[] list = rest.postForObject(Constants.url + "/getEnquiryHeaderListBetweenDate",map, GetEnquiryHeader[].class);
			 enquiryList = new ArrayList<GetEnquiryHeader>(Arrays.asList(list));
			 
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return enquiryList;
	}
	
	@RequestMapping(value = "/deleteEnquiry/{enqId}", method = RequestMethod.GET)
	public String deleteEnquiry(@PathVariable int enqId, HttpServletRequest request, HttpServletResponse response) {
 
		try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("enqId",enqId);
			
			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deleteQuatationHeader",map,  ErrorMessage.class); 
			System.out.println(errorMessage);
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfEnquiry";
	}
	
	@RequestMapping(value = "/editEnquiry/{enqId}", method = RequestMethod.GET)
	public ModelAndView editEnquiry(@PathVariable int enqId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/editEnquiry");
		try {
			addItemInEditEnquiryDetail = new ArrayList<GetQuatationDetail>();
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("enqId",enqId);
			
			 editEnquiry = rest.postForObject(Constants.url + "/getQuatationHeaderAndDetail",map, GetQuatationHeader.class);
			addItemInEditEnquiryDetail = editEnquiry.getQuatationDetailList();
			  
			GetItem[] item = rest.getForObject(Constants.url + "/getAllItems",  GetItem[].class); 
			List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item));
			model.addObject("itemList", itemList);
			
			model.addObject("editEnquiry", editEnquiry);
			
			/*Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			
			model.addObject("vendorList", vendorList);*/

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteItemFromEditEnquiry", method = RequestMethod.GET)
	@ResponseBody
	public List<GetQuatationDetail> deleteItemFromEditEnquiry(HttpServletRequest request, HttpServletResponse response) {

		
		try {
			
			int index = Integer.parseInt(request.getParameter("index"));  
			 
			if(addItemInEditEnquiryDetail.get(index).getEnqDetailId()!=0)
				addItemInEditEnquiryDetail.get(index).setDelStatus(0);
			else
				addItemInEditEnquiryDetail.remove(index);
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addItemInEditEnquiryDetail;
	}
	
	@RequestMapping(value = "/addItmeInEditEnquiryList", method = RequestMethod.GET)
	@ResponseBody
	public List<GetQuatationDetail> addItmeInEditEnquiryList(HttpServletRequest request, HttpServletResponse response) {

		
		try {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			float qty = Float.parseFloat(request.getParameter("qty")); 
			String enqItemDate =  request.getParameter("enqItemDate"); 
			String itemRemark = request.getParameter("itemRemark");
			String editIndex = request.getParameter("editIndex");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("itemId", itemId);
			GetItem  item = rest.postForObject(Constants.url + "/getItemByItemId",map, GetItem .class);
			  
			if(editIndex.equalsIgnoreCase("") || editIndex.equalsIgnoreCase(null))
			  {
					GetQuatationDetail enquiryDetail = new GetQuatationDetail();
					enquiryDetail.setItemId(itemId);
					enquiryDetail.setEnqQty(qty);
					enquiryDetail.setEnqRemark(itemRemark);
					enquiryDetail.setEnqDetailDate(enqItemDate);
					enquiryDetail.setItemCode(item.getItemCode()+"-"+item.getItemDesc());
					enquiryDetail.setDelStatus(1);
					addItemInEditEnquiryDetail.add(enquiryDetail);
			  }
			 else
			  {
				 	int index = Integer.parseInt(editIndex); 
				 	addItemInEditEnquiryDetail.get(index).setItemId(itemId);
				 	addItemInEditEnquiryDetail.get(index).setEnqQty(qty);
				 	addItemInEditEnquiryDetail.get(index).setEnqRemark(itemRemark);
				 	addItemInEditEnquiryDetail.get(index).setEnqDetailDate(enqItemDate);
				 	addItemInEditEnquiryDetail.get(index).setItemCode(item.getItemCode()+"-"+item.getItemDesc()); 
			  }
			
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addItemInEditEnquiryDetail;
	}
	
	@RequestMapping(value = "/editItemInEditEnquiry", method = RequestMethod.GET)
	@ResponseBody
	public GetQuatationDetail editItemInEditEnquiry(HttpServletRequest request, HttpServletResponse response) {

		GetQuatationDetail edit = new GetQuatationDetail();
		
		try {
			
			int index = Integer.parseInt(request.getParameter("index"));  
			 
			edit = addItemInEditEnquiryDetail.get(index);
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return edit;
	}
	
	@RequestMapping(value = "/submitEditEnquiry", method = RequestMethod.POST) 
	public String submitEditEnquiry(HttpServletRequest request, HttpServletResponse response) {

		 
		
		try {
			 
			 
			String enqRemark = request.getParameter("enqRemark"); 
			String enqDate = request.getParameter("enqDate"); 
			
			String Date = DateConvertor.convertToYMD(enqDate);
			  
			editEnquiry.setEnqRemark(enqRemark);
			editEnquiry.setEnqDate(Date);
			editEnquiry.setDelStatus(1); 
			
			for(int i=0 ; i<addItemInEditEnquiryDetail.size() ; i++) {
				
				addItemInEditEnquiryDetail.get(i).setEnqDetailDate(DateConvertor.convertToYMD(addItemInEditEnquiryDetail.get(i).getEnqDetailDate()));
			}
			
			editEnquiry.setQuatationDetailList(addItemInEditEnquiryDetail); 
				   
			QuatationHeader res = rest.postForObject(Constants.url + "/saveQuatationHeaderAndDetail", editEnquiry, QuatationHeader.class);
			System.out.println(res);
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfEnquiry";
	}
	
	@RequestMapping(value = "/addEnquiryFromQuotation", method = RequestMethod.GET)
	public ModelAndView addEnquiryFromQuotation(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/addEnquiryFromQuotation");
		try {
			addItemInEnquiryDetail = new ArrayList<EnquiryDetail>();
			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			
			model.addObject("vendorList", vendorList); 
			
			GetQuatationHeader[] getQuatationHeader = rest.getForObject(Constants.url + "/getQuotationListForEnquiry",  GetQuatationHeader[].class); 
			List<GetQuatationHeader> getQuatationHeaderList = new ArrayList<GetQuatationHeader>(Arrays.asList(getQuatationHeader));
			model.addObject("getQuatationHeaderList", getQuatationHeaderList); 
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			model.addObject("enqDateTemp", sf.format(date));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	List<GetQuatationDetail> getQuatationDetailListForEnq = new ArrayList<GetQuatationDetail>();
	EnquiryHeader enquiryHeaderFromQuat = new EnquiryHeader();
	List<EnquiryDetail> enqDetailList = new ArrayList<EnquiryDetail>();
	GetEnquiryHeader editEnquiryFromQtn = new GetEnquiryHeader();
	List<GetEnquiryDetail> detailList = new ArrayList<GetEnquiryDetail>();
	
	@RequestMapping(value = "/getQuotationDetailByQutIdForEnquiry", method = RequestMethod.GET)
	@ResponseBody
	public List<GetQuatationDetail> geIntendDetailByIndIdForEnquiry(HttpServletRequest request,
			HttpServletResponse response) {

		try {

			int qutId = Integer.parseInt(request.getParameter("qutId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("qutId", qutId);
			GetQuatationDetail[] indentTrans = rest.postForObject(Constants.url + "/getQuotationDetailByQutId", map,
					GetQuatationDetail[].class);
			getQuatationDetailListForEnq = new ArrayList<GetQuatationDetail>(Arrays.asList(indentTrans));
			
			System.out.println("getQuatationDetailListForEnq " + getQuatationDetailListForEnq);
			if(qutId==enquiryHeaderFromQuat.getIndId())
			{
				for(int i = 0 ; i < getQuatationDetailListForEnq.size() ; i++)
				{
					for(int j = 0 ; j < enqDetailList.size() ; j++)
					{
						if(getQuatationDetailListForEnq.get(i).getItemId()==enqDetailList.get(j).getItemId()) {
							getQuatationDetailListForEnq.get(i).setPoQty(enqDetailList.get(j).getEnqQty());
							break;
						}
					}
					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getQuatationDetailListForEnq;
	}
	
	@RequestMapping(value = "/submitEnqListFromQuotation", method = RequestMethod.POST)
	public ModelAndView submitEnqList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/addEnquiryFromQuotation");

		try {
			enqDetailList = new ArrayList<>();
			enquiryHeaderFromQuat = new EnquiryHeader();
 

			int enqId = Integer.parseInt(request.getParameter("indMId"));
			String[] checkbox = request.getParameterValues("select_to_approve");

			try {
				int vendIdTemp = Integer.parseInt(request.getParameter("vendIdTemp"));
				model.addObject("vendIdTemp", vendIdTemp);
				System.out.println(vendIdTemp);
			} catch (Exception e) {
				 
			}

			try {
				String enqDateTemp = request.getParameter("enqDateTemp");
				model.addObject("enqDateTemp", enqDateTemp);
				System.out.println(enqDateTemp);
			} catch (Exception e) {
				 
			}

			try {
				String enqRemarkTemp = request.getParameter("enqRemarkTemp");
				model.addObject("enqRemarkTemp", enqRemarkTemp);
				System.out.println(enqRemarkTemp);
			} catch (Exception e) {
				 
			}

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			model.addObject("vendorList", vendorList);

			GetQuatationHeader[] getQuatationHeader = rest.getForObject(Constants.url + "/getQuotationListForEnquiry",  GetQuatationHeader[].class); 
			List<GetQuatationHeader> getQuatationHeaderList = new ArrayList<GetQuatationHeader>(Arrays.asList(getQuatationHeader));
			model.addObject("getQuatationHeaderList", getQuatationHeaderList); 
			
			try {
				for (int i = 0; i < getQuatationDetailListForEnq.size(); i++) {
					for (int j = 0; j < checkbox.length; j++) {
						System.out.println(checkbox[j] + getQuatationDetailListForEnq.get(i).getEnqDetailId());
						if (Integer.parseInt(checkbox[j]) == getQuatationDetailListForEnq.get(i).getEnqDetailId()) {
							EnquiryDetail enqDetail = new EnquiryDetail();
							enqDetail.setIndId(getQuatationDetailListForEnq.get(i).getEnqId());
							enqDetail.setIndNo(getQuatationDetailListForEnq.get(i).getIndNo());
							enqDetail.setItemCode(getQuatationDetailListForEnq.get(i).getItemCode());
							enqDetail.setItemId(getQuatationDetailListForEnq.get(i).getItemId()); 
							enqDetail.setEnqRemark(getQuatationDetailListForEnq.get(i).getEnqRemark());
							enqDetail.setEnqDetailDate(getQuatationDetailListForEnq.get(i).getEnqDetailDate()); 
							enqDetail.setDelStatus(1);
							enqDetail.setEnqQty(
									Float.parseFloat(request.getParameter("enqQty" + getQuatationDetailListForEnq.get(i).getEnqDetailId())));
							enqDetail.setEnqRemark(request.getParameter("indRemark" + getQuatationDetailListForEnq.get(i).getEnqDetailId()));

							enqDetailList.add(enqDetail);

							enquiryHeaderFromQuat.setIndNo(getQuatationDetailListForEnq.get(i).getIndNo());
							enquiryHeaderFromQuat.setIndId(enqId);
						}

					}
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
			System.out.println("enqDetailList" + enqDetailList);

			model.addObject("enqDetailList", enqDetailList);
			model.addObject("enqId", enqId);
			model.addObject("enquiryHeader", enquiryHeaderFromQuat);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/insertEnquiryByQuotation", method = RequestMethod.POST)
	public String insertEnquiryByIndent(HttpServletRequest request, HttpServletResponse response) {

		try {

			List<EnquiryHeader> enquiryHeaderList = new ArrayList<EnquiryHeader>();

			String[] vendId = request.getParameterValues("vendId");
			String enqRemark = request.getParameter("enqRemark");
			String enqDate = request.getParameter("enqDate");
 

			String Date = DateConvertor.convertToYMD(enqDate); 
			DocumentBean docBean = null;
			
			try {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 8);
				map.add("catId", 2);
				map.add("date", DateConvertor.convertToYMD(enqDate));
				map.add("typeId", 1);
				RestTemplate restTemplate = new RestTemplate();

				docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
				 
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			for (int i = 0; i < vendId.length; i++) {

				EnquiryHeader insert = new EnquiryHeader();

				 
				try {
 
					String indMNo = docBean.getSubDocument().getCategoryPrefix() + "";
					int counter = docBean.getSubDocument().getCounter();
					int counterLenth = String.valueOf(counter).length();
					counterLenth = 4 - counterLenth;
					StringBuilder code = new StringBuilder(indMNo + "");

					for (int k = 0; k < counterLenth; k++) {
						String j = "0";
						code.append(j);
					}
					code.append(String.valueOf(counter));

					insert.setEnqNo("" + code);

					docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter() + 1);
					System.out.println("docBean " + docBean);
					//docList.add(docBean.getSubDocument());
				} catch (Exception e) {
					e.printStackTrace();
				}
				insert.setVendId(Integer.parseInt(vendId[i]));
				insert.setEnqRemark(enqRemark);
				insert.setEnqDate(Date);
				insert.setDelStatus(1); 
				insert.setIndId(enquiryHeaderFromQuat.getIndId());
				insert.setIndNo(enquiryHeaderFromQuat.getIndNo());
				insert.setEnquiryDetailList(enqDetailList);
				enquiryHeaderList.add(insert);

			}

			ErrorMessage res = rest.postForObject(Constants.url + "/saveEnquiryHeaderAndDetail", enquiryHeaderList,
					ErrorMessage.class);
			if (res.isError() == false) {
				try {
					/*for (int l = 0; l < docList.size(); l++) {*/
					System.out.println("docBean " + docBean);
						SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc",  docBean.getSubDocument(),
								SubDocument.class);
					//}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfEnqFromQuotation";
	}
	
	@RequestMapping(value = "/listOfEnqFromQuotation", method = RequestMethod.GET)
	public ModelAndView listOfEnqFromQuotation(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/listOfEnqFromQuotation");
		try {

			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat display = new SimpleDateFormat("dd-MM-yyyy");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("fromDate", sf.format(date));
			map.add("toDate", sf.format(date));
			map.add("status",0);
			
			GetEnquiryHeader[] list = rest.postForObject(Constants.url + "/getEnqHeaderListBetweenDate", map,
					GetEnquiryHeader[].class);
			List<GetEnquiryHeader> enquiryList = new ArrayList<GetEnquiryHeader>(Arrays.asList(list));

			model.addObject("enquiryList", enquiryList);
			model.addObject("date", display.format(date));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/getEnqListByDateForQuotation", method = RequestMethod.GET)
	@ResponseBody
	public List<GetEnquiryHeader> getEnqListByDateForQuotation(HttpServletRequest request, HttpServletResponse response) {

		List<GetEnquiryHeader> enquiryList = new ArrayList<GetEnquiryHeader>();
		try {

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			int status = Integer.parseInt(request.getParameter("status"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));
			map.add("status", status);

			GetEnquiryHeader[] list = rest.postForObject(Constants.url + "/getEnqHeaderListBetweenDate", map,
					GetEnquiryHeader[].class);
			enquiryList = new ArrayList<GetEnquiryHeader>(Arrays.asList(list));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return enquiryList;
	}
	
	@RequestMapping(value = "/deleteEnqFromQuotation/{enqId}", method = RequestMethod.GET)
	public String deleteEnqFromQuotation(@PathVariable int enqId, HttpServletRequest request, HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("enqId", enqId);

			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deleteEnquiryHeader", map,
					ErrorMessage.class);
			System.out.println(errorMessage);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfEnqFromQuotation";
	}
	
	@RequestMapping(value = "/editEnqFromQuotation/{enqId}", method = RequestMethod.GET)
	public ModelAndView editEnqFromQuotation(@PathVariable int enqId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/editEnqFromQuotation");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("enqId", enqId);
			getQuatationDetailListForEnq = new ArrayList<>();
			
			editEnquiryFromQtn = rest.postForObject(Constants.url + "/getEnquiryHeaderAndDetail", map,
					GetEnquiryHeader.class);
			detailList = editEnquiryFromQtn.getEnquiryDetailList();

			System.out.println("detailList" + detailList);

			model.addObject("editEnquiry", editEnquiryFromQtn);
			model.addObject("detailList", detailList);

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);

			/*MultiValueMap<String, Object> map2 = new LinkedMultiValueMap<>();
			map2.add("status", "0,1");
			GetIndentByStatus[] inted = rest.postForObject(Constants.url + "/getIntendsByStatusWithoutPoType", map2,
					GetIndentByStatus[].class);
			List<GetIndentByStatus> intedList = new ArrayList<GetIndentByStatus>(Arrays.asList(inted));
			model.addObject("intedList", intedList);*/

			/*int qtnId = editEnquiryFromQtn.getIndId();
			System.out.println("qtnId" + qtnId);
			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("qutId", qtnId);
			GetQuatationDetail[] indentTrans = rest.postForObject(Constants.url + "/getQuotationDetailByQutId", map1,
					GetQuatationDetail[].class);
			getQuatationDetailListForEnq = new ArrayList<GetQuatationDetail>(Arrays.asList(indentTrans));
			model.addObject("getQuatationDetailListForEnq", getQuatationDetailListForEnq);*/

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteItemFromEditEnquiryFromQuotation", method = RequestMethod.GET)
	@ResponseBody
	public List<GetEnquiryDetail> deleteItemFromEditEnquiryFromQuotation(HttpServletRequest request, HttpServletResponse response) {

		
		try {
			
			int index = Integer.parseInt(request.getParameter("index"));  
			 
			if(detailList.get(index).getEnqDetailId()!=0)
				detailList.get(index).setDelStatus(0);
			else
				detailList.remove(index);
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return detailList;
	}
	
	@RequestMapping(value = "/geQuotationDetailByQutIdForEditEnquiry", method = RequestMethod.GET)
	@ResponseBody
	public List<GetQuatationDetail> geQuotationDetailByQutIdForEditEnquiry(HttpServletRequest request,
			HttpServletResponse response) {

		try {

			int qutId = Integer.parseInt(request.getParameter("qutId"));

			MultiValueMap<String, Object> map1 = new LinkedMultiValueMap<String, Object>();
			map1.add("qutId", qutId);
			GetQuatationDetail[] indentTrans = rest.postForObject(Constants.url + "/getQuotationDetailByQutId", map1,
					GetQuatationDetail[].class);
			getQuatationDetailListForEnq = new ArrayList<GetQuatationDetail>(Arrays.asList(indentTrans)); 
			 
			for(int j = 0 ; j<detailList.size() ; j++) {
			 		
				for(int i = 0 ; i<getQuatationDetailListForEnq.size() ; i++) {
					if(getQuatationDetailListForEnq.get(i).getItemId()==detailList.get(j).getItemId() && detailList.get(j).getDelStatus()==1)
					{
						getQuatationDetailListForEnq.remove(i);
					}
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getQuatationDetailListForEnq;
	}
	
	@RequestMapping(value = "/submitEditEnqFromQuotationList", method = RequestMethod.POST)
	public ModelAndView submitEditEnqFromQuotationList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("enquiry/editEnqFromQuotation");

		try {
			 
			String[] checkbox = request.getParameterValues("select_to_approve");

			try {
				int vendIdTemp = Integer.parseInt(request.getParameter("vendIdTemp"));
				model.addObject("vendIdTemp", vendIdTemp);
				editEnquiryFromQtn.setVendId(vendIdTemp);
				System.out.println(vendIdTemp);
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String enqDateTemp = request.getParameter("enqDateTemp");
				model.addObject("enqDateTemp", enqDateTemp);
				System.out.println(enqDateTemp);
				editEnquiryFromQtn.setEnqDate(enqDateTemp);
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String enqRemarkTemp = request.getParameter("enqRemarkTemp");
				model.addObject("enqRemarkTemp", enqRemarkTemp);
				System.out.println(enqRemarkTemp);
				editEnquiryFromQtn.setEnqRemark(enqRemarkTemp);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			model.addObject("vendorList", vendorList);

			/*MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("status", "0,1,2");
			GetIndentByStatus[] inted = rest.postForObject(Constants.url + "/getIntendsByStatusWithoutPoType", map,
					GetIndentByStatus[].class);
			List<GetIndentByStatus> intedList = new ArrayList<GetIndentByStatus>(Arrays.asList(inted));
			model.addObject("intedList", intedList);*/

			try {
				for (int i = 0; i < getQuatationDetailListForEnq.size(); i++) {
					for (int j = 0; j < checkbox.length; j++) {
						System.out.println(checkbox[j] + getQuatationDetailListForEnq.get(i).getEnqDetailId());
						if (Integer.parseInt(checkbox[j]) == getQuatationDetailListForEnq.get(i).getEnqDetailId()) {
							GetEnquiryDetail enqDetail = new GetEnquiryDetail();
							enqDetail.setIndId(getQuatationDetailListForEnq.get(i).getIndId());
							enqDetail.setIndNo(getQuatationDetailListForEnq.get(i).getIndNo());
							enqDetail.setItemCode(getQuatationDetailListForEnq.get(i).getItemCode());
							enqDetail.setItemId(getQuatationDetailListForEnq.get(i).getItemId()); 
							enqDetail.setEnqRemark(getQuatationDetailListForEnq.get(i).getEnqRemark());
							enqDetail.setEnqDetailDate(getQuatationDetailListForEnq.get(i).getEnqDetailDate());
							enqDetail.setEnqItemDesc(getQuatationDetailListForEnq.get(i).getEnqItemDesc());
							enqDetail.setDelStatus(1);
							enqDetail.setEnqQty(
									Float.parseFloat(request.getParameter("enqQty" + getQuatationDetailListForEnq.get(i).getEnqDetailId())));

							detailList.add(enqDetail); 
						}

					}
				}
			}catch(Exception e)
			{
				
			}
			
			System.out.println("detailList" + detailList);

			model.addObject("editEnquiry", editEnquiryFromQtn);
			model.addObject("detailList", detailList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/submitEditEnqFromQuotation", method = RequestMethod.POST)
	public String submitEditEnqFromQuotation(HttpServletRequest request, HttpServletResponse response) {

		try {

			List<GetEnquiryHeader> enquiryHeaderList = new ArrayList<GetEnquiryHeader>();

			String enqRemark = request.getParameter("enqRemark");
			String enqDate = request.getParameter("enqDate");
			int vendId = Integer.parseInt(request.getParameter("vendId"));
			// String enqDate = request.getParameter("enqDate");

			String Date = DateConvertor.convertToYMD(enqDate);

			editEnquiryFromQtn.setEnqRemark(enqRemark);
			editEnquiryFromQtn.setEnqDate(Date);
			editEnquiryFromQtn.setDelStatus(1);
			editEnquiryFromQtn.setEnquiryDetailList(detailList);
			editEnquiry.setVendId(vendId);
			enquiryHeaderList.add(editEnquiryFromQtn);

			System.out.println(enquiryHeaderList);

			ErrorMessage res = rest.postForObject(Constants.url + "/saveEnquiryHeaderAndDetail", enquiryHeaderList,
					ErrorMessage.class);
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfEnqFromQuotation";
	}

}
