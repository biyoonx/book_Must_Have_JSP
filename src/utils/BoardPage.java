package utils;

public class BoardPage {
    public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
        String pagingStr = "";

        // 전체 페이지 수 계산
        int totalPages = (int)Math.ceil((double)totalCount / pageSize);

        // 이전 페이지 블록 바로가기 출력
        int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
        if (pageTemp != 1) {
            pagingStr += String.format("""
                    <a href="%s?pageNum=1">[첫 페이지]</a>
                    &nbsp;
                    <a href="%s?pageNum=%d">[이전 블록]</a>
                    """, reqUrl, reqUrl, (pageTemp - 1));
        }

        // 각 페이지 번호 출력
        int blockCount = 1;
        while (blockCount <= blockPage && pageTemp <= totalPages) {
            if (pageTemp == pageNum) {
                pagingStr += String.format("&nbsp;%s&nbsp;", pageTemp);
            } else {
                pagingStr += String.format("&nbsp;<a href=\"%s?pageNum=%d\">%d</a>&nbsp;", reqUrl, pageTemp, pageTemp);
            }
            pageTemp++;
            blockCount++;
        }

        // 다음 페이지 블록 바로가기 출력
        if (pageTemp <= totalPages) {
            pagingStr += String.format("""
                    <a href="%s?pageNum=%d">[다음 블록]</a>
                    &nbsp;
                    <a href="%s?pageNum=%d">[마지막 페이지]</a>
                    """, reqUrl, pageTemp, reqUrl, totalPages);
        }

        return pagingStr;
    }
}