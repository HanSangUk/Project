package com.army.choo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dto.BasketDTO;
import com.army.choo.service.BasketService;

@Controller
public class BasketController {

	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BasketService basketService;
	
	@RequestMapping(value = "/basketinsert")
	public ModelAndView basketInsert(@ModelAttribute BasketDTO basketDTO) {
		System.out.println("이건 장바구니 dTO입니다 : " + basketDTO);
		mav = basketService.basketInsert(basketDTO);
		return mav;
	}
	
	@RequestMapping(value = "/basketlist")
	public ModelAndView basketList() {
		String baid = (String) session.getAttribute("loginId");
		mav = basketService.basketList(baid);
		return mav;
	}
	
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, BasketDTO bDTO) throws Exception {
	 
	 String baid = (String) session.getAttribute("loginId");
	 System.out.println(chArr);
	 
	 int result = 0;
	 int banumber = 0;
		/* List<BasketDTO> basketList = new ArrayList<BasketDTO>(); */
	 
	 if(baid != null) {
		 bDTO.setBaid(baid);
	  
	  for(String i : chArr) {   
		  banumber = Integer.parseInt(i);
	   bDTO.setBanumber(banumber);
	   basketService.deleteCart(bDTO);
	  }   
	  result = 1;
	 }  
	 
		/* basketList = basketService.basketajaxList(baid); */
	 
	 return result;  
	}
}
