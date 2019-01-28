package com.ats.tril;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.model.Category;
import com.ats.tril.model.ErrorMessage;
import com.ats.tril.model.GetCurrStockRol;
import com.ats.tril.model.GetCurrentStock;
import com.ats.tril.model.GetPODetail;
import com.ats.tril.model.GetSubDept;
import com.ats.tril.model.StockHeader;
import com.ats.tril.model.Type;
import com.ats.tril.model.Vendor;
import com.ats.tril.model.accessright.ModuleJson;
import com.ats.tril.model.indent.GetIndents;
import com.ats.tril.model.login.UserResponse;
import com.ats.tril.model.po.GetPoHeader;
import com.ats.tril.model.po.PoHeader;
 

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	RestTemplate restTemp = new RestTemplate();

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}
	@RequestMapping(value = "/showStoreDashboard", method = RequestMethod.GET)
	public ModelAndView showStoreDashboard(HttpServletRequest request, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView("home");

		try {
			
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
                map.add("status", "0,1");
				GetIndents[] indentList = restTemp.postForObject(Constants.url + "/getIndentList", map, GetIndents[].class);

				List<GetIndents> indentListRes = new ArrayList<GetIndents>(Arrays.asList(indentList));
				System.err.println(indentListRes.toString());
				mav.addObject("indentListRes", indentListRes);
				Category[] category = restTemp.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
				List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category));
              
				StockHeader stockHeader = restTemp.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",StockHeader.class);
				
				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				 
				String fromDate=stockHeader.getYear()+"-"+stockHeader.getMonth()+"-"+"01";
				String toDate=sf.format(date);
				
				map = new LinkedMultiValueMap<String, Object>();
				map.add("fromDate", fromDate);
	 			map.add("toDate", toDate);
	 			GetCurrStockRol[] getCurrentStock = restTemp.postForObject(Constants.url + "/getItemsLessThanROLForDashB", map, GetCurrStockRol[].class);

				List<GetCurrStockRol> lowReorderItemList = new ArrayList<GetCurrStockRol>(Arrays.asList(getCurrentStock));
				System.err.println(lowReorderItemList.toString());
				mav.addObject("lowReorderItemList", lowReorderItemList);
				mav.addObject("categoryList", categoryList);
				
				Type[] type = restTemp.getForObject(Constants.url + "/getAlltype", Type[].class);
				List<Type> typeList = new ArrayList<Type>(Arrays.asList(type)); 
				mav.addObject("typeList", typeList);
			
				}
				catch (Exception e) {
					e.printStackTrace();
				}
		
		return mav;
	}
	@RequestMapping("/loginProcess")
	public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse res) throws IOException {

		String name = request.getParameter("username");
		String password = request.getParameter("password");

		ModelAndView mav = new ModelAndView("login");

		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		HttpSession session = request.getSession();

		try {
			System.out.println("Login Process " + name);

			if (name.equalsIgnoreCase("") || password.equalsIgnoreCase("") || name == null || password == null) {

				mav = new ModelAndView("login");
			} else {

				RestTemplate restTemplate = new RestTemplate();

				UserResponse userObj = restTemplate.getForObject(
						Constants.url+"/login?username=" + name + "&password=" + password,
						UserResponse.class);
				
				 
				String loginResponseMessage="";

				
				if (userObj.getErrorMessage().isError()==false) {
					
					session.setAttribute("UserDetail", userObj);
					UserResponse userResponse =(UserResponse) session.getAttribute("UserDetail");
					session.setAttribute("userInfo", userResponse.getUser());
					
					mav = new ModelAndView("welcome");
					session.setAttribute("userName", name);
					
					loginResponseMessage="Login Successful";
					mav.addObject("loginResponseMessage",loginResponseMessage);
					
					
					MultiValueMap<String, Object> map =new LinkedMultiValueMap<String, Object>();
					int userId=userObj.getUser().getId();
					map.add("usrId", userId);
					System.out.println("Before web service");
					try {
					 ParameterizedTypeReference<List<ModuleJson>> typeRef = new ParameterizedTypeReference<List<ModuleJson>>() {
					};
					ResponseEntity<List<ModuleJson>> responseEntity = restTemplate.exchange(Constants.url + "getRoleJson",
							HttpMethod.POST, new HttpEntity<>(map), typeRef);
					
					 List<ModuleJson> newModuleList = responseEntity.getBody();
					
					 //System.err.println("new Module List " +newModuleList.toString());
					 
						session.setAttribute("newModuleList", newModuleList);
						session.setAttribute("sessionModuleId", 0);
						session.setAttribute("sessionSubModuleId", 0);

				/*	Date date = new Date();*/
					 map = new LinkedMultiValueMap<String, Object>();
/*					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
*/					/*String fromDate = df.format(date);
					String toDate = df.format(date);
                   
					map.add("fromDate", fromDate);
					map.add("toDate",toDate);*/
					/*map.add("status", "0,1");
					GetIndents[] indentList = restTemp.postForObject(Constants.url + "/getIndentList", map, GetIndents[].class);

					List<GetIndents> indentListRes = new ArrayList<GetIndents>(Arrays.asList(indentList));
					System.err.println(indentListRes.toString());
					mav.addObject("indentListRes", indentListRes);
					
					StockHeader stockHeader = restTemp.getForObject(Constants.url + "/getCurrentRunningMonthAndYear",StockHeader.class);
					Category[] category = restTemp.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
					List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category));
                    System.err.println("categoryList:  "+categoryList.toString());
					
					Date date = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					 
					String fromDate=stockHeader.getYear()+"-"+stockHeader.getMonth()+"-"+"01";
					String toDate=sf.format(date);
					
					map = new LinkedMultiValueMap<String, Object>();
					map.add("fromDate", fromDate);
		 			map.add("toDate", toDate);
		 			GetCurrStockRol[] getCurrentStock =restTemp.postForObject(Constants.url + "/getItemsLessThanROLForDashB", map, GetCurrStockRol[].class);

					List<GetCurrStockRol> lowReorderItemList = new ArrayList<GetCurrStockRol>(Arrays.asList(getCurrentStock));
					System.err.println(lowReorderItemList.toString());
					mav.addObject("lowReorderItemList", lowReorderItemList);
					mav.addObject("categoryList", categoryList);
					
					  
					 
						Type[] type = restTemp.getForObject(Constants.url + "/getAlltype", Type[].class);
						List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
						
						mav.addObject("typeList", typeList);*/
						
					}
					catch (Exception e) {
						e.printStackTrace();
					}
					return mav;
				} else {

					mav = new ModelAndView("login");
					System.out.println("Invalid login credentials");

				}

				
			}
		} catch (Exception e) {
			System.out.println("HomeController Login API Excep:  " + e.getMessage());
			e.printStackTrace();

		}

		return mav;

	}
	List<GetPoHeader> headerList;
	@RequestMapping(value = "/getPoListRes", method = RequestMethod.GET)
	public @ResponseBody List<GetPoHeader> getPoList(HttpServletRequest request,
			HttpServletResponse response) {

		 headerList = new ArrayList<GetPoHeader>();
		try {
			int poType=Integer.parseInt(request.getParameter("poType"));
			int status=Integer.parseInt(request.getParameter("status"));
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("poType", poType);
			map.add("status",status);
			headerList=restTemp.postForObject(Constants.url+"getPoHeaderDashList", map, List.class);
	     
			System.err.println(headerList.toString());
		}
		catch (Exception e) {
			
			e.printStackTrace();
		}
		return headerList;
	}
	
	
	@RequestMapping(value = "/showAddMrn/{poType}/{vendorId}/{poId}/{poNo}", method = RequestMethod.GET)
	public ModelAndView showAddMrn(HttpServletRequest request, HttpServletResponse response,@PathVariable int poType,
			@PathVariable int vendorId,@PathVariable int poId,@PathVariable String poNo) {

		ModelAndView model = null;
		try {
			
			//poIdList = new String();
			//poDetailList = new ArrayList<GetPODetail>();

		//	poDetailList = null;
			model = new ModelAndView("mrn/showAddMrn");
			RestTemplate rest = new RestTemplate();

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);
			
			model.addObject("poType",poType);
			
			model.addObject("vendorId",vendorId);
			
			model.addObject("poId",poId);
			model.addObject("poNo",poNo);
			

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("poId", poId);
			 
			
			ErrorMessage errorMessage = rest.postForObject(Constants.url + "/getPoDetailScheduleDate", map, ErrorMessage.class);
			model.addObject("errorMessage", errorMessage);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);
			
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			model.addObject("date", dateFormat.format(date));
			System.err.println("Inside show Add Mrn /showAddMrn/{poType}/{vendorId}/{poId} in HomeController");

		} catch (Exception e) {

			System.err.println("Exception in showing  showAddMrn/{poType}/{vendorId}/{poId}" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}
	@ExceptionHandler(LoginFailException.class)
	public String redirectToLogin() {
		System.out.println("HomeController Login Fail Excep:");

		return "login";
	}
	
	@RequestMapping(value = "/sessionTimeOut", method = RequestMethod.GET)
	public String sessionTimeOut(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/setSubModId", method = RequestMethod.GET)
	public @ResponseBody void setSubModId(HttpServletRequest request,
		HttpServletResponse response) {
		int subModId=Integer.parseInt(request.getParameter("subModId"));
		int modId=Integer.parseInt(request.getParameter("modId"));
		/*System.out.println("subModId " + subModId);
		System.out.println("modId " + modId);*/
		HttpSession session = request.getSession();
		session.setAttribute("sessionModuleId", modId);
		session.setAttribute("sessionSubModuleId",subModId);
		 session.removeAttribute( "exportExcelList" );
	}
	
}
