package com.army.choo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.choo.dto.BasketDTO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int basketInsert(BasketDTO basketDTO) {
		return sql.insert("Basket.BasketInsert", basketDTO);
	}

	public List<BasketDTO> basketList(String baid) {
		return sql.selectList("Basket.BasketList", baid);
	}

	public void deleteCart(BasketDTO bDTO) {
		sql.delete("Basket.deleteCart", bDTO);
	}

	public List<BasketDTO> basketajaxList(String baid) {
		return sql.selectList("Basket.BasketAjaxList", baid);
	}

}
