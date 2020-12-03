package com.army.choo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.service.GgymService;

@Controller
public class GgymController {

	public ModelAndView mav;
	
	@Autowired
	public GgymService gsvc;
	
	// 찜 등록/삭제(ajax)
	@RequestMapping(value="/ggymcheck")
	public @ResponseBody String ggymCheck
		(@RequestParam("mid") String mid,
					@RequestParam("comnumber") String comnumber) {
		System.out.println("controller시작");
		String checkresult = gsvc.ggymCheck(mid,comnumber);
		System.out.println("if서비스끝");
		System.out.println(checkresult);
		return checkresult;
	}
	
	
}
