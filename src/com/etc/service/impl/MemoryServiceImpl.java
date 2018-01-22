package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.MemoryDao;
import com.etc.pojo.Memory;
import com.etc.pojo.MemoryKindCount;
import com.etc.service.MemoryService;
@Service
public class MemoryServiceImpl implements MemoryService{
	@Autowired
	private MemoryDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Memory> getByKind(int kind) {
		// TODO Auto-generated method stub
		return dao.getByKind(kind);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public Memory getDetailById(int id) {
		// TODO Auto-generated method stub
		return dao.getDetailById(id);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<MemoryKindCount> getKindCount() {
		// TODO Auto-generated method stub
		return dao.getKindCount();
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Memory> getByIndex(int start, int end, int kind) {
		// TODO Auto-generated method stub
		return dao.getByIndex(start, end, kind);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int getCountByKind(int kind) {
		// TODO Auto-generated method stub
		return dao.getCountByKind(kind);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void insertMemory(Memory memory) {
		// TODO Auto-generated method stub
		dao.insertMemory(memory);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<Memory> getByUid(int start,int end,int uid) {
		// TODO Auto-generated method stub
		return dao.getByUid(start, end, uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int getCountByUid(int uid) {
		// TODO Auto-generated method stub
		return dao.getCountByUid(uid);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		dao.deleteById(id);
	}
	@Override
	public List<Memory> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}
	@Override
	public Memory getLyjyById(int id) {
		// TODO Auto-generated method stub
		return dao.getLyjyById(id);
	}
	@Override
	public void deleteMemory(int id) {
		// TODO Auto-generated method stub
		dao.deleteMemory(id);
	}

}
