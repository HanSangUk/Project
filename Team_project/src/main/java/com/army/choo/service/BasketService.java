package com.army.choo.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.BasketDAO;
import com.army.choo.dto.BasketDTO;

@Service
public class BasketService {

	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BasketDAO basketDAO;
	
	public ModelAndView basketInsert(BasketDTO basketDTO) {
	      mav = new ModelAndView();
	      int result = basketDAO.basketInsert(basketDTO);
	      String category = basketDTO.getCategory();
	      int pnumber = basketDTO.getPnumber();
	      if (result > 0 ) {
	         mav.addObject("category", category);
	         mav.addObject("pnumber", pnumber);
	         mav.setViewName("basketv/BasketConfirm");
	      }else {
	         System.out.println("insert실패");
	      }
	      return mav;
	   }

	public ModelAndView basketList(String baid) {
		mav = new ModelAndView();
		
		List<BasketDTO> balist = basketDAO.basketList(baid);
		
		mav.addObject("basketlist", balist);
		mav.setViewName("basketv/BasketList");
		
		return mav;
	}

	public void deleteCart(BasketDTO bDTO) throws Exception {
		basketDAO.deleteCart(bDTO);
	}

	public List<BasketDTO> basketajaxList(String baid) {
		List<BasketDTO> balist = basketDAO.basketajaxList(baid);
		return balist;
	}

}
