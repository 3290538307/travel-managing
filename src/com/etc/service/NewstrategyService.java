package com.etc.service;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.pojo.Newstrategypojo;

public interface NewstrategyService {
	public List<Newstrategypojo> getStratelist();
	public void insertNews(@Param("uid") int uid,@Param("title") String title,@Param("triptime") String triptime,@Param("people") String people,@Param("imgpath") String imgpath,@Param("triptype") String triptype,@Param("content") String content,@Param("equipment") String equipment,@Param("notice") String notice,@Param("summary") String summary,@Param("spot")String spot,@Param("cdate") Timestamp cdate);
	public void deleteNews(@Param("id") int id);
	public Newstrategypojo getline(@Param("id") int id);
	public void updatenews(Newstrategypojo pojo);



}
