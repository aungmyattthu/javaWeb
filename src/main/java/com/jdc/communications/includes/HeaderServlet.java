package com.jdc.communications.includes;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/header")
public class HeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String HEADER = """
						<!DOCTYPE html>
			<html>
			<head>
			<meta charset="UTF-8">
			<title>communications</title>
			</head>
			<body>
				<""";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// html Header
		resp.getWriter().append(HEADER);
	}
}
