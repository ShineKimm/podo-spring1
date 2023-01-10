package podo.podospring.common.interceptor;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginIntercepter implements HandlerInterceptor {

    //인터셉터가 처리될 패스
    public List loginEssential
            = Arrays.asList("/guide/reserGuide/**", "/reservation/**");

    //인터셉터에서 제외될 패스
    public List loginInessential
            = Arrays.asList("/*", "/index/**", "/getBoardList/**");

    private static Logger log = LoggerFactory.getLogger(LoginIntercepter.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {

        log.info("==================== BEGIN ====================");
        log.info("Request URI ===> " + request.getRequestURI());

        String MS_NUM = (String)request.getSession().getAttribute("MS_NUM");



        if (MS_NUM == null) {
            response.sendRedirect("/member/login");
        }
        return true;

//        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        log.info("==================== END ======================");
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }
}
