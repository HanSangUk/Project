package com.army.choo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.MemberDAO;
import com.army.choo.dao.ProductDAO;
import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.PageDTO;
import com.army.choo.dto.ProductDTO;


@Service
public class MainService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private ProductDAO pDAO;
	
	private ModelAndView mav;
	
	private static final int PAGE_LIMIT = 5;   // 한페이지에 보이는 글 갯수
	private static final int BLOCK_LIMIT = 5;   // 목록에 보이는 수
	

	public ModelAndView mainSearch(String searchInput, int page) {
		mav = new ModelAndView();
		// 지점 -------
		int listCount = mDAO.listCount(searchInput);
		int startRow = (page-1)*PAGE_LIMIT+1; // 1 4 7 10 13 ......
		int endRow = page*PAGE_LIMIT; // 3 6 9 12 ....
		
		PageDTO paging = new PageDTO();
		paging.setStartrow(startRow);
		paging.setEndrow(endRow);
		paging.setSearch(searchInput);
		List<ComMemberDTO> officelist = mDAO.officeListPaging(paging);
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
		
		// 물품 -------------------------------------------------------
		
		int listCount1 = pDAO.listCount(searchInput);
		int startRow1 = (page-1)*PAGE_LIMIT+1; // 1 4 7 10 13 ......
		int endRow1 = page*PAGE_LIMIT; // 3 6 9 12 ....
		
		paging.setStartrow1(startRow1);
		paging.setEndrow1(endRow1);
		paging.setSearch(searchInput);
		List<ProductDTO> productlist = pDAO.productListPaging(paging);
		//필요한 페이지 계산
		int maxPage1 = (int)(Math.ceil((double)listCount1/PAGE_LIMIT));
		int startPage1 = (((int)(Math.ceil((double)page/BLOCK_LIMIT))) -1) * BLOCK_LIMIT +1;
		                     // Math.ceil = 그냥 반올림
		int endPage1 = startPage1 + BLOCK_LIMIT - 1;
		if(endPage1 > maxPage1) {
			endPage1 = maxPage1;
		}
		
		paging.setPage(page);
		paging.setStartpage1(startPage1);
		paging.setEndpage1(endPage1);
		paging.setMaxpage1(maxPage1);
		
		
		mav.addObject("productlist", productlist);
		mav.addObject("paging", paging);
		mav.addObject("officelist", officelist);
		mav.setViewName("SearchListPaging");
		
		return mav;
	}
	
	
	//검색후 더보기(지점)
	public ModelAndView officeSearch(String searchInput, int page) {
		mav = new ModelAndView();
		
		int listCount = mDAO.listCount(searchInput);
		int startRow = (page-1)*PAGE_LIMIT+1; // 1 4 7 10 13 ......
		int endRow = page*PAGE_LIMIT; // 3 6 9 12 ....
		
		PageDTO paging = new PageDTO();
		paging.setStartrow(startRow);
		paging.setEndrow(endRow);
		paging.setSearch(searchInput);
		List<ComMemberDTO> officelist = mDAO.officeListPaging(paging);
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
		
		mav.addObject("officelist", officelist);
		mav.addObject("paging", paging);
		mav.setViewName("SearchOfficeListPaging");
		
		return mav;
	}

	
	//검색 후 더보기(물품)	
	public ModelAndView productSearch(String searchInput, int page) {
		mav = new ModelAndView();
		
		int listCount = pDAO.listCount(searchInput);
		int startRow = (page-1)*PAGE_LIMIT+1; // 1 4 7 10 13 ......
		int endRow = page*PAGE_LIMIT; // 3 6 9 12 ....
		
		PageDTO paging = new PageDTO();
		paging.setStartrow(startRow);
		paging.setEndrow(endRow);
		paging.setSearch(searchInput);
		List<ProductDTO> productlist = pDAO.productListPaging(paging);
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
		
		mav.addObject("productlist", productlist);
		mav.addObject("paging", paging);
		mav.setViewName("SearchProductListPaging");
		
		return mav;
	}


	public ModelAndView officeMangeMent(String pcnumber) {
		mav = new ModelAndView();
		List<ProductDTO> pDTO = pDAO.officeMangeMent(pcnumber);
		mav.addObject("productlist", pDTO);
		mav.setViewName("productv/OfficeManagement");
		return mav;
	}
	
	
}
