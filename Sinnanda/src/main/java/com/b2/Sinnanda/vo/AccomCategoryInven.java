package com.b2.Sinnanda.vo;

import java.util.List;

import lombok.Data;

@Data
public class AccomCategoryInven {
	private int accomCategoryInvenNo;
	private int accomNo;
	private int accomCategoryNo;
	private String createDate;
	private String upcateDate;
	
	private List<AccomCategory> accomCategories;
}
