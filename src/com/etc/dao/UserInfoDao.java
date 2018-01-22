package com.etc.dao;


import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.pojo.ApplyFriend;
import com.etc.pojo.UserInfo;
import com.etc.pojo.UserInfoDetail;
@Repository
public interface UserInfoDao {
	public UserInfo getPojo(String name);
	public void insertPojo(UserInfo user);
	public void updatePojo(@Param("name") String name,@Param("password") String password);
	public List<UserInfo> getALL();
	public UserInfoDetail getUserDetailById(String id);
	public void updateUser(UserInfoDetail detail);
	public String getImg(int uid);
	public void updateImg(@Param("uid") int uid,@Param("img") String img);
	public void updatePwd(@Param("uid") int uid,@Param("password") String password);
	public List<UserInfoDetail> getFriends(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public int countFriends(int uid);
	public void deleteFriend(@Param("uid") int uid,@Param("f_id")int friendId);
	public int isFriend(@Param("uid") int uid,@Param("xid") int xid);
	public List<UserInfoDetail> getOthers(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public void applyFriend(@Param("uid")int uid,@Param("fid")int fid,@Param("time")Timestamp time);
	public List<ApplyFriend> getApplyFriends(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public int countApplyFriends(int uid);
	public void updateFriend(@Param("uid")int uid,@Param("fid")int fid);
	public Integer isSend(@Param("uid")int uid,@Param("fid")int fid);
}
