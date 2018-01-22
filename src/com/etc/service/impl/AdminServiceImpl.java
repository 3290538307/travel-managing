package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.AdminDao;
import com.etc.pojo.Admin;
import com.etc.service.AdminService;


@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public Admin getAdmin(String name) {
		// TODO Auto-generated method stub
		return dao.getAdmin(name);
	}
	public void AddAdmin(Admin admin){
		dao.AddAdmin(admin);
	}
	public List<Admin> getAdminAll(){
		return dao.getAdminAll();
	}
}
