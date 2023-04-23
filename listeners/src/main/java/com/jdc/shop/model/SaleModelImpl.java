package com.jdc.shop.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.jdc.shop.model.entity.SaleItem;
import com.jdc.shop.model.entity.Vouncher;

public class SaleModelImpl implements SaleModel{

	private List<Vouncher> vounchers;
	
	public SaleModelImpl()
	{
		vounchers = new ArrayList<Vouncher>();
	}
	
	@Override
	public List<Vouncher> getSaleHistory() {
		return new ArrayList<Vouncher>(vounchers);
	}

	@Override
	public Vouncher findById(int id) {
		
		for(var vouncher : vounchers) {
			if(id == vouncher.getId()) {
				return vouncher;
			}
		}
		return null;
	}

	@Override
	public int create(String customer, List<SaleItem> sales) {
		var vouncher = new Vouncher();
		vouncher.setCustomer(customer);
		vouncher.setSales(sales);
		vouncher.setSaleTime(LocalDateTime.now());
		vouncher.setId(vounchers.size()+1);
		vounchers.add(vouncher);
		return vouncher.getId();
	}

}
