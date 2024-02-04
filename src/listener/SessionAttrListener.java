package listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

@WebListener
public class SessionAttrListener implements HttpSessionAttributeListener {
    // 세션에 속성이 추가되는 이벤트 감지
    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
//        HttpSessionAttributeListener.super.attributeAdded(event);
        System.out.printf("[리스너]세션 속성 추가 : %s = %s\n", event.getName(), event.getValue());
    }

    // 세션에 속성이 제거되는 이벤트 감지
    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
//        HttpSessionAttributeListener.super.attributeRemoved(event);
        System.out.printf("[리스너]세션 속성 제거 : %s = %s\n", event.getName(), event.getValue());
    }

    // 세션에 속성이 변경되는 이벤트 감지
    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
//        HttpSessionAttributeListener.super.attributeReplaced(event);
        System.out.printf("[리스너]세션 속성 변경 : %s = %s\n", event.getName(), event.getValue());
    }
}