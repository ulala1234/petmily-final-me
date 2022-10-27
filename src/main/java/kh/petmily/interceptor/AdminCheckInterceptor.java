/*관리자 인터셉터로
관리자가 아니라면 컨트롤러로 가는 호출을 가로채서 index 로 가도록 기능을 하는 클래스다.*/
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

        // 세션이 존재하면 세션 생성, 그 외 null 반환
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
