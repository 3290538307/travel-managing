package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.JbyDao;
import com.etc.pojo.Jby;
import com.etc.service.JbyService;
@Service
public class JbyServiceImpl implements JbyService{
	@Autowired
	private JbyDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void insertJby(Jby jby) {
		// TODO Auto-generated method stub
		dao.insertJby(jby);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public int JbyCountByUid(int uid) {
		// TODO Auto-generated method stub
		return dao.JbyCountByUid(uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public List<Jby> getByUid(int start, int end, int uid) {
		// TODO Auto-generated method stub
		return dao.getByUid(start, end, uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		dao.deleteById(id);
	}
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Jby> getTravel(int start,int end) {
		// TODO Auto-generated method stub
		return dao.getTravel(start,end);
	}
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public Jby getTravelDetailById(int id) {
		// TODO Auto-generated method stub
		return dao.getTravelDetailById(id);
	}
	@Override
	public List<Jby> getTravelDetailBydest(String dest) {
		// TODO Auto-generated method stub
		return dao.getTravelDetailBydest(dest);
	}
	
	
	@Override
	public int countTravelALL() {
		// TODO Auto-generated method stub
		return dao.countTravelALL();
	}
	@Override
	public List<Jby> getTravelALL() {
		// TODO Auto-generated method stub
		return dao.getTravelALL();
	}

}
