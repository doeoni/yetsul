package com.yetsul.model;

import lombok.Data;

@Data
public class Page {
//	검색 정보
	private String searchCondition;
	private String searchKeyword;
	
//	정렬 기준 정보
	private String orderBy; // 정렬 순서
	private String sortBy; // 정렬 기준이 될 column
	private String asc; // 정렬 순서(오름차순,내림차순)
	
//	페이징 처리 정보
	private int nowPage; // 현재 페이지
	private int nowRecode; // 현재 레코드
	private int totalPage; // 총 페이지
	private int totalRecode; // 총 레코드
	private int displayPage; // 한 페이지에 보여질 페이지 수
	private int displayRecode; // 한 페이지에 보여질 레코드 수
	private int pageStart; // 페이지 목록의 시작
	private int pageEnd; // 페이지 목록의 끝
	private int lastPageStartRecode; // 마지막 페이지의 시작 레코드
}


