package joeun.project;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RedirectFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String host = httpRequest.getServerName();

        // bluelegend.net 또는 aws.bluelegend.net으로 접근하면 www.bluelegend.net으로 리디렉션
        if (host.equals("bluelegend.net") || host.equals("aws.bluelegend.net")) {
            String newUrl = "https://www.bluelegend.net" + httpRequest.getRequestURI();
            httpResponse.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
            httpResponse.setHeader("Location", newUrl);
        } else {
            chain.doFilter(request, response); // 다른 호스트일 경우 요청을 계속 처리
        }
    }

    @Override
    public void destroy() {}
}
