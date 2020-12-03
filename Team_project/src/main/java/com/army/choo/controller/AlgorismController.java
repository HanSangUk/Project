package com.army.choo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dto.PayDTO;
import com.army.choo.service.AlgorismService;

@Controller
public class AlgorismController {

	@Autowired
	public AlgorismService asvc;
	
	public ModelAndView mav;
	
	@RequestMapping(value="algorismGo")
	public ModelAndView algorism(@ModelAttribute List<PayDTO> plist) {
		mav=asvc.selectUser(plist);
		return mav;
	}
}
