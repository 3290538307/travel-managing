package com.etc.service;

import java.util.List;

import com.etc.pojo.SpotStrategyInfo;

public interface SpotStrategyInfoService {
	public List<SpotStrategyInfo> getALL();
	public SpotStrategyInfo getStrategyDetailById(String id);
	public List<SpotStrategyInfo> getSeason();
	public List<SpotStrategyInfo> getTheme();
}
