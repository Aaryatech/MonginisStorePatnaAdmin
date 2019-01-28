 package com.ats.tril.controller;

import java.io.File;
import java.io.FileInputStream;
import java.text.DateFormat;
import java.text.ParseException;
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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.AccountHead;
import com.ats.tril.model.Category;
import com.ats.tril.model.ConsumptionReportWithCatId;
import com.ats.tril.model.Dept;
import com.ats.tril.model.ErrorMessage;
import com.ats.tril.model.GetCurrentStock;
import com.ats.tril.model.GetItemGroup;
import com.ats.tril.model.GetSubDept;
import com.ats.tril.model.ImportExcelForPo;
import com.ats.tril.model.IndentValueLimit;
import com.ats.tril.model.ItemListWithCurrentStock;
import com.ats.tril.model.StockHeader;
import com.ats.tril.model.Type;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.doc.SubDocument;
import com.ats.tril.model.indent.GetIndent;
import com.ats.tril.model.indent.GetIndentDetail;
import com.ats.tril.model.indent.Indent;
import com.ats.tril.model.indent.IndentTrans;
import com.ats.tril.model.indent.TempIndentDetail;
import com.ats.tril.model.item.GetItem;
import com.ats.tril.model.item.ItemList;

@Controller
@Scope("session")
public class IndentController { 
	
	
	
	RestTemplate rest = new RestTemplate();
	List<ConsumptionReportWithCatId> mrnReportList = new ArrayList<ConsumptionReportWithCatId>();
	List<ItemListWithCurrentStock> itemListWithCurrentStockList = new ArrayList<>();
	
	
	public List<ConsumptionReportWithCatId> getValueFunction() {
		 
		mrnReportList = new ArrayList<ConsumptionReportWithCatId>();
		
		try {
			 
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat dd = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			  Calendar calendar = Calendar.getInstance();
			  calendar.setTime(date);
			   
			 String fromDate = "01"+"-"+(calendar.get(Calendar.MONTH)+1)+"-"+calendar.get(Calendar.YEAR);
			 String toDate = yy.format(date);
			 
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>(); 
			 			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			 			map.add("toDate", toDate); 
			 			System.out.println(map);
			 			ConsumptionReportWithCatId[] consumptionReportWithCatId = rest.postForObject(Constants.url + "/getConsumptionMrnData",map, ConsumptionReportWithCatId[].class);
			 		 mrnReportList = new ArrayList<ConsumptionReportWithCatId>(Arrays.asList(consumptionReportWithCatId));
					   
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mrnReportList;
	}
	
	@RequestMapping(value = "/getlimitationValue", method = RequestMethod.GET)
	@ResponseBody
	public List<ConsumptionReportWithCatId> getlimitationValue(HttpServletRequest request, HttpServletResponse response) {
  
		return mrnReportList;
	}
	
	@RequestMapping(value = "/getIndentValueLimit", method = RequestMethod.GET)
	@ResponseBody
	public float getIndentValueLimit(HttpServletRequest request, HttpServletResponse response) {
  
		float total = 0;
		try {
			List<IndentValueLimit> list = new ArrayList<IndentValueLimit>();
			
			int catId = Integer.parseInt(request.getParameter("catId"));
			int typeId = Integer.parseInt(request.getParameter("typeId"));
			
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date = new Date();
			  Calendar calendar = Calendar.getInstance();
			  calendar.setTime(date);
			   
			 String fromDate = "01"+"-"+(calendar.get(Calendar.MONTH)+1)+"-"+calendar.get(Calendar.YEAR);
			 String toDate = yy.format(date);
			 
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>(); 
			 			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			 			map.add("toDate", toDate);
			 			map.add("catId", catId);
			 			map.add("typeId", typeId);
			 			map.add("status", "0,1,2");
			 			System.out.println(map);
			 			IndentValueLimit[] indentValueLimit = rest.postForObject(Constants.url + "/getIndentValueLimit",map, IndentValueLimit[].class);
			 			list = new ArrayList<IndentValueLimit>(Arrays.asList(indentValueLimit));
			
			 			System.out.println("list " + list);
			 			
			 			for(int i=0; i<list.size() ; i++) {
			 				
			 				total=total+(list.get(i).getQty()*list.get(i).getRate());
			 				System.out.println("total ----------" + total);
			 			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	  
	@RequestMapping(value = "/getLastRate", method = RequestMethod.GET)
	@ResponseBody
	public float getLastRate(HttpServletRequest request, HttpServletResponse response) {
  
		float rate = 0;
		float totalIndentValueText=0;
		try {
			 
			 
			int flag = Integer.parseInt(request.getParameter("flag"));
			float itemQty = Integer.parseInt(request.getParameter("qty"));
			 totalIndentValueText = Integer.parseInt(request.getParameter("totalIndentValueText"));
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();  
			 
			 
			 if(flag==1) {
				 int itemId = Integer.parseInt(request.getParameter("itemId"));
				 map.add("itemId", itemId); 
				 System.out.println(map);
				  rate = rest.postForObject(Constants.url + "/getLatestRateofItem",map, Float.class); 
				 System.out.println("rate " + rate);
				 totalIndentValueText=totalIndentValueText+(itemQty*rate);
			 }
			 else {
				 map.add("itemId", itemIdforMinus); 
				 System.out.println(map);
				  rate = rest.postForObject(Constants.url + "/getLatestRateofItem",map, Float.class); 
				 System.out.println("rate " + rate);
				 totalIndentValueText=totalIndentValueText-(qty*rate);
			 }
			 			  
		}catch(Exception e) {
			e.printStackTrace();
		}
		return totalIndentValueText;
	}
	
	@RequestMapping(value = "/getMoqQtyForValidation", method = RequestMethod.GET)
	@ResponseBody
	public ItemListWithCurrentStock getMoqQtyForValidation(HttpServletRequest request, HttpServletResponse response) {
  
		ItemListWithCurrentStock getItem  = new ItemListWithCurrentStock();
		 
		try {
			   
				 int itemId = Integer.parseInt(request.getParameter("itemId"));
				 
				 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					map.add("fromDate", fromDateForStock);
					map.add("toDate", toDateForStock);
					map.add("itemId", itemId);
					 
					getItem = rest.postForObject(Constants.url + "/getItemListByItemIdWithStock",map,ItemListWithCurrentStock.class);
					
					  
				  for(int i=0;i<itemList.size();i++) {
					 if(itemId==itemList.get(i).getItemId()) {
						 getItem.setMaxLevel(itemList.get(i).getItemOpQty());
					 }
					 
				 } 
			 
			 			  
		}catch(Exception e) {
			e.printStackTrace();
		}
		return getItem;
	}
	
	@RequestMapping(value = "/getIndentPendingValueLimit", method = RequestMethod.GET)
	@ResponseBody
	public float getIndentPendingValueLimit(HttpServletRequest request, HttpServletResponse response) {
  
		float total = 0;
		try {
			List<IndentValueLimit> list = new ArrayList<IndentValueLimit>();
			
			int catId = Integer.parseInt(request.getParameter("catId"));
			int typeId = Integer.parseInt(request.getParameter("typeId"));
			
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date = new Date();
			  Calendar calendar = Calendar.getInstance();
			  calendar.setTime(date);
			   
			 String fromDate = "01"+"-"+(calendar.get(Calendar.MONTH)+1)+"-"+calendar.get(Calendar.YEAR);
			 String toDate = yy.format(date);
			 
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>(); 
			 			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			 			map.add("toDate", toDate);
			 			map.add("catId", catId);
			 			map.add("typeId", typeId);
			 			map.add("status", "7,9");
			 			System.out.println(map);
			 			IndentValueLimit[] indentValueLimit = rest.postForObject(Constants.url + "/getIndentValueLimit",map, IndentValueLimit[].class);
			 			list = new ArrayList<IndentValueLimit>(Arrays.asList(indentValueLimit));
			
			 			System.out.println("list " + list);
			 			
			 			for(int i=0; i<list.size() ; i++) {
			 				System.out.println("total ----------" + total);
			 				total=total+(list.get(i).getQty()*list.get(i).getRate());
			 				
			 				
			 			}
			 			
			 			System.out.println("getIndentPendingValueLimit " + total);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	String fromDateForStock;
	String toDateForStock;
	
	@RequestMapping(value = "/showIndent", method = RequestMethod.GET)
	public ModelAndView addCategory(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			
			tempIndentList = new ArrayList<TempIndentDetail>();
			model = new ModelAndView("indent/addindent");
			Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
			model.addObject("categoryList", categoryList);

			AccountHead[] accountHead = rest.getForObject(Constants.url + "/getAllAccountHeadByIsUsed",
					AccountHead[].class);
			List<AccountHead> accountHeadList = new ArrayList<AccountHead>(Arrays.asList(accountHead)); 
			model.addObject("accountHeadList", accountHeadList);

			/*Dept[] Dept = rest.getForObject(Constants.url + "/getAllDeptByIsUsed", Dept[].class);
			List<Dept> deparmentList = new ArrayList<Dept>(Arrays.asList(Dept)); 
			model.addObject("deparmentList", deparmentList);*/
			
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			model.addObject("date", dateFormat.format(date));

			StockHeader stockHeader = rest.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",
					StockHeader.class);

			date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

			fromDateForStock = stockHeader.getYear() + "-" + stockHeader.getMonth() + "-" + "01";
			toDateForStock = sf.format(date);
			 
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);
			
			/*MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("fromDate", fromDateForStock);
			 map.add("toDate", toDateForStock);
			 
			GetCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getCurrentStock",map,GetCurrentStock[].class);
			
			 stockList = new ArrayList<>(Arrays.asList(getCurrentStock));*/
			 
			//getValueFunction();
			
		} catch (Exception e) {

			System.err.println("Exception in showing add Indent" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/addItemFromItemListInIndent", method = RequestMethod.POST)
	public ModelAndView addItemFromItemListInIndent(HttpServletRequest request,
			HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("indent/addindent");
		try {
			
			 
			try {
				String indHeaderRemarkTemp = request.getParameter("indHeaderRemarkTemp");
				model.addObject("indHeaderRemarkTemp", indHeaderRemarkTemp);
			} catch (Exception e) {
				// TODO: handle exception
			} 
			try {
				int accHeadTemp = Integer.parseInt(request.getParameter("accHeadTemp"));
				model.addObject("accHeadTemp", accHeadTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String indentDateTemp = request.getParameter("indentDateTemp")  ;
				model.addObject("date", indentDateTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				int indentTypeTemp = Integer.parseInt(request.getParameter("indentTypeTemp"));
				model.addObject("indentTypeTemp", indentTypeTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				String indentNoTemp = request.getParameter("indentNoTemp") ;
				model.addObject("indentNoTemp", indentNoTemp);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			int catIdTemp = Integer.parseInt(request.getParameter("catIdTemp"));
			System.out.println("catIdTemp " + catIdTemp);
			model.addObject("catIdTemp", catIdTemp);

			String[] checkbox = request.getParameterValues("select_to_approve");
			
			Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
			model.addObject("categoryList", categoryList);

			AccountHead[] accountHead = rest.getForObject(Constants.url + "/getAllAccountHeadByIsUsed",
					AccountHead[].class);
			List<AccountHead> accountHeadList = new ArrayList<AccountHead>(Arrays.asList(accountHead)); 
			model.addObject("accountHeadList", accountHeadList);
 
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			model.addObject("date", dateFormat.format(date));
 
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);
			
			for(int i = 0 ; i<checkbox.length ; i++) {
				
				for(int j = 0 ; j<itemListWithCurrentStockList.size() ; j++) {
					
					if(Integer.parseInt(checkbox[i])==itemListWithCurrentStockList.get(j).getItemId()) {
						
						TempIndentDetail detail = new TempIndentDetail();
						 
						detail.setCurStock(itemListWithCurrentStockList.get(j).getClsQty());
						detail.setItemId(itemListWithCurrentStockList.get(j).getItemId());
						detail.setItemName(itemListWithCurrentStockList.get(j).getItemCode()+"-"+itemListWithCurrentStockList.get(j).getItemDesc());
						detail.setQty(Float.parseFloat(request.getParameter("qty"+itemListWithCurrentStockList.get(j).getItemId()))); 
						detail.setDate(DateConvertor.convertToDMY(request.getParameter("schDate"+itemListWithCurrentStockList.get(j).getItemId())));
						detail.setUom(itemListWithCurrentStockList.get(j).getItemUom());
						detail.setItemCode(itemListWithCurrentStockList.get(j).getItemCode()); 
						detail.setPoPending(itemListWithCurrentStockList.get(j).getPoPending());
						detail.setAvgIssueQty(itemListWithCurrentStockList.get(j).getAvgIssueQty());
						detail.setMoqQty(itemListWithCurrentStockList.get(j).getItemopQty());
						tempIndentList.add(detail);
						break;

					} 
				}
				
			}
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("catId", catIdTemp);  
			GetItem[] GetItem = rest.postForObject(Constants.url + "itemListByCatId", map, GetItem[].class);
			itemList = new ArrayList<>(Arrays.asList(GetItem));
			
			model.addObject("itemList", itemList);
			model.addObject("tempIndentList", tempIndentList);
			model.addObject("isSubmit", 1);
 
		} catch (Exception e) {

			System.err.println("Exce in getIndentDetail Cont @IndentController by Ajax call " + e.getMessage());

			e.printStackTrace();
		}
		return model;
	}
	 
	List<TempIndentDetail> tempIndentList = new ArrayList<TempIndentDetail>();

	float qty=0; 
	int itemIdforMinus=0; 
	// getIndentDetail to add a new Item in add Indent jsp
	@RequestMapping(value = "/getIndentDetail", method = RequestMethod.GET)
	public @ResponseBody List<TempIndentDetail> getIndentDetail(HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("In getIndentDetail ");

		try {

			int key = Integer.parseInt(request.getParameter("key"));

			if (key == -1) {

				System.err.println("Add Call Indent");
				String itemName = request.getParameter("itemName");
				String remark = request.getParameter("remark");

				int itemId = Integer.parseInt(request.getParameter("itemId"));

				if (tempIndentList.size() > 0) {
					/*int flag = 0;
					for (int i = 0; i < tempIndentList.size(); i++) {
						tempIndentList.get(i).setIsDuplicate(0);
						if (tempIndentList.get(i).getItemId() == itemId) {
							tempIndentList.get(i).setIsDuplicate(1);
							flag = 1;

						} // end of if item exist

					} // end of for tempIndeList
					if (flag == 0) {*/
						System.err.println("New Item added to existing list");

						float qty = Float.parseFloat(request.getParameter("qty"));
						String schDate =  request.getParameter("schDay") ;
						String indDate = request.getParameter("indentDate");
						
						MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
						map.add("fromDate", fromDateForStock);
						map.add("toDate", toDateForStock);
						map.add("itemId", itemId);
						//GetCurrentStock getCurrentStockByItemId = rest.postForObject(Constants.url + "/getCurrentStockByItemId",map,GetCurrentStock.class);
						ItemListWithCurrentStock getCurrentStockByItemId = rest.postForObject(Constants.url + "/getItemListByItemIdWithStock",map,ItemListWithCurrentStock.class);
						
						TempIndentDetail detail = new TempIndentDetail();
						String uom = null;
						String itemCode = null;
						for (int j = 0; j < itemList.size(); j++) {
							if (itemList.get(j).getItemId() == itemId) {
								uom = itemList.get(j).getItemUom();
								itemCode = itemList.get(j).getItemCode();
								detail.setMoqQty(itemList.get(j).getItemOpQty());
								break;
							}
						}
						 
						// Date d=LocalDate.now().plusDays(schDay);
						detail.setCurStock(getCurrentStockByItemId.getOpeningStock()+getCurrentStockByItemId.getApproveQty()-
								getCurrentStockByItemId.getIssueQty()-getCurrentStockByItemId.getDamageQty());
						detail.setItemId(itemId);
						detail.setItemName(itemName);
						detail.setQty(qty); 
						detail.setDate(schDate);
						detail.setUom(uom);
						detail.setItemCode(itemCode);
						detail.setRemark(remark);
						detail.setPoPending(getCurrentStockByItemId.getPoPending());
						detail.setAvgIssueQty(getCurrentStockByItemId.getAvgIssueQty());
						tempIndentList.add(detail);
					//}
				} // end of if tempIndentList.size>0

				else {

					System.err.println("New Item added first time : list is empty");

					float qty = Float.parseFloat(request.getParameter("qty"));
					String schDate =  request.getParameter("schDay") ;
					String indDate = request.getParameter("indentDate");
					TempIndentDetail detail = new TempIndentDetail();

					String uom = null;
					String itemCode = null;
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					map.add("fromDate", fromDateForStock);
					map.add("toDate", toDateForStock);
					map.add("itemId", itemId);
					//GetCurrentStock getCurrentStockByItemId = rest.postForObject(Constants.url + "/getCurrentStockByItemId",map,GetCurrentStock.class);
					ItemListWithCurrentStock getCurrentStockByItemId = rest.postForObject(Constants.url + "/getItemListByItemIdWithStock",map,ItemListWithCurrentStock.class);

					for (int j = 0; j < itemList.size(); j++) {

						if (itemList.get(j).getItemId() == itemId) {

							uom = itemList.get(j).getItemUom();
							itemCode = itemList.get(j).getItemCode();
							detail.setMoqQty(itemList.get(j).getItemOpQty());
							break;
						}
					}

					// String calculatedDate = incrementDate(deliveryDate, itemShelfLife);
 
					detail.setCurStock(getCurrentStockByItemId.getOpeningStock()+getCurrentStockByItemId.getApproveQty()-
							getCurrentStockByItemId.getIssueQty()-getCurrentStockByItemId.getDamageQty());
					detail.setItemId(itemId);
					detail.setItemName(itemName);
					detail.setQty(qty); 
					detail.setDate(schDate);
					detail.setUom(uom);
					detail.setItemCode(itemCode);
					detail.setRemark(remark);
					detail.setPoPending(getCurrentStockByItemId.getPoPending());
					detail.setAvgIssueQty(getCurrentStockByItemId.getAvgIssueQty());
					tempIndentList.add(detail);
				} // else it is first item
			} // end of if key==-1

			else {
				System.err.println("remove call Indent");
				qty=tempIndentList.get(key).getQty();
				itemIdforMinus=tempIndentList.get(key).getItemId();
				tempIndentList.remove(key);
			}
		} catch (Exception e) {

			System.err.println("Exce in getIndentDetail Cont @IndentController by Ajax call " + e.getMessage());

			e.printStackTrace();
		}
		return tempIndentList;
	}
	
	@RequestMapping(value = "/deleteIndent/{indId}", method = RequestMethod.GET)
	public String deleteIndent(@PathVariable int indId, HttpServletRequest request, HttpServletResponse response) {

		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("indId", indId);

			ErrorMessage ErrorMessage = rest.postForObject(Constants.url + "/deleteIndent", map, ErrorMessage.class);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "redirect:/getIndents";
	}

	@RequestMapping(value = "/getSubDeptListByDeptId", method = RequestMethod.GET)
	public @ResponseBody List<GetSubDept> getSubDeptListByDeptId(HttpServletRequest request,
			HttpServletResponse response) {

		List<GetSubDept> subDeptList = new ArrayList<GetSubDept>();
		try {

			int deptId = 0;

			String deptIdS = request.getParameter("deptId");

			deptId = Integer.parseInt(deptIdS);

			System.out.println("deptId Id " + deptId);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			// MultiValueMap<String, Object> mapItemList = new LinkedMultiValueMap<String,
			// Object>();

			map.add("deptId", deptId);

			RestTemplate restTemplate = new RestTemplate();

			subDeptList = restTemplate.postForObject(Constants.url + "getSubDeptListByDeptId", map, List.class);

		} catch (Exception e) {

			System.err.println("Exce in FrCurStock Cont @items by Cat Id Ajax call " + e.getMessage());

			e.printStackTrace();
		}
		return subDeptList;
	}

	@RequestMapping(value = "/getgroupListByCatId", method = RequestMethod.GET)
	public @ResponseBody List<GetItem> getgroupListByCatId(HttpServletRequest request,
			HttpServletResponse response) {
		
		 
		try {

			int catId = 0;

			String catIds = request.getParameter("catId");

			catId = Integer.parseInt(catIds);

			System.out.println("catIds Id " + catIds);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
 
			map.add("catId", catId); 
			GetItem[] GetItem = rest.postForObject(Constants.url + "itemListByCatId", map, GetItem[].class);
			itemList = new ArrayList<>(Arrays.asList(GetItem));

		} catch (Exception e) {

			System.err.println(
					"Exce in getgroupListByCatId Cont @IndentController by Cat Id Ajax call " + e.getMessage());

			e.printStackTrace();
		}
		return itemList;
	}

	List<GetItem> itemList = new ArrayList<GetItem>();

	@RequestMapping(value = "/itemListByGroupId", method = RequestMethod.GET)
	public @ResponseBody List<GetItem> itemListByGroupId(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("In get group by cat Id ");
		try {

			int grpId = 0;

			String grpIds = request.getParameter("grpId");

			grpId = Integer.parseInt(grpIds);

			System.out.println("grpId Id " + grpId);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			// MultiValueMap<String, Object> mapItemList = new LinkedMultiValueMap<String,
			// Object>();

			map.add("groupId", grpId);

			RestTemplate restTemplate = new RestTemplate();

			ItemList resList = restTemplate.postForObject(Constants.url + "itemListByGroupId", map, ItemList.class);

			itemList = resList.getItems();

			for (int i = 0; i < itemList.size(); i++) {

				itemList.get(i).setItemDesc(itemList.get(i).getItemCode() + " - " + itemList.get(i).getItemDesc());

			}

		} catch (Exception e) {

			System.err.println(
					"Exce in getgroupListByCatId Cont @IndentController by Cat Id Ajax call " + e.getMessage());

			e.printStackTrace();
		}
		return itemList;
	}

	public String incrementDate(String date, int day) {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(sdf.parse(date));

		} catch (ParseException e) {
			System.out.println("Exception while incrementing date " + e.getMessage());
			e.printStackTrace();
		}
		c.add(Calendar.DATE, day); // number of days to add
		date = sdf.format(c.getTime());

		return date;

	}
	
	
	
	
	@RequestMapping(value = "/getItemFroItemListBelowROL", method = RequestMethod.GET)
	@ResponseBody
	public List<ItemListWithCurrentStock> getItemFroItemListBelowROL(HttpServletRequest request, HttpServletResponse response) {

		
		itemListWithCurrentStockList = new ArrayList<ItemListWithCurrentStock>();
		
		try {
			
			int catId = Integer.parseInt(request.getParameter("catId"));
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("fromDate", fromDateForStock);
			 map.add("toDate", toDateForStock);
			 map.add("catId", catId);
			 
			 ItemListWithCurrentStock[] getCurrentStock = rest.postForObject(Constants.url + "/getItemListByCatIdWithStock",map,ItemListWithCurrentStock[].class);
			
			 itemListWithCurrentStockList = new ArrayList<>(Arrays.asList(getCurrentStock)); 
			 
 			System.out.println(itemListWithCurrentStockList);
 	 
 			 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemListWithCurrentStockList;
	}

	// used on editIndent Header add new item for edit Indent

	@RequestMapping(value = "/getIndentDetailForEdit", method = RequestMethod.GET)
	public @ResponseBody List<GetIndentDetail> getIndentDetailForEdit(HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println("In get getIndentDetailForEdit ");

		try {
			tempIndentList = new ArrayList<TempIndentDetail>();
			int indMId = Integer.parseInt(request.getParameter("indMId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("indMId", indMId);
			RestTemplate restTemp = new RestTemplate();
			Indent indent = restTemp.postForObject(Constants.url + "/getIndentByIndId", map, Indent.class);

			int key = Integer.parseInt(request.getParameter("key"));
			if (key == -1) {
				System.err.println("Add Call Indent");
				String itemName = request.getParameter("itemName");

				String remark = request.getParameter("remark");
				int itemId = Integer.parseInt(request.getParameter("itemId"));
				System.err.println("Item Id " + itemId);
				float qty = Float.parseFloat(request.getParameter("qty"));
				String schDay = request.getParameter("schDay") ;
				String indDate = request.getParameter("indentDate");

				int flag = 0;
				/*for (int i = 0; i < indDetailListForEdit.size(); i++) {
					indDetailListForEdit.get(i).setIsDuplicate(0);
					if (indDetailListForEdit.get(i).getItemId() == itemId) {
						flag = 1;
						indDetailListForEdit.get(i).setIsDuplicate(1);

					}
				}*/
				if (flag == 0) {
					TempIndentDetail tempDetail = new TempIndentDetail();
					String uom = null;
					String itemCode = null;
					for (int i = 0; i < itemList.size(); i++) {

						if (itemList.get(i).getItemId() == itemId) {
							uom = itemList.get(i).getItemUom();
							itemCode = itemList.get(i).getItemCode();
							break;
						}
					}
					tempIndentList = new ArrayList<TempIndentDetail>();
					 
					tempDetail.setCurStock(0);
					tempDetail.setItemId(itemId);
					tempDetail.setItemName(itemName);
					tempDetail.setQty(qty); 
					tempDetail.setDate(schDay);
					tempDetail.setUom(uom);
					tempDetail.setItemCode(itemCode);
					tempDetail.setRemark(remark);
					tempIndentList.add(tempDetail);

					IndentTrans transDetail = new IndentTrans();
					TempIndentDetail detail = tempIndentList.get(0);

					transDetail.setIndDStatus(9);// changed from 0 to 9 on 18 aug

					transDetail.setIndItemCurstk(detail.getCurStock());
					transDetail.setIndItemDesc(detail.getItemName());
					transDetail.setIndItemSchd(detail.getSchDays());
					transDetail.setIndItemSchddt(DateConvertor.convertToSqlDate(detail.getDate()));
					transDetail.setIndItemUom(detail.getUom());
					transDetail.setIndMDate(indent.getIndMDate());
					transDetail.setIndMNo(indent.getIndMNo());
					transDetail.setIndQty(detail.getQty());
					transDetail.setIndRemark(detail.getRemark());
					transDetail.setItemId(detail.getItemId());
					transDetail.setIndFyr(detail.getQty());

					transDetail.setIndMId(indent.getIndMId());
					transDetail.setDelStatus(Constants.delStatus);
					transDetail.setIndApr1Date(indent.getIndMDate());
					transDetail.setIndApr2Date(indent.getIndMDate());
					
					// indTrasList.add(transDetail);

					GetIndentDetail[] indDetail = rest.postForObject(Constants.url + "/saveIndentTras", transDetail,
							GetIndentDetail[].class);

					indDetailListForEdit = new ArrayList<GetIndentDetail>(Arrays.asList(indDetail));
					
					for (int i = 0; i < indDetailListForEdit.size(); i++) {

						indDetailListForEdit.get(i).setIndItemSchddt(DateConvertor.convertToYMD(indDetailListForEdit.get(i).getIndItemSchddt()));

					}
					
				} // end of if flag==0
			} // end of if key==-1;
		} catch (Exception e) {

			System.err.println("Exce in getIndentDetail Cont @IndentController by Ajax call " + e.getMessage());

			e.printStackTrace();
		}
		return indDetailListForEdit;
	}

	@RequestMapping(value = "/getInvoiceNo", method = RequestMethod.GET)
	@ResponseBody
	public DocumentBean getInvoiceNo(HttpServletRequest request, HttpServletResponse response) {

		String invNo = "";
		DocumentBean docBean = null;
		try {
			int catId = Integer.parseInt(request.getParameter("catId"));
			int docId = Integer.parseInt(request.getParameter("docId"));
			String date = request.getParameter("date");
			int typeId = Integer.parseInt(request.getParameter("typeId"));
			
			if (date == "") {
				Date currDate = new Date();
				date = new SimpleDateFormat("yyyy-MM-dd").format(currDate);
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("docId", docId);
			map.add("catId", catId);
			map.add("date", DateConvertor.convertToYMD(date));
			map.add("typeId", typeId);
			
			RestTemplate restTemplate = new RestTemplate();

			docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
			System.err.println("Doc" + docBean.toString());
			String indMNo = docBean.getSubDocument().getCategoryPrefix() + "";
			int counter = docBean.getSubDocument().getCounter();
			int counterLenth = String.valueOf(counter).length();
			counterLenth = 4 - counterLenth;
			StringBuilder code = new StringBuilder(indMNo);

			for (int i = 0; i < counterLenth; i++) {
				String j = "0";
				code.append(j);
			}
			code.append(String.valueOf(counter));
			invNo = "" + code;
			docBean.setCode(invNo);
			System.err.println("invNo" + invNo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return docBean;
	}

	@RequestMapping(value = "/saveIndent", method = RequestMethod.POST)
	public String saveIndent(HttpServletRequest request, HttpServletResponse response) {

		try {

			System.err.println("Inside saveIndent");

			int catId = Integer.parseInt(request.getParameter("catId"));

			String indNo = request.getParameter("indent_no");

			int indType = Integer.parseInt(request.getParameter("indent_type"));
			
			String indHeaderRemark = request.getParameter("indHeaderRemark");

			String indDate = request.getParameter("indent_date");
			System.err.println("indeDate " + indDate);

			int accHead = Integer.parseInt(request.getParameter("acc_head"));

			int isMachineSpe = Integer.parseInt(request.getParameter("machine_specific"));

			int dept = 0;
			int subDept = 0;

			if (isMachineSpe == 1) {
				System.err.println("It is Machine Specific");
				dept = Integer.parseInt(request.getParameter("dept"));
				subDept = Integer.parseInt(request.getParameter("sub_dept"));

				System.err.println("dept " + dept + "sub Dept  " + subDept);

			}

			System.err.println("dept " + dept + "sub Dept  " + subDept);

			int isDev = Integer.parseInt(request.getParameter("is_dev"));
			int isMonthly = Integer.parseInt(request.getParameter("is_monthly"));

			Indent indent = new Indent();
			DocumentBean docBean = null;
			try {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 1);
				map.add("catId", catId);
				map.add("date", DateConvertor.convertToYMD(indDate));
				map.add("typeId", indType);
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

				indent.setIndMNo("" + code);

				docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter() + 1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			indent.setAchdId(accHead);
			indent.setCatId(catId);
			indent.setIndIsdev(isDev);
			indent.setIndIsmonthly(isMonthly);
			indent.setIndMDate(DateConvertor.convertToYMD(indDate));

			indent.setIndMStatus(9);
			indent.setIndMType(indType);
			indent.setIndRemark("-");

			indent.setDeptId(dept);
			indent.setSubDeptId(subDept);
			indent.setIndApr1Date(DateConvertor.convertToYMD(indDate));
			indent.setIndApr2Date(DateConvertor.convertToYMD(indDate));

			indent.setDelStatus(Constants.delStatus);
			indent.setIndRemark(indHeaderRemark);
			List<IndentTrans> indTrasList = new ArrayList<IndentTrans>();
			for (int i = 0; i < tempIndentList.size(); i++) {

				IndentTrans transDetail = new IndentTrans();
				TempIndentDetail detail = tempIndentList.get(i);

				transDetail.setIndDStatus(9);

				transDetail.setIndItemCurstk(detail.getCurStock());
				transDetail.setIndItemDesc(detail.getItemName());
				transDetail.setIndItemSchd(detail.getSchDays());
				transDetail.setIndItemSchddt(DateConvertor.convertToSqlDate(detail.getDate()));
				transDetail.setIndItemUom(detail.getUom());
				transDetail.setIndMDate(indent.getIndMDate());
				transDetail.setIndMNo(indent.getIndMNo());
				transDetail.setIndQty(detail.getQty());
				transDetail.setIndRemark(detail.getRemark());
				transDetail.setItemId(detail.getItemId());
				transDetail.setIndFyr(detail.getQty());
				transDetail.setDelStatus(Constants.delStatus);
				
				transDetail.setIndApr1Date(DateConvertor.convertToYMD(indDate));
				transDetail.setIndApr2Date(DateConvertor.convertToYMD(indDate));

				indTrasList.add(transDetail);

			}
			indent.setIndentTrans(indTrasList);
			System.err.println("Indent = " + indent.toString());

			RestTemplate restTemp = new RestTemplate();
			if (indTrasList.size() > 0) {
				Indent indRes = restTemp.postForObject(Constants.url + "/saveIndentAndTrans", indent, Indent.class);
				if (indRes != null) {
					try {

						SubDocument subDocRes = restTemp.postForObject(Constants.url + "/saveSubDoc",
								docBean.getSubDocument(), SubDocument.class);

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				System.err.println("indRes " + indRes.toString());
			}
		} catch (Exception e) {

			System.err.println("Exception in @saveIndent  Indent" + e.getMessage());
			e.getCause();
			e.printStackTrace();
		}
		System.err.println("Inside last Saveindent");

		return "redirect:/showIndent";
	}

	// getIndents //show fromDate toDate and status

	List<GetIndent> indentList = new ArrayList<GetIndent>();
	String fromDate, toDate;

	@RequestMapping(value = "/getIndents", method = RequestMethod.GET)
	public ModelAndView getIndents(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("indent/viewindent");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			// String fromDate,toDate;
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);
			
			if (request.getParameter("from_date") == null || request.getParameter("to_date") == null) {
				Date date = new Date();
				DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				fromDate = df.format(date);
				toDate = df.format(date);
				System.out.println("From Date And :" + fromDate + "ToDATE" + toDate);

				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("typeId", 0);
				System.out.println("inside if ");
			} else {
				fromDate = request.getParameter("from_date");
				toDate = request.getParameter("to_date");
				int typeId = Integer.parseInt(request.getParameter("typeId"));

				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("typeId", typeId);
				model.addObject("typeId", typeId);
			}
			map.add("status", "0,1,2,9,7");

			
			GetIndent[] indents = rest.postForObject(Constants.url + "/getIndentsByType", map, GetIndent[].class);

			indentList = new ArrayList<GetIndent>();

			indentList = new ArrayList<GetIndent>(Arrays.asList(indents));

			System.out.println("Indent List using /getIndents   " + indentList.toString());

			model.addObject("indentList", indentList);
			model.addObject("fromDate", fromDate);
			model.addObject("toDate", toDate);
			
			 

		} catch (Exception e) {

			System.err.println("Exception in getIndents Indent" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	// editIndent edit Indent Header

	List<GetIndentDetail> indDetailListForEdit = new ArrayList<GetIndentDetail>();

	@RequestMapping(value = "/editIndent/{indMId}", method = RequestMethod.GET)
	public ModelAndView editIndent(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("indMId") int indMId) {

		indDetailListForEdit = new ArrayList<GetIndentDetail>();

		ModelAndView model = null;
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			System.err.println("from date in edit Indent " + fromDate + "toDate  " + toDate);

			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			map.add("status", "0,1,2,9,7");

			GetIndent[] indents = rest.postForObject(Constants.url + "/getIndents", map, GetIndent[].class);

			indentList = new ArrayList<GetIndent>();

			indentList = new ArrayList<GetIndent>(Arrays.asList(indents));

			GetIndent getIndent = new GetIndent();

			for (int i = 0; i < indentList.size(); i++) {

				if (indentList.get(i).getIndMId() == indMId) {
					getIndent = indentList.get(i);
					break;
				}
			}

			model = new ModelAndView("indent/editIndentHeader");
			Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category));

			model.addObject("categoryList", categoryList);

			AccountHead[] accountHead = rest.getForObject(Constants.url + "/getAllAccountHeadByIsUsed",
					AccountHead[].class);
			List<AccountHead> accountHeadList = new ArrayList<AccountHead>(Arrays.asList(accountHead));

			model.addObject("accountHeadList", accountHeadList);

			Dept[] Dept = rest.getForObject(Constants.url + "/getAllDeptByIsUsed", Dept[].class);
			List<Dept> deparmentList = new ArrayList<Dept>(Arrays.asList(Dept));

			model.addObject("deparmentList", deparmentList);
			model.addObject("indent", getIndent);

			model.addObject("isDept", getIndent.getDeptId());
			map = new LinkedMultiValueMap<String, Object>();

			map.add("indMId", indMId);

			map.add("delStatus", Constants.delStatus);

			GetIndentDetail[] indDetail = rest.postForObject(Constants.url + "/getIndentDetailByIndentId", map,
					GetIndentDetail[].class);

			indDetailListForEdit = new ArrayList<GetIndentDetail>(Arrays.asList(indDetail));

			for (int i = 0; i < indDetailListForEdit.size(); i++) {

				 indDetailListForEdit.get(i).setIndItemSchddt(DateConvertor.convertToYMD(indDetailListForEdit.get(i).getIndItemSchddt()));

			}

			System.err.println("Indent Detail List  " + indDetailListForEdit.toString());
			model.addObject("indDetailList", indDetailListForEdit);

			model.addObject("fromDate", fromDate);
			model.addObject("toDate", toDate);
			
			  
			 
				Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
				List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
				
				model.addObject("typeList", typeList);
				
				StockHeader stockHeader = rest.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",
						StockHeader.class);

				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

				fromDateForStock = stockHeader.getYear() + "-" + stockHeader.getMonth() + "-" + "01";
				toDateForStock = sf.format(date);

		} catch (Exception e) {

			System.err.println("Exception in showing editIndent/{indMId}" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	// editIndentProcess
	// indentId

	@RequestMapping(value = "/editIndentProcess", method = RequestMethod.POST)
	public String editIndentProcess(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("Inside editIndentProcess ");
		ModelAndView model = null;
		int indentId = 0;
		try {

			indentId = Integer.parseInt(request.getParameter("indentId"));

			int accHead = Integer.parseInt(request.getParameter("acc_head"));

			int isMachineSpe = Integer.parseInt(request.getParameter("machine_specific"));
			
			String indRemark = request.getParameter("indHeaderRemark");

			int dept = 0;
			int subDept = 0;

			/*if (isMachineSpe == 1) {
				System.err.println("It is Machine Specific");*/
				dept = Integer.parseInt(request.getParameter("dept"));
				subDept = Integer.parseInt(request.getParameter("sub_dept"));
			//}

			System.err.println("dept " + dept + "sub Dept  " + subDept);

			int isDev = Integer.parseInt(request.getParameter("is_dev"));
			int isMonthly = Integer.parseInt(request.getParameter("is_monthly"));

			// build an update query to update indent
			// editIndentHeader return type ErrorMessage;

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("achdId", accHead);
			map.add("deptId", dept);
			map.add("subDeptId", subDept);
			map.add("indIsdev", isDev);
			map.add("indIsmonthly", isMonthly);
			map.add("indMId", indentId);
			map.add("indRemark", indRemark);
			
			ErrorMessage editIndentHeaderResponse = rest.postForObject(Constants.url + "/editIndentHeader", map,
					ErrorMessage.class);
			System.err.println("editIndentHeaderResponse " + editIndentHeaderResponse.toString());

		}

		catch (Exception e) {
			System.err.println("Exception in editIndentProcess " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/getIndents";

	}

	// updateIndDetail

	@RequestMapping(value = "/updateIndDetail", method = RequestMethod.GET)
	public @ResponseBody List<GetIndentDetail> updateIndDetail(HttpServletRequest request, HttpServletResponse response
	/*
	 * @PathVariable("indDId") int indDId, @PathVariable("indMId") int
	 * indentId, @PathVariable("qty") int qty
	 */) {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		ModelAndView model = null;
		List<GetIndentDetail> indDetailList = new ArrayList<GetIndentDetail>();
		try {

			float indQty = Float.parseFloat(request.getParameter("qty"));

			int indDId = Integer.parseInt(request.getParameter("indDId"));

			int indentId = Integer.parseInt(request.getParameter("indMId"));

			if (indQty > 0) {
				System.err.println("It is Edit call indQty >0");
				String schDays =  request.getParameter("schDays") ;

				String remark = request.getParameter("remark");
				System.err.println("New Param sch Days and remark  " + schDays + "remark " + remark);

				// build an update query to update indent
				// editIndentHeader return type ErrorMessage;
				map = new LinkedMultiValueMap<String, Object>();

				map.add("indDId", indDId);
				map.add("indQty", indQty);
				map.add("schDay",schDays);
				map.add("remark", remark);
				map.add("indentId", indentId);

				ErrorMessage editIndentDetailResponse = rest.postForObject(Constants.url + "/editIndentDetail", map,
						ErrorMessage.class);
				System.err.println("editIndentDetailResponse " + editIndentDetailResponse.toString());

			} else {

				System.err.println("In Else indent qt It is Delete call");
				map = new LinkedMultiValueMap<String, Object>();

				map.add("indDId", indDId);
				map.add("delStatus", 0);

				ErrorMessage editIndentDetailResponse = rest.postForObject(Constants.url + "/delteIndentDetailItem",
						map, ErrorMessage.class);
				System.err.println("editIndentDetailResponse " + editIndentDetailResponse.toString());

			}
			map = new LinkedMultiValueMap<String, Object>();

			map = new LinkedMultiValueMap<String, Object>();

			map.add("indMId", indentId);

			map.add("delStatus", Constants.delStatus);

			GetIndentDetail[] indDetail = rest.postForObject(Constants.url + "/getIndentDetailByIndentId", map,
					GetIndentDetail[].class);

			indDetailList = new ArrayList<GetIndentDetail>(Arrays.asList(indDetail));
			for (int i = 0; i < indDetailList.size(); i++) {

				indDetailList.get(i).setIndItemSchddt(DateConvertor.convertToYMD(indDetailList.get(i).getIndItemSchddt()));

			}
			System.err.println("Ind detail after update call  " + indDetailList.toString());

		}

		catch (Exception e) {
			System.err.println("Exception in updateIndDetail Ajax Call  " + e.getMessage());
			e.printStackTrace();
		}

		return indDetailList;
		// return "redirect:/editIndent/" + indentId;

	}

	// Indent Approval Module
	String indToDate;

	@RequestMapping(value = "/getIndentsForApproval/{apr}", method = RequestMethod.GET)
	public ModelAndView getIndentsForApproval1(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int apr) {
		System.err.println("Initial call On Load function Approval is : " + apr);

		ModelAndView model = null;
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			if (request.getParameter("to_date") == null) {
				Date date = new Date();
				DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				indToDate = df.format(date);
				System.out.println("inside if ");
			} else {
				indToDate = request.getParameter("to_date");
				System.out.println("inside Else ");
				System.out.println("toDate " + indToDate);
			}
			if (apr == 1) {
				map.add("status", "9,7");
			} else if (apr == 2) {
				map.add("status", "7");
			}
			map.add("toDate", DateConvertor.convertToYMD(indToDate));

			model = new ModelAndView("indent/viewindentapr1");
			GetIndent[] indents = rest.postForObject(Constants.url + "/getIndentsForApproval", map, GetIndent[].class);

			indentList = new ArrayList<GetIndent>();

			indentList = new ArrayList<GetIndent>(Arrays.asList(indents));

			System.out.println("Indent List using /getIndents   " + indentList.toString());

			model.addObject("indentList", indentList);
			model.addObject("toDate", indToDate);
			model.addObject("apr", apr);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {

			System.err.println("Exception in getIndentsForApproval1 Indent" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	List<GetIndentDetail> indAprItemList;

	@RequestMapping(value = "/getIndentDetailToApprove/{indMId}/{apr}", method = RequestMethod.GET)
	public ModelAndView getIndItemForApproval1(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("indMId") int indMId, @PathVariable("apr") int apr) {

		indAprItemList = new ArrayList<GetIndentDetail>();

		ModelAndView model = null;
		try {
			// int apr = Integer.parseInt(request.getParameter("apr"));

			System.err.println("apr== " + apr);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			Date date = new Date();
			DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			indToDate = df.format(date);

			map.add("toDate", DateConvertor.convertToYMD(indToDate));
			if (apr == 1) {
				map.add("status", "9,7");
			} else if (apr == 2) {
				map.add("status", "7");
			}

			GetIndent[] indents = rest.postForObject(Constants.url + "/getIndentsForApproval", map, GetIndent[].class);

			indentList = new ArrayList<GetIndent>();

			indentList = new ArrayList<GetIndent>(Arrays.asList(indents));

			GetIndent getIndent = new GetIndent();

			for (int i = 0; i < indentList.size(); i++) {

				if (indentList.get(i).getIndMId() == indMId) {
					getIndent = indentList.get(i);
					break;
				}
			}

			model = new ModelAndView("indent/indDetailApr");

			model.addObject("indent", getIndent);

			model.addObject("isDept", getIndent.getDeptId());
			map = new LinkedMultiValueMap<String, Object>();

			map.add("indMId", indMId);

			map.add("delStatus", Constants.delStatus);

			GetIndentDetail[] indDetail = rest.postForObject(Constants.url + "/getIndentDetailByIndentId", map,
					GetIndentDetail[].class);

			indAprItemList = new ArrayList<GetIndentDetail>(Arrays.asList(indDetail));

			System.err.println("Indent Detail  indAprItemList " + indAprItemList.toString());
			model.addObject("indDetailList", indAprItemList);

			model.addObject("toDate", indToDate);
			model.addObject("apr", apr);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {

			System.err.println("Exception in showing getIndItemForApproval1/{indMId} -indAprItemList" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	// new : for both apr 1 and 2 after selecting to_date show Indents upto that date

	@RequestMapping(value = "/getIndentsForApproval", method = RequestMethod.POST)
	public ModelAndView getIndentsForApproval1(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("inside FORM ACTION POST  ");
		ModelAndView model = null;
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			if (request.getParameter("to_date") == null) {
				Date date = new Date();
				DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				indToDate = df.format(date);
				System.out.println("inside if ");
			} else {
				indToDate = request.getParameter("to_date");
				System.out.println("inside Else ");
				System.out.println("toDate " + indToDate);
			}

			System.err.println("indToDate== " + indToDate);
			int apr = Integer.parseInt(request.getParameter("apr"));

			if (apr == 1) {
				map.add("status", "9,7");
			} else if (apr == 2) {
				map.add("status", "7");
			}
			map.add("toDate", DateConvertor.convertToYMD(indToDate));

			model = new ModelAndView("indent/viewindentapr1");
			GetIndent[] indents = rest.postForObject(Constants.url + "/getIndentsForApproval", map, GetIndent[].class);

			indentList = new ArrayList<GetIndent>();

			indentList = new ArrayList<GetIndent>(Arrays.asList(indents));

			System.out.println("Indent List using /getIndentsForApproval   " + indentList.toString());

			model.addObject("indentList", indentList);
			model.addObject("toDate", indToDate);
			model.addObject("apr", apr);

		} catch (Exception e) {

			System.err.println("Exception in getIndentsForApproval Indent" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	/// new

	// aprIndentProcess form action on indDetaiApr jsp

	@RequestMapping(value = "/aprIndentProcess", method = RequestMethod.POST)
	public String aprIndentProcess(HttpServletRequest request, HttpServletResponse response) {
		int apr = Integer.parseInt(request.getParameter("apr"));
		ModelAndView model = null;
		try {

			System.err.println("Inside  aprIndentProcess");
			String indDetail[] = request.getParameterValues("name1");

			// indentId
			int indentId = Integer.parseInt(request.getParameter("indentId"));
			System.err.println("apr  " + apr);

			String indDetailIdList = new String();
			//List<String> ind = new ArrayList<>();
			for (int i = 0; i < indDetail.length; i++) {

				System.err.println("Ind Id at index  " + i + "is" + indDetail[i]);
				indDetailIdList = indDetailIdList + "," + indDetail[i];
				
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			// ind.remove(ind.get(0));
			if (apr == 1) {
				map.add("indDStatus", 0);

			} else if (apr == 2) {
				map.add("indDStatus", 0);
			}
			
			// approveIndent webservice
			map.add("indDetailIdList", indDetailIdList.substring(1, indDetailIdList.length()));
			map.add("indentId", indentId);
			
			ErrorMessage editIndentDetailResponse = rest.postForObject(Constants.url + "/approveIndent", map,
					ErrorMessage.class);

		} catch (Exception e) {
			System.err.println("Exce in appr Indent  " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/getIndentsForApproval/" + apr;

	}
	
	@RequestMapping(value = "/exportExcelforIndent", method = RequestMethod.GET)
	@ResponseBody
	public List<TempIndentDetail> exportExcelforIndent(HttpServletRequest request, HttpServletResponse response) {

		
		 
		try {
			  Date date = new Date();
			  SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			//String excelFilePath = "C:/pdf/Books2.xlsx";
			int catId = Integer.parseInt(request.getParameter("catId")); 
			int typeId = Integer.parseInt(request.getParameter("typeId"));
			//String excelFilePath = "http://132.148.143.124:8080/triluploads/Books.xlsx";
			String excelFilePath = "/opt/tomcat-latest/webapps/uploads/Books2.xlsx";
			//String excelFilePath = "/home/lenovo/Downloads/Books2.xlsx";
	        FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
	         
	        Workbook workbook = new XSSFWorkbook(inputStream);
	        Sheet firstSheet = workbook.getSheetAt(0);
	        Iterator<Row> iterator = firstSheet.iterator();
	         
	        DataFormatter formatter = new DataFormatter(Locale.US);
	        
	        while (iterator.hasNext()) {
	            Row nextRow = iterator.next();
	            Iterator<Cell> cellIterator = nextRow.cellIterator();
	             
	            int index=0;
	            TempIndentDetail detail = new TempIndentDetail();
	            
	            while (cellIterator.hasNext()) {
	                Cell cell = cellIterator.next();
	                
	                 try {
	                 	if(index==0) {
	                 		detail.setItemId(Integer.parseInt(formatter.formatCellValue(cell)));
	                 	} 
		                else if(index==1) {
		                	detail.setItemCode(formatter.formatCellValue(cell));
		                } 
		                else if(index==2) {
		                	detail.setItemName(formatter.formatCellValue(cell));
		                } 
		                else if(index==3) {
		                	detail.setUom(formatter.formatCellValue(cell));
		                } 
		                else if(index==4) { 
		                	if(catId!=Integer.parseInt(formatter.formatCellValue(cell))) {
		                		index=0;
		                		break;
		                	}
		                	 
		                }
		                else if(index==6) {
		                	detail.setQty(Float.parseFloat(formatter.formatCellValue(cell)));
		                }
		                else if(index==7) { 
		                	if(typeId!=Integer.parseInt(formatter.formatCellValue(cell))) {
		                		index=0;
		                		 break;
		                	}
		                }
		                	 
	                index++;
	                
	                System.out.print(" - ");
	                 }catch (Exception e) {
							// TODO: handle exception
						}
	            }
	            if(index!=0) {
	            	detail.setDate(sf.format(date));
	            	detail.setIsDuplicate(1);
	            	detail.setRemark("-"); 
	            	tempIndentList.add(detail);
	            }
	           
	            System.out.println();
	        }
	         
	        workbook.close();
	        inputStream.close();
	    
	         
	        
	        System.out.println("tempIndentList---------" + tempIndentList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tempIndentList;
	}

}// end of Class

/*
 * @RequestMapping(value = "/updateIndDetail/{indDId}/{indMId}/{qty}", method =
 * RequestMethod.GET) public String updateIndDetail(HttpServletRequest request,
 * HttpServletResponse response,
 * 
 * @PathVariable("indDId") int indDId, @PathVariable("indMId") int
 * indentId, @PathVariable("qty") int qty) {
 * 
 * ModelAndView model = null; try {
 * 
 * // int indQty =Integer.parseInt(request.getParameter("indQty"+indDId));
 * 
 * // build an update query to update indent // editIndentHeader return type
 * ErrorMessage;
 * 
 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
 * Object>();
 * 
 * map.add("indDId", indDId); map.add("indQty", qty);
 * 
 * ErrorMessage editIndentDetailResponse = rest.postForObject(Constants.url +
 * "/editIndentDetail", map, ErrorMessage.class);
 * System.err.println("editIndentDetailResponse " +
 * editIndentDetailResponse.toString());
 * 
 * }
 * 
 * catch (Exception e) { System.err.println("Exception in updateIndDetail " +
 * e.getMessage()); e.printStackTrace(); }
 * 
 * return "redirect:/editIndent/" + indentId;
 * 
 * 
 * }
 */

// deleteIndentHeader action of indent list action 1

// showEditViewIndentDetail show indentdetail from indent header list action
// button Cancelled given with Indent Header Edit

/*
 * @RequestMapping(value = "/showEditViewIndentDetail/{indMId}", method =
 * RequestMethod.GET) public ModelAndView
 * showEditViewIndentDetail(HttpServletRequest request, HttpServletResponse
 * response,@PathVariable("indMId") int indMId) {
 * 
 * ModelAndView model = null; try {
 * 
 * GetIndent getIndent=new GetIndent(); for(int i=0;i<indentList.size();i++) {
 * 
 * if(indentList.get(i).getIndMId()==indMId) { getIndent=indentList.get(i);
 * break; } }
 * 
 * model = new ModelAndView("indent/editIndentDetail");
 * 
 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
 * Object>();
 * 
 * map.add("indMId", indMId); map.add("delStatus",0);
 * 
 * IndentTrans[] indDetail = rest.postForObject(Constants.url +
 * "/getIndentDetailByIndMId",map, IndentTrans[].class);
 * 
 * List<IndentTrans> indDetailList = new
 * ArrayList<IndentTrans>(Arrays.asList(indDetail));
 * 
 * System.err.println("Indent Detail List  " +indDetailList.toString());
 * model.addObject("indDetailList", indDetailList); model.addObject("indent",
 * getIndent);
 * 
 * } catch (Exception e) {
 * 
 * System.err.println("Exception in showEditViewIndentDetail " +e.getMessage());
 * e.printStackTrace(); }
 * 
 * return model; }
 */
