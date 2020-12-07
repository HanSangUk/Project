package com.army.choo.controller;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dto.AlarmDTO;
import com.army.choo.dto.PayDTO;
import com.army.choo.service.MainService;
import com.google.gson.Gson;


@Controller
public class MainController {

	
	private ModelAndView mav;
	
	@Autowired
	private MainService main;
	
	
	@RequestMapping(value="/commain", method=RequestMethod.GET)
	public String index() {
		return "memberv/ComMain";
	}
	
	//스프링 컨트롤러 부분
    @RequestMapping(value = "/jsons", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String json(Locale locale, Model model) {    
        String[] array = {"김치 볶음밥", "신라면", "진라면", "라볶이", "팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"};
            Gson gson = new Gson();
        return gson.toJson(array);//["김치 볶음밥","신라면","진라면","라볶이","팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"]
    }
	
	@RequestMapping(value="/totalsearch")
	public ModelAndView totalSearch(String searchInput, 
			@RequestParam(value="page", required=false, defaultValue="1")int page) {
		mav = main.mainSearch(searchInput, page);
		return mav;
	}
	
	@RequestMapping(value="/officesearch")
	public ModelAndView officeSearch(String searchInput, 
			@RequestParam(value="page", required=false, defaultValue="1")int page) {
		mav = main.officeSearch(searchInput, page);
		return mav;
	}
	
	@RequestMapping(value="/productsearch")
	public ModelAndView productSearch(String searchInput, 
			@RequestParam(value="page", required=false, defaultValue="1")int page) {
		mav = main.productSearch(searchInput, page);
		return mav;
	}
	
	@RequestMapping(value="/officemanagement")
	public ModelAndView officeMangeMent(@RequestParam("pcnumber") String pcnumber) {
		mav = main.officeMangeMent(pcnumber);
		return mav;
	}
	
	/*
	 * @RequestMapping(value="/kakaomap") public String kakaoMap() { return
	 * "kakaomap"; }
	 */
	
	@RequestMapping(value="/kakaomap")
	   public ModelAndView mapDistance(@RequestParam("mx") double mx, @RequestParam("my") double my, @RequestParam("cx") double cx,
			   @RequestParam("cy") double cy, @RequestParam("paynumber") int paynumber) {
	      double distance;
	       double radius = 6371; // 지구 반지름(km)
	       double x1 = cx;
	       double y1 = cy;
	       double x2= mx;
	       double y2= my;
	       double toRadian = Math.PI / 180;

	       double deltaLatitude = Math.abs(x1 - x2) * toRadian;
	       double deltaLongitude = Math.abs(y1 - y2) * toRadian;

	       double sinDeltaLat = Math.sin(deltaLatitude / 2);
	       double sinDeltaLng = Math.sin(deltaLongitude / 2);
	       double squareRoot = Math.sqrt(
	           sinDeltaLat * sinDeltaLat +
	           Math.cos(x1 * toRadian) * Math.cos(x2 * toRadian) * sinDeltaLng * sinDeltaLng);

	       distance = 2 * radius * Math.asin(squareRoot);
	       double hour = distance / 60;
	       int hour1 = (int) Math.floor(hour);
	       distance = distance - 60*hour1;
	       System.out.println(distance);
	       int distance1 = (int) Math.floor(distance);
	      
	       mav = new ModelAndView();
	       
	       PayDTO pDTO = new PayDTO();
	       AlarmDTO aDTO = new AlarmDTO();
	       
	       pDTO.setPaynumber(paynumber);
	       pDTO.setTimes(distance1);
	       pDTO.setHour(hour1);
	       
	       
	       aDTO.setTimes(distance1);
	       aDTO.setHour(hour1);
	       aDTO.setPaynumber(paynumber);
	       
	       main.alarm(aDTO);
	       main.Distance(pDTO);
	       
	       
	       mav.setViewName("redirect:/commemberpaylist");
	       return mav;
	       
	   }
	
	@RequestMapping(value="/htmlkey")
	public String htmlKey() {
		return "html";
	}
}
