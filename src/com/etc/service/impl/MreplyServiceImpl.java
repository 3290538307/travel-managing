package com.etc.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;





import com.etc.dao.MreplyDao;
import com.etc.pojo.Mreply;
import com.etc.service.MreplyService;
@Service
public class MreplyServiceImpl implements MreplyService {
	@Autowired
	private MreplyDao dao=null;

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Mreply> getBylyjy_id(int start,int end,int id) {
		// TODO Auto-generated method stub
		return dao.getBylyjy_id(start,end,id);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void insertMreply(int lyjy_id, int uid, String content,
			Timestamp time) {
		// TODO Auto-generated method stub
		dao.insertMreply(lyjy_id, uid, content, time);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int countBylyjy_id(int id) {
		// TODO Auto-generated method stub
		return dao.countBylyjy_id(id);
	}
	

}
