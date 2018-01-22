package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.pojo.Message;

@Repository
public interface MessageDao {
	public List<Message> getMessages(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public int countMessage(int uid);
	public void insertMessage(Message message);
	public void deleteMessage(int id);
}
