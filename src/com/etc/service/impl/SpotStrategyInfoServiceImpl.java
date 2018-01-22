package com.etc.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.SpotStrategyDao;
import com.etc.pojo.SpotStrategyInfo;
import com.etc.service.SpotStrategyInfoService;

@Service
public class SpotStrategyInfoServiceImpl implements SpotStrategyInfoService {
	
	@Autowired
	private SpotStrategyDao dao=null;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<SpotStrategyInfo> getALL() {
		// TODO Auto-generated method stub
		return dao.getALL();
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public SpotStrategyInfo getStrategyDetailById(String id) {
		// TODO Auto-generated method stub
		return dao.getStrategyDetailById(id) ;
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<SpotStrategyInfo> getSeason() {
		// TODO Auto-generated method stub
		return dao.getSeason();
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public List<SpotStrategyInfo> getTheme() {
		// TODO Auto-generated method stub
		return dao.getTheme();
	}
	
	
	
}
