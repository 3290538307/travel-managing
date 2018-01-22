package com.etc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.pojo.Message;

public interface MessageService {
	public List<Message> getMessages(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public int countMessage(int uid);
	public void insertMessage(Message message);
	public void deleteMessage(int id);
}
