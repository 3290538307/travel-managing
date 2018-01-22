package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.MessageDao;
import com.etc.pojo.Message;
import com.etc.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Message> getMessages(int start, int end, int uid) {
		// TODO Auto-generated method stub
		return dao.getMessages(start, end, uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int countMessage(int uid) {
		// TODO Auto-generated method stub
		return dao.countMessage(uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void insertMessage(Message message) {
		// TODO Auto-generated method stub
		dao.insertMessage(message);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void deleteMessage(int id) {
		// TODO Auto-generated method stub
		dao.deleteMessage(id);
	}

}
