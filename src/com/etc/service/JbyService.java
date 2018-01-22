package com.etc.service;

import java.util.List;




import org.apache.ibatis.annotations.Param;

import com.etc.pojo.Jby;

public interface JbyService {
	public void insertJby(Jby jby);
	public int JbyCountByUid(int uid);
	public List<Jby> getByUid(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public void deleteById(int id);	
	public List<Jby> getTravel(int start,int end);
	public Jby getTravelDetailById(int id);
	public List<Jby> getTravelDetailBydest(String id);
	public int countTravelALL();
	public List<Jby> getTravelALL();
}
