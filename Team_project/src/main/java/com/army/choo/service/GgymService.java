package com.army.choo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.choo.dao.GgymDAO;

@Service
public class GgymService {
	
	@Autowired
	public GgymDAO gdao;

	// 찜 등록/삭제(ajax)
	public String ggymCheck(String mid,String comnumber) {
		System.out.println("service시작");
		int result = gdao.ggymCheckSelect(mid,comnumber);
		System.out.println("ggymCheckSelect씉");
		String checkresult=null;
		if(result > 0)	{
			//등록이 돼있으니 등록해제
			int gymmnumber = gdao.ggymselect(mid,comnumber);
			 gdao.ggymCheckOff(gymmnumber);
			 checkresult="off";
			}
		else {
			//등록이 안돼있으니 등록 함
			gdao.ggymCheckOn(mid, comnumber);
			 checkresult="on";
			}
		System.out.println("if끝");
		return checkresult;
	}

}
