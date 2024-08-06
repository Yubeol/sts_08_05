<%@ page import="java.util.List, java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    List<Map<String, Object>> articles = (List<Map<String, Object>>) request.getAttribute("articles");
    Integer currentPage = (Integer) request.getAttribute("currentPage");
    Integer totalPages = (Integer) request.getAttribute("totalPages");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>

    <h2>게시물 목록</h2>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>제목</th>
                <th>날짜</th>
                <th>내용</th>
            </tr>
        </thead>
        <tbody>
            <% for (Map<String, Object> article : articles) { %>
                <tr>
                    <td><%= article.get("id") %></td>
                    <td><%= article.get("title") %></td>
                    <td><%= article.get("regDate") %></td>
                    <td><%= article.get("body") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <div>
        <a href="?page=<%= currentPage - 1 %>" <%= (currentPage <= 1) ? "style='pointer-events: none; color: grey;'" : "" %>>이전</a>
        <% for (int i = 1; i <= totalPages; i++) { %>
            <a href="?page=<%= i %>" <%= (i == currentPage) ? "style='font-weight: bold;'" : "" %>><%= i %></a>
        <% } %>
        <a href="?page=<%= currentPage + 1 %>" <%= (currentPage >= totalPages) ? "style='pointer-events: none; color: grey;'" : "" %>>다음</a>
    </div>

</body>
</html>
