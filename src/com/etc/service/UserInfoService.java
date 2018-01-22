package com.etc.service;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.pojo.ApplyFriend;
import com.etc.pojo.UserInfo;
import com.etc.pojo.UserInfoDetail;

public interface UserInfoService {
	public UserInfo getPojo(String name);
	public void insertPojo(UserInfo user);
	public void updatePojo(String name,String password);
	public List<UserInfo> getALL();
	public UserInfoDetail getUserDetailById(String id);
	public void updateUser(UserInfoDetail detail);
	public String getImg(int uid);
	public void updateImg(int uid,String img);
	public void updatePwd(int uid,String password);
	public List<UserInfoDetail> getFriends(int start,int end,int uid);
	public int countFriends(int uid);
	public void deleteFriend(int uid,int friendId);
	public int isFriend(int uid,int xid);
	public List<UserInfoDetail> getOthers(int start,int end,int uid);
	public void applyFriend(int uid,int fid,Timestamp time);
	public List<ApplyFriend> getApplyFriends(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public int countApplyFriends(int uid);
	public void updateFriend(@Param("uid")int uid,@Param("fid")int fid);
	public Integer isSend(@Param("uid")int uid,@Param("fid")int fid);
}
