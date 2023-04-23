package com.jdc.communications;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/redirect")
public class RedirectServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var name = req.getParameter("name");
		var phone = req.getParameter("phone");
		System.out.println(name);
		System.out.println(phone);

		var path = req.getContextPath().concat("/success.jsp");
		resp.sendRedirect(path);
	}
}
