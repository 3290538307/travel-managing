package com.etc.service;

import java.util.List;

import com.etc.pojo.Admin;

public interface AdminService {
	public Admin getAdmin(String name);
	public void AddAdmin(Admin admin);
	public List<Admin> getAdminAll();
}
