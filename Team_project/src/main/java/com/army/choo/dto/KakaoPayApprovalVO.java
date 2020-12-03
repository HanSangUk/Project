package com.army.choo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApprovalVO {
	//response
    private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private AmountVO amount;
    private CardVO card_info;
    private String item_name, item_code, payload;
    private Integer quantity, tax_free_amount, vat_amount, total_amount;
    private Date created_at, approved_at;
    private String ordernum;
	private String payage;
	private String paydate;
	private String paygender;
	private String payoffice;
	private Integer pcode;
	private String paycategory;
	private int paynumber;
	private int updatequantity;
}
