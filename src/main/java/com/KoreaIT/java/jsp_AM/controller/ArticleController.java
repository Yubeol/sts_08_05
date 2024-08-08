package com.KoreaIT.java.jsp_AM.contoller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.KoreaIT.java.jsp_AM.service.ArticleService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ArticleController {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private Connection conn;

	private ArticleService articleService;

	public ArticleController(HttpServletRequest request, HttpServletResponse response, Connection conn) {
		this.conn = conn;
		this.request = request;
		this.response = response;

		this.articleService = new ArticleService(conn);
	}

	public void showList() throws ServletException, IOException {
		int page = 1;

		if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int itemsInAPage = 10;
		int limitFrom = (page - 1) * itemsInAPage;

		int totalCnt = articleService.getTotalCnt();
		int totalPage = (int) Math.ceil(totalCnt / (double) itemsInAPage);

		List<Map<String, Object>> articleRows = articleService.getForPrintArticles(limitFrom, itemsInAPage);

		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("articleRows", articleRows);
		request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
	}

}