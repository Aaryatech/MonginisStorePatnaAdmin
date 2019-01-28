package com.ats.tril.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
import com.ats.tril.model.item.GetItem;
import com.ats.tril.model.GetItemGroup;
import com.ats.tril.model.GetItemSubGrp;
import com.ats.tril.model.GetPassReturnDetailWithItemName;
import com.ats.tril.model.GetPassReturnHeader;
import com.ats.tril.model.GetpassDetail;
import com.ats.tril.model.GetpassDetailItemName;
import com.ats.tril.model.GetpassHeader;
import com.ats.tril.model.GetpassHeaderItemName;
import com.ats.tril.model.GetpassItemVen;
import com.ats.tril.model.GetpassReturn;
import com.ats.tril.model.GetpassReturnDetail;
import com.ats.tril.model.GetpassReturnVendor;
import com.ats.tril.model.Type;
import com.ats.tril.model.Uom;
import com.ats.tril.model.Vendor;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.doc.SubDocument;
import com.ats.tril.model.item.ItemList;
import com.ats.tril.model.mrn.GetMrnHeader;
import com.fasterxml.jackson.databind.util.Converter;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
@Scope("session")
public class GetpassController {

	RestTemplate rest = new RestTemplate();
	List<GetpassDetail> addItemInGetpassDetail = new ArrayList<GetpassDetail>();
	List<GetpassReturnDetail> getpassReturnDetailList = new ArrayList<GetpassReturnDetail>();
	List<GetpassDetailItemName> getpassDetailItemName = new ArrayList<GetpassDetailItemName>();
	List<GetpassDetail> getpassDetailList = new ArrayList<>();

	GetpassHeaderItemName editGatepassHeader = new GetpassHeaderItemName();
	GetpassHeaderItemName editGetpassHeaderNon = new GetpassHeaderItemName();

	List<GetpassDetailItemName> editGatepassHeaderList = new ArrayList<>();
	GetpassHeader editGetpassHeader = new GetpassHeader();
	GetpassReturn getpassReturn = new GetpassReturn();

	@RequestMapping(value = "/addGetpassHeader", method = RequestMethod.GET)
	public ModelAndView addGetpassHeader(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/addGetpassHeader");
		try {
			addItemInGetpassDetail = new ArrayList<GetpassDetail>();
			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);

			Category[] categoryRes = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> catList = new ArrayList<Category>(Arrays.asList(categoryRes));

			model.addObject("catList", catList);
			
			Uom[] uom = rest.getForObject(Constants.url + "/getAllUoms", Uom[].class);
			List<Uom> uomList = new ArrayList<Uom>(Arrays.asList(uom));
			model.addObject("uomList", uomList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getItemIdByGroupId", method = RequestMethod.GET)
	@ResponseBody
	public List<GetItem> getItemIdByGroupId(HttpServletRequest request, HttpServletResponse response) {

		List<GetItem> itemList = new ArrayList<GetItem>();
		try {
			int grpId = Integer.parseInt(request.getParameter("grpId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("groupId", grpId);
			ItemList resList = rest.postForObject(Constants.url + "itemListByGroupId", map, ItemList.class);

			itemList = resList.getItems();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemList;
	}

	@RequestMapping(value = "/addItemInGetpassList", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassDetail> addItemInGetpassList(HttpServletRequest request, HttpServletResponse response) {

		try {

			int itemId = Integer.parseInt(request.getParameter("itemId"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			int grpId = Integer.parseInt(request.getParameter("grpId"));
			float qty = Float.parseFloat(request.getParameter("qty"));
			String remark = request.getParameter("remark");
			int uomId = Integer.parseInt(request.getParameter("uomId")); 
			String uomName = request.getParameter("uomName");
			
			String editIndex = request.getParameter("editIndex");

			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String Date = sf.format(date);

			System.out.println("Date" + Date);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("itemId", itemId);
			GetItem item = rest.postForObject(Constants.url + "/getItemByItemId", map, GetItem.class);

			if (editIndex.equalsIgnoreCase("") || editIndex.equalsIgnoreCase(null)) {
				GetpassDetail getpassDetail = new GetpassDetail();
				getpassDetail.setGpItemId(itemId);
				getpassDetail.setItemCode(item.getItemCode()+"-"+item.getItemDesc());
				getpassDetail.setGpQty(qty);
				getpassDetail.setIsUsed(1);
				getpassDetail.setGpDetailId(0);
				getpassDetail.setGpNoDays(0);
				getpassDetail.setGpReturnDate(Date);
				getpassDetail.setGpStatus(9);
				getpassDetail.setCatId(catId);
				getpassDetail.setGroupId(grpId);
				getpassDetail.setGpRemQty(0);
				getpassDetail.setGpRetQty(0);
				getpassDetail.setRemark(remark);
				getpassDetail.setUom(uomId);
				getpassDetail.setUomName(uomName);
				
				addItemInGetpassDetail.add(getpassDetail);
			} else {
				int index = Integer.parseInt(editIndex);
				addItemInGetpassDetail.get(index).setGpItemId(itemId);
				addItemInGetpassDetail.get(index).setGpQty(qty);
				addItemInGetpassDetail.get(index).setGpDetailId(0);

				addItemInGetpassDetail.get(index).setGpReturnDate(Date);
				addItemInGetpassDetail.get(index).setItemCode(item.getItemCode()+"-"+item.getItemDesc()); 
				addItemInGetpassDetail.get(index).setCatId(catId);
				addItemInGetpassDetail.get(index).setGroupId(grpId);
				addItemInGetpassDetail.get(index).setIsUsed(1);
				addItemInGetpassDetail.get(index).setGpRemQty(0);
				addItemInGetpassDetail.get(index).setGpRetQty(0);
				addItemInGetpassDetail.get(index).setRemark(remark);
				addItemInGetpassDetail.get(index).setUom(uomId);
				addItemInGetpassDetail.get(index).setUomName(uomName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return addItemInGetpassDetail;
	}

	@RequestMapping(value = "/deleteItemFromGetpass", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassDetail> deleteItemFromGetpass(HttpServletRequest request, HttpServletResponse response) {

		try {

			int index = Integer.parseInt(request.getParameter("index"));

			addItemInGetpassDetail.remove(index);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return addItemInGetpassDetail;
	}

	@RequestMapping(value = "/editItemInAddGetpass", method = RequestMethod.GET)
	@ResponseBody
	public GetpassDetail editItemInAddGetpass(HttpServletRequest request, HttpServletResponse response) {

		GetpassDetail edit = new GetpassDetail();

		try {

			int index = Integer.parseInt(request.getParameter("index"));

			edit = addItemInGetpassDetail.get(index);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return edit;
	}

	@RequestMapping(value = "/insertGetpassNonreturnable", method = RequestMethod.POST)
	public String insertGetpassNonreturnable(HttpServletRequest request, HttpServletResponse response) {

		try {

			GetpassHeader getpassHeaderRes = new GetpassHeader();

			int vendId = Integer.parseInt(request.getParameter("vendId"));
			String gpNo =  request.getParameter("gpNo") ;
			String gpDate = request.getParameter("gpDate");
			int stock = Integer.parseInt(request.getParameter("stock"));
			String sendingWith = request.getParameter("sendingWith");
			String remark1 = request.getParameter("remark1");
			int returnFor = Integer.parseInt(request.getParameter("returnFor"));

			String Date = DateConvertor.convertToYMD(gpDate);

			GetpassHeader getpassHeader = new GetpassHeader();
			getpassHeader.setGpVendor(vendId);
			DocumentBean docBean=null;
			try {
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 5);
				map.add("catId", 1);
				map.add("date", DateConvertor.convertToYMD(gpDate));
				map.add("typeId", 1);
				RestTemplate restTemplate = new RestTemplate();

				 docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
				/*int counter=docBean.getSubDocument().getCounter();
				
				getpassHeader.setGpNo(counter);
				
				docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter()+1);*/
				 
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

					getpassHeader.setGpNo("" + code);

					docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter() + 1);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			getpassHeader.setGpReturnDate(Date);
			getpassHeader.setIsUsed(1);
			getpassHeader.setForRepair(returnFor);
			getpassHeader.setSendingWith(sendingWith);
			getpassHeader.setRemark1(remark1);
			getpassHeader.setRemark2("null");
			getpassHeader.setIsStockable(stock);
			getpassHeader.setGpType(0);
			getpassHeader.setGpDate(Date);
			getpassHeader.setGpStatus(9);
			getpassHeader.setGetpassDetail(addItemInGetpassDetail);

			System.out.println(getpassHeader);
			GetpassHeader res = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail", getpassHeader,
					GetpassHeader.class);
			if(res!=null)
	          {
	        		try {
	        			
	        			SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(), SubDocument.class);

	        		
	        		}catch (Exception e) {
						e.printStackTrace();
					}
	          }
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/addGetpassHeader";
	}

	@RequestMapping(value = "/listOfGetpass", method = RequestMethod.GET)
	public ModelAndView listOfGetpass(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/listOfGetpass");
		try {

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			List<GetpassItemVen> passList = new ArrayList<>();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			
			if(request.getParameter("vendId")==null) {
				
				map.add("vendId", 0);

				GetpassItemVen[] list = rest.postForObject(Constants.url + "/getGetpassNonReturnable", map,
						GetpassItemVen[].class);
				 passList = new ArrayList<GetpassItemVen>(Arrays.asList(list));
				 model.addObject("vendId", 0);
			}
			else {
			String vendId = request.getParameter("vendId");
			map.add("vendId", vendId); 
			GetpassItemVen[] list = rest.postForObject(Constants.url + "/getGetpassNonReturnable", map,
					GetpassItemVen[].class);
			 passList = new ArrayList<GetpassItemVen>(Arrays.asList(list));
			 model.addObject("vendId", vendId);
			}
			
			model.addObject("passList", passList);
			model.addObject("vendorList", vendorList);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteGetpassHeader/{gpId}", method = RequestMethod.GET)
	public String deleteGetpassHeader(@PathVariable int gpId, HttpServletRequest request,
			HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("gpId", gpId);

			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deleteGetpassHeader", map,
					ErrorMessage.class);
			System.out.println(errorMessage);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfGetpass";
	}

	@RequestMapping(value = "/editGetpassHeader/{gpId}", method = RequestMethod.GET)
	public ModelAndView editGetpassHeader(@PathVariable int gpId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/editGetpass");
		try {
			editGatepassHeaderList = new ArrayList<>();

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);

			Category[] categoryRes = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> catList = new ArrayList<Category>(Arrays.asList(categoryRes));

			model.addObject("catList", catList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("gpId", gpId);

			editGetpassHeaderNon = rest.postForObject(Constants.url + "/getGetpassItemHeaderAndDetailWithItemNameForNonReturnable", map,
					GetpassHeaderItemName.class);
			editGatepassHeaderList = editGetpassHeaderNon.getGetpassDetailItemNameList();

			System.out.println(editGetpassHeaderNon);
			System.out.println(editGatepassHeaderList);
			/*GetItem[] item = rest.getForObject(Constants.url + "/getAllItems", GetItem[].class);
			List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item));
			model.addObject("itemList", itemList);*/

			model.addObject("editGetpassHeaderNon", editGetpassHeaderNon);
			
			Uom[] uom = rest.getForObject(Constants.url + "/getAllUoms", Uom[].class);
			List<Uom> uomList = new ArrayList<Uom>(Arrays.asList(uom));
			model.addObject("uomList", uomList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/submitEditGetpass", method = RequestMethod.POST)
	public String submitEditGetpass(HttpServletRequest request, HttpServletResponse response) {

		try {

			int vendId = Integer.parseInt(request.getParameter("vendId"));
			String gpNo = request.getParameter("gpNo");
			String gpDate = request.getParameter("gpDate");
			int stock = Integer.parseInt(request.getParameter("stock"));
			String sendingWith = request.getParameter("sendingWith");
			String remark1 = request.getParameter("remark1");
			int returnFor = Integer.parseInt(request.getParameter("returnFor"));

			String Date = DateConvertor.convertToYMD(gpDate);

			GetpassHeader getpassHeader = new GetpassHeader();
			getpassHeader.setGpVendor(vendId);
			getpassHeader.setGpNo(gpNo);
			getpassHeader.setGpReturnDate(Date);
			getpassHeader.setIsUsed(1);
			getpassHeader.setForRepair(returnFor);
			getpassHeader.setSendingWith(sendingWith);
			getpassHeader.setRemark1(remark1);
			getpassHeader.setRemark2("null");
			getpassHeader.setIsStockable(stock);
			getpassHeader.setGpType(0);
			getpassHeader.setGpDate(Date);

			getpassHeader.setGetpassDetail(addItemInGetpassDetail);

			System.out.println(getpassHeader);
			GetpassHeader res = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail", getpassHeader,
					GetpassHeader.class);
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfGatepass";
	}

	@RequestMapping(value = "/getGetpassNonByVendId", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassItemVen> getGetpassNonByVendId(HttpServletRequest request, HttpServletResponse response) {

		List<GetpassItemVen> passList = new ArrayList<GetpassItemVen>();
		try {

			String vendId = request.getParameter("vendId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("vendId", vendId);

			GetpassItemVen[] list = rest.postForObject(Constants.url + "/getGetpassNonReturnable", map,
					GetpassItemVen[].class);
			passList = new ArrayList<GetpassItemVen>(Arrays.asList(list));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return passList;
	}

	@RequestMapping(value = "/addGetpassReturnable", method = RequestMethod.GET)
	public ModelAndView addGetpassReturnable(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/addGetpassReturnable");
		try {
			addItemInGetpassDetail = new ArrayList<GetpassDetail>();
			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);

			Category[] categoryRes = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> catList = new ArrayList<Category>(Arrays.asList(categoryRes));

			model.addObject("catList", catList);
			
			Uom[] uom = rest.getForObject(Constants.url + "/getAllUoms", Uom[].class);
			List<Uom> uomList = new ArrayList<Uom>(Arrays.asList(uom));
			model.addObject("uomList", uomList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/addItemInGetpassReturnableList", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassDetail> addItemInGetpassReturnableList(HttpServletRequest request,
			HttpServletResponse response) {

		try {

			int itemId = Integer.parseInt(request.getParameter("itemId"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			int grpId = Integer.parseInt(request.getParameter("grpId"));
			float qty = Float.parseFloat(request.getParameter("qty"));
			int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
			String remark = request.getParameter("remark");
			int uomId = Integer.parseInt(request.getParameter("uomId"));
			String uomName = request.getParameter("uomName");
			String editIndex = request.getParameter("editIndex");

			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String Date = sf.format(date);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("itemId", itemId);
			GetItem item = rest.postForObject(Constants.url + "/getItemByItemId", map, GetItem.class);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			try {

				c.setTime(sdf.parse(Date));
			} catch (ParseException e) {
				e.printStackTrace();
			}

			c.add(Calendar.DAY_OF_MONTH, noOfDays);
			String newDate = sdf.format(c.getTime());

			System.out.println("Date after Addition: " + newDate);

			if (editIndex.equalsIgnoreCase("") || editIndex.equalsIgnoreCase(null)) {
				GetpassDetail getpassDetail = new GetpassDetail();
				getpassDetail.setGpItemId(itemId);
				getpassDetail.setItemCode(item.getItemCode()+"-"+item.getItemDesc());
				getpassDetail.setGpQty(qty);
				getpassDetail.setIsUsed(1);
				getpassDetail.setGpDetailId(0);
				getpassDetail.setGpNoDays(noOfDays);
				getpassDetail.setGpReturnDate(newDate);
				getpassDetail.setGpStatus(9);
				getpassDetail.setCatId(catId);
				getpassDetail.setGroupId(grpId);
				getpassDetail.setGpRemQty(qty);
				getpassDetail.setGpRetQty(0);
				getpassDetail.setUom(uomId);
				getpassDetail.setUomName(uomName);
				getpassDetail.setRemark(remark);
				addItemInGetpassDetail.add(getpassDetail);
			} else {
				int index = Integer.parseInt(editIndex);
				addItemInGetpassDetail.get(index).setGpItemId(itemId);
				addItemInGetpassDetail.get(index).setGpQty(qty);
				addItemInGetpassDetail.get(index).setGpDetailId(0); 
				addItemInGetpassDetail.get(index).setGpReturnDate(newDate);
				addItemInGetpassDetail.get(index).setItemCode(item.getItemCode()+"-"+item.getItemDesc()); 
				addItemInGetpassDetail.get(index).setCatId(catId);
				addItemInGetpassDetail.get(index).setGroupId(grpId);
				addItemInGetpassDetail.get(index).setIsUsed(1);
				addItemInGetpassDetail.get(index).setGpRemQty(qty); 
				addItemInGetpassDetail.get(index).setGpNoDays(noOfDays);
				addItemInGetpassDetail.get(index).setRemark(remark);
				addItemInGetpassDetail.get(index).setUom(uomId);
				addItemInGetpassDetail.get(index).setUomName(uomName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return addItemInGetpassDetail;
	}
	@RequestMapping(value = "/getInvoiceNoGp", method = RequestMethod.GET)
	@ResponseBody
	public DocumentBean getInvoiceNoGp(HttpServletRequest request, HttpServletResponse response) {
            
		String invNo="-";
		DocumentBean docBean=null;
		try {
			int catId = Integer.parseInt(request.getParameter("catId"));
			int docId = Integer.parseInt(request.getParameter("docId"));
			String date = request.getParameter("date");
			int typeId = Integer.parseInt(request.getParameter("typeId"));
			if(date=="") {
				Date currDate = new Date();
				date= new SimpleDateFormat("yyyy-MM-dd").format(currDate);
				}
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("docId",docId);
			map.add("catId", catId);
			map.add("date", DateConvertor.convertToYMD(date));
			map.add("typeId", typeId);
			RestTemplate restTemplate = new RestTemplate();

			docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
			System.err.println("Doc"+docBean.toString());
		
			invNo=""+docBean.getSubDocument().getCounter();
			docBean.setCode(invNo);
			System.err.println("invNo"+invNo);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return docBean;
	}
	@RequestMapping(value = "/insertGetpassReturnable", method = RequestMethod.POST)
	public String insertGetpassReturnable(HttpServletRequest request, HttpServletResponse response) {

		try {

			GetpassHeader getpassHeaderRes = new GetpassHeader();

			int vendId = Integer.parseInt(request.getParameter("vendId"));
			String gpNo = request.getParameter("gpNo");
			String gpDate = request.getParameter("gpDate");
			int stock = Integer.parseInt(request.getParameter("stock"));
			String sendingWith = request.getParameter("sendingWith");
			String remark1 = request.getParameter("remark1");
			int returnFor = Integer.parseInt(request.getParameter("returnFor"));
			//int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));

			String Date = DateConvertor.convertToYMD(gpDate);

			System.out.println("Date before Addition: " + gpDate);
			// Specifying date format that matches the given date
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			Calendar c = Calendar.getInstance();
			try {
				// Setting the date to the given date
				c.setTime(sf.parse(gpDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}

			// Number of Days to add
			//c.add(Calendar.DAY_OF_MONTH, noOfDays);
			// Date after adding the days to the given date
			//String newDate = sdf.format(c.getTime());
			// Displaying the new Date after addition of Days
			//System.out.println("Date after Addition: " + newDate);

			GetpassHeader getpassHeader = new GetpassHeader();
			getpassHeader.setGpVendor(vendId);
			DocumentBean docBean=null;
			try {
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 4);
				map.add("catId", 1);
				map.add("date", DateConvertor.convertToYMD(gpDate));
				map.add("typeId", 1);
				RestTemplate restTemplate = new RestTemplate();

				 docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
				/*int counter=docBean.getSubDocument().getCounter();
				
				getpassHeader.setGpNo(counter);
				
				docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter()+1);*/
				 
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
					getpassHeader.setGpNo("" + code);
					
					docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter() + 1);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			//getpassHeader.setGpReturnDate(newDate);
			getpassHeader.setIsUsed(1);
			getpassHeader.setForRepair(returnFor);
			getpassHeader.setSendingWith(sendingWith);
			getpassHeader.setRemark1(remark1);
			getpassHeader.setRemark2("null");
			getpassHeader.setIsStockable(stock);
			getpassHeader.setGpType(1);
			getpassHeader.setGpDate(Date);
			getpassHeader.setGpStatus(9);
			getpassHeader.setGetpassDetail(addItemInGetpassDetail);
			
			String returnDate = new String();
			for(int i = 0 ; i<addItemInGetpassDetail.size() ; i++) {
				
				if(i==0) {
					returnDate=addItemInGetpassDetail.get(i).getGpReturnDate();
				}
				else {
					 if (returnDate.compareTo(addItemInGetpassDetail.get(i).getGpReturnDate()) > 0) {
						 returnDate = addItemInGetpassDetail.get(i).getGpReturnDate();
			            } 
				}
			}
			getpassHeader.setGpReturnDate(returnDate);
			System.out.println(getpassHeader);
			GetpassHeader res = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail", getpassHeader,
					GetpassHeader.class);
			 if(res!=null)
	          {
	        		try {
	        			
	        			SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(), SubDocument.class);

	        		
	        		}catch (Exception e) {
						e.printStackTrace();
					}
	          }
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/addGetpassReturnable";
	}

	@RequestMapping(value = "/listOfGetpassReturnable", method = RequestMethod.GET)
	public ModelAndView listOfGetpassReturnable(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/listOfGetpassReturnable");
		try {

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);
			List<GetpassItemVen> passList = new ArrayList<GetpassItemVen>();
			
			if(request.getParameterValues("gpStatusList[]")==null) {
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("vendId", 0);
				map.add("gpStatusList", "0");

				GetpassItemVen[] list = rest.postForObject(Constants.url + "/getGetpassReturnable", map,
						GetpassItemVen[].class);
				passList = new ArrayList<GetpassItemVen>(Arrays.asList(list));
				model.addObject("gpStatusList", 0);
			}
			else {
				
				String[] gpStatusList = request.getParameterValues("gpStatusList[]");
				List<String> stsList = new ArrayList<String>(Arrays.asList(gpStatusList));
				
				model.addObject("gpStatusList", stsList);
				StringBuilder sb = new StringBuilder();

				for (int i = 0; i < gpStatusList.length; i++) {
					sb = sb.append(gpStatusList[i] + ",");

				}
				String items = sb.toString();
				items = items.substring(0, items.length() - 1);

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
				map.add("vendId", 0);
				map.add("gpStatusList", items);

				GetpassItemVen[] list = rest.postForObject(Constants.url + "/getGetpassReturnable", map,
						GetpassItemVen[].class);
				passList = new ArrayList<GetpassItemVen>(Arrays.asList(list));
			}
			
			model.addObject("passList", passList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getGetpassRetByVendId", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassItemVen> getGetpassRetByVendId(HttpServletRequest request, HttpServletResponse response) {

		List<GetpassItemVen> passList = new ArrayList<GetpassItemVen>();
		try {

			String vendId = request.getParameter("vendId");
			String[] gpStatusList = request.getParameterValues("gpStatusList[]");

			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < gpStatusList.length; i++) {
				sb = sb.append(gpStatusList[i] + ",");

			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("vendId", vendId);
			map.add("gpStatusList", items);

			GetpassItemVen[] list = rest.postForObject(Constants.url + "/getGetpassReturnable", map,
					GetpassItemVen[].class);
			passList = new ArrayList<GetpassItemVen>(Arrays.asList(list));
			System.out.println("passList" + passList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return passList;
	}

	@RequestMapping(value = "/deleteGetpassHeaderReturnable/{gpId}", method = RequestMethod.GET)
	public String deleteGetpassHeaderReturnable(@PathVariable int gpId, HttpServletRequest request,
			HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("gpId", gpId);

			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deleteGetpassHeader", map,
					ErrorMessage.class);
			System.out.println(errorMessage);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfGetpassReturnable";
	}

	@RequestMapping(value = "/editGetpassHeaderRet/{gpId}", method = RequestMethod.GET)
	public ModelAndView editGetpassHeaderRet(@PathVariable int gpId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/editGetpassReturnable");
		try {
			editGatepassHeaderList = new ArrayList<>();

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);

			Category[] categoryRes = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> catList = new ArrayList<Category>(Arrays.asList(categoryRes));

			model.addObject("catList", catList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("gpId", gpId);

			editGatepassHeader = rest.postForObject(Constants.url + "/getGetpassItemHeaderAndDetailWithItemNameForNonReturnable", map,
					GetpassHeaderItemName.class);

			/*GetItem[] item = rest.getForObject(Constants.url + "/getAllItems", GetItem[].class);
			List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item));
			model.addObject("itemList", itemList);*/

			for(int i = 0 ; i<editGatepassHeader.getGetpassDetailItemNameList().size() ; i++) {
				
				editGatepassHeader.getGetpassDetailItemNameList().get(i).setGpReturnDate(DateConvertor.convertToYMD(
						editGatepassHeader.getGetpassDetailItemNameList().get(i).getGpReturnDate())); 
			}
			System.out.println(editGatepassHeader);

			editGatepassHeaderList = editGatepassHeader.getGetpassDetailItemNameList();
			model.addObject("editGetpassHeader", editGatepassHeader);
			
			Uom[] uom = rest.getForObject(Constants.url + "/getAllUoms", Uom[].class);
			List<Uom> uomList = new ArrayList<Uom>(Arrays.asList(uom));
			model.addObject("uomList", uomList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/editItemInEditGetpass", method = RequestMethod.GET)
	@ResponseBody
	public GetpassDetailItemName editItemInEditGetpass(HttpServletRequest request, HttpServletResponse response) {

		GetpassDetailItemName edit = new GetpassDetailItemName();

		try {

			int index = Integer.parseInt(request.getParameter("index"));

			edit = editGatepassHeaderList.get(index);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return edit;
	}

	@RequestMapping(value = "/deleteItemFromEditGetpass", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassDetailItemName> deleteItemFromEditGetpass(HttpServletRequest request,
			HttpServletResponse response) {

		try {

			int index = Integer.parseInt(request.getParameter("index"));

			if (editGatepassHeaderList.get(index).getGpDetailId() == 0)
				editGatepassHeaderList.remove(index);
			else
				editGatepassHeaderList.get(index).setIsUsed(0);

			System.out.println(editGatepassHeaderList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return editGatepassHeaderList;
	}

	@RequestMapping(value = "/addItemInEditGetpassReturnableList", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassDetailItemName> addItemInEditGetpassReturnableList(HttpServletRequest request,
			HttpServletResponse response) {

		try {

			int itemId = Integer.parseInt(request.getParameter("itemId"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			int grpId = Integer.parseInt(request.getParameter("grpId"));
			float qty = Float.parseFloat(request.getParameter("qty"));
			int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
			int uomId = Integer.parseInt(request.getParameter("uomId"));
			String uomName = request.getParameter("uomName");
			String remark = request.getParameter("remark");
			String editIndex = request.getParameter("editIndex");

			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String Date = sf.format(date);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("itemId", itemId);
			GetItem item = rest.postForObject(Constants.url + "/getItemByItemId", map, GetItem.class);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			try {

				c.setTime(sdf.parse(Date));
			} catch (ParseException e) {
				e.printStackTrace();
			}

			c.add(Calendar.DAY_OF_MONTH, noOfDays);
			String newDate = sdf.format(c.getTime());

			System.out.println("Date after Addition: " + newDate);

			if (editIndex.equalsIgnoreCase("") || editIndex.equalsIgnoreCase(null)) {
				GetpassDetailItemName getpassDetail = new GetpassDetailItemName();
				getpassDetail.setGpItemId(itemId);
				getpassDetail.setItemCode(item.getItemCode()+"-"+item.getItemDesc());
				getpassDetail.setGpQty(qty);
				getpassDetail.setIsUsed(1);
				getpassDetail.setGpDetailId(0);
				getpassDetail.setGpNoDays(noOfDays);
				getpassDetail.setGpReturnDate(newDate);
				getpassDetail.setGpStatus(9);
				getpassDetail.setCatId(catId);
				getpassDetail.setGrpId(grpId);
				getpassDetail.setGpRemQty(qty);
				getpassDetail.setGpRetQty(0);
				getpassDetail.setRemark(remark);
				getpassDetail.setUom(uomId);
				getpassDetail.setUomName(uomName);
				editGatepassHeaderList.add(getpassDetail);
			} else {
				int index = Integer.parseInt(editIndex);
				editGatepassHeaderList.get(index).setGpItemId(itemId);
				editGatepassHeaderList.get(index).setGpQty(qty);
				editGatepassHeaderList.get(index).setGpReturnDate(newDate);
				editGatepassHeaderList.get(index).setItemCode(item.getItemCode()+"-"+item.getItemDesc()); 
				editGatepassHeaderList.get(index).setCatId(catId);
				editGatepassHeaderList.get(index).setGrpId(grpId);
				editGatepassHeaderList.get(index).setIsUsed(1);
				editGatepassHeaderList.get(index).setGpRemQty(qty); 
				editGatepassHeaderList.get(index).setGpNoDays(noOfDays);
				editGatepassHeaderList.get(index).setRemark(remark);
				editGatepassHeaderList.get(index).setUom(uomId);
				editGatepassHeaderList.get(index).setUomName(uomName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return editGatepassHeaderList;
	}

	@RequestMapping(value = "/submitEditGetpassReturnable", method = RequestMethod.POST)
	public String submitEditGetpassReturnable(HttpServletRequest request, HttpServletResponse response) {

		try {

			int vendId = Integer.parseInt(request.getParameter("vendId"));
			String gpNo = request.getParameter("gpNo");
			String gpDate = request.getParameter("gpDate");
			int stock = Integer.parseInt(request.getParameter("stock"));
			String sendingWith = request.getParameter("sendingWith");
			String remark1 = request.getParameter("remark1");
			int returnFor = Integer.parseInt(request.getParameter("returnFor"));
			// int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));

			String Date = DateConvertor.convertToYMD(gpDate);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			try {
				c.setTime(sdf.parse(gpDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}

			// Number of Days to add
			// c.add(Calendar.DAY_OF_MONTH, noOfDays);
			// Date after adding the days to the given date
			String newDate = sdf.format(c.getTime());
			// Displaying the new Date after addition of Days
			System.out.println("Date after Addition: " + newDate);

			editGatepassHeader.setGpVendor(vendId);
			editGatepassHeader.setGpNo(gpNo);
			
			editGatepassHeader.setIsUsed(1);
			editGatepassHeader.setForRepair(returnFor);
			editGatepassHeader.setSendingWith(sendingWith);
			editGatepassHeader.setRemark1(remark1);
			editGatepassHeader.setRemark2("null");
			editGatepassHeader.setIsStockable(stock);
			editGatepassHeader.setGpType(1);
			editGatepassHeader.setGpDate(Date);

			/*for (int i = 0; i < editGatepassHeaderList.size(); i++) {
				editGatepassHeaderList.get(i)
						.setGpReturnDate(DateConvertor.convertToYMD(editGatepassHeaderList.get(i).getGpReturnDate()));
			}*/
			
			String returnDate = new String();
			for(int i = 0 ; i<editGatepassHeaderList.size() ; i++) {
				
				if(i==0) {
					returnDate=editGatepassHeaderList.get(i).getGpReturnDate();
				}
				else {
					 if (returnDate.compareTo(editGatepassHeaderList.get(i).getGpReturnDate()) > 0) {
						 returnDate = editGatepassHeaderList.get(i).getGpReturnDate();
			            } 
				}
			}
			
			editGatepassHeader.setGpReturnDate(returnDate);
			editGatepassHeader.setGetpassDetail(editGatepassHeaderList);

			System.out.println(editGatepassHeader);
			GetpassHeader res = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail", editGatepassHeader,
					GetpassHeader.class);
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfGetpassReturnable";
	}

	@RequestMapping(value = "/submitEditGetpassNonReturnable", method = RequestMethod.POST)
	public String submitEditGetpassNonReturnable(HttpServletRequest request, HttpServletResponse response) {

		try {

			int vendId = Integer.parseInt(request.getParameter("vendId"));
			String gpNo = request.getParameter("gpNo");
			String gpDate = request.getParameter("gpDate");
			int stock = Integer.parseInt(request.getParameter("stock"));
			String sendingWith = request.getParameter("sendingWith");
			String remark1 = request.getParameter("remark1");
			int returnFor = Integer.parseInt(request.getParameter("returnFor"));

			String Date = DateConvertor.convertToYMD(gpDate);

			System.out.println(editGetpassHeaderNon);
			System.out.println(editGatepassHeaderList);

			editGetpassHeaderNon.setGpVendor(vendId);
			editGetpassHeaderNon.setGpNo(gpNo);
			editGetpassHeaderNon.setGpReturnDate(Date);
			editGetpassHeaderNon.setIsUsed(1);
			editGetpassHeaderNon.setForRepair(returnFor);
			editGetpassHeaderNon.setSendingWith(sendingWith);
			editGetpassHeaderNon.setRemark1(remark1);
			editGetpassHeaderNon.setRemark2("null");
			editGetpassHeaderNon.setIsStockable(stock);
			editGetpassHeaderNon.setGpType(0);
			editGetpassHeaderNon.setGpDate(Date);

			for (int i = 0; i < editGatepassHeaderList.size(); i++) {
				editGatepassHeaderList.get(i)
						.setGpReturnDate(DateConvertor.convertToYMD(editGatepassHeaderList.get(i).getGpReturnDate()));
			}
			editGetpassHeaderNon.setGetpassDetail(editGatepassHeaderList);

			System.out.println("editGetpassHeaderNon " + editGetpassHeaderNon);
			GetpassHeader res = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail", editGetpassHeaderNon,
					GetpassHeader.class);
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfGetpass";
	}

	GetpassHeaderItemName getpassHeaderItemName = new GetpassHeaderItemName();

	@RequestMapping(value = "/addGetpassReturn/{gpId}", method = RequestMethod.GET)
	public ModelAndView addGetpassReturn(@PathVariable int gpId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/return");
		try {

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("gpId", gpId);

			getpassHeaderItemName = rest.postForObject(Constants.url + "/getGetpassItemHeaderAndDetailWithItemName",
					map, GetpassHeaderItemName.class);
			System.out.println("getpassDetailItemName              " + getpassDetailItemName);
			getpassDetailItemName = getpassHeaderItemName.getGetpassDetailItemNameList();
			model.addObject("getpassHeaderItemName", getpassHeaderItemName);
			model.addObject("getpassDetailItemName", getpassDetailItemName);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertGetpassReturn", method = RequestMethod.POST)
	public String insertGetpassReturn(HttpServletRequest request, HttpServletResponse response) {

		try {

			int gpId = Integer.parseInt(request.getParameter("gpId"));
			String gpNo = request.getParameter("gpNo");
			String returnNo =  request.getParameter("returnNo") ;
			String date = request.getParameter("date");
			// float retQty = Float.parseFloat(request.getParameter("retQty"));

			String remarkDetail = request.getParameter("remarkDetail");

			String remark = request.getParameter("remark");

			GetpassReturn getpassReturn = new GetpassReturn();
			getpassReturn.setVendorId(getpassHeaderItemName.getGpVendor());
			DocumentBean docBean=null;
			try {
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 7);
				map.add("catId", 1);
				map.add("date", DateConvertor.convertToYMD(date));
				map.add("typeId", 1);
				RestTemplate restTemplate = new RestTemplate();

				 docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
				/*int counter=docBean.getSubDocument().getCounter();
				
				getpassReturn.setGpNo(counter);
				
				docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter()+1);*/
				 
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

					getpassReturn.setReturnNo("" + code);

					docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter() + 1);
			}catch (Exception e) {
				e.printStackTrace();
			}
			getpassReturn.setGpNo(gpNo);
			getpassReturn.setGpReturnDate(DateConvertor.convertToYMD(date));
			getpassReturn.setIsUsed(1);
			getpassReturn.setGpRemark(remark);
			getpassReturn.setGpRemark1("null"); 
			getpassReturn.setGpId(gpId);
			getpassReturn.setStatus(1);
			getpassReturnDetailList = new ArrayList<GetpassReturnDetail>();

			for (int i = 0; i < getpassDetailItemName.size(); i++) {
				GetpassReturnDetail getpassReturnDetail = new GetpassReturnDetail();
				getpassReturnDetail.setGpQty(getpassDetailItemName.get(i).getGpQty());
				getpassReturnDetail.setGpItemId(getpassDetailItemName.get(i).getGpItemId());
				getpassReturnDetail.setIsUsed(1);
				getpassReturnDetail.setRemark(request.getParameter("remarkDetail" + i));
				getpassReturnDetail.setRemark1("null");
				getpassReturnDetail.setReturnQty(Float.parseFloat(request.getParameter("retQty" + i)));
				getpassReturnDetail.setRemQty(Float.parseFloat(request.getParameter("remQty" + i)));
				getpassReturnDetail.setStatus(1);
				getpassDetailItemName.get(i).setGpRemQty(Float.parseFloat(request.getParameter("remQty" + i)));
				getpassDetailItemName.get(i).setGpRetQty(Float.parseFloat(request.getParameter("retQty" + i)));
				getpassReturnDetailList.add(getpassReturnDetail);
			}

			getpassReturn.setGetpassReturnDetailList(getpassReturnDetailList);

			System.out.println("final return  " + getpassReturn);
			 GetpassReturn res = rest.postForObject(Constants.url + "/saveGetPassReturnHeaderDetail", getpassReturn,
					GetpassReturn.class);
			if (res != null) {
 
				for (int i = 0; i < getpassDetailItemName.size(); i++) {
					if (getpassDetailItemName.get(i).getGpRemQty() == 0)
						getpassDetailItemName.get(i).setGpStatus(3);
					else if (getpassDetailItemName.get(i).getGpRemQty() > 0
							&& getpassDetailItemName.get(i).getGpRemQty() < getpassDetailItemName.get(i).getGpQty())
						getpassDetailItemName.get(i).setGpStatus(2);
					else
						getpassDetailItemName.get(i).setGpStatus(1);

					getpassDetailItemName.get(i).setGpReturnDate(
							DateConvertor.convertToYMD(getpassDetailItemName.get(i).getGpReturnDate()));
				}

				int status = 3;
				for (int i = 0; i < getpassDetailItemName.size(); i++) {
					if (getpassDetailItemName.get(i).getGpStatus() == 2) {
						status = 2;
						break;
					}
					else if (getpassDetailItemName.get(i).getGpStatus() == 1) {
						status = 1; 
					}
					 
				}
				getpassHeaderItemName.setGpDate(DateConvertor.convertToYMD(getpassHeaderItemName.getGpDate()));
				getpassHeaderItemName.setGpReturnDate(DateConvertor.convertToYMD(getpassHeaderItemName.getGpReturnDate()));
				getpassHeaderItemName.setGpStatus(status);
				getpassHeaderItemName.setGetpassDetail(getpassDetailItemName);
				System.out.println("getpassHeaderItemName " + getpassHeaderItemName);
				 GetpassHeader result = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail",
						getpassHeaderItemName, GetpassHeader.class);
				 if(result!=null)
		          {
		        		try {
		        			
		        			SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(), SubDocument.class);

		        		
		        		}catch (Exception e) {
							e.printStackTrace();
						}
		          }
				System.out.println(result);
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}

		//return "redirect:/listOfGetpassReturn";
		return "redirect:/listOfGetpassReturnable";
	}

	@RequestMapping(value = "/listOfGetpassReturn", method = RequestMethod.GET)
	public ModelAndView listOfGetpassReturn(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/returnList");
		try {

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getListOfReturnGetpass", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassReturnVendor> getListOfReturnGetpass(HttpServletRequest request, HttpServletResponse response) {

		List<GetpassReturnVendor> list = new ArrayList<GetpassReturnVendor>();
		try {

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			int vendId = Integer.parseInt(request.getParameter("vendId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));
			map.add("vendId", vendId);

			GetpassReturnVendor[] getlist = rest.postForObject(Constants.url + "/getGetpassReturnVendor", map,
					GetpassReturnVendor[].class);
			list = new ArrayList<GetpassReturnVendor>(Arrays.asList(getlist));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@RequestMapping(value = "/getGetpassReturn", method = RequestMethod.GET)
	@ResponseBody
	public List<GetpassItemVen> getGetpassReturn(HttpServletRequest request, HttpServletResponse response) {

		List<GetpassItemVen> passList = new ArrayList<GetpassItemVen>();
		try {

			String vendId = request.getParameter("vendId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("vendId", vendId);

			GetpassItemVen[] list = rest.postForObject(Constants.url + "/getGetpassReturnable", map,
					GetpassItemVen[].class);
			passList = new ArrayList<GetpassItemVen>(Arrays.asList(list));
			System.out.println("passList" + passList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return passList;
	}

	GetPassReturnHeader getPassReturnHeader = new GetPassReturnHeader();
	List<GetPassReturnDetailWithItemName> getPassReturnDetailWithItemNamelList = new ArrayList<>();

	@RequestMapping(value = "/editReturnList/{returnId}", method = RequestMethod.GET)
	public ModelAndView editEnquiry(@PathVariable int returnId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/editGetpassReturn");
		try {
			getpassReturnDetailList = new ArrayList<GetpassReturnDetail>();

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("returnId", returnId);

			getPassReturnHeader = rest.postForObject(Constants.url + "/getPassReturnHeaderAndDetail", map,
					GetPassReturnHeader.class);
			getPassReturnDetailWithItemNamelList = getPassReturnHeader.getGetPassReturnDetailList();

			map = new LinkedMultiValueMap<>();
			map.add("gpId", getPassReturnHeader.getGpId());

			editGatepassHeader = rest.postForObject(Constants.url + "/getGetpassItemHeaderAndDetailWithItemName", map,
					GetpassHeaderItemName.class);

			editGatepassHeaderList = editGatepassHeader.getGetpassDetailItemNameList();

			for (int i = 0; i < getPassReturnDetailWithItemNamelList.size(); i++) {
				for (int j = 0; j < editGatepassHeaderList.size(); j++) {
					if (getPassReturnDetailWithItemNamelList.get(i).getGpItemId() == editGatepassHeaderList.get(j)
							.getGpItemId()) {
						getPassReturnDetailWithItemNamelList.get(i)
								.setBalanceQty(editGatepassHeaderList.get(j).getGpRemQty());
						break;
					}
				}
			}

			model.addObject("editReturnList", getPassReturnHeader);
			model.addObject("list", getPassReturnDetailWithItemNamelList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteGetpassHeaderReturn/{returnId}", method = RequestMethod.GET)
	public String deleteGetpassHeaderReturn(@PathVariable int returnId, HttpServletRequest request,
			HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("returnId", returnId);

			GetPassReturnHeader returnGatePass = rest.postForObject(Constants.url + "/getPassReturnHeaderAndDetail",
					map, GetPassReturnHeader.class);

			map = new LinkedMultiValueMap<>();
			map.add("gpId", returnGatePass.getGpId());

			GetpassHeaderItemName updateGatePass = rest.postForObject(
					Constants.url + "/getGetpassItemHeaderAndDetailWithItemName", map, GetpassHeaderItemName.class);

			for (int i = 0; i < returnGatePass.getGetPassReturnDetailList().size(); i++) {
				for (int j = 0; j < updateGatePass.getGetpassDetailItemNameList().size(); j++) {
					if (returnGatePass.getGetPassReturnDetailList().get(i).getGpItemId() == updateGatePass
							.getGetpassDetailItemNameList().get(j).getGpItemId()) {
						updateGatePass.getGetpassDetailItemNameList().get(j)
								.setGpRemQty(updateGatePass.getGetpassDetailItemNameList().get(j).getGpRemQty()
										+ returnGatePass.getGetPassReturnDetailList().get(i).getReturnQty());
					}
				}
			}

			map = new LinkedMultiValueMap<>();
			map.add("returnId", returnId);
			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/deleteGetpassReturn", map,
					ErrorMessage.class);
			System.out.println(errorMessage);
			
			if (errorMessage.isError() == false) {
				 
				for (int i = 0; i < updateGatePass.getGetpassDetailItemNameList().size(); i++) {

					if (updateGatePass.getGetpassDetailItemNameList().get(i).getGpRemQty() == 0)
						updateGatePass.getGetpassDetailItemNameList().get(i).setGpStatus(3);
					else if (updateGatePass.getGetpassDetailItemNameList().get(i).getGpRemQty() > 0
							&& updateGatePass.getGetpassDetailItemNameList().get(i).getGpRemQty() < updateGatePass
									.getGetpassDetailItemNameList().get(i).getGpQty())
						updateGatePass.getGetpassDetailItemNameList().get(i).setGpStatus(2);
					else
						updateGatePass.getGetpassDetailItemNameList().get(i).setGpStatus(1);

					updateGatePass.getGetpassDetailItemNameList().get(i).setGpReturnDate(DateConvertor
							.convertToYMD(updateGatePass.getGetpassDetailItemNameList().get(i).getGpReturnDate()));
				}

				int status = 3;
				 
				for (int i = 0; i < updateGatePass.getGetpassDetailItemNameList().size(); i++) {
					if (updateGatePass.getGetpassDetailItemNameList().get(i).getGpStatus() == 2) {
						status = 2;
						break;
					}
					else if (updateGatePass.getGetpassDetailItemNameList().get(i).getGpStatus() == 1) {
						status = 1; 
					}
					 
				}

				updateGatePass.setGpStatus(status);
				updateGatePass.setGetpassDetail(updateGatePass.getGetpassDetailItemNameList());
				updateGatePass.setGpDate(DateConvertor.convertToYMD(updateGatePass.getGpDate()));
				updateGatePass.setGpReturnDate(DateConvertor.convertToYMD(updateGatePass.getGpReturnDate()));
				GetpassHeader result = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail", updateGatePass,
						GetpassHeader.class);
				
				System.out.println(result);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfGetpassReturn";
	}

	@RequestMapping(value = "/submitEditGetpassReturn", method = RequestMethod.POST)
	public String submitGetpassReturn(HttpServletRequest request, HttpServletResponse response) {

		try {

			String date = request.getParameter("date");
			String remark = request.getParameter("remark");

			getPassReturnHeader.setGpRemark(remark);
			getPassReturnHeader.setGpReturnDate(DateConvertor.convertToYMD(date));

			for (int i = 0; i < getPassReturnDetailWithItemNamelList.size(); i++) {

				getPassReturnDetailWithItemNamelList.get(i)
						.setReturnQty(Float.parseFloat(request.getParameter("retQty" + i)));
				getPassReturnDetailWithItemNamelList.get(i)
						.setRemQty(Float.parseFloat(request.getParameter("remQty" + i)));
				getPassReturnDetailWithItemNamelList.get(i).setRemark(request.getParameter("remarkDetail" + i));
				 
			}

			getPassReturnHeader.setGetPassReturnDetailList(getPassReturnDetailWithItemNamelList);

			System.out.println("edit return " + getPassReturnHeader);

			 GetpassReturn res = rest.postForObject(Constants.url + "/saveGetPassReturnHeader", getPassReturnHeader,
					GetpassReturn.class);

			GetpassReturnDetail[] getpassReturnDetail = rest.postForObject(Constants.url + "/saveGetPassDetail",
					getPassReturnDetailWithItemNamelList, GetpassReturnDetail[].class);

			List<GetpassReturnDetail> list = new ArrayList<>(Arrays.asList(getpassReturnDetail));
			if (res != null ) {
 
				for (int i = 0; i < editGatepassHeaderList.size(); i++) {
					for (int j = 0; j < getPassReturnDetailWithItemNamelList.size(); j++) {
						if (getPassReturnDetailWithItemNamelList.get(j).getGpItemId() == editGatepassHeaderList.get(i)
								.getGpItemId()) {
							editGatepassHeaderList.get(i)
									.setGpRemQty(getPassReturnDetailWithItemNamelList.get(j).getRemQty());
							editGatepassHeaderList.get(i)
									.setGpRetQty(getPassReturnDetailWithItemNamelList.get(j).getReturnQty());
							break;
						}
					}
					if (editGatepassHeaderList.get(i).getGpRemQty() == 0)
						editGatepassHeaderList.get(i).setGpStatus(3);
					else if (editGatepassHeaderList.get(i).getGpRemQty() > 0
							&& editGatepassHeaderList.get(i).getGpRemQty() < editGatepassHeaderList.get(i).getGpQty())
						editGatepassHeaderList.get(i).setGpStatus(2);
					else
						editGatepassHeaderList.get(i).setGpStatus(1);

					editGatepassHeaderList.get(i).setGpReturnDate(
							DateConvertor.convertToYMD(editGatepassHeaderList.get(i).getGpReturnDate()));
				}

				int status = 3;
				 
				for (int i = 0; i < editGatepassHeaderList.size(); i++) {
					if (editGatepassHeaderList.get(i).getGpStatus() == 2) {
						status = 2;
						break;
					}
					else if (editGatepassHeaderList.get(i).getGpStatus() == 1) {
						status = 1; 
					}
					 
				}

				editGatepassHeader.setGpStatus(status);
				editGatepassHeader.setGetpassDetail(editGatepassHeaderList);
				editGatepassHeader.setGpDate(DateConvertor.convertToYMD(editGatepassHeader.getGpDate()));
				editGatepassHeader.setGpReturnDate(DateConvertor.convertToYMD(editGatepassHeader.getGpReturnDate()));
				System.out.println("editGatepassHeader  " + editGatepassHeader);
 
				GetpassHeader result = rest.postForObject(Constants.url + "/saveGetPassHeaderDetail",
						editGatepassHeader, GetpassHeader.class);
				System.out.println(result);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/listOfGetpassReturn";
		//return "redirect:/listOfGetpassReturnable";
	}
	
	List<GetpassItemVen> getPassListForApprove = new ArrayList<GetpassItemVen>( );
	
	@RequestMapping(value = "/firstApproveGatePass", method = RequestMethod.GET)
	public ModelAndView firstApproveGatePass(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/approveGatePass");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
 
			map.add("status","7,9"); 
			GetpassItemVen[] gatePassList =rest.postForObject(Constants.url+"getGetpassItemHeaderAndDetailForApprove", map,  GetpassItemVen[].class);
			 getPassListForApprove = new ArrayList<GetpassItemVen>(Arrays.asList(gatePassList));
			model.addObject("approve", 1);
			model.addObject("getPassListForApprove", getPassListForApprove);
			
			/*Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);*/
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/secondApproveGatePass", method = RequestMethod.GET)
	public ModelAndView secondApprovePurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("getpass/approveGatePass");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			 
			map.add("status","7"); 
			GetpassItemVen[] gatePassList =rest.postForObject(Constants.url+"getGetpassItemHeaderAndDetailForApprove", map,  GetpassItemVen[].class);
			 getPassListForApprove = new ArrayList<GetpassItemVen>(Arrays.asList(gatePassList));
			model.addObject("approve", 2);
			model.addObject("getPassListForApprove", getPassListForApprove);
			
			/*Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);*/

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	GetpassHeaderItemName gatepassFroApprove = new GetpassHeaderItemName();
	
	@RequestMapping(value = "/approveGatePassDetail/{gpId}/{approve}", method = RequestMethod.GET)
	public ModelAndView approvePoDetail(@PathVariable int gpId,@PathVariable int approve, HttpServletRequest request, HttpServletResponse response) {

		 
		ModelAndView model = new ModelAndView("getpass/approveGatepassDetail");
		try {

			 gatepassFroApprove = new GetpassHeaderItemName();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			 map.add("gpId",gpId); 
			 gatepassFroApprove = rest.postForObject(Constants.url + "/getGetpassItemHeaderAndDetailWithItemNameForNonReturnable", map,
						GetpassHeaderItemName.class);
			
           model.addObject("gatepassFroApprove", gatepassFroApprove);
			model.addObject("approve", approve);
			
			for(int i = 1 ; i<getPassListForApprove.size() ; i++) {
				
				if(getPassListForApprove.get(i).getGpId()==gpId) {
					model.addObject("vendorName",getPassListForApprove.get(i).getVendorName()); 
					break;
				}
			}
			
			
			
			/*Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);*/

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/submitGatepassApprove", method = RequestMethod.POST)
	public String submitMrnApprove(HttpServletRequest request, HttpServletResponse response) {

		String ret = null;
		int approve = Integer.parseInt(request.getParameter("approve"));
		try {
			 
			
			String gpDetailId = new String();
			int gpId = 0 ;
			int status = 7;
			
			
			if(approve==1) {
				
				gatepassFroApprove.setGpStatus(7);
				gpId=gatepassFroApprove.getGpId();
				String[] checkbox = request.getParameterValues("select_to_approve");
				status=7;
				for(int i=0 ; i<checkbox.length ;i++) {
					
					for(int j=0 ; j<gatepassFroApprove.getGetpassDetailItemNameList().size() ; j++) {
						
						if(Integer.parseInt(checkbox[i])==gatepassFroApprove.getGetpassDetailItemNameList().get(j).getGpDetailId()) {
							gatepassFroApprove.getGetpassDetailItemNameList().get(j).setGpStatus(7);
							gpDetailId=gpDetailId+","+gatepassFroApprove.getGetpassDetailItemNameList().get(j).getGpDetailId();
							break;
						}
					}
				}
				
				 
			}
			else if(approve==2){
				
				gatepassFroApprove.setGpStatus(1);
				gpId=gatepassFroApprove.getGpId();
				String[] checkbox = request.getParameterValues("select_to_approve");
				status=1;
				for(int i=0 ; i<checkbox.length ;i++) {
					
					for(int j=0 ; j<gatepassFroApprove.getGetpassDetailItemNameList().size() ; j++) {
						
						if(Integer.parseInt(checkbox[i])==gatepassFroApprove.getGetpassDetailItemNameList().get(j).getGpDetailId()) {
							gatepassFroApprove.getGetpassDetailItemNameList().get(j).setGpStatus(1);
							gpDetailId=gpDetailId+","+gatepassFroApprove.getGetpassDetailItemNameList().get(j).getGpDetailId();
							break;
						}
					}
				}
				
			}
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("gpId", gpId);
			map.add("gpDetailId", gpDetailId.substring(1, gpDetailId.length()));
			map.add("status", status);
			System.out.println("map " + map);
			ErrorMessage approved = rest.postForObject(Constants.url + "/updateStatusWhileGatepassApprov", map, ErrorMessage.class);
 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(approve==1) {
			ret = "redirect:/firstApproveGatePass";
		}
		else {
			ret = "redirect:/secondApproveGatePass";
		}

		return ret;
	}

}
