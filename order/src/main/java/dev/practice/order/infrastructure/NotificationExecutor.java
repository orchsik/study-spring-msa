package dev.practice.order.infrastructure;

import dev.practice.order.domain.notification.NotificationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class NotificationExecutor implements NotificationService {
    @Override
    public void sendEmail(String email, String title, String description) {
        log.info("sendEmail");
    }

    @Override
    public void sendKakao(String phoneNumber, String description) {
        log.info("sendKakao");
    }

    @Override
    public void sendSms(String phoneNumber, String description) {
        log.info("sendSms");
    }
}
