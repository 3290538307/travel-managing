package com.etc.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etc.pojo.SpotStrategyInfo;
import com.etc.pojo.UserInfoDetail;


@Repository
public interface SpotStrategyDao {

	public List<SpotStrategyInfo> getALL();
	public SpotStrategyInfo getStrategyDetailById(String id);
	public List<SpotStrategyInfo> getSeason();
	public List<SpotStrategyInfo> getTheme();
}

