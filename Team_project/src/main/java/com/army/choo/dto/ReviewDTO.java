package com.army.choo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {
   private int rnumber;
   private String rid;
   private String rcontents;
   private String rdate;
   private int pnumber;
   private int paynumber;

}