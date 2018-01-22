package com.etc.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.NewstrategyDao;
import com.etc.pojo.Newstrategypojo;
import com.etc.service.NewstrategyService;

@Service
public class NewstrategyServiceImpl implements NewstrategyService{
	@Autowired
	private NewstrategyDao dao=null;

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)

	public List<Newstrategypojo> getStratelist() {
		// TODO Auto-generated method stub
		return dao.getStratelist();
	}

	@Override
	public void insertNews(int uid, String title, String triptime,
			String people, String imgpath, String triptype, String content,
			String equipment, String notice, String summary, String spot,
			Timestamp cdate) {
		// TODO Auto-generated method stub
		dao.insertNews(uid, title, triptime, people, imgpath, triptype, content, equipment, notice, summary, spot, cdate);
		
	}

	@Override
	public void deleteNews(int id) {
		// TODO Auto-generated method stub
		dao.deleteNews(id);
		
	}

	@Override
	public Newstrategypojo getline(int id) {
		// TODO Auto-generated method stub
		return dao.getline(id);
	}

	@Override
	public void updatenews(Newstrategypojo pojo) {
		// TODO Auto-generated method stub
		dao.updatenews(pojo);
	}

	
	
		
	

}
