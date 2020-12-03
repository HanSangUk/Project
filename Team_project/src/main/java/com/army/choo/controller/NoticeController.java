package com.army.choo.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dto.NoticeDTO;
import com.army.choo.service.NoticeService;

@Controller
public class NoticeController {
	
	public ModelAndView mav;
	
	@Autowired
	public NoticeService nsvc;
	
	//시작
	@RequestMapping(value="/")
	public String start() {
		return "start";
	}
	
	@RequestMapping(value="/home")
	public ModelAndView home() {
		mav = nsvc.selectproduct();
		return mav;
	}
	
	//실시간 채팅 가기
	@RequestMapping(value="/echogo")
	public String echoGo() {
		return "echo";
	}
	
	//공지사항 리스트
	@RequestMapping(value="/noticelist")
	public ModelAndView noticeList(@RequestParam(value="page",
			required=false, defaultValue="1") int page) {
		mav = nsvc.noticeList(page);
		return mav;
	}
	
	//공지사항 작성페이지로 가기
	@RequestMapping(value="/noticewritego")
	public String noticeWritego() {
		return "notice/noticewrite";
	}
	
	//공지사항 작성 처리
	@RequestMapping(value="/noticewrite")
	public ModelAndView noticeWrite(@ModelAttribute NoticeDTO ndto) throws IllegalStateException, IOException {
		mav = nsvc.noticeWrite(ndto);
		return mav;
	}
	
	//공지사항 삭제처리
	@RequestMapping(value="/noticedelete")
	public ModelAndView noticDelete(@RequestParam("nnumber") int nnumber ) {
		mav =nsvc.noticeDelete(nnumber);
		return mav;
	}
	
	//공지사항 상세보기 처리 noticeview
	@RequestMapping(value="/noticeview")
	public ModelAndView noticeView(@RequestParam("nnumber") int nnumber
			,@RequestParam("page") int page) {
		mav =nsvc.noticeView(nnumber,page);
		return mav;
	}
	//공지사항 수정 정보 가져오기
	@RequestMapping(value="/noticeupdate")
	public ModelAndView noticUpdate(@RequestParam("nnumber") int nnumber) {
		mav =nsvc.noticeUpdate(nnumber);
		return mav;
	}
	
	
}