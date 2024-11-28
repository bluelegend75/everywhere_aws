package joeun.project.dao;

import java.util.List;

import joeun.project.dto.BannerDto;

public interface BannerDAO {
	List<BannerDto> getActiveBanners();
}
