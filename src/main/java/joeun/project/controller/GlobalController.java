package joeun.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import joeun.project.dto.BannerDto;
import joeun.project.service.BannerService;

@ControllerAdvice
public class GlobalController {
	@Autowired
    private BannerService bannerService;

    @ModelAttribute
    public void addBannerData(Model model) {
    	List<BannerDto> banners = bannerService.getActiveBanners();
//    	System.out.println("banners:"+banners);
    	int middleIndex = banners.size() / 2;
        List<BannerDto> leftBanners = banners.subList(0, middleIndex);
        List<BannerDto> rightBanners = banners.subList(middleIndex, banners.size());
    	
        model.addAttribute("leftBanners", leftBanners);
        model.addAttribute("rightBanners", rightBanners);
    }
}
