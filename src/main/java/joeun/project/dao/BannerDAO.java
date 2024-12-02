package joeun.project.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import joeun.project.dto.BannerDto;
import joeun.project.dto.VistorCntDto;

public interface BannerDAO {
	List<BannerDto> getActiveBanners();
    // 일자별 방문자 수 조회
	VistorCntDto getVisitorCount();

    // 방문자 수 증가
    void incrementVisitorCount(@Param("visitDate") LocalDate visitDate);
    
    void incrementNearBolgguriCnt(@Param("visitDate") LocalDate visitDate);
}
