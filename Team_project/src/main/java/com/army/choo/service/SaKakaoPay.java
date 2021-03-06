package com.army.choo.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dto.KakaoPayApprovalVO;
import com.army.choo.dto.KakaoPayReadyVO;

import lombok.extern.java.Log;

@Service
@Log
public class SaKakaoPay {
	
	@Autowired
	private HttpSession session;
	
	private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    String Partner_user_id =null;
    String Total_amount = null;
    String item_code = null;
    
    
    public String kakaoPayReady(KakaoPayApprovalVO kdto, String[] array, String[] arraypnumber) {
       Partner_user_id =kdto.getPartner_user_id();
       Total_amount=Integer.toString(kdto.getTotal_amount());
       item_code = kdto.getItem_code();
       
        RestTemplate restTemplate = new RestTemplate();
        
        
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "e591ce1bf227835a630c9c2ac60dbef7");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1");
        params.add("partner_user_id",kdto.getPartner_user_id());
        params.add("item_name", "싸다잉");
        params.add("quantity",Integer.toString(kdto.getQuantity()));
        params.add("total_amount",Integer.toString(kdto.getTotal_amount()));
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8090/choo/bakakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8090/choo/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8090/choo/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    
    
    public KakaoPayApprovalVO kakaoPayInfo2(String pg_token) {
        
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "e591ce1bf227835a630c9c2ac60dbef7");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1");
        params.add("partner_user_id",Partner_user_id);
        params.add("pg_token", pg_token);
        params.add("total_amount", Total_amount);
       
      /*
       * params.add("cid", "TC0ONETIME"); params.add("partner_order_id",
       * Integer.toString(ordernum));
       * params.add("partner_user_id",kdto.getPartner_user_id());
       * params.add("item_name", kdto.getItem_name());
       * params.add("quantity",Integer.toString(kdto.getQuantity()));
       * params.add("total_amount",Integer.toString(kdto.getTotal_amount()));
       * params.add("tax_free_amount", "0");
       */
        
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
            
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
        return null;
    }
}
