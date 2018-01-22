package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.etc.pojo.Memory;
import com.etc.pojo.MemoryKindCount;

@Repository
public interface MemoryDao {
	public List<Memory> getByKind(int kind);
	public Memory getDetailById(int id);
	public List<MemoryKindCount> getKindCount();
	public int getCountByKind(int kind);
	public List<Memory> getByIndex(@Param("start") int start,@Param("end") int end,@Param("kind") int kind);
	public void insertMemory(Memory memory);
	public List<Memory> getByUid(@Param("start") int start,@Param("end") int end,@Param("uid") int uid);
	public int getCountByUid(int uid);
	public void deleteById(int id);
	public List<Memory> getAll();
	public Memory getLyjyById(int id);
	public void deleteMemory(int id);
}
