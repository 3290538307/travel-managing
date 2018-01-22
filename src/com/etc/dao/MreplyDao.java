package com.etc.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.pojo.Mreply;
//���μ�������
@Repository
public interface MreplyDao {
	public List<Mreply> getBylyjy_id(@Param("start")int start,@Param("end")int end,@Param("id")int id);
	public void insertMreply(@Param("lyjy_id") int lyjy_id,@Param("uid") int uid,@Param("content") String content,@Param("time") Timestamp time);
	public int countBylyjy_id(int id);

}
