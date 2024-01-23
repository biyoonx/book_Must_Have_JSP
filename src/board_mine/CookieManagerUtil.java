package board_mine;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class CookieManagerUtil {
    public static void makeCookie(HttpServletResponse response, String cookieName, String cookieValue, int minutes) {
        Cookie cookie = new Cookie(cookieName, cookieValue);
        cookie.setPath("/");
        cookie.setMaxAge(minutes * 60);
        response.addCookie(cookie);
    }
    public static String readCookie(HttpServletRequest request, String cookieName) {
        Cookie[] allCookies = request.getCookies();
        Optional<Cookie> cookie = Optional.empty();
        if (allCookies != null) {
            List<Cookie> cookies = Arrays.asList(allCookies);
            cookie = cookies.stream()
                    .filter(c -> c.getName().equals(cookieName))
                    .findAny();
        }
        return cookie.map(Cookie::getValue).orElse(null);
    }
    public static void deleteCookie(HttpServletResponse response, String cookieName) {
        makeCookie(response, cookieName, null, 0);
    }
}