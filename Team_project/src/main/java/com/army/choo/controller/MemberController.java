package com.army.choo.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.api.KakaoJoinApi;
import com.army.choo.api.KakaoLoginApi;
import com.army.choo.api.NaverJoinApi;
import com.army.choo.api.NaverLoginApi;
import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.service.MemberService;
import com.army.choo.service.UserMailSendService;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	
	
	@Autowired
	private UserMailSendService mailsender;
	
	@Autowired
	private NaverJoinApi naverJoinApi;
		
	@Autowired
	private NaverLoginApi naverLoginApi;
		
	@Autowired
	private KakaoJoinApi kakaoJoinApi;
		
	@Autowired
	private KakaoLoginApi kakaoLoginApi;


	//선택 회원가입 창으로 가기
	@RequestMapping(value="/memberinsertpick")
	public String memberInsertPick() {
		return "MemberInsertPick";
	}
	
	//기업 회원가입창으로
	@RequestMapping(value="/commemberinsertgo")
	public String comMemberJoin() {
		return "memberv/ComMemberJoin";
	}
	
	//기업 회원가입
	@RequestMapping(value="/commemberinsertform")
	public ModelAndView comMemberInsertForm(ComMemberDTO mDTO) {
		mav = ms.comMemberInsertForm(mDTO);
		return mav;
	}
	
	//로그인 선택 창으로 가기
	@RequestMapping(value="/loginpick")
	public String loginPick() {
		return "LoginPick";
	}
	
	//지점 리스트
	@RequestMapping(value="/commemberlistpaging")
	public ModelAndView commemberList(@RequestParam(value="page",
			required=false,defaultValue="1") int page, @RequestParam(value="mid") String mid) {
		System.out.println(mid);
		mav = ms.commemberList(page, mid);
		return mav;
	}
	
	//기업로그인 페이지 이동
	@RequestMapping(value="/commemberlogin")
	public String comMemberLogin() {
		return "memberv/ComLogin";
	}
	
	//기업로그인
	@RequestMapping(value="/comlogin")
	public ModelAndView comLoignForm(ComMemberDTO mDTO) {
		mav = ms.comLoignForm(mDTO);
	return mav;
	}
	// 기업회원 마이페이지
		@RequestMapping(value = "/commypage")
		public ModelAndView comMypage(@RequestParam("comnumber") String comnumber) {
			mav = ms.comMyPage(comnumber);
			return mav;
		}

		// 기업회원정보 수정 페이지 이동
		@RequestMapping(value = "/commemberupdate")
		public ModelAndView comMemberUpdate(@RequestParam("comnumber") String comnumber) {
			mav = ms.comMemberUpdate(comnumber);
			return mav;
		}

		// 기업회원정보 수정
		@RequestMapping(value = "/commemberupdateform")
		public ModelAndView comMemeberUpdateForm(ComMemberDTO mDTO) {
			mav = ms.comMemberUpdateForm(mDTO);
			return mav;
		}
	
	//기업 회원 로그아웃
	@RequestMapping(value="/comlogout")
	public String logOut() {
		session.invalidate();
		return "start";
	}
	
	
	//일반회원 회원가입 창으로
	@RequestMapping(value = "/memberinsertgo")
	public String memberinsertgo() {
		return "memberv/UserMemberJoin";
	}
	
	//일반회원 회원가입
	@RequestMapping(value = "/memberinsert")
	public String memberinsert(MemberDTO member, Model model, HttpServletRequest request){
		System.out.println(member.toString());
		ms.memberinset(member);
		mailsender.mailSendWithUserKey(member, request);
		return "redirect:/";
	}
	
	// 아이디 중복확인
	@RequestMapping(value="/idoverlap")
		public @ResponseBody String idOverlap(@RequestParam("mid") String mid) {
			System.out.println("전달받은 값"+mid);
			String resultMsg = ms.idOverlap(mid);
			return resultMsg;
	}
	// 이메일 인증확인
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
		public String emailInjeung(@RequestParam("mid") String mid, @RequestParam("mkey") String mkey) {		
		mailsender.alter_userKey_service(mid,mkey);
		return "memberv/regSuccess";
	}
	// 일반 회원 로그인창으로
	@RequestMapping(value = "/memberlogingo")
	public String memberlogingo(){
		return "memberv/UserMemberLogin";
	}
	//일반회원 회원가입 창으로
	@RequestMapping(value = "/memberinsertgogo")
	public String memberinsertgogo() {
		return "MemberInsertPick2";
	}
	
	// 일반 회원 로그인
	@RequestMapping(value = "/memberlogin")
	public String memberlogin(@ModelAttribute MemberDTO member,HttpServletResponse response) {
		 int result = ms.memberlogin(member);
		 if( result ==1)
		 	{Cookie cookie1 = new Cookie("userinfo",member.getMid());
			 cookie1.setMaxAge(60*10);
			 cookie1.setPath("/");
			 response.addCookie(cookie1);
			 session.setAttribute("loginId",member.getMid());
			 return "start";
		 	}
		 else
		 	{return "Fail";
		 	}
	}
	
	// 일반 회원 로그아웃
	@RequestMapping(value="/memberlogout")
	public String memberLogout(HttpServletResponse response) {
		Cookie cookie1 = new Cookie("userinfo",null);
		cookie1.setMaxAge(0);
		cookie1.setPath("/");
		response.addCookie(cookie1);
		session.invalidate();
		return "start";
	}
	//회원탈퇴 페이지 이동
	@RequestMapping(value="/commemberout")
	public String comMemberOut() {
		return "memberv/ComMemberOut";
	}
	//회원탈퇴
	@RequestMapping(value="/commemberoutform")
	public ModelAndView comMemberOutForm(ComMemberDTO mDTO) {
		mav = ms.comMemberOutForm(mDTO);
		session.invalidate();
		return mav;
	}
	
	// 일반 회원 마이페이지
	@RequestMapping(value = "/mypage")
		public ModelAndView mypage(@RequestParam("mid") String mid) {
		mav = ms.mypage(mid);
		return mav;
	}
	    
	// 일반 회원 정보 수정창으로
	@RequestMapping(value = "/memberupdate")
		public ModelAndView memberUpdate(@ModelAttribute MemberDTO member) {
		mav = ms.memberUpdate(member);
		return mav;
	}
	
	// 일반 회원 정보 수정처리
	@RequestMapping(value = "/memberupdateprocess")
		public ModelAndView memberUpdateProcess(@ModelAttribute MemberDTO member){
		mav = ms.memberUpdateProcess(member);
		return mav;
	}
	
	// 일반 회원 탈퇴
	@RequestMapping(value = "/memberout")
		public ModelAndView memberOut(@RequestParam("mid") String mid) {
		mav = ms.memberOut(mid);
		return mav;
	}
	
	//------------------------------
	
	// 카카오 서버 로그인 
		@RequestMapping(value="/kakaojoin")
		public ModelAndView kakaoJoin(HttpSession session) {
			String kakaoUrl = kakaoJoinApi.getAuthorizationUrl(session);
			mav = new ModelAndView();
			mav.addObject("kakaoUrl", kakaoUrl);
			mav.setViewName("KakaoLogin");
			return mav;
		}
		
		// 카카오 서버 인증 통과 후 처리 
		@RequestMapping(value="/kakaojoinok")
		public ModelAndView kakaoJoinOK(@RequestParam("code") String code,
				HttpSession session) {
			JsonNode token = kakaoJoinApi.getAccessToken(code);
			JsonNode profile = kakaoJoinApi.getKakaoUserInfo(token.path("access_token"));
			System.out.println("profile "+profile);
			// profile에 담긴 id 값을 가지고 MemberJoin.jsp로 이동 
			String kakaoId = profile.get("id").asText();
			mav = new ModelAndView();
			mav.addObject("kakaoId", kakaoId);
			mav.setViewName("memberv/UserMemberJoin");
			return mav;
		}
		
		// 카카오로그인
		@RequestMapping(value="/kakaologin")
		public ModelAndView kakaoLogin(HttpSession session) {
			String kakaoUrl = kakaoLoginApi.getAuthorizationUrl(session);
			mav = new ModelAndView();
			mav.addObject("kakaoUrl", kakaoUrl);
			mav.setViewName("KakaoLogin");
			return mav;
		}
		
		//카카오로그인
		@RequestMapping(value="/kakaologinok")
		public ModelAndView kakaoLoginOK(@RequestParam("code") String code) {
			JsonNode token = kakaoLoginApi.getAccessToken(code);
			JsonNode profile = kakaoLoginApi.getKakaoUserInfo(token.path("access_token"));
			
			mav = ms.kakaoLogin(profile); 
			return mav;
		}

		//네이버
		@RequestMapping(value="/naverjoin")
		public ModelAndView naverJoin(HttpSession session) {
			String naverUrl = naverJoinApi.getAuthorizationUrl(session);
			mav = new ModelAndView();
			mav.addObject("naverUrl", naverUrl);
			mav.setViewName("NaverLogin");
			return mav;
		}
		
		@RequestMapping(value="/naverjoinok")
		public ModelAndView naverJoinOK(@RequestParam("code") String code,
				@RequestParam("state") String state, HttpSession session) throws IOException, ParseException, org.json.simple.parser.ParseException {
			mav = new ModelAndView();
			OAuth2AccessToken oauthToken = naverJoinApi.getAccessToken(session, code, state);
			String profile = naverJoinApi.getUserProfile(oauthToken);
			JSONParser parser = new JSONParser();
			
			Object obj = parser.parse(profile);
			
			JSONObject naverUser = (JSONObject)obj;
			JSONObject userInfo = (JSONObject)naverUser.get("response");
			String naverId = (String) userInfo.get("id");
			
			mav.addObject("naverId", naverId);
			mav.setViewName("memberv/UserMemberJoin");
			
			return mav;
		}
		
		@RequestMapping(value="/naverlogin")
		public ModelAndView naverLogin(HttpSession session) {
			String naverUrl = naverLoginApi.getAuthorizationUrl(session);
			mav = new ModelAndView();
			mav.addObject("naverUrl", naverUrl);
			mav.setViewName("NaverLogin");
			return mav;
		}
		
		@RequestMapping(value="/naverloginok")
		public ModelAndView naverLoginOK(@RequestParam("code") String code,
				@RequestParam("state") String state, HttpSession session) throws IOException, ParseException, org.json.simple.parser.ParseException {
			OAuth2AccessToken oauthToken = naverLoginApi.getAccessToken(session, code, state);
			String profile = naverJoinApi.getUserProfile(oauthToken);
			mav = ms.naverLogin(profile);
			return mav;
			
		}
		
		@RequestMapping(value = "/paylistgo")
	    public ModelAndView payList(@RequestParam("payid") String payid, @RequestParam(value="page",
				required=false, defaultValue="1") int page) {
	        mav = ms.payList(payid, page);
	        return mav;
	    }
		
		
		//알람
		@RequestMapping(value = "/alarmCount")
		public @ResponseBody int alarmCount() {
			String amid = (String) session.getAttribute("loginId");
			System.out.println("전달받은 값"+amid);
			int alarmCount = ms.alarmCount(amid);
			return alarmCount;
		}
		@RequestMapping(value = "/alarmgo")
		public String alarmGo() {
			return "alarm";
		}
		@RequestMapping(value = "/alarmlist")
		public ModelAndView alarmList() {
			String amid = (String) session.getAttribute("loginId");
			mav = ms.alarmList(amid);
			return mav;
		}
		@RequestMapping(value = "/commemberpaylist")
		public ModelAndView commemberpayList(@RequestParam(value="page",
				required=false, defaultValue="1") int page) {
			String comnumber = (String) session.getAttribute("loginId");
			mav = ms.commemberpayList(comnumber, page);
			return mav;
		}
		
		//		
}
