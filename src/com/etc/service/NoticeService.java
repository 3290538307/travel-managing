package com.etc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.pojo.Notice;

public interface NoticeService {
	public List<Notice> getNotice();
	public Notice getANotice(int id);
	public List<Notice> getALL();
	public void insertPojo(Notice notice);
	public Notice getAdminById(String aid);
	public List<Notice> getAdminNotice();
	public void updateNotice(@Param("id")int id,@Param("title")String title,@Param("message")String message);
	public void deleteNotice(int id);
}

