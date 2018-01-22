package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.pojo.Reply;
@Repository
public interface ReplyDao {
	public List<Reply> getByZoneId(@Param("start") int start,@Param("end") int end,@Param("zoneId") int zoneId);
	public int countByZoneId(int zoneId);
	public void insertReply(Reply reply);
	public void deleteReply(int zoneId);
}
