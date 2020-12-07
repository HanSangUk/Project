package com.army.choo.controller;



import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dto.PayDTO;
import com.army.choo.dto.ProductDTO;
import com.army.choo.dto.ReviewDTO;
import com.army.choo.service.ProductService;


@Controller
public class ProductController {
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/productinsertgo")
	public String ProductInsertGo() {
		return "productv/ProductInsert";
	}
	
	//기업로그인후 페이지
	@RequestMapping(value="commaingo")
	public ModelAndView comMainGo(@RequestParam(value="page",
			required=false, defaultValue="1") int page) {
		mav = productService.comMainGo(page);
		return mav;
	}
	
	@RequestMapping(value="/productinsert") 
	public ModelAndView productInsert(@ModelAttribute ProductDTO product) throws IllegalStateException, IOException {
		mav = productService.productInsert(product);
		return mav;
	}
	@RequestMapping(value="productupdate")
	public ModelAndView productUpdate(@RequestParam("pnumber") int pnumber) {
		mav = productService.productUpdate(pnumber);
		return mav;
	}
	@RequestMapping(value="productupdateprocess")
	public ModelAndView productUpdateProcess(@ModelAttribute ProductDTO product) throws IllegalStateException, IOException {
		mav = productService.productUpdateProcess(product);
		return mav;
	}
	@RequestMapping(value="proudctdelete")
	public ModelAndView productDelete(@RequestParam("pnumber") int pnumber) {
		mav = productService.productDelete(pnumber);
		return mav;
	}
	//지점리스트
	@RequestMapping(value="/officelist")
	public ModelAndView officeList(@RequestParam("company") String company, @RequestParam(value="page",
			required=false, defaultValue="1") int page) {
		mav = productService.officeList(company, page);
		return mav;
	}
	//지점에 대한 상품리스트
	@RequestMapping(value="/productlist")
	public ModelAndView productList(@RequestParam("comnumber") String comnumber,@RequestParam("pcategory") String pcategory) {
		mav = productService.productList(comnumber,pcategory);
		return mav;
	}
	//지점 상세보기
	@RequestMapping(value = "/productview")
	public ModelAndView productView(@RequestParam("pnumber") int pnumber, @RequestParam(value="page",
			required=false, defaultValue="1") int page,@RequestParam(value = "pcategory") String pcategory) {
		mav = productService.productView(pnumber, page,pcategory);
		return mav;
	}
	
	//리뷰 작성
    @RequestMapping(value = "/productreview")
    public ModelAndView productReview(ReviewDTO review) {
       mav = productService.productReview(review);
       return mav;
    }   
    
    //배송완료
    @RequestMapping(value = "/productagree")
    public ModelAndView productAgree(@RequestParam("paynumber") int paynumber) {
       mav = productService.productAgree(paynumber);
       return mav;
    }
    
    @RequestMapping(value = "/cproductagree")
    public ModelAndView productAgree(@RequestParam("payagree") String payagree,@RequestParam("paynumber") int paynumber,@RequestParam("payname") String payname,@RequestParam("payoffice") String payoffice,@RequestParam("payid") String payid) {
       PayDTO paydto = new PayDTO();
       if(payagree.equals("상품준비중")) {
    	   payagree = "배송준비중";
       }else {
    	   payagree = "배송중";
       }
       paydto.setPayid(payid);
       paydto.setPayname(payname);
       paydto.setPayoffice(payoffice);
       paydto.setPayagree(payagree);
       paydto.setPaynumber(paynumber);
       System.out.println("@@@@@@"+paydto.toString());
       System.out.println("ang");
       mav = productService.cproductAgree(paydto);
       return mav;
    }
    
}
