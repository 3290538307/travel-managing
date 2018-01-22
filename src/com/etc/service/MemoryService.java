package com.etc.service;

import java.util.List;



import com.etc.pojo.Memory;
import com.etc.pojo.MemoryKindCount;

public interface MemoryService {
	public List<Memory> getByKind(int kind);
	public Memory getDetailById(int id);
	public List<MemoryKindCount> getKindCount();
	public List<Memory> getByIndex(int start,int end,int kind);
	public int getCountByKind(int kind);
	public void insertMemory(Memory memory);
	public List<Memory> getByUid(int start,int end,int uid);
	public int getCountByUid(int uid);
	public void deleteById(int id);
	public List<Memory> getAll();
	public Memory getLyjyById(int id);
	public void deleteMemory(int id);
}
