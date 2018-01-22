package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.ReplyDao;
import com.etc.pojo.Reply;
import com.etc.service.ReplyService;
@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Reply> getByZoneId(int start, int end, int zoneId) {
		// TODO Auto-generated method stub
		return dao.getByZoneId(start, end, zoneId);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int countByZoneId(int zoneId) {
		// TODO Auto-generated method stub
		return dao.countByZoneId(zoneId);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void insertReply(Reply reply) {
		// TODO Auto-generated method stub
		dao.insertReply(reply);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void deleteReply(int zoneId) {
		// TODO Auto-generated method stub
		dao.deleteReply(zoneId);
	}

}
