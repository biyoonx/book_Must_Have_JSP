<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-28
  Time: 오전 1:47
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/Common/common.css" />
</head>
<body>
    <h2>파일 첨부형 게시판 - 목록 보기(List)</h2>

<%--    검색 폼--%>
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord" />
                    <input type="submit" value="검색하기" />
                </td>
            </tr>
        </table>
    </form>

<%--    목록 테이블--%>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="*"></th>
            <th width="15%"></th>
            <th width="10%"></th>
            <th width="15%"></th>
            <th width="8%"></th>
        </tr>
        <c:choose>
            <c:when test="${ empty boardList }">
                <tr>
                    <td colspan="6" align="center">등록된 게시물이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ boardList }" var="row" varStatus="loop">
                    <tr align="center">
                        <td>
                            ${ map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index)}
                        </td>
                        <td align="left">
                            <a href="<%= application.getContextPath() %>/14MVCBoard/mvcboard/view.do?idx=${ row.idx }">${ row.title }</a>
                        </td>
                        <td>
                            ${ row.name }
                        </td>
                        <td>
                            ${ row.visitcount }
                        </td>
                        <td>
                            ${ row.postdate }
                        </td>
                        <td>
                            <c:if test="${ not empty row.ofile }">
                                <a href="<%= application.getContextPath() %>/14MVCBoard/mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[다운로드]</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>

<%--    하단 메뉴(바로가기, 글쓰기)--%>
    <table border="1" width="90%">
        <tr align="center">
            <td>
                ${ map.pagingImg }
            </td>
            <td width="100">
                <button onclick="location.href='<%= application.getContextPath() %>/14MVCBoard/mvcboard/write.do';">글쓰기</button>
            </td>
        </tr>
    </table>
</body>
</html>