package joeun.project.service;

import java.time.LocalDate;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import joeun.project.dao.BannerDAO;
import joeun.project.dto.VistorCntDto;
@Service
public class VisitorServiceImpl implements VisitorService {
	@Autowired
	SqlSession sqlSession;
    // 오늘의 방문자 수 조회
    public VistorCntDto getVisitorCount() {
    	BannerDAO dao = sqlSession.getMapper(BannerDAO.class);
        return dao.getVisitorCount();
    }
	
	// 방문자 수 증가:index_cnt
    public void incrementVisitorCount() {
    	BannerDAO dao = sqlSession.getMapper(BannerDAO.class);
        LocalDate today = LocalDate.now();

        // 오늘의 방문자 수 증가
        dao.incrementVisitorCount(today);
    }
	// 방문자 수 증가:nearbolgguri_cnt
    public void incrementNearBolgguriCnt() {
    	BannerDAO dao = sqlSession.getMapper(BannerDAO.class);
        LocalDate today = LocalDate.now();

        // 오늘의 방문자 수 증가
        dao.incrementNearBolgguriCnt(today);
    }

}
