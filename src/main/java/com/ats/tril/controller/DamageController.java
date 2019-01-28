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
import com.ats.tril.model.Damage;
import com.ats.tril.model.ErrorMessage;
import com.ats.tril.model.GetDamage;
import com.ats.tril.model.GetItemGroup;
import com.ats.tril.model.StockHeader;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.doc.SubDocument; 

@Controller
@Scope("session")
public class DamageController {
	
	RestTemplate rest = new RestTemplate();
	List<Damage> damageList = new ArrayList<Damage>();
	GetDamage editDamage = new GetDamage();
	
	@RequestMapping(value = "/addDamage", method = RequestMethod.GET)
	public ModelAndView addCategory(HttpServletRequest request, HttpServletResponse response) {
		 damageList = new ArrayList<Damage>();
		
		ModelAndView model = new ModelAndView("damage/addDamage");
		try {
			GetItemGroup[] itemGroupList = rest.getForObject(Constants.url + "/getAllItemGroupByIsUsed",
					GetItemGroup[].class);
			model.addObject("itemGroupList", itemGroupList);
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					
			model.addObject("date", sf.format(date));
			
			StockHeader stockHeader = rest.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",StockHeader.class);
			 
			 System.out.println( " stock Date: " + stockHeader.getDate());
			 
			 model.addObject("stockDateDDMMYYYY", DateConvertor.convertToDMY(stockHeader.getDate()));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/addItmeInDamageList", method = RequestMethod.GET)
	@ResponseBody
	public List<Damage> addItmeInDamageList(HttpServletRequest request, HttpServletResponse response) {

		 
		try {
			
			String itemName = request.getParameter("itemName");
			int itemId = Integer.parseInt(request.getParameter("itemId")); 
			String reason = request.getParameter("reason"); 
			float qty = Float.parseFloat(request.getParameter("qty"));  
			float value = Float.parseFloat(request.getParameter("value"));
			
			Damage damage = new Damage();
			damage.setItemId(itemId);
			damage.setItemName(itemName);
			damage.setQty(qty);
			damage.setValue(value);
			damage.setReason(reason);
			damage.setDelStatus(1);
			damageList.add(damage);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return damageList;
	}
	
	@RequestMapping(value = "/deleteDamageFromList", method = RequestMethod.GET)
	@ResponseBody
	public List<Damage> deleteDamageFromList(HttpServletRequest request, HttpServletResponse response) {

		 
		try {
			 
			int index = Integer.parseInt(request.getParameter("index")); 
			 
			damageList.remove(index);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return damageList;
	}
	
	@RequestMapping(value = "/submitDamageList", method = RequestMethod.POST)
	public String submitDamageList(HttpServletRequest request, HttpServletResponse response) {
		 
		try {
			String date = request.getParameter("date"); 
			String itemName = request.getParameter("itemName");
			int itemId = Integer.parseInt(request.getParameter("itemId")); 
			String reason = request.getParameter("reason");  
			float qty = Float.parseFloat(request.getParameter("qty"));  
			float value = Float.parseFloat(request.getParameter("value"));
			
			Damage damage = new Damage();
			
			 DocumentBean docBean=null;
				try {
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
					map.add("docId",10);
					map.add("catId", 1);
					map.add("date", date);
					map.add("typeId", 1);
					RestTemplate restTemplate = new RestTemplate();

					 docBean = restTemplate.postForObject(Constants.url + "getDocumentData", map, DocumentBean.class);
					String indMNo=docBean.getSubDocument().getCategoryPrefix()+"";
					int counter=docBean.getSubDocument().getCounter();
					int counterLenth = String.valueOf(counter).length();
					counterLenth =4 - counterLenth;
					StringBuilder code = new StringBuilder(indMNo+"");

					for (int i = 0; i < counterLenth; i++) {
						String j = "0";
						code.append(j);
					}
					code.append(String.valueOf(counter));
					
					damage.setDamageNo(""+code);
					
					docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter()+1);
				}catch (Exception e) {
					e.printStackTrace(); 
				}
			damage.setItemId(itemId);
			damage.setItemName(itemName);
			damage.setQty(qty);
			damage.setValue(value);
			damage.setReason(reason);
			damage.setDelStatus(1);
			damage.setDate(date);
			damageList.add(damage);
			 
			
			System.out.println(damageList);
			
			ErrorMessage res = rest.postForObject(Constants.url + "/saveDamage",damageList,
					ErrorMessage.class);
			System.out.println(res);
			
			if(res.isError()==false) {
				try {
        			
        			SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(), SubDocument.class);

        		
        		}catch (Exception e) {
					e.printStackTrace();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/addDamage";
	}
	
	@RequestMapping(value = "/getDamageList", method = RequestMethod.GET)
	public ModelAndView getDamageList(HttpServletRequest request, HttpServletResponse response) {
	 
		ModelAndView model = new ModelAndView("damage/getDamageList");
		try {
			
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat show = new SimpleDateFormat("dd-MM-yyyy");
			
			Date date = new Date();
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			
			if( request.getParameter("fromDate")==null ||  request.getParameter("toDate")==null) {
				
				map.add("fromDate", sf.format(date));
				map.add("toDate", sf.format(date));
				model.addObject("fromDate", show.format(date));
				model.addObject("toDate", show.format(date)); 
			}
			else {
				
				 String fromDate = request.getParameter("fromDate");
				 String toDate = request.getParameter("toDate");
				 
				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				model.addObject("fromDate", fromDate); 
				model.addObject("toDate", toDate); 
			}
			
			GetDamage[] getDamage = rest.postForObject(Constants.url + "/getDamageList",map,
					GetDamage[].class);
			List<GetDamage> getDamagelist = new ArrayList<GetDamage>(Arrays.asList(getDamage));
			model.addObject("getDamagelist", getDamagelist);
			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/getDamageMaterialListByDate", method = RequestMethod.GET)
	@ResponseBody
	public List<GetDamage> getDamageMaterialListByDate(HttpServletRequest request, HttpServletResponse response) {
	 
		List<GetDamage> getDamagelist = new ArrayList<GetDamage>();
		try {
			
			 String fromDate = request.getParameter("fromDate");
			 String toDate = request.getParameter("toDate");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));
			GetDamage[] getDamage = rest.postForObject(Constants.url + "/getDamageList",map,
					GetDamage[].class);
			getDamagelist = new ArrayList<GetDamage>(Arrays.asList(getDamage));
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getDamagelist;
	}
	
	@RequestMapping(value = "/editDamageItem/{damageId}", method = RequestMethod.GET)
	public ModelAndView editDamageItem(@PathVariable int damageId, HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("damage/editDamageItem");
		editDamage = new GetDamage();
		try {
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("damageId", damageId);
			editDamage = rest.postForObject(Constants.url + "/getDamageById",map,
					GetDamage.class);
			editDamage.setDate(DateConvertor.convertToYMD(editDamage.getDate()));
			model.addObject("editDamage", editDamage);
			
			StockHeader stockHeader = rest.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",StockHeader.class); 
			 System.out.println( " stock Date: " + stockHeader.getDate()); 
			 model.addObject("stockDateDDMMYYYY", DateConvertor.convertToDMY(stockHeader.getDate()));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/deleteDamageItem/{damageId}", method = RequestMethod.GET)
	public String deleteDamageItem(@PathVariable int damageId, HttpServletRequest request, HttpServletResponse response) {
		 
		try {
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("damageId", damageId);
			ErrorMessage delete = rest.postForObject(Constants.url + "/deleteDamage",map,
					ErrorMessage.class);
			  
			 System.out.println( " delete " +  delete);  

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/getDamageList";
	}
	
	@RequestMapping(value = "/submitEditDamageList", method = RequestMethod.POST)
	public String submitEditDamageList(HttpServletRequest request, HttpServletResponse response) {
		 
		try {
			
			 
			String date = request.getParameter("date"); 
			String reason = request.getParameter("reason"); 
			float qty = Float.parseFloat(request.getParameter("qty"));  
			float value = Float.parseFloat(request.getParameter("value"));
			 
			editDamage.setDate(date);
			editDamage.setReason(reason);
			editDamage.setQty(qty);
			editDamage.setValue(value); 
			ErrorMessage res = rest.postForObject(Constants.url + "/saveDamageSingle",editDamage,
					ErrorMessage.class);
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/getDamageList";
	}

}
