package com.army.choo.dao;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GgymDAO {

	
	@Autowired
	public SqlSessionTemplate sql;
	
	
	//찜 삭제(해제)
	public void ggymCheckOff(int ggymnumber) {
		sql.delete("Ggym.ggymdelete", ggymnumber);
	}

	//찜 등록(설정)
	public void ggymCheckOn(String mid, String comnumber) {
		Map<String,String> gmap = new HashMap<String,String>();
		gmap.put("mid", mid);
		gmap.put("comnumber", comnumber);
		sql.insert("Ggym.ggyminsert", gmap);
	}

	//찜 등록 확인 여부 판단
	public int ggymCheckSelect(String mid, String comnumber) {
		Map<String,String> gmap = new HashMap<String,String>();
		gmap.put("mid", mid);
		gmap.put("comnumber", comnumber);
		return sql.selectOne("Ggym.ggymcheckselect", gmap);
	}

	public int ggymselect(String mid, String comnumber) {
		Map<String,String> gmap = new HashMap<String,String>();
		gmap.put("mid", mid);
		gmap.put("comnumber", comnumber);
		return sql.selectOne("Ggym.ggymselect", gmap);
	}



}
