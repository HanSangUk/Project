package com.army.choo.controller;

import org.springframework.stereotype.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.army.choo.dto.KakaoPayApprovalVO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.service.KakaoPay;
import com.army.choo.service.MemberService;
import com.army.choo.service.PayService;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SampleController {

   public ModelAndView mav;
   
   @Autowired
   private PayService payservice;
   
   @Autowired 
   private MemberService memberservice;
   

   @Setter(onMethod_ = @Autowired)
   
   private KakaoPay kakaopay;

   @GetMapping("/kakaoPay")
   public void kakaoPayGet() {

   }

   @PostMapping("/kakaoPay")
   public String kakaoPay(@ModelAttribute KakaoPayApprovalVO kpapprovalVO) {
      log.info("kakaoPay post............................................");

      return "redirect:" + kakaopay.kakaoPayReady(kpapprovalVO);

   }

   @GetMapping("/kakaoPaySuccess")
   public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, RedirectAttributes redirectAttributes) {
      /*, RedirectAttributes kredirect*/
      log.info("kakaoPaySuccess get............................................");
      log.info("kakaoPaySuccess pg_token : " + pg_token);
      KakaoPayApprovalVO kvalue = kakaopay.kakaoPayInfo(pg_token);
      MemberDTO mDTO = memberservice.memberdetailService(kvalue.getPartner_user_id());
      
      int pnumber = Integer.parseInt(kvalue.getItem_code());
      String office = memberservice.productService(pnumber);
      kvalue.setPcode(pnumber);
      kvalue.setTotal_amount(kvalue.getAmount().getTotal());
      kvalue.setPayage(mDTO.getMbirth());
      kvalue.setPaygender(mDTO.getMgender());
      kvalue.setPayoffice(office);
      redirectAttributes.addFlashAttribute("kvalue", kvalue);
      System.out.println("ssssssssss "+ kvalue);
      return "redirect:/payinsert";
   }

     @SuppressWarnings("unchecked")
	@RequestMapping(value = "/payinsert")
     public ModelAndView payInsert(HttpServletRequest request) {
        Map<String, KakaoPayApprovalVO> flashMap = (Map<String, KakaoPayApprovalVO>)RequestContextUtils.getInputFlashMap(request);
        KakaoPayApprovalVO kvalue = (KakaoPayApprovalVO)flashMap.get("kvalue");
        mav = payservice.payInsert(kvalue);
        return mav;
     }
   
}