package joeun.project.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
public class RssController {

    @GetMapping(value = "/rss", produces = "application/rss+xml")
    @ResponseBody
    public void generateRss(HttpServletResponse response) {
        response.setContentType("application/rss+xml; charset=UTF-8");

        try (PrintWriter writer = response.getWriter()) {
            writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
            writer.write("<rss version=\"2.0\">");
            writer.write("<channel>");
            writer.write("<title>여행지도 방방곡곡</title>");
            writer.write("<link>https://www.bluelegend.net</link>");
            writer.write("<description>●여행 정보 사이트 방방곡곡 ●목적지를 몰라도 갈곳을 쉽게 찾고, 여형계획을 세울 수 있는 여행추천 여행지도 방방곡곡 ●어디 갈까? 고민 끝</description>");
            
            // 예시 아이템
            writer.write("<item>");
            writer.write("<title>여행지도</title>");
            writer.write("<link>https://www.bluelegend.net/nearBolgguri</link>");
            writer.write("<description>볼꺼리</description>");
            writer.write("<pubDate>Mon, 21 Nov 2024 12:00:00 +0000</pubDate>");
            writer.write("</item>");
            
            writer.write("</channel>");
            writer.write("</rss>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
