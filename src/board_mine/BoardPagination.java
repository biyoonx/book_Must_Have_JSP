package board_mine;

public class BoardPagination {
    public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
        StringBuilder pagingStr = new StringBuilder();
        String blank = "&nbsp;";

        // 전체 페이지 수 계산
        int totalPages = (int)Math.ceil((double)totalCount / pageSize);

        // <(이전 페이지 블록 바로가기) 출력
        int pageOfCurrentBlock = (int)Math.floor((double)(pageNum - 1) / blockPage) * blockPage + 1;
        if (pageNum > 1) {
            pagingStr.append(String.format("<a href=\"%s?pageNum=1\">[첫 페이지]</a>%s", reqUrl, blank));
        }
        if (pageOfCurrentBlock > blockPage) {
            pagingStr.append(String.format("<a href=\"%s?pageNum=%d\">[이전 블록]</a>%s", reqUrl, (pageOfCurrentBlock - 1), blank));
        }

        // 각 페이지 번호 출력
        for (int i = 0, currPage = pageOfCurrentBlock; i < blockPage && currPage <= totalPages; i++, currPage++) {
            if (currPage == pageNum) {
                pagingStr.append(String.format("%s%d%s", blank, currPage, blank));
            } else {
                pagingStr.append(String.format("%s<a href=\"%s?pageNum=%d\">%d</a>%s", blank, reqUrl, currPage, currPage, blank));
            }
        }

        // >(다음 페이지 블록 바로가기) 출력
        if (pageOfCurrentBlock + blockPage <= totalPages) {
            pagingStr.append(String.format("%s<a href=\"%s?pageNum=%d\">[다음 블록]</a>", blank, reqUrl, (pageOfCurrentBlock + blockPage)));
        }
        if (pageNum < totalPages) {
            pagingStr.append(String.format("%s<a href=\"%s?pageNum=%d\">[마지막 페이지]</a>", blank, reqUrl, totalPages));
        }

        return pagingStr.toString();
    }
}