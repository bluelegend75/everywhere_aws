package joeun.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import joeun.project.dao.BannerDAO;
import joeun.project.dto.BannerDto;

@Service
public class BannerServiceImpl implements BannerService {
	@Autowired
	SqlSession sqlSession;

    public List<BannerDto> getActiveBanners() {
    	BannerDAO dao = sqlSession.getMapper(BannerDAO.class);
//    	System.out.println("BannerServiceImpl-dao.getActiveBanners():"+dao.getActiveBanners());
		return dao.getActiveBanners();
    }
}