package com.jdc.legacy;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var path = req.getServletPath();
		System.out.println("path :"+path);
		switch (path) {
		case "/hello" -> hello(req);
		case "/count-up" -> countUp(req);
		case "/greeting" -> greet(req);
		}
		getServletContext().getRequestDispatcher("/home.jsp").forward(req, resp);
	}

	private void hello(HttpServletRequest req) {
		
		req.setAttribute("message", "Hello Legacy Servlet.");
	}

	private void countUp(HttpServletRequest req) {
		
		var session = req.getSession(true);
		var obj = session.getAttribute("count");
		int count = 0;
		if (null != obj) {
			count = Integer.parseInt(obj.toString());
		}
		count++;
		session.setAttribute("count", count);
		req.setAttribute("message", String.format("Count is %d", count));
	}

	private void greet(HttpServletRequest req) {
	}
}
