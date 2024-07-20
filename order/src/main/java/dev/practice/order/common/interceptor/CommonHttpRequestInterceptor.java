package dev.practice.order.common.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.UUID;

/**
 * 모든 HTTP 요청에 대한 공통 처리를 담당하는 인터셉터
 * HTTP 요청을 가로채고, 요청마다 고유한 식별자를 설정하여 로깅하는 데 사용된다.
 * 이 클래스는 HandlerInterceptor 인터페이스를 구현하며, 요청이 컨트롤러에 도달하기
 * 전에 특정 작업을 수행하는 preHandle 메서드를 구현하고 있다.
 */
@Slf4j
@Component
public class CommonHttpRequestInterceptor implements HandlerInterceptor {
    public static final String HEADER_REQUEST_UUID_KEY = "x-request-id";


    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String requestEventId = request.getHeader(HEADER_REQUEST_UUID_KEY);
        if (StringUtils.isEmpty(requestEventId)) {
            requestEventId = UUID.randomUUID().toString();
        }
        MDC.put(HEADER_REQUEST_UUID_KEY, requestEventId);
        return true;
    }


}
