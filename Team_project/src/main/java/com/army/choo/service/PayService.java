package com.army.choo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.PayDAO;
import com.army.choo.dao.ProductDAO;
import com.army.choo.dto.KakaoPayApprovalVO;
import com.army.choo.dto.PayDTO;

@Service
public class PayService {
	
	@Autowired
	private PayDAO pdao;
	 
	@Autowired
	private ProductDAO productDAO;
	
	private ModelAndView mav;
	   //결제 데이터 삽입
	   public ModelAndView payInsert(KakaoPayApprovalVO kvalue) {
		   int value = kvalue.getPcode();
		  String category = pdao.categorySelect2(value); 
		  kvalue.setPaycategory(category);
		  int result = pdao.payInsert(kvalue);
		  String mid = kvalue.getPartner_user_id();
		  productDAO.updatequantity(kvalue);
		  pdao.alarmInsert(kvalue);
		  List<PayDTO> paylist = new ArrayList<PayDTO>();
		  paylist = pdao.payListSelect(mid);
		  mav = new ModelAndView();
		  if (result > 0) {
			  mav.addObject("payList",paylist);
			  mav.setViewName("productv/PayList");
		  }else {
			  mav.setViewName("Fail");
		  }
	      return mav;
	   }

	public String categoryselect(int banumber) {
		String category = pdao.categorySelect(banumber);
		return category;
	}
	
	public int payInsert2(KakaoPayApprovalVO kvalue) {
		int result = pdao.payInsert2(kvalue);
		return result;
	}

	public ModelAndView payDelete(int banumber, KakaoPayApprovalVO kvalue) {
		mav = new ModelAndView();
		int result = pdao.payDelete(banumber);
		List <PayDTO> paylist = new ArrayList<PayDTO>();
		String mid = kvalue.getPartner_user_id();
		if(result > 0 ) {
			pdao.productupdate(kvalue);
			paylist = pdao.payListSelect(mid);
			mav.addObject("payList", paylist);
			mav.setViewName("productv/PayList");
		}else {
			System.out.println();
		}
		return mav;
	}

	public String banameselect(int banumber) {
		String baname = pdao.banameselect(banumber);
		return baname;
	}
}
