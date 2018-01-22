package com.etc.service;

import java.sql.Timestamp;
import java.util.List;


import com.etc.pojo.Zone;

public interface ZoneService {
	public List<Zone> getZoneByUid(int uid,int start,int end);
	public Integer getMyZoneCount(int uid);
	public void deleteMyZoneById(int id);
	public void insertZone(int uid,Timestamp ctime,String content);
	public List<Zone> getFriendZones(int uid,int start,int end);
	public int countFriendZones(int uid);
	public Zone getZoneById(int id);
}
