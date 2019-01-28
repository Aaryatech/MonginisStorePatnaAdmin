package com.ats.tril.controller;

import java.io.File;
import java.io.FileInputStream;
import java.text.DateFormat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.xml.DocumentDefaultsDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.ErrorMessage;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.GetPODetail;
import com.ats.tril.model.GetPoHeaderList;
import com.ats.tril.model.ImportExcelForPo;
import com.ats.tril.model.IssueDetail;
import com.ats.tril.model.IssueHeader;
import com.ats.tril.model.SettingValue;
import com.ats.tril.model.Type;
import com.ats.tril.model.Vendor;
import com.ats.tril.model.doc.DocumentBean;
import com.ats.tril.model.doc.SubDocument;
import com.ats.tril.model.indent.GetIndent;
import com.ats.tril.model.indent.GetIntendDetail;
import com.ats.tril.model.indent.Indent;
//import com.ats.tril.model.login.UserResponse;
import com.ats.tril.model.mrn.GetMrnDetail;
import com.ats.tril.model.mrn.GetMrnHeader;
import com.ats.tril.model.mrn.MrnDetail;
import com.ats.tril.model.mrn.MrnHeader;
import com.ats.tril.model.mrn.PoItemForMrnEdit;
import com.ats.tril.model.po.PoHeader;
import com.itextpdf.text.pdf.PdfMediaClipData;
import com.steadystate.css.parser.selectors.PseudoElementSelectorImpl;
import com.sun.org.apache.bcel.internal.util.SyntheticRepository;

@Controller
@Scope("session")
public class MrnController {
 
	RestTemplate rest = new RestTemplate();
	
	
	String poIdList = new String();
	List<GetPODetail> poDetailList = new ArrayList<GetPODetail>();


	@RequestMapping(value = "/showAddMrn", method = RequestMethod.GET)
	public ModelAndView showAddMrn(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			
			poIdList = new String();
			poDetailList = new ArrayList<GetPODetail>();

			poDetailList = null;
			model = new ModelAndView("mrn/showAddMrn");

			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));
			for(int i=0;i<vendorList.size();i++) {
				vendorList.get(i).setVendorName(vendorList.get(i).getVendorCode()+" "+vendorList.get(i).getVendorName());
			}
			
			model.addObject("vendorList", vendorList);
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			model.addObject("date", dateFormat.format(date));
			model.addObject("poType", 0);
			model.addObject("vendorId", 0);
			model.addObject("poId", 0);
			System.err.println("Inside show Add Mrn ");
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {

			System.err.println("Exception in showing showAddMrn" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = { "/getPOHeaderList" }, method = RequestMethod.GET)
	public @ResponseBody List<PoHeader> getPOHeaderList(HttpServletRequest request, HttpServletResponse response) {

		List<PoHeader> poHeadList = new ArrayList<PoHeader>();

		try {

			int vendorId = 0;

			vendorId = Integer.parseInt(request.getParameter("vendorId"));
			
			int	poType = Integer.parseInt(request.getParameter("grn_type"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("poType", poType);
			map.add("vendId", vendorId);
			map.add("delStatus", Constants.delStatus);
			map.add("statusList", "0,1");
			
			// Written Inside Purchase Order Rest controller in web api
			
			PoHeader[] poHeadRes = rest.postForObject(Constants.url + "/getPOHeaderList", map, PoHeader[].class);
			poHeadList = new ArrayList<PoHeader>(Arrays.asList(poHeadRes));

			System.err.println("PO header List Using Ajax Call  " + poHeadList.toString());

		} catch (Exception e) {

			System.err.println("Exception in getting PO Header List By Ajax Call " + e.getMessage());
			
			e.printStackTrace();
		}

		return poHeadList;
	}

	
	@RequestMapping(value = { "/getPODetailList" }, method = RequestMethod.GET)
	public @ResponseBody List<GetPODetail> getPODetails(HttpServletRequest request, HttpServletResponse response) {
System.err.println("Inside getPODetailList add Mrn jsp Ajax call ");
		GetPODetail[] poDetailRes;
		try {
			poIdList = new String();

			//if (poIdList.isEmpty()) {

				poIdList = request.getParameter("poIds");
				System.err.println("Po  Id List  " + poIdList);

				poIdList = poIdList.substring(1, poIdList.length() - 1);
				poIdList = poIdList.replaceAll("\"", "");

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("poIdList", poIdList);

				poDetailRes = rest.postForObject(Constants.url + "/getPODetailList", map, GetPODetail[].class);
				System.err.println("poDetail response  " +poDetailRes.toString());
				
				List<GetPODetail> tempPoDList=null;
				
				
				tempPoDList = new ArrayList<GetPODetail>(Arrays.asList(poDetailRes));
				
					System.err.println("tempPoDList  " +tempPoDList.toString());
						
				if(poDetailList!=null) {
					System.err.println("poDId list not empty ");
					
					for(int i=0;i<tempPoDList.size();i++) {
						int flag=0;
						for(int j=0;j<poDetailList.size();j++) {
							
							if(tempPoDList.get(i).getPoDetailId()==poDetailList.get(j).getPoDetailId()) {
							flag=1;
								
							}//end of poId Match
							
						}
						if(flag==0) {
						poDetailList.add(tempPoDList.get(i));
						System.err.println("Record Added ");
						}
					}
					
					//code  here
					List<GetPODetail> poDetList1=new ArrayList<GetPODetail>();
					//poDetList1=poDetailList;
					
					for(int k=0;k<poDetailList.size();k++) {
						
						poDetList1.add(poDetailList.get(k));
					}
					System.err.println("poDetList1 before =" +poDetList1.toString());
					System.err.println("tempPoDList111111  =" +tempPoDList.toString());


					for(int a=0;a<poDetList1.size();a++) {
						System.err.println("Inside poDetList1  index a = "+a);
						int flag1=0;
						System.err.println("tempPoDList === size" +tempPoDList.size());
						System.err.println("tempPoDList111111  =" +tempPoDList.toString());
						for(int p=0;p<tempPoDList.size();p++) {
							System.err.println("Inside tempPoDList  index p = "+p);

							if(poDetList1.get(a).getPoDetailId()==tempPoDList.get(p).getPoDetailId()) {
								
								System.err.println("Item code "+poDetList1.get(a).getItemCode());
								flag1=1;
								
							}//end of match
						}//end of b for
						
						if(flag1==0) {
							poDetList1.get(a).setTempIsDelete(1);
						}
						
					}//end of a for
					
					System.err.println("poDetList1 =" +poDetList1.toString());

					
					poDetailList=new ArrayList<>();
					
					for(int a=0;a<poDetList1.size();a++) {
						
						if(poDetList1.get(a).getTempIsDelete()==0) {
							
							poDetailList.add(poDetList1.get(a));
							
						}
						
					}
					
					
				}//end of if poDetailList.size>0
				
				else {
					System.err.println("Else new List : First call");
					poDetailList = new ArrayList<GetPODetail>(Arrays.asList(poDetailRes));	
					
				}
				
				//poDetailList = new ArrayList<GetPODetail>(Arrays.asList(poDetailRes));

			//} // end of if poIdList is Empty

			/*else {
				int qty = Integer.parseInt(request.getParameter("qty"));

				int poDId = Integer.parseInt(request.getParameter("poDId"));

				if (poDetailList.size() > 0) {

					// if(qty>0) {

					System.err.println("Inside poDlist.size >0 ");

					for (int i = 0; i < poDetailList.size(); i++) {

						if (poDetailList.get(i).getPoDetailId() == poDId) {
							System.err.println("Inside poDId matched  ");

							poDetailList.get(i).setReceivedQty(qty);

						} else {

							System.err.println("Po Detaol ID Not matched ");
						}
					}
					// }
				}

			} // end of else
*/			System.err.println("PO Details List Using Ajax Call  " + poDetailList.toString());

		} catch (Exception e) {

			System.err.println("Exception in getting PO Detail List @getPODetailList By Ajax Call " + e.getMessage());
			e.printStackTrace();
		}

		return poDetailList;

	}

	
	@RequestMapping(value = { "/addMrnQty" }, method = RequestMethod.GET)
	public @ResponseBody List<GetPODetail> addMrnQty(HttpServletRequest request, HttpServletResponse response) {

		try {
			
			System.err.println("inside /addMrnQty");
			
			float qty = Float.parseFloat(request.getParameter("qty"));

			int poDId = Integer.parseInt(request.getParameter("poDId"));
			
			float chalanQty = Float.parseFloat(request.getParameter("chalanQty"));
			
			
			if (poDetailList.size() > 0) {

				// if(qty>0) {

				System.err.println("Inside poDlist.size >0 ");

				for (int i = 0; i < poDetailList.size(); i++) {

					if (poDetailList.get(i).getPoDetailId() == poDId) {
						System.err.println("Inside poDId matched  ");

						poDetailList.get(i).setReceivedQty(qty);
						poDetailList.get(i).setChalanQty(chalanQty);

					} else {

						System.err.println("Po Detail ID Not matched ");
					}
				}
				// }
			}
		} catch (Exception e) {

			System.err.println("Exception in addMrnQty " + e.getMessage());
			e.printStackTrace();
		}

		return poDetailList;

	}
	
	// getTempPoDetail

	@RequestMapping(value = { "/getTempPoDetail" }, method = RequestMethod.GET)
	public @ResponseBody List<GetPODetail> getTempPoDetail(HttpServletRequest request, HttpServletResponse response) {

		try {
			System.err.println("inside /getTempPoDetail");
		} catch (Exception e) {

			System.err.println("Exception in getTempPoDetail " + e.getMessage());
			e.printStackTrace();
		}

		return poDetailList;

	}

	// insertMrnProcess final Mrn Insert Call Ajax;

	@RequestMapping(value = { "/insertMrnProcess" }, method = RequestMethod.GET)
	public @ResponseBody MrnHeader insertMrnProcess(HttpServletRequest request, HttpServletResponse response) {
		MrnHeader mrnHeaderRes = null;
		try {
			System.err.println("inside /insertMrnProcess");

			int grnType = Integer.parseInt(request.getParameter("grn_type"));
			int vendorId = Integer.parseInt(request.getParameter("vendor_id"));

			String grnNo = request.getParameter("grn_no");
			String grnDate = request.getParameter("grn_date");

			String gateEntryNo = request.getParameter("gate_entry_no");
			String gateEntryDate = request.getParameter("gate_entry_date");

			String chalanNo = request.getParameter("chalan_no");
			String chalanDate = request.getParameter("chalan_date");

			String billNo = request.getParameter("bill_no");
			String billDate = request.getParameter("bill_date");

			String lrDate = request.getParameter("lorry_date");
			String lrNo = request.getParameter("lorry_no");
			String transport = request.getParameter("transport");
			String lorryRemark = request.getParameter("lorry_remark");

			MrnHeader mrnHeader = new MrnHeader();
			//----------------------------Inv No---------------------------------
			//DocumentBean docBean=null;
			
			
			try {
				
				/*MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docId", 3);
				map.add("catId", 1);
				map.add("date", DateConvertor.convertToYMD(grnDate));
				map.add("typeId", grnType);
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
				code.append(String.valueOf(counter));*/
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("docType", 1); 
				map.add("date", DateConvertor.convertToYMD(grnDate)); 
				
				RestTemplate restTemplate = new RestTemplate();

				ErrorMessage errorMessage = restTemplate.postForObject(Constants.url + "generateIssueNoAndMrnNo", map, ErrorMessage.class);
				
				
				mrnHeader.setMrnNo(""+errorMessage.getMessage());
				
				//docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter()+1);
			}catch (Exception e) {
				e.printStackTrace();
			}
			//----------------------------Inv No---------------------------------
			List<MrnDetail> mrnDetailList = new ArrayList<MrnDetail>();

			mrnHeader.setBillDate(DateConvertor.convertToYMD(billDate));
			mrnHeader.setBillNo(billNo);
			mrnHeader.setDelStatus(Constants.delStatus);
			mrnHeader.setDocDate(DateConvertor.convertToYMD(chalanDate));
			mrnHeader.setDocNo(chalanNo);
			mrnHeader.setGateEntryDate(DateConvertor.convertToYMD(gateEntryDate));
			mrnHeader.setGateEntryNo(gateEntryNo);
			mrnHeader.setLrDate(DateConvertor.convertToYMD(lrDate));
			mrnHeader.setLrNo(lrNo);
			mrnHeader.setMrnDate(DateConvertor.convertToYMD(grnDate));
		
			mrnHeader.setMrnStatus(4);
			mrnHeader.setMrnType(grnType);
			mrnHeader.setRemark1(lorryRemark);
			mrnHeader.setRemark2("def");
			mrnHeader.setTransport(transport);
			mrnHeader.setUserId(1);
			mrnHeader.setVendorId(vendorId);

			for (GetPODetail detail : poDetailList) {

				if (detail.getReceivedQty() > 0) {

					MrnDetail mrnDetail = new MrnDetail();

					mrnDetail.setIndentQty(detail.getIndedQty());

					mrnDetail.setPoQty(detail.getItemQty());

					mrnDetail.setMrnQty(detail.getReceivedQty());

					mrnDetail.setItemId(detail.getItemId());

					mrnDetail.setPoId(detail.getPoId());

					mrnDetail.setPoNo(detail.getPoNo());

					mrnDetail.setMrnDetailStatus(4);

					mrnDetail.setBatchNo("Default Batch KKKK-00456");
					mrnDetail.setDelStatus(Constants.delStatus);

					mrnDetail.setPoDetailId(detail.getPoDetailId());
					 

					mrnDetail.setMrnQtyBeforeEdit(-1);
					mrnDetail.setRemainingQty(mrnDetail.getMrnQty());
					mrnDetail.setApproveQty(mrnDetail.getMrnQty());
					mrnDetailList.add(mrnDetail);

				}
			}

			mrnHeader.setMrnDetailList(mrnDetailList);

			System.err.println("Mrn Header   " + mrnHeader.toString());

			RestTemplate restTemp = new RestTemplate();

			 mrnHeaderRes = restTemp.postForObject(Constants.url + "/saveMrnHeadAndDetail", mrnHeader,
					MrnHeader.class);
			 if(mrnHeaderRes!=null)
	          {
	        		try {
	        			
	        			//SubDocument subDocRes = restTemp.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(), SubDocument.class);

	        		
	        		}catch (Exception e) {
						e.printStackTrace();
					}
	          }
			System.err.println("mrnHeaderRes " + mrnHeaderRes.toString());

		} catch (Exception e) {

			System.err.println("Exception in insertMrnProcess " + e.getMessage());
			e.printStackTrace();

		}

		return mrnHeaderRes;
	}

	String fromDate, toDate;
	List<GetMrnHeader> mrnHeaderList = new ArrayList<GetMrnHeader>();

	@RequestMapping(value = "/getMrnHeaders", method = RequestMethod.GET)
	public ModelAndView getMrnHeaders(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			
			

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			// String fromDate,toDate;

			if (request.getParameter("from_date") == null || request.getParameter("to_date") == null) {
				Date date = new Date();
				DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				fromDate = df.format(date);
				toDate = df.format(date);
				System.out.println("From Date And :" + fromDate + "To DATE" + toDate);

				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("grnType", -1);

				System.out.println("inside if ");
			} else {
				fromDate = request.getParameter("from_date");
				toDate = request.getParameter("to_date");
				int grnType=Integer.parseInt(request.getParameter("grn_type"));
				System.out.println("inside Else ");

				System.out.println("fromDate " + fromDate);

				System.out.println("toDate " + toDate);

				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("grnType", grnType);
			}
			// map.add("status", 0);

			model = new ModelAndView("mrn/viewmrn");
			GetMrnHeader[] mrnHead = rest.postForObject(Constants.url + "/getMrnHeaderByDate", map,
					GetMrnHeader[].class);

			mrnHeaderList = new ArrayList<GetMrnHeader>();

			mrnHeaderList = new ArrayList<GetMrnHeader>(Arrays.asList(mrnHead));

			System.out.println("mrnHeaderList List using /getMrnHeaderByDate   " + mrnHeaderList.toString());

			model.addObject("mrnHeaderList", mrnHeaderList);
			model.addObject("fromDate", fromDate);
			model.addObject("toDate", toDate);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {

			System.err.println("Exception in getMrnHeader MRN" + e.getMessage());
			e.printStackTrace();
		}

		return model;
	}

	// showEditViewMrnDetail/

	List<GetMrnDetail> mrnDetailList = new ArrayList<GetMrnDetail>();
	
	List<PoItemForMrnEdit> poItemListForMrnEdit = new ArrayList<PoItemForMrnEdit>();
List<GetPODetail> poDetailForEditMrn=new ArrayList<GetPODetail>();

	
	@RequestMapping(value = "/showEditViewMrnDetail/{mrnId}", method = RequestMethod.GET)
	public ModelAndView editIndent(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("mrnId") int mrnId) {
		
		poItemListForMrnEdit=new ArrayList<PoItemForMrnEdit>();
		poDetailForEditMrn=new ArrayList<GetPODetail>();
		GetPODetail[] poDetailRes;
		ModelAndView model = null;
		try {
			model = new ModelAndView("mrn/editMrnDetail");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("mrnId", mrnId);

			GetMrnDetail[] mrnDetail = rest.postForObject(Constants.url + "/getMrnDetailByMrnId", map,
					GetMrnDetail[].class);

			mrnDetailList = new ArrayList<GetMrnDetail>(Arrays.asList(mrnDetail));

			GetMrnHeader getMrnHeader = new GetMrnHeader();

			for (int i = 0; i < mrnHeaderList.size(); i++) {

				if (mrnHeaderList.get(i).getMrnId() == mrnId) {

					getMrnHeader = mrnHeaderList.get(i);
					break;

				}

			}
			map = new LinkedMultiValueMap<String, Object>();
			
			String s=new String();
			
			for(int i=0;i<mrnDetailList.size();i++) {
				if(i==0) {
					
					s=""+mrnDetailList.get(i).getPoId()+",";
				}else {
				s=s+mrnDetailList.get(i).getPoId()+",";
				}
			}
			System.err.println("to get po detail from mrn poid " +s);
			map.add("poIdList", s);

			poDetailRes = rest.postForObject(Constants.url + "/getPODetailList", map, GetPODetail[].class);
			poDetailList = new ArrayList<GetPODetail>(Arrays.asList(poDetailRes));
			
			System.err.println("POd res in edit show " +poDetailList.toString());
			
			for(int i=0;i<poDetailList.size();i++) {
				int flag=0;
				System.err.println("poDetailList poid  " +poDetailList.get(i).getPoDetailId());
				for(int j=0;j<mrnDetailList.size();j++) {
					System.err.println("mrnDetailList poid  " +mrnDetailList.get(j).getPoDetailId());

					if(mrnDetailList.get(j).getPoDetailId()==poDetailList.get(i).getPoDetailId()) {
						System.err.println("Match found ");
						flag=1;
						
					}
					
				}
				if(flag==0) {
					
					poDetailForEditMrn.add(poDetailList.get(i));
					
				}
				
			}
			
			System.err.println("POd poDetailForEditMrn edit show " +poDetailForEditMrn.toString());
			model.addObject("mrnDetailList", mrnDetailList);
			
			model.addObject("poItemList", poDetailForEditMrn);

			model.addObject("mrnHeader", getMrnHeader);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {

			System.err.println("Exception in /getMrnDetailByMrnId Mrn Controller" + e.getMessage());

			e.printStackTrace();

		}
		return model;
	}
	
	@RequestMapping(value = { "/getpoDetailForEditMrn" }, method = RequestMethod.GET)
	public @ResponseBody List<GetPODetail> getpoDetailForEditMrn(HttpServletRequest request, HttpServletResponse response) {

		System.err.println("poDetailForEditMrn  Ajx " +poDetailForEditMrn.toString());
		
		float qty=Float.parseFloat(request.getParameter("qty"));
		int poDId=Integer.parseInt(request.getParameter("poDId"));
		
		if(qty==0 && poDId==0) {
			System.err.println("qty and podid are zero ");
			
		}else {
			System.err.println("In else ");
		for(int i=0;i<poDetailForEditMrn.size();i++) {
			
			if(poDetailForEditMrn.get(i).getPoDetailId()==poDId) {
				System.err.println("Podid matched "+poDId +"quantity seted" +qty);
				poDetailForEditMrn.get(i).setReceivedQty(qty);
			}
		}
		}
		
		return poDetailForEditMrn;
			
		
	}
	
	//temp Submit on edit mrn: add new item
	@RequestMapping(value = { "/submitNewMrnItemOnEdit" }, method = RequestMethod.GET)
	public @ResponseBody List<GetMrnDetail> submitNewMrnItemOnEdit(HttpServletRequest request, HttpServletResponse response) {
		
	//	uuu;
		//getMrnHeader
		
		int mrnId=Integer.parseInt(request.getParameter("mrnId"));
		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("mrnId", mrnId);
				MrnHeader mrnHead = rest.postForObject(Constants.url + "/getOneMrnHeader", map,
						MrnHeader.class);
		List<MrnDetail> editMrnDetailList = new ArrayList<MrnDetail>();

		for (GetPODetail detail : poDetailForEditMrn) {

			if (detail.getReceivedQty() > 0) {

				MrnDetail mrnDetail = new MrnDetail();

				mrnDetail.setIndentQty(detail.getIndedQty());

				mrnDetail.setPoQty(detail.getItemQty());

				mrnDetail.setMrnQty(detail.getReceivedQty());

				mrnDetail.setItemId(detail.getItemId());

				mrnDetail.setPoId(detail.getPoId());

				mrnDetail.setPoNo(detail.getPoNo());

				mrnDetail.setMrnDetailStatus(4);

				mrnDetail.setBatchNo("Default Batch KKKK-00456");
				mrnDetail.setDelStatus(Constants.delStatus);

				mrnDetail.setPoDetailId(detail.getPoDetailId()); 
				mrnDetail.setMrnQtyBeforeEdit(-1);
				mrnDetail.setApproveQty(mrnDetail.getMrnQty());
				mrnDetail.setRemainingQty(mrnDetail.getMrnQty());
				editMrnDetailList.add(mrnDetail);

			}
			mrnHead.setMrnDetailList(editMrnDetailList);
		}

		RestTemplate restTemp = new RestTemplate();

		MrnHeader	 mrnHeaderRes = restTemp.postForObject(Constants.url + "/saveMrnHeadAndDetail", mrnHead,
				MrnHeader.class);
		
		GetMrnDetail[] mrnDetail = rest.postForObject(Constants.url + "/getMrnDetailByMrnId", map,
				GetMrnDetail[].class);

		mrnDetailList = new ArrayList<GetMrnDetail>(Arrays.asList(mrnDetail));
		poDetailForEditMrn.clear();

		return mrnDetailList;

	}
	
	// ajax call to change the mrn Qty
	// getMrnDetail

	// edit mrn detail call

	@RequestMapping(value = { "/getMrnDetail" }, method = RequestMethod.GET)
	public @ResponseBody List<GetMrnDetail> getMrnDetail(HttpServletRequest request, HttpServletResponse response) {

		try {

			float mrnQty = Float.parseFloat(request.getParameter("qty"));

			int mrnDetailId = Integer.parseInt(request.getParameter("detailId"));

			if (mrnDetailList.size() > 0) {

				// if(qty>0) {

				System.err.println("Inside poDlist.size >0 ");

				for (int i = 0; i < mrnDetailList.size(); i++) {

					if (mrnDetailList.get(i).getMrnDetailId() == mrnDetailId) {
						System.err.println("Inside mrnDetailId matched  ");

						mrnDetailList.get(i).setMrnQty(mrnQty);

					} else {

						System.err.println("Mrn Detail ID Not matched ");
					}
				}
				// }
			}

			System.err.println("Mrn Details List Using Ajax Call  " + mrnDetailList.toString());

		} catch (Exception e) {

			System.err.println("Exception in getting Mrn Detail List @getMrnDetail By Ajax Call " + e.getMessage());
			e.printStackTrace();
		}

		return mrnDetailList;

	}

	@RequestMapping(value = { "/editMrnProcess" }, method = RequestMethod.GET)
	public @ResponseBody MrnHeader editMrnProcess(HttpServletRequest request, HttpServletResponse response) {

		MrnHeader mrnHeaderRes = null; 
		try {
			System.err.println("inside /editMrnProcess");

			String gateEntryNo = request.getParameter("gate_entry_no");
			String gateEntryDate = request.getParameter("gate_entry_date");

			String chalanNo = request.getParameter("chalan_no");
			String chalanDate = request.getParameter("chalan_date");

			String billNo = request.getParameter("bill_no");
			String billDate = request.getParameter("bill_date");

			String lrDate = request.getParameter("lorry_date");
			String lrNo = request.getParameter("lorry_no");
			String transport = request.getParameter("transport");
			String lorryRemark = request.getParameter("lorry_remark");

			int mrnId = Integer.parseInt(request.getParameter("mrn_id"));

			MrnHeader mrnHeader = new MrnHeader();

			for (int i = 0; i < mrnHeaderList.size(); i++) {

				if (mrnHeaderList.get(i).getMrnId() == mrnId) {

					mrnHeader.setMrnId(mrnId);

					mrnHeader.setVendorId(mrnHeaderList.get(i).getVendorId());
					mrnHeader.setMrnNo(mrnHeaderList.get(i).getMrnNo());
					mrnHeader.setMrnDate(DateConvertor.convertToYMD(mrnHeaderList.get(i).getMrnDate()));
					mrnHeader.setMrnType(mrnHeaderList.get(i).getMrnType());

				}

			}

			List<MrnDetail> editMrnDetailList = new ArrayList<MrnDetail>();

			mrnHeader.setBillDate(DateConvertor.convertToYMD(billDate));
			mrnHeader.setBillNo(billNo);
			mrnHeader.setDelStatus(Constants.delStatus);
			mrnHeader.setDocDate(DateConvertor.convertToYMD(chalanDate));
			mrnHeader.setDocNo(chalanNo);
			mrnHeader.setGateEntryDate(DateConvertor.convertToYMD(gateEntryDate));
			mrnHeader.setGateEntryNo(gateEntryNo);
			mrnHeader.setLrDate(DateConvertor.convertToYMD(lrDate));
			mrnHeader.setLrNo(lrNo);
			// mrnHeader.setMrnNo("default MRN NO");
			mrnHeader.setMrnStatus(4);
			mrnHeader.setRemark1(lorryRemark);
			mrnHeader.setRemark2("def");
			mrnHeader.setTransport(transport);
			mrnHeader.setUserId(1);

			for (GetMrnDetail detail : mrnDetailList) {

				if (detail.getMrnQty() > 0) {

					MrnDetail mrnDetail = new MrnDetail();

					mrnDetail.setMrnDetailId(detail.getMrnDetailId());
					mrnDetail.setMrnId(detail.getMrnId());

					mrnDetail.setMrnQty(detail.getMrnQty());
					mrnDetail.setIndentQty(detail.getIndentQty());
					mrnDetail.setPoQty(detail.getPoQty());
					mrnDetail.setMrnQty(detail.getMrnQty());
					mrnDetail.setItemId(detail.getItemId());
					mrnDetail.setPoId(detail.getPoId());
					mrnDetail.setPoNo(detail.getPoNo());
					mrnDetail.setMrnDetailStatus(4);
					mrnDetail.setMrnDetailId(detail.getMrnDetailId());
					mrnDetail.setBatchNo(detail.getBatchNo());
					mrnDetail.setDelStatus(detail.getDelStatus());
					mrnDetail.setPoDetailId(detail.getPoDetailId());

					mrnDetail.setApproveQty(detail.getMrnQty());
					mrnDetail.setRejectQty(detail.getRejectQty());
					mrnDetail.setRejectRemark(detail.getRejectRemark());
					mrnDetail.setIssueQty(detail.getIssueQty());
					mrnDetail.setRemainingQty(detail.getMrnQty()); 
					mrnDetail.setMrnQtyBeforeEdit(detail.getMrnQtyBeforeEdit());

					editMrnDetailList.add(mrnDetail);

				}
			}

			mrnHeader.setMrnDetailList(editMrnDetailList);

			System.err.println("Mrn Header  bean generated  " + mrnHeader.toString());

			RestTemplate restTemp = new RestTemplate();

			 mrnHeaderRes = restTemp.postForObject(Constants.url + "/saveMrnHeadAndDetail", mrnHeader,
					MrnHeader.class);

			System.err.println("mrnHeaderRes " + mrnHeaderRes.toString());

		} catch (Exception e) {

			System.err.println("Exception in editMrnProcess " + e.getMessage());
			e.printStackTrace();

		}

		return mrnHeaderRes;

	}

	@RequestMapping(value = "/deleteMrn/{mrnId}", method = RequestMethod.GET)
	public String deleteMrn(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("mrnId") int mrnId) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("mrn/editMrnDetail");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("mrnId", mrnId);

			ErrorMessage errMsg = rest.postForObject(Constants.url + "/deleteMrnHeader", map, ErrorMessage.class);
			System.err.println("Delete Mrn Response  " + errMsg.getMessage());

		} catch (Exception e) {

			System.err.println("Exception in /deleteMrn Mrn Controller" + e.getMessage());

			e.printStackTrace();

		}
		return "redirect:/getMrnHeaders";
	}
	
	@RequestMapping(value = "/deleteMrnDetail/{mrnDetailId}", method = RequestMethod.GET)
	public String deleteMrnDetail(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("mrnDetailId") int mrnDetailId) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("mrn/editMrnDetail");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("mrnDetailId", mrnDetailId);

			ErrorMessage errMsg = rest.postForObject(Constants.url + "/deleteMrnDetail", map, ErrorMessage.class);
			System.err.println("Delete Mrn Response  " + errMsg.getMessage());

		} catch (Exception e) {

			System.err.println("Exception in /deleteMrn Mrn Controller" + e.getMessage());

			e.printStackTrace();

		}
		return "redirect:/getMrnHeaders";
	}
	
	@RequestMapping(value = "/firstApproveMrn", method = RequestMethod.GET)
	public ModelAndView firstApprovePurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("mrn/approveMrn");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
 
			map.add("status","2,3"); 
			map.add("venId",0);
			GetMrnHeader[] getMrnHeader =rest.postForObject(Constants.url+"getMrnHeaderList", map,  GetMrnHeader[].class);
			List<GetMrnHeader> getMrnHeaderList = new ArrayList<GetMrnHeader>(Arrays.asList(getMrnHeader));
			model.addObject("approve", 1);
			model.addObject("getMrnHeaderList", getMrnHeaderList);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/secondApproveMrn", method = RequestMethod.GET)
	public ModelAndView secondApprovePurchaseOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("mrn/approveMrn");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			 
			map.add("status","3"); 
			map.add("venId",0);
			GetMrnHeader[] getMrnHeader =rest.postForObject(Constants.url+"getMrnHeaderList", map,  GetMrnHeader[].class);
			List<GetMrnHeader> getMrnHeaderList = new ArrayList<GetMrnHeader>(Arrays.asList(getMrnHeader));
			model.addObject("approve", 2);
			model.addObject("getMrnHeaderList", getMrnHeaderList);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	GetMrnHeader mrnFroApprove = new GetMrnHeader();
	
	@RequestMapping(value = "/approveMrnDetail/{mrnId}/{approve}", method = RequestMethod.GET)
	public ModelAndView approvePoDetail(@PathVariable int mrnId,@PathVariable int approve, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("mrn/approveMrnDetail");
		try {

			mrnFroApprove = new GetMrnHeader();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			 map.add("mrnId",mrnId); 
			 mrnFroApprove=rest.postForObject(Constants.url+"getMrnHeaderForApprove", map,  GetMrnHeader.class);
			
           model.addObject("mrnFroApprove", mrnFroApprove);
			model.addObject("approve", approve);
			
			Type[] type = rest.getForObject(Constants.url + "/getAlltype", Type[].class);
			List<Type> typeList = new ArrayList<Type>(Arrays.asList(type));
			model.addObject("typeList", typeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/submitMrnApprove", method = RequestMethod.POST)
	public String submitMrnApprove(HttpServletRequest request, HttpServletResponse response) {

		String ret = null;
		int approve = Integer.parseInt(request.getParameter("approve"));
		try {
			 
			
			String mrnDetalId = new String();
			int mrnId = 0 ;
			int status = 2;
			
			
			if(approve==1) {
				
				mrnFroApprove.setMrnStatus(3);
				mrnId=mrnFroApprove.getMrnId();
				String[] checkbox = request.getParameterValues("select_to_approve");
				status=3;
				for(int i=0 ; i<checkbox.length ;i++) {
					
					for(int j=0 ; j<mrnFroApprove.getGetMrnDetailList().size() ; j++) {
						
						if(Integer.parseInt(checkbox[i])==mrnFroApprove.getGetMrnDetailList().get(j).getMrnDetailId()) {
							mrnFroApprove.getGetMrnDetailList().get(j).setMrnDetailStatus(3);
							mrnDetalId=mrnDetalId+","+mrnFroApprove.getGetMrnDetailList().get(j).getMrnDetailId();
							break;
						}
					}
				}
				
				 
			}
			else if(approve==2){
				 
				mrnFroApprove.setMrnStatus(4);
				mrnId=mrnFroApprove.getMrnId();
				String[] checkbox = request.getParameterValues("select_to_approve");
				status=4;
				for(int i=0 ; i<checkbox.length ;i++) {
					
					for(int j=0 ; j<mrnFroApprove.getGetMrnDetailList().size() ; j++) {
						
						if(Integer.parseInt(checkbox[i])==mrnFroApprove.getGetMrnDetailList().get(j).getMrnDetailId()) {
							mrnFroApprove.getGetMrnDetailList().get(j).setMrnDetailStatus(4);
							mrnDetalId=mrnDetalId+","+mrnFroApprove.getGetMrnDetailList().get(j).getMrnDetailId();
							break;
						}
					}
				} 
				
			}
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("mrnId", mrnId);
			map.add("mrnDetalId", mrnDetalId.substring(1, mrnDetalId.length()));
			map.add("status", status);
			System.out.println("map " + map);
			ErrorMessage approved = rest.postForObject(Constants.url + "/updateStatusWhileMrnApprov", map, ErrorMessage.class);
			
			 if(approve==2 && approved.isError()==false) {
				 
				 GetItem[] item = rest.getForObject(Constants.url + "/getAllItems",  GetItem[].class); 
					List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item)); 
					map = new LinkedMultiValueMap<String, Object>();
					map.add("name", "autoIssue"); 
					System.out.println("map " + map);
					SettingValue settingValue = rest.postForObject(Constants.url + "/getSettingValue", map, SettingValue.class);
					
					int flag=0;
					 String[] type = settingValue.getValue().split(",");
					 
					 for(int i = 0 ; i<type.length ; i++) {
						 
						 if(mrnFroApprove.getMrnType()==Integer.parseInt(type[i])) {
							  flag=1;
							  break;
						 }
					 }
					 
					 if(flag==1) {
						 
						 IssueHeader issueHeader = new IssueHeader(); 
						 issueHeader.setIssueDate(DateConvertor.convertToYMD(mrnFroApprove.getMrnDate()));
						 DocumentBean docBean=null;
							try {
								
								 map = new LinkedMultiValueMap<String, Object>();
								map.add("docId",6);
								map.add("catId", 1);
								map.add("date", DateConvertor.convertToYMD(mrnFroApprove.getMrnDate()));
								map.add("typeId", mrnFroApprove.getMrnType());
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
								
								 issueHeader.setIssueNo(""+code);
								
								docBean.getSubDocument().setCounter(docBean.getSubDocument().getCounter()+1);
							}catch (Exception e) {
								e.printStackTrace();
								 issueHeader.setIssueNo("1");
							}
							
							ErrorMessage getDeptId = new ErrorMessage();
							try {
								
								int poId = mrnFroApprove.getGetMrnDetailList().get(0).getPoId(); 
								 map = new LinkedMultiValueMap<>();
								 map.add("poId", poId);
								 getDeptId = rest.postForObject(Constants.url + "/getDeptAndSubDeptFromIndentByPoId", map,
										 ErrorMessage.class);
								
							} catch (Exception e) {
								// TODO: handle exception
							}
							
							String[] deptIdAndSubDeptId = getDeptId.getMessage().split(",");
						 //issueHeader.setIssueNo(issueNo);
						 issueHeader.setDeleteStatus(1);
						
						 issueHeader.setDeptId(Integer.parseInt(deptIdAndSubDeptId[0]));
						 issueHeader.setSubDeptId(Integer.parseInt(deptIdAndSubDeptId[1]));
						 issueHeader.setAccHead(Integer.parseInt(deptIdAndSubDeptId[2]));
						 issueHeader.setItemCategory(mrnFroApprove.getMrnType());
						 String mrnDetailList = new String();
						 List<IssueDetail> issueDetailList = new ArrayList<IssueDetail>();
						 for(int i=0 ; i<mrnFroApprove.getGetMrnDetailList().size() ; i++)
						 {
							 for(int j=0 ; j<itemList.size() ;j++)
							 {
								 if(itemList.get(j).getItemId()==mrnFroApprove.getGetMrnDetailList().get(i).getItemId()) {
									 IssueDetail issueDetail = new IssueDetail();
									 issueDetail.setItemId(mrnFroApprove.getGetMrnDetailList().get(i).getItemId());
									 issueDetail.setItemIssueQty(mrnFroApprove.getGetMrnDetailList().get(i).getMrnQty());
									 issueDetail.setItemGroupId(itemList.get(j).getGrpId());
									 issueDetail.setDeptId(Integer.parseInt(deptIdAndSubDeptId[0]));
									 issueDetail.setSubDeptId(Integer.parseInt(deptIdAndSubDeptId[1]));
									 issueDetail.setAccHead(Integer.parseInt(deptIdAndSubDeptId[2]));
									 //issueDetail.setItemName(itemName);
									 /*issueDetail.setGroupName(groupName);
									 issueDetail.setDeptName(deptName);
									 issueDetail.setSubDeptName(subDeptName);
									 issueDetail.setAccName(accName);*/
									 issueDetail.setDelStatus(1); 
									 issueDetail.setBatchNo(mrnFroApprove.getGetMrnDetailList().get(i).getBatchNo());
									 issueDetail.setMrnDetailId(mrnFroApprove.getGetMrnDetailList().get(i).getMrnDetailId()); 
									 mrnDetailList=mrnDetailList+","+mrnFroApprove.getGetMrnDetailList().get(i).getMrnDetailId();
									 issueDetailList.add(issueDetail);
									 break;
								 }
							 }
							 
						 }
			  
						 mrnDetailList = mrnDetailList.substring(1, mrnDetailList.length());
						 
						  map = new LinkedMultiValueMap<>();
						 map.add("mrnDetailList", mrnDetailList);
						 MrnDetail[] MrnDetail = rest.postForObject(Constants.url + "/getMrnDetailListByMrnDetailId", map,
								 MrnDetail[].class);
						 
						 List<MrnDetail> updateMrnDetail = new ArrayList<MrnDetail>(Arrays.asList(MrnDetail));
						 
						 for(int j=0 ; j<issueDetailList.size() ; j++)
						 {
							 for(int i=0 ; i<updateMrnDetail.size() ; i++)
							 { 
								 if(updateMrnDetail.get(i).getMrnDetailId()==issueDetailList.get(j).getMrnDetailId())
								 {
									 updateMrnDetail.get(i).setRemainingQty(updateMrnDetail.get(i).getRemainingQty()-issueDetailList.get(j).getItemIssueQty());
									 updateMrnDetail.get(i).setIssueQty(updateMrnDetail.get(i).getIssueQty()+issueDetailList.get(j).getItemIssueQty());
								 }
							 }
						 }
						 issueHeader.setIssueDetailList(issueDetailList); 
						 System.err.println("issueHeader  " + issueHeader); 
						 System.err.println("updateMrnDetail  " + updateMrnDetail); 
						  IssueHeader res = rest.postForObject(Constants.url + "/saveIssueHeaderAndDetail", issueHeader,
								IssueHeader.class);
						  MrnDetail[] update = rest.postForObject(Constants.url + "/updateMrnDetailList", updateMrnDetail,
			    					 MrnDetail[].class);
						  SubDocument subDocRes = rest.postForObject(Constants.url + "/saveSubDoc", docBean.getSubDocument(), SubDocument.class);

						 
					 }
			} 
 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(approve==1) {
			ret = "redirect:/firstApproveMrn";
		}
		else {
			ret = "redirect:/secondApproveMrn";
		}

		return ret;
	}
	
	
	@RequestMapping(value = "/exportExcelforMrn", method = RequestMethod.GET)
	@ResponseBody
	public List<ImportExcelForPo> exportExcelforPo(HttpServletRequest request, HttpServletResponse response) {

		
		List<ImportExcelForPo> list = new ArrayList<>();
		try {
			  
			//String excelFilePath = "C:/pdf/Books1.xlsx";
			//String excelFilePath = "http://132.148.143.124:8080/triluploads/Books1.xlsx";
			String excelFilePath = "/opt/tomcat-latest/webapps/uploads/Books1.xlsx";
			//String excelFilePath = "/home/lenovo/Downloads/Books1.xlsx";
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
	    
	        
	        
	        for(int i=0 ; i<poDetailList.size() ; i++) {
	        	
	        	for(int j=0 ; j< list.size() ; j++) {
	        		
	        		if(poDetailList.get(i).getItemId()==list.get(j).getItemId()) {
	        			
	        			list.get(j).setIndDetailId(poDetailList.get(i).getPoDetailId());
	        			poDetailList.get(i).setReceivedQty(list.get(j).getQty());
						poDetailList.get(i).setChalanQty(list.get(j).getRate());
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
