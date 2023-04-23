package com.jdc.legacy;

import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

public class CounterListener implements HttpSessionAttributeListener {
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		var name = se.getName();
		System.out.printf("%s is created new.%n", name);
	}
	
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		var name = se.getName();
		System.out.printf("%s is replaced.%n", name);
	}
}
