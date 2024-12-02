package joeun.project.service;

import joeun.project.dto.VistorCntDto;

public interface VisitorService {
	public VistorCntDto getVisitorCount();
	
	public void incrementVisitorCount();
	
	public void incrementNearBolgguriCnt();
	

}
