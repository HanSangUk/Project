package com.army.choo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.choo.dto.KakaoPayApprovalVO;
import com.army.choo.dto.PayDTO;
import com.army.choo.dto.ProductDTO;

@Repository
public class PayDAO {
	@Autowired
	private SqlSessionTemplate sql;
	   
	//결제 데이터 삽입
	public int payInsert(KakaoPayApprovalVO kvalue) {
		System.out.println("dfasdfaf" + kvalue);
		return sql.insert("Pay.payInsert", kvalue);
	}

	public String categorySelect(int banumber) {
		return sql.selectOne("Basket.categorySelect",banumber);
	}
	
	public int payInsert2(KakaoPayApprovalVO kvalue) {
		return sql.insert("Pay.payInsert2", kvalue);
	}

	public int payDelete(int banumber) {
		return sql.delete("Pay.payDelete", banumber);
	}

	public List<PayDTO> payListSelect(String mid) {
		return sql.selectList("Pay.payListSelect", mid);
	}

	public String banameselect(int banumber) {
		return sql.selectOne("Basket.banameSelect", banumber);
	}

	public List<PayDTO> selectpayproduct() {
		return sql.selectList("Pay.payProduct");
	}

	public String categorySelect2(int value) {
		return sql.selectOne("Product.categorySelect2", value);
	}

	public void productupdate(KakaoPayApprovalVO kvalue) {
		sql.update("Product.productupdate", kvalue);
		
	}
	
	public int month1(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month1", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month2(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month2", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month3(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month3", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month4(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month4", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month5(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month5", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month6(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month6", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month7(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month7", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month8(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month8", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month9(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month9", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month10(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month10", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month11(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month11", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int month12(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.month12", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		
		return result;
	}

	public int num1(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.categorynum1", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		return result;
	}
	public int num2(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.categorynum2", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		return result;
	}
	public int num3(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.categorynum3", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		return result;
		
	}
	public int num4(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.categorynum4", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		return result;
	}
	public int num5(String loginId) {
		int result = 0;
		try {
			result = sql.selectOne("Pay.categorynum5", loginId);
		}catch(NullPointerException e){
			result = 0;
		}
		return result;
	}

	public void alarmInsert(KakaoPayApprovalVO kvalue) {
		sql.insert("Pay.alarmInsert",kvalue);
		
	}
}
