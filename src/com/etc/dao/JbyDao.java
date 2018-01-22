package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.pojo.Jby;

@Repository
public interface JbyDao {
	public void insertJby(Jby jby);
	public int JbyCountByUid(int uid);
	public List<Jby> getByUid(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public void deleteById(int id);	
	public List<Jby> getTravel(@Param("start") int start,@Param("end") int end);
	public Jby getTravelDetailById(int id);
	public List<Jby> getTravelDetailBydest(String id);
	public int countTravelALL();
	public List<Jby> getTravelALL();
}
