package com.etc.service;

import java.util.List;


import com.etc.pojo.Reply;

public interface ReplyService {
	public List<Reply> getByZoneId(int start,int end,int zoneId);
	public int countByZoneId(int zoneId);
	public void insertReply(Reply reply);
	public void deleteReply(int zoneId);
}
