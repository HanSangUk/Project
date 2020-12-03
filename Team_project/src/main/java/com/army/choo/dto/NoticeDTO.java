package com.army.choo.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeDTO {
	private int nnumber;
	private String ntitle ;
	private String ncontents ;
	private Date ndate ;
	private MultipartFile nfile;
	private String nfilename ;
	private int nhits;
}
