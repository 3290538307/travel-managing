package com.etc.service;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.pojo.Mreply;

public interface MreplyService {
	public List<Mreply> getBylyjy_id(int start,int end,int id);
	public void insertMreply(@Param("lyjy_id") int lyjy_id,@Param("uid") int uid,@Param("content") String content,@Param("time") Timestamp time);
	public int countBylyjy_id(int id);
}
