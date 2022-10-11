package kh.petmily.interceptor;

import kh.petmily.domain.member.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class AdminCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("AdminCheckInterceptor 실행");

        HttpSession session = request.getSession(false);

        Member member = (Member) session.getAttribute("authUser");

        if (!member.getGrade().equals("관리자")) {
            log.info("관리자 아님");

            response.sendRedirect("/");

            return false;
        }

        return true;
    }
}
