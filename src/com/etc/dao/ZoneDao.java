package com.etc.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.pojo.Zone;

@Repository
public interface ZoneDao {
	public List<Zone> getZoneByUid(@Param("uid") int uid,@Param("start") int start,@Param("end") int end);
	public Integer getMyZoneCount(int uid);
	public void deleteMyZoneById(int id);
	public void insertZone(@Param("uid") int uid,@Param("time") Timestamp ctime,@Param("content") String content);
	public List<Zone> getFriendZones(@Param("uid") int uid,@Param("start") int start,@Param("end") int end);
	public int countFriendZones(int uid);
	public Zone getZoneById(int id);
}
