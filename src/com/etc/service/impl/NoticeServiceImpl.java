package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.NoticeDao;
import com.etc.pojo.Notice;
import com.etc.service.NoticeService;
@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Notice> getNotice() {
		// TODO Auto-generated method stub
		return dao.getNotice();
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public Notice getANotice(int id) {
		// TODO Auto-generated method stub
		return dao.getANotice(id);
	}
	@Override
	public List<Notice> getALL() {
		// TODO Auto-generated method stub
		return dao.getALL();
	}
	@Override
	public void insertPojo(Notice notice) {
		// TODO Auto-generated method stub
		dao.insertPojo(notice);
	}
	@Override
	public Notice getAdminById(String aid) {
		// TODO Auto-generated method stub
		return dao.getAdminById(aid);
	}
	@Override
	public List<Notice> getAdminNotice() {
		// TODO Auto-generated method stub
		return dao.getAdminNotice();
	}
	@Override
	public void updateNotice(int id, String title, String message) {
		// TODO Auto-generated method stub
		dao.updateNotice(id, title, message);
	}
	@Override
	public void deleteNotice(int id) {
		// TODO Auto-generated method stub
		dao.deleteNotice(id);
	}

}
