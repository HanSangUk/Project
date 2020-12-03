package com.army.choo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.choo.dto.KakaoPayApprovalVO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.dto.PageDTO;
import com.army.choo.dto.PayDTO;
import com.army.choo.dto.ProductDTO;
import com.army.choo.dto.ReviewDTO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public String login(MemberDTO member) {
		return sql.selectOne("Product.memberlogin", member);
	}

	public int productInsert(ProductDTO product) {
		return sql.insert("Product.productInsert", product);
	}

	public List<ProductDTO> productSelect(String loginId) {
		return sql.selectList("Product.productSelect", loginId);
	}

	public ProductDTO productUpdate(int pnumber) {
		return sql.selectOne("Product.productDetailSelect", pnumber);
	}

	public int productUpdateProcess(ProductDTO product) {
		return sql.update("Product.productUpdateProcess", product);
	}

	public int productDelete(int pnumber) {
		return sql.delete("Product.productDelete", pnumber);
	}

	public ProductDTO productView(int pnumber) {
		return sql.selectOne("Product.productView", pnumber);
	}

	public int listCount(String searchInput) {
		return sql.selectOne("Product.listcount", searchInput);
	}

	public List<ProductDTO> productListPaging(PageDTO paging) {
		return sql.selectList("Product.productpaging", paging);
	}

	public List<ProductDTO> officeMangeMent(String pcnumber) {
		return sql.selectList("Product.officeMangeMent", pcnumber);
	}

	public int listcount(String loginId) {
		return sql.selectOne("Product.commainListCount", loginId);
	}
	
	//홈(최근등록상품)

	public List<ProductDTO> selectproduct() {
		return sql.selectList("Product.selectproduct");
	}

	public ProductDTO bestproductlist(int pnumber) {
		return sql.selectOne("Product.bestproduct", pnumber);
	}
	
	 // 리뷰 작성
	   public int productReview(ReviewDTO review) {
	      return sql.insert("Product.productReview",review);
	   }
	   // 리뷰 리스트
	   public List<ReviewDTO> reviewList(PageDTO paging) {
	      return sql.selectList("Product.reviewList",paging);
	   }
	   // 배달완료
	   public int productAgree(int paynumber) {
		   return sql.update("Product.productAgree",paynumber);
	   }

	public int reviewlistCount(int pnumber) {
		return sql.selectOne("Product.reviewListCount", pnumber);
	}

	public int selectquantity(String item_code) {
		return sql.selectOne("Product.selectquantity", item_code);
	}
	//단일구매 갯수 마이너스
	public void updatequantity(KakaoPayApprovalVO kvalue) {
		sql.update("Product.updatequantity", kvalue);
		
	}
	//리뷰작성여부
	public int reviewAgree(ReviewDTO review) {
		return sql.update("Product.reviewAgree",review);
	}
	public List<ProductDTO> productList(String comnumber) {
		return sql.selectList("Product.productList", comnumber);
	}

	public List<ProductDTO> productList2(ProductDTO product) {
		return sql.selectList("Product.productList2", product);
	}
	
	public void cproductAgree(PayDTO paydto) {
		sql.update("Product.cproductAgree",paydto);
	}
	
	public void alarm2(PayDTO paydto) {
		sql.insert("Product.alarm2",paydto);	
	}

	public void alarm3(PayDTO paydto) {
		sql.insert("Product.alarm3",paydto);	
	}
}
