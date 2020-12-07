package com.army.choo.service;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.GgymDAO;
import com.army.choo.dao.MemberDAO;
import com.army.choo.dto.AlarmDTO;
import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.GgymDTO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.dto.PageDTO;
import com.army.choo.dto.PayDTO;
import com.army.choo.dto.ProductDTO;
import com.fasterxml.jackson.databind.JsonNode;


@Service
public class MemberService {
	
	@Autowired
	private GgymDAO gdao;
	
	
	@Autowired
	private MemberDAO mDAO;
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	//기업회원가입
	public ModelAndView comMemberInsertForm(ComMemberDTO mDTO) {
		mav = new ModelAndView();
		int result = mDAO.comMemberInsertForm(mDTO);
		if(result > 0) {
			mav.setViewName("Main");
		} else {
			mav.setViewName("Fail");
		}
		return mav;
	}
	
	private static final int PAGE_LIMIT = 5;  
	private static final int BLOCK_LIMIT = 5;
	//찜 리스트
	public ModelAndView commemberList(int page, String mid) {
		mav = new ModelAndView();
		int listcount = mDAO.listcounts(mid);
		int startrow =(page-1)*PAGE_LIMIT+1;	
		int endrow = page*PAGE_LIMIT;		
		PageDTO pdto = new PageDTO();
		pdto.setStartrow(startrow);
		pdto.setEndrow(endrow);
		pdto.setMid(mid);
		System.out.println(pdto.getMid());
		List<GgymDTO> bplist = mDAO.commemberListpaging(pdto);
		for(int i=0; i<bplist.size(); i++) {
			GgymDTO gDTO = bplist.get(i);
			String comnumber = gDTO.getGgymoffice();
			ComMemberDTO cDTO = mDAO.comMemberDate(comnumber);
			gDTO.setComoffice(cDTO.getComoffice());
			gDTO.setGgymcompany(cDTO.getCompany());
			gDTO.setGgymcomphone(cDTO.getComphone());
			System.out.println(comnumber);
			int result = gdao.ggymCheckSelect(mid,comnumber);
			if(result>0) {
				gDTO.setStar("★");
			} else {
				gDTO.setStar("☆");
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
		mav.addObject("commemberlist" , bplist);
		mav.setViewName("ggym/GgymList");
		return mav;
	}
	
	//기업로그인
	public ModelAndView comLoignForm(ComMemberDTO mDTO) {
		mav = new ModelAndView();
		String loginId = mDAO.comLoginForm(mDTO);
		if(loginId != null) {
			session.setAttribute("loginId", loginId);
			mav.setViewName("memberv/ComStats");
		} else {
			mav.setViewName("Fail");
		}
		return mav;
	}

	//일반회원 회원가입
	public ModelAndView memberinset(MemberDTO member) {
		int joinResult = mDAO.memberinsert(member);
		mav = new ModelAndView();
		System.out.println(member.getMxaddress());
		System.out.println(member.getMyaddress());
		if(joinResult > 0) {
			mav.setViewName("memberv/UserMemberLogin");
		}
		return mav;
	}
	//아이디 중복체크
	public String idOverlap(String mid) {
		String checkResult = mDAO.idOverlap(mid);
		String resultMsg = null;
		if(checkResult == null) {
			resultMsg = "OK";
		}else {
			resultMsg ="NO";
		}
		return resultMsg;
	}

	//일반회원 로그인
	public int memberlogin(MemberDTO member) {
		int SETAUTHSTATUS = mDAO.memberlogin(member);
		int result =0;
		if(SETAUTHSTATUS == 1) {
			result=1;
		} else {
			result=0;
		}
		return result;
	}
	
	//기업회원정보수정 기본정보불러오기(페이지이동)
	public ModelAndView comMemberUpdate(String comnumber) {
		mav = new ModelAndView();
		ComMemberDTO mDTO = mDAO.comMemberUpdate(comnumber);
		mav.addObject("comupdate", mDTO);
		mav.setViewName("memberv/ComMemberUpdate");
		return mav;
	}
		
	//기업회원정보수정
	public ModelAndView comMemberUpdateForm(ComMemberDTO mDTO) {
		mav = new ModelAndView();
		int result = mDAO.comMemberUpdateForm(mDTO);
		if(result > 0) {
			mav.setViewName("memberv/ComMain");
		} else {
			mav.setViewName("Fail");
		}
		return mav;
	}
		
	//기업회원탈퇴
	public ModelAndView comMemberOutForm(ComMemberDTO mDTO) {
		mav = new ModelAndView();
		int result = mDAO.comMemberOutForm(mDTO);
		if(result>0) {
			mav.setViewName("memberv/ComMain");
		} else {
			mav.setViewName("Fail");
		}
		return mav;
	}
		
	//기업 마이페이지
	public ModelAndView comMyPage(String comnumber) {
		mav = new ModelAndView();
		ComMemberDTO mDTO = mDAO.comMyPage(comnumber);
		mav.addObject("commypage", mDTO);
		mav.setViewName("memberv/ComMyPage");
		return mav;
	}
    // 일반회원 마이페이지
	public ModelAndView mypage(String mid) {
		mav = new ModelAndView();
		MemberDTO mypage = mDAO.mypage(mid);
		mav.addObject("mypage",mypage);
		mav.setViewName("memberv/UserMemberMypage");
		return mav;
	}

   // 일반회원 수정창
	public ModelAndView memberUpdate(MemberDTO member) {
		mav = new ModelAndView();
		MemberDTO memberUpdate = mDAO.memberUpdate(member);
		mav.addObject("memberUpdate",memberUpdate);
		mav.setViewName("memberv/UserMemberUpdate");
		return mav;
	}

   // 일반회원 수정처리
	public ModelAndView memberUpdateProcess(MemberDTO member) {
		mav = new ModelAndView();
		int memberUpdateProcess = mDAO.memberUpdateProcess(member);
		String mid = member.getMid();
		if(memberUpdateProcess > 0) {
			mav.setViewName("redirect:/mypage?mid="+mid);
		}
		return mav;
	}

   //일반회원 탈퇴
	public ModelAndView memberOut(String mid) {
		mav = new ModelAndView();
		int memberOut = mDAO.memberOut(mid);
		if(memberOut > 0) {
			session.invalidate();
			mav.setViewName("home");
		}
		return mav;
	}
	
	//카카오에서 멤버 셀렉트
		public MemberDTO memberdetailService(String partner_user_id) {
			MemberDTO mDTO = mDAO.memberdetailService(partner_user_id);
			return mDTO;
		}

		public String productService(int pnumber) {
			String office = mDAO.productService(pnumber);
			return office;
		}
		
		public ModelAndView naverLogin(String profile) throws ParseException {
			mav = new ModelAndView();
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(profile);
			JSONObject naverUser = (JSONObject)obj;
			JSONObject userInfo = (JSONObject)naverUser.get("response");
			String naverId = (String)userInfo.get("id");
			String loginId = mDAO.naverLogin(naverId);
			session.setAttribute("loginId", loginId);
			mav.setViewName("memberv/UserMemberLogin");
			return mav;
		}

		public ModelAndView kakaoLogin(JsonNode profile) {
			mav = new ModelAndView();
			String kakaoId = profile.get("id").asText();
			String loginId = mDAO.kakaoLogin(kakaoId);
			
			session.setAttribute("loginId", loginId);
			mav.setViewName("memberv/UserMemberLogin");
			
			return mav;
		}	
		
		
		//구매목록
	      public ModelAndView payList(String payid, int page) {
	         mav = new ModelAndView();
	         int count = mDAO.paycount(payid);
	         int startrow =(page-1)*PAGE_LIMIT+1;	
			 int endrow = page*PAGE_LIMIT;	
			 PageDTO pdto = new PageDTO();
			 pdto.setStartrow(startrow);
			 pdto.setEndrow(endrow);
			 pdto.setMid(payid);
	         List<PayDTO> payList = mDAO.payList(pdto); 
	         int startpage =(((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;  //1 6  11 16
			 int maxpage =(int)(Math.ceil((double)count/PAGE_LIMIT));					//5 10 15 20
			 int endpage = startpage + BLOCK_LIMIT -1;
			 if(endpage>maxpage) 
			 	{endpage=maxpage;
				}
			 pdto.setPage(page);
			 pdto.setStartpage(startpage);
			 pdto.setEndpage(endpage);
			 pdto.setMaxpage(maxpage);
			 mav.addObject("paging" , pdto);
	         mav.addObject("payList", payList);
	         mav.setViewName("productv/PayList");
	         return mav;
	      }
	      
	      public int alarmCount(String amid) {
				int alarmCount = mDAO.alarmCount(amid);
				
				return alarmCount;
			}

	      public ModelAndView alarmList(String amid, int page) {
				mav = new ModelAndView();
				int listCount = mDAO.alarmlistCount(amid);
				int startRow = (page-1)*PAGE_LIMIT+1; // 1 4 7 10 13 ......
				int endRow = page*PAGE_LIMIT; // 3 6 9 12 ....
				PageDTO paging = new PageDTO();
				paging.setStartrow(startRow);
				paging.setEndrow(endRow);
				paging.setAmid(amid);
				List<AlarmDTO> alarmList = mDAO.alarmList(paging);
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
				mDAO.alarmConfirm();
				mav.addObject("paging", paging);
				mav.addObject("alarmList",alarmList);
				mav.setViewName("alarmList");
				return mav;
			}

			public ModelAndView commemberpayList(String comnumber, int page) {
				mav = new ModelAndView();
				int listcount = mDAO.listcount(comnumber);
				int startrow =(page-1)*PAGE_LIMIT+1;	
				int endrow = page*PAGE_LIMIT;	
				PageDTO pdto = new PageDTO();
				pdto.setStartrow(startrow);
				pdto.setEndrow(endrow);
				pdto.setCompany(comnumber);
				List<PayDTO> commemberpayList =  mDAO.commemberpayList(pdto);
				int startpage =(((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;  //1 6  11 16
				int maxpage =(int)(Math.ceil((double)listcount/PAGE_LIMIT));					//5 10 15 20
				int endpage = startpage + BLOCK_LIMIT -1;
				if(endpage>maxpage) {
					endpage=maxpage;
				}
				pdto.setPage(page);
				pdto.setStartpage(startpage);
				pdto.setEndpage(endpage);
				pdto.setMaxpage(maxpage);
				mav.addObject("paging" , pdto);
				mav.addObject("commemberpayList",commemberpayList);
				mav.setViewName("productv/ComMemberPayList");
				return mav;
			}

}
