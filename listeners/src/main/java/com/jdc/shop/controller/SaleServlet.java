package com.jdc.shop.controller;

import java.io.IOException;
import java.util.List;

import com.jdc.shop.model.SaleModel;
import com.jdc.shop.model.ShoppingCart;
import com.jdc.shop.model.entity.Vouncher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sale-history", "/sale-details", "/checkout" })
public class SaleServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SaleModel model;

	@Override
	public void init() throws ServletException {
		var application = getServletContext();
		model = (SaleModel) application.getAttribute("sale.model");

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		switch (req.getServletPath()) {
		case "/sale-history":
			showSaleHistory(req, resp);
			break;
		case "/sale-details":
			showDetails(req, resp);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/// get customer name
		var customer = req.getParameter("customer");
		// get sale items from shopping cart
		var cart = (ShoppingCart)req.getSession().getAttribute("cart");
		var sales = cart.items();
		// create vouncher
		var vouncherId = model.create(customer, sales);
		// reset shopping cart
		req.getSession().removeAttribute("cart");
		// redirect to sale details
		resp.sendRedirect(req.getServletContext().getContextPath().concat("/sale-details?id=")+vouncherId);
	}

	private void showDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get id from request
		var str = req.getParameter("id");
		var id = Integer.parseInt(str);

		var vouncher = model.findById(id);
		// set voucher to request scope
		req.setAttribute("data", vouncher);

		getServletContext().getRequestDispatcher("/sale-details.jsp").forward(req, resp);
	}

	private void showSaleHistory(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// get sale list from sale model
		List<Vouncher> list = model.getSaleHistory();
		// add sales list to request scope
		req.setAttribute("data", list);
		// forward to sale list jsp
		getServletContext().getRequestDispatcher("/sale-list.jsp").forward(req, resp);

	}
}
