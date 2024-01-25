package el;

public class MyELClass {
    // 주민번호를 입력받아 성별 반환
    public String getGender(String resiNo) {
        int beginIdx = resiNo.indexOf("-") + 1;
        int genderInt = Character.getNumericValue(resiNo.charAt(beginIdx));
//        int genderInt = Character.digit(resiNo.charAt(beginIdx), 10);

        return switch (genderInt) {
            case 1, 3 -> "남자";
            case 2, 4 -> "여자";
            default -> "주민번호 오류";
        };
    }

    // 입력받은 문자열이 숫자인지 판별
    public static boolean isNumber(String value) {
        return value != null && value.matches("[0-9.]+");
//        char[] chArr = value.toCharArray();
//        for (char ch : chArr) {
//            // version 1
//            if (ch < '0' || ch > '9') {
//                return false;
//            }
//            // version 2
//            if (!Character.isDigit(ch)) {
//                 return false;
//            }
//        }
//        return true;
    }

    // 입력받은 정수까지의 구구단을 HTML 테이블로 출력
    public static String showGugudan(int limitDan) {
        StringBuffer sb = new StringBuffer();
//        try {
            sb.append("<table border='1'>");

            for (int i = 2; i <= limitDan; i++) {
                sb.append("<tr>");

                for (int j = 1; j <= 9; j++) {
                    String dan = String.format("<td>%d × %d = %d</td>", i, j, i * j);
                    sb.append(dan);
                }

                sb.append("</tr>");
            }

            sb.append("</table>");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        return sb.toString();
    }
}