package com.etc.utils;

public class Page {
	private int total;//记录该表的总行数
	private int perNum;//每一页的行数
	public Page(int perNum) {
		this.perNum=perNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPerNum() {
		return perNum;
	}
	public void setPerNum(int perNum) {
		this.perNum = perNum;
	}
	private int getTotalPages(){
		return (total%perNum)==0?(total/perNum):(total/perNum+1);
	}
	public int[] getPerPageStartIndex(){
		int totalPages=getTotalPages(),start=0;
		int[] result=new int[totalPages];
		for(int i=0;i<totalPages;i++){
			result[i]=start;
			start+=(perNum);
		}
		return result;
	}
}
