package com.army.choo.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.AlgorismDAO;
import com.army.choo.dto.PayDTO;
import com.army.choo.dto.ProductDTO;

@Service
public class AlgorismService {
	
	private ModelAndView mav;
	
	@Autowired
	public AlgorismDAO adao;

	@Autowired
	public HttpSession session;
	
	public ModelAndView selectUser(List<PayDTO> plist) {
		
		String userid = plist.get(0).getPayid(); 
		String category = adao.selectCategoti(userid);
		String maxCategory = adao.selectMaxCategoti(category);
		List<ProductDTO> pclist = adao.selectProductList(maxCategory);
		String mid = (String) session.getAttribute("loginId");
		for(int i=0 ; i<pclist.size();i++)
			{ProductDTO pdto = pclist.get(i);
			 pdto.setUserid(mid);
			 	int result = adao.insertProduct(pdto);
			 }
		mav = new ModelAndView();
		mav.addObject("plist",plist);
		mav.setViewName("paymentv/PayList");
		return mav;
		
		}
		
	}
	

