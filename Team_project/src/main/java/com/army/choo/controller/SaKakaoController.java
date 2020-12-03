package com.army.choo.controller;

import org.springframework.stereotype.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.army.choo.dto.KakaoPayApprovalVO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.service.KakaoPay;
import com.army.choo.service.MemberService;
import com.army.choo.service.PayService;
import com.army.choo.service.SaKakaoPay;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SaKakaoController {

	public ModelAndView mav;
	
	@Autowired
	private PayService payservice;

	@Autowired
	private MemberService memberservice;

	@Setter(onMethod_ = @Autowired)

	private SaKakaoPay sakakaopay;
	int arraysize = 0;
	String[] banumberarray = null;
	String[] pnumberarray = null;
	String[] arrayquantity2 = null;
	@GetMapping("/bakakaopay")
	public void kakaoPayGet() {

	}

	@PostMapping("/bakakaopay")
	public String kakaoPay(@ModelAttribute KakaoPayApprovalVO kpapprovalVO, String[] array, String[] arraypnumber, String[] arrayquantity) {
		log.info("bakakaopay post............................................");
		arraysize = array.length;
		banumberarray = new String[arraysize];
		pnumberarray = new String[arraysize];
		arrayquantity2 = new String[arraysize];
		for (int i = 0; i < array.length; i++) {
			System.out.println("상품번호 : " + arraypnumber[i]);
			banumberarray[i] = array[i];
			pnumberarray[i] = arraypnumber[i];
			arrayquantity2[i] = arrayquantity[i];
		}

		return "redirect:" + sakakaopay.kakaoPayReady(kpapprovalVO, array, arraypnumber);

	}

	@GetMapping("/bakakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, RedirectAttributes redirectAttributes) {
		/* , RedirectAttributes kredirect */
		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		KakaoPayApprovalVO kvalue = sakakaopay.kakaoPayInfo2(pg_token);
		System.out.println(kvalue.getPartner_user_id());
		redirectAttributes.addFlashAttribute("kvalue", kvalue);
		System.out.println("ssssssssss " + kvalue);
		return "redirect:/payinsert2";
	}

	

	 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/payinsert2")
	public ModelAndView payInsert(HttpServletRequest request) {
		int result = 0;
		int banumber = 0;
		int quantity = 0;
		Map<String, KakaoPayApprovalVO> flashMap = (Map<String, KakaoPayApprovalVO>) RequestContextUtils.getInputFlashMap(request);
		KakaoPayApprovalVO kvalue = (KakaoPayApprovalVO) flashMap.get("kvalue");
		System.out.println("ddddd : " + kvalue);
		MemberDTO mDTO = memberservice.memberdetailService(kvalue.getPartner_user_id());
		  for(int i = 0; i < banumberarray.length; i++) { 
			  int pnumber = Integer.parseInt(pnumberarray[i]); 
			  banumber = Integer.parseInt(banumberarray[i]);
			  quantity = Integer.parseInt(arrayquantity2[i]);
			  kvalue.setUpdatequantity(quantity);
			  String office = memberservice.productService(pnumber); 
			  kvalue.setPcode(pnumber);
			  kvalue.setPayage(mDTO.getMbirth());
			  kvalue.setPaygender(mDTO.getMgender());
			  kvalue.setPayoffice(office);
			  kvalue.setPcode(pnumber); 
			  String category = payservice.categoryselect(banumber);
			  kvalue.setPaycategory(category);
			  String baname = payservice.banameselect(banumber);
			  kvalue.setItem_name(baname);
			  result = payservice.payInsert2(kvalue);
			  if(result > 0) {
				  mav = payservice.payDelete(banumber, kvalue); 
			  }else {
				  System.out.println("뭐가안되었을까????????");
			  }
			  }
		return mav;
	}

}
