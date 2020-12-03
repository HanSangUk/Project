package com.army.choo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.choo.dto.ProductDTO;

@Repository
public class AlgorismDAO {

	@Autowired
	public SqlSessionTemplate sql;

	public String selectCategoti(String userid) {
		return sql.selectOne("Pay.selectCategory",userid);
	}

	public String selectMaxCategoti(String category) {
		return sql.selectOne("Pay.selectMaxCategory",category);
	}

	public List<ProductDTO> selectProductList(String maxCategory) {
		return sql.selectList("Pay.selectProductList",maxCategory);
	}

	public int insertProduct(ProductDTO pdto) {
		return sql.insert("Pay.insertProduct", pdto);
	}
	
	
}
