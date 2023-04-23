package com.jdc.shop.model;

import java.util.List;

import com.jdc.shop.model.entity.SaleItem;
import com.jdc.shop.model.entity.Vouncher;



public interface SaleModel {
	static SaleModel model() {
		return new SaleModelImpl();
	}

	List<Vouncher> getSaleHistory();

	Vouncher findById(int id);

	int create(String customer, List<SaleItem> sales);
}
