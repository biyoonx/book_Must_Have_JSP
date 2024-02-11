<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-12
  Time: 오전 12:24
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 API</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/Common/common.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
        // [검색 요청] 버튼 클릭 시 실행할 메서드 정의
        $(function () {
            $('#searchBtn').click(function () {
                $.ajax({
                    url: '<%= application.getContextPath() %>/NaverSearchAPI.do', // 요청 URL
                    type: 'get', // HTTP 메서드
                    data: { // 메서드로 전달할 데이터
                        keyword: $('#keyword').val(), // 검색어
                        startNum: $('#startNum option:selected').val() // 검색 시작 위치
                    },
                    dataType: 'json', // 응답 데이터 형식
                    success: sucFuncJson, // 요청 성공 시 호출할 메서드 설정
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });

        // 검색 성공 시 결과를 화면에 뿌려줌
        function sucFuncJson(data) {
            let str = '';
            $.each(data.items, function(index, item) {
                str += `
                <ul>
                    <li>${"${index + 1}"}</li>
                    <li>${"${item.title}"}</li>
                    <li>${"${item.description}"}</li>
                    <li>${"${item.bloggername}"}</li>
                    <li>${"${item.bloggerlink}"}</li>
                    <li>${"${item.postdate}"}</li>
                    <li><a href="${"${item.link}"}" target="_black">바로가기</a></li>
                </ul>
                `;
            });
            $('#searchResult').html(str);
        }

        // 검색 실패 시 경고창의 띄워줌
        function errFunc(e) {
            alert(`실패 : ${"${e.status}"}`);
        }
    </script>
    <style>
        ul {
            border: 2px solid #ccc;
        }
    </style>
</head>
<body>
    <div>
        <div>
            <form id="searchFrm">
                <p>한 페이지에 10개 씩 출력됨</p>
                <select id="startNum">
                    <option value="1">1페이지</option>
                    <option value="11">2페이지</option>
                    <option value="21">3페이지</option>
                    <option value="31">4페이지</option>
                    <option value="41">5페이지</option>
                </select>
                <input type="text" id="keyword" placeholder="검색어를 입력하세요." />
                <button type="button" id="searchBtn">검색 요청</button>
            </form>
        </div>
        <div class="row" id="searchResult">
            여기에 검색 결과가 출력됩니다.
        </div>
    </div>
</body>
</html>