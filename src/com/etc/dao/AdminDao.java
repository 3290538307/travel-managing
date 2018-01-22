package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.pojo.Admin;

@Repository
public interface AdminDao {
	public Admin getAdmin(String name);
	public void AddAdmin(Admin admin);
	public List<Admin> getAdminAll();
}
