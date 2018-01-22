package com.etc.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.UserInfoDao;
import com.etc.pojo.ApplyFriend;
import com.etc.pojo.UserInfo;
import com.etc.pojo.UserInfoDetail;
import com.etc.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired
	private UserInfoDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public UserInfo getPojo(String name) {
		// TODO Auto-generated method stub
		return dao.getPojo(name);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void insertPojo(UserInfo user) {
		// TODO Auto-generated method stub
		dao.insertPojo(user);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void updatePojo(String name, String password) {
		// TODO Auto-generated method stub
		dao.updatePojo(name, password);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<UserInfo> getALL() {
		// TODO Auto-generated method stub
		return dao.getALL();
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public UserInfoDetail getUserDetailById(String id) {
		// TODO Auto-generated method stub
		return dao.getUserDetailById(id);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void updateUser(UserInfoDetail detail) {
		// TODO Auto-generated method stub
		dao.updateUser(detail);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public String getImg(int uid) {
		// TODO Auto-generated method stub
		return dao.getImg(uid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void updateImg(int uid, String img) {
		// TODO Auto-generated method stub
		dao.updateImg(uid, img);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void updatePwd(int uid,String password) {
		// TODO Auto-generated method stub
		dao.updatePwd(uid,password);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<UserInfoDetail> getFriends(int start, int end, int uid) {
		// TODO Auto-generated method stub
		return dao.getFriends(start, end, uid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int countFriends(int uid) {
		// TODO Auto-generated method stub
		return dao.countFriends(uid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void deleteFriend(int uid, int friendId) {
		// TODO Auto-generated method stub
		dao.deleteFriend(uid, friendId);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int isFriend(int uid, int xid) {
		// TODO Auto-generated method stub
		return dao.isFriend(uid, xid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<UserInfoDetail> getOthers(int start,int end,int uid) {
		// TODO Auto-generated method stub
		return dao.getOthers(start, end, uid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void applyFriend(int uid, int fid,Timestamp time) {
		// TODO Auto-generated method stub
		dao.applyFriend(uid, fid,time);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<ApplyFriend> getApplyFriends(int start, int end, int uid) {
		// TODO Auto-generated method stub
		return dao.getApplyFriends(start, end, uid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int countApplyFriends(int uid) {
		// TODO Auto-generated method stub
		return dao.countApplyFriends(uid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void updateFriend(int uid, int fid) {
		// TODO Auto-generated method stub
		dao.updateFriend(uid, fid);
	}

	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public Integer isSend(int uid, int fid) {
		// TODO Auto-generated method stub
		return dao.isSend(uid, fid);
	}

}
