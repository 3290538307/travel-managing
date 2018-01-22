package com.etc.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.ZoneDao;
import com.etc.pojo.Zone;
import com.etc.service.ZoneService;
@Service
public class ZoneServiceImpl implements ZoneService{
	@Autowired
	private ZoneDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	
	public List<Zone> getZoneByUid(int uid, int start, int end) {
		// TODO Auto-generated method stub
		return dao.getZoneByUid(uid, start, end);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public Integer getMyZoneCount(int uid) {
		// TODO Auto-generated method stub
		return dao.getMyZoneCount(uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void deleteMyZoneById(int id) {
		// TODO Auto-generated method stub
		dao.deleteMyZoneById(id);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void insertZone(int uid, Timestamp ctime, String content) {
		// TODO Auto-generated method stub
		dao.insertZone(uid, ctime, content);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Zone> getFriendZones(int uid, int start, int end) {
		// TODO Auto-generated method stub
		return dao.getFriendZones(uid, start, end);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int countFriendZones(int uid) {
		// TODO Auto-generated method stub
		return dao.countFriendZones(uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public Zone getZoneById(int id) {
		// TODO Auto-generated method stub
		return dao.getZoneById(id);
	}

}
