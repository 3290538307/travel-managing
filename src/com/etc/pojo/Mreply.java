package com.etc.pojo;

import java.sql.Timestamp;


public class Mreply {

	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private int id;
	private int lyjy_id;
	private int uid;
	private String content;
	private Timestamp time;
	private String username;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLyjy_id() {
		return lyjy_id;
	}
	public void setLyjy_id(int lyjy_id) {
		this.lyjy_id = lyjy_id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
