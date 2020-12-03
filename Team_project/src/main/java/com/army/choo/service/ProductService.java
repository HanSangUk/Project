package com.army.choo.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.GgymDAO;
import com.army.choo.dao.MemberDAO;
import com.army.choo.dao.PayDAO;
import com.army.choo.dao.ProductDAO;
import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.PageDTO;
import com.army.choo.dto.PayDTO;
import com.army.choo.dto.ProductDTO;
import com.army.choo.dto.ReviewDTO;

@Service
public class ProductService {
	private ModelAndView mav;
	
	@Autowired
	private GgymDAO gdao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private PayDAO payDAO;
	/*
	 * public ModelAndView login(MemberDTO member) { mav = new ModelAndView();
	 * String loginId = productDAO.login(member); List<ProductDTO> productlist = new
	 * ArrayList<ProductDTO>(); productlist = productDAO.productSelect(); if(loginId
	 * != null) { session.setAttribute("loginId", loginId);
	 * mav.addObject("productlist", productlist);
	 * mav.setViewName("productv/OfficeManagement"); }else {
	 * mav.setViewName("loginFail"); } return mav; }
	 */
	private static final int PAGE_LIMIT =5;  
	private static final int BLOCK_LIMIT = 5; 
	
	//기업로그인 후 상품리스트
		public ModelAndView comMainGo(int page) {
			mav = new ModelAndView();
			String loginId = (String)session.getAttribute("loginId");
			int listcount = productDAO.listcount(loginId);
			int startrow =(page-1)*PAGE_LIMIT+1;	
			int endrow = page*PAGE_LIMIT;		
			PageDTO pdto = new PageDTO();
			pdto.setStartrow(startrow);
			pdto.setEndrow(endrow);
			List<ProductDTO> productlist = new ArrayList<ProductDTO>();
			productlist = productDAO.productSelect(loginId);
			int startpage =(((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;  //1 6  11 16
			int maxpage =(int)(Math.ceil((double)listcount/PAGE_LIMIT));					//5 10 15 20
			int endpage = startpage + BLOCK_LIMIT -1;
			if(endpage>maxpage) 
				{endpage=maxpage;
				}
			pdto.setPage(page);
			pdto.setStartpage(startpage);
			pdto.setEndpage(endpage);
			pdto.setMaxpage(maxpage);
			/*
			 * List<Integer> monthlist = new ArrayList<Integer>(); monthlist =
			 * payDAO.month(loginId);
			 */
			ComMemberDTO comDTO = new ComMemberDTO();
	        comDTO = memberDAO.comoffice(loginId);
			int total1 = payDAO.month1(loginId);
			int total2 = payDAO.month2(loginId);
			int total3 = payDAO.month3(loginId);
			int total4 = payDAO.month4(loginId);
			int total5 = payDAO.month5(loginId);
			int total6 = payDAO.month6(loginId);
			int total7 = payDAO.month7(loginId);
			int total8 = payDAO.month8(loginId);
			int total9 = payDAO.month9(loginId);
			int total10 = payDAO.month10(loginId);
			int total11 = payDAO.month11(loginId);
			int total12 = payDAO.month12(loginId);
			int categorynum1 = payDAO.num1(loginId);
			int categorynum2 = payDAO.num2(loginId);
			int categorynum3 = payDAO.num3(loginId);
			int categorynum4 = payDAO.num4(loginId);
			int categorynum5 = payDAO.num5(loginId);
			if(productlist != null) {
				mav.addObject("Snack", categorynum1);
				mav.addObject("Drink", categorynum2);
				mav.addObject("Icecream", categorynum3);
				mav.addObject("Noodle", categorynum4);
				mav.addObject("Food", categorynum5);
				mav.addObject("total1", total1);
				mav.addObject("total2", total2);
				mav.addObject("total3", total3);
				mav.addObject("total4", total4);
				mav.addObject("total5", total5);
				mav.addObject("total6", total6);
				mav.addObject("total7", total7);
				mav.addObject("total8", total8);
				mav.addObject("total9", total9);
				mav.addObject("total10", total10);
				mav.addObject("total11", total11);
				mav.addObject("total12", total12);
				mav.addObject("paging" , pdto);
				mav.addObject("cDTO",comDTO);
				mav.addObject("productlist", productlist);
				mav.setViewName("memberv/ComMain");
			}else {
				mav.setViewName("");
			}
			return mav;
		}
	
	public ModelAndView productInsert(ProductDTO product) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		String loginId = (String)session.getAttribute("loginId");
		product.setPcnumber(loginId);
		
		MultipartFile pfile = product.getPfile();
		String pimage = pfile.getOriginalFilename();
		pimage = System.currentTimeMillis() +  "_" + pimage;
		String savePath = "D:\\source\\spring\\Team_project\\src\\main\\webapp\\resources\\uploadfile\\" + pimage;
		
		if(!pfile.isEmpty()) { 
			pfile.transferTo(new File(savePath));
		}
		product.setPimage(pimage);
		int result = productDAO.productInsert(product);
		List<ProductDTO> productlist = new ArrayList<ProductDTO>();
		productlist = productDAO.productSelect(loginId);
		if(result > 0) {
			mav.addObject("productlist", productlist);
			mav.setViewName("memberv/ComStats");
			}
		else {
			mav.setViewName("productv/ProductInsertFail");
		}
		return mav;
	}

	public ModelAndView productUpdate(int pnumber) {
		mav = new ModelAndView();
		ProductDTO productlist =  productDAO.productUpdate(pnumber);
		if(productlist != null) {
			mav.addObject("list", productlist);
			mav.setViewName("productv/ProductUpdate");
		}else {
			mav.setViewName("productv/ProductUpdateFail");
		}
		return mav;
	}

	public ModelAndView productUpdateProcess(ProductDTO product) throws IllegalStateException, IOException {
	      mav = new ModelAndView();
	      MultipartFile pfile = product.getPfile();
	      String pimage = pfile.getOriginalFilename();
	      String preexistence = product.getPreexistence();
	         if(pimage.length()==0) {
	            product.setPimage(preexistence);
	         } else {
	            pimage = System.currentTimeMillis() + "_" + pimage;
	            String savePath = "D:\\source\\spring\\Team_project\\src\\main\\webapp\\resources\\uploadfile\\"+pimage;
	            if(!pfile.isEmpty()) {
	               pfile.transferTo(new File(savePath));
	            }
	            product.setPimage(pimage);
	         }
	   
	      int updateProcessResult = productDAO.productUpdateProcess(product);
	      if(updateProcessResult > 0) {
	         mav.setViewName("memberv/ComStats");
	      }else { 
	         mav.setViewName("productv/productUpdateProcessFail");
	      }
	      return mav;
	   }

	public ModelAndView productDelete(int pnumber) {
		mav = new ModelAndView();
		int result = productDAO.productDelete(pnumber);
		if(result > 0) {
			mav.setViewName("memberv/ComStats");
		}else {
			mav.setViewName("");
		}
			
		return mav;
	}
	
	
	//지점리스트
	public ModelAndView officeList(String company, int page) {
		mav = new ModelAndView();
		int listcount = memberDAO.listcount();
		int startrow =(page-1)*PAGE_LIMIT+1;	
		int endrow = page*PAGE_LIMIT;	
		PageDTO pdto = new PageDTO();
		pdto.setStartrow(startrow);
		pdto.setEndrow(endrow);
		pdto.setCompany(company);
		List<ComMemberDTO> officelist = new ArrayList<ComMemberDTO>(); 
		officelist = memberDAO.officeLists(pdto);
		for(int i=0; i<officelist.size(); i++) {
			ComMemberDTO cDTO = officelist.get(i);
			String comnumber = cDTO.getComnumber();
			String mid = (String) session.getAttribute("loginId");
			int result = gdao.ggymCheckSelect(mid,comnumber);
			if(result>0) {
				cDTO.setStar("★");
			} else {
				cDTO.setStar("☆");
			}
		}
		int startpage =(((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;  //1 6  11 16
		int maxpage =(int)(Math.ceil((double)listcount/PAGE_LIMIT));					//5 10 15 20
		int endpage = startpage + BLOCK_LIMIT -1;
		if(endpage>maxpage) 
			{endpage=maxpage;
			}
		pdto.setPage(page);
		pdto.setStartpage(startpage);
		pdto.setEndpage(endpage);
		pdto.setMaxpage(maxpage);
		mav.addObject("paging" , pdto);
		mav.addObject("officelist", officelist);
		mav.setViewName("OfficeList");
		return mav;
	}

	public ModelAndView productList(String comnumber, String pcategory) {
		mav = new ModelAndView();
		List<ProductDTO> productlist = new ArrayList<ProductDTO>();
		ProductDTO product = new ProductDTO();
		product.setPcnumber(comnumber);
		product.setPcategory(pcategory);
		if(pcategory.equals("1")) {
			productlist = productDAO.productList(comnumber);
		}else{
			productlist = productDAO.productList2(product);
		}
		if(productlist != null) {
			mav.addObject("productlist", productlist);
			mav.addObject("pcategory",pcategory);
			mav.setViewName("productv/UserProductList");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}

	public ModelAndView productView(int pnumber, int page, String pcategory) {
		mav = new ModelAndView();
		
		int listCount = productDAO.reviewlistCount(pnumber);
		int startRow = (page-1)*PAGE_LIMIT+1; // 1 4 7 10 13 ......
		int endRow = page*PAGE_LIMIT; // 3 6 9 12 ....
		ProductDTO pDTO = new ProductDTO();
		PageDTO paging = new PageDTO();
		paging.setStartrow(startRow);
		paging.setEndrow(endRow);
		paging.setPnumber(pnumber);
		pDTO = productDAO.productView(pnumber);
		List<ReviewDTO> reviewList =  productDAO.reviewList(paging);
		//필요한 페이지 계산
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT))) -1) * BLOCK_LIMIT +1;
		                     // Math.ceil = 그냥 반올림
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
				
		paging.setPage(page);
		paging.setStartpage(startPage);
		paging.setEndpage(endPage);
		paging.setMaxpage(maxPage);
		if(pDTO != null) {
			mav.addObject("pDTO", pDTO);
			mav.addObject("paging", paging);
			mav.addObject("pcategory",pcategory);
			mav.addObject("reviewList",reviewList);
			mav.setViewName("productv/ProductView");
		}else {
			mav.setViewName("Fail");
		}
		return mav;
	}

	
	
	   //리뷰 작성
	   public ModelAndView productReview(ReviewDTO review) {
		  mav= new ModelAndView();
		  int pnumber = review.getPnumber();
	      int reviewResult = productDAO.productReview(review);
	      if(reviewResult > 0) {
	    	 productDAO.reviewAgree(review);
	         mav.setViewName("redirect:/productview?pnumber="+pnumber);
	      }
	      return mav;
	   }
	   //배송완료
	   public ModelAndView productAgree(int paynumber) {
	      String loginId = (String)session.getAttribute("loginId");
	      System.out.println(loginId);
	      mav= new ModelAndView();
	      productDAO.productAgree(paynumber);
	      mav.addObject("payid",loginId);
	      mav.setViewName("redirect:/paylistgo");
	      return mav;
	   }
	   
	   public ModelAndView cproductAgree(PayDTO paydto) {
			  mav= new ModelAndView();
			  productDAO.cproductAgree(paydto);
			  if(paydto.getPayagree().equals("배송준비중")) {
				  productDAO.alarm2(paydto);
			  }else {
				  productDAO.alarm3(paydto);
			  }
			  mav.setViewName("redirect:/commemberpaylist");
			  return mav;
		   }

}
