package com.xl.ccms.entity;

public class Page {
	private Integer pageIndex;
	private Integer singleRows;  
	private Integer totalRows;

	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getSingleRows() {
		return singleRows;
	}
	public void setSingleRows(Integer singleRows) {
		this.singleRows = singleRows;
	}
	public Integer getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(Integer totalRows) {
		this.totalRows = totalRows;
	}


	public Page() {
		super();
		this.pageIndex=1;
		this.singleRows=5;
	}

	public Page(Integer pageIndex,Integer singleRows){
		this.pageIndex=pageIndex;
		this.singleRows=singleRows;
	}

	public Integer getStartRows(){
		return (this.pageIndex-1)*this.singleRows;
	}



}
