package joeun.project.service;

import java.util.List;

import joeun.project.dto.BannerDto;

public interface BannerService {
	public List<BannerDto> getActiveBanners();
}
