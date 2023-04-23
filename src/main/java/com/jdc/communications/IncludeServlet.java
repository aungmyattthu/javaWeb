package com.jdc.communications;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/include")
public class IncludeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// include Message (Relative Path) from ServletReqest
		var header = req.getRequestDispatcher("./header");
		header.include(req, resp);
		// title
		resp.getWriter().append("h1>Include Demo</h1>");
		// Include Message (Absolute Path) from ServletContext
		var context = getServletContext();
		// NamedDispatcher
		var message = context.getNamedDispatcher("IncludeMessage");
		// include via Named Dispatcher
		message.include(req, resp);

		// own message
		resp.getWriter().append("""
				<p>Hello from Owner Service</p>
				""");

		// Include Message (Named Dispatcher) from ServletContext
		var footer = context.getRequestDispatcher("/footer");
		footer.include(req, resp);
	}
}
