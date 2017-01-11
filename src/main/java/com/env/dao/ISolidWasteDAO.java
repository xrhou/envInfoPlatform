package com.env.dao;

import java.util.List;

import com.env.entity.SolidWaste;
/**
 * 固体废物
 * @author hbj403
 */
public interface ISolidWasteDAO {

	public void addSolidWaste(SolidWaste solidWaste);
	
	public List<SolidWaste> getAllSolidWaste(String entUserId);
	
	public boolean delSolidWasteBysolidWasteId(String solidWasteId);
	
	public SolidWaste getSolidWasteBysolidWasteId(String solidWasteId);
	
	public boolean updateSolidWaste(SolidWaste solidWaste);
}
