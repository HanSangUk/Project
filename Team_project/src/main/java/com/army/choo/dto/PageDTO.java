package com.army.choo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PageDTO {
	
	private int page;
	private int maxpage;
	private int endpage;
	private int startpage;
	private int startrow;
	private int endrow;
	private String search;
	private String company;
	private String mid;
	private int maxpage1;
	private int endpage1;
	private int startpage1;
	private int startrow1;
	private int endrow1;
	private int pnumber;
	
}
