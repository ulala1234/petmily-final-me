/*로그인 인터셉터로
로그인이 안되어 있으면 컨트롤러로 가는 호출을 가로채서 로그인으로 가도록 기능을 하는 클래스다.*/
package kh.petmily.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("LoginCheckInterceptor 실행");

        // 세션이 존재하면 세션 생성, 그 외 null 반환
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("authUser") == null) {
            log.info("미인증 사용자");

            response.sendRedirect("/login");

            return false;
        }

        return true;
    }
}
