package com.army.choo.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.*;

@Getter
@Setter
@ToString
public class ProductDTO {
private int pnumber;
private String pname;
private int pprice;
private String pinfo;
private String pcategory;
private String pcnumber;
private int pcount;
private MultipartFile pfile;
private String pimage;
private String pdate;
private String userid;
private String comnumber;
private String preexistence;
}
