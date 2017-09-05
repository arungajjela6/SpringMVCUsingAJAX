package com.mtc.app.entity;

import java.util.List;

public interface InterfaceProduct {

	List<product> fetchProduct();
	
	product fetchProductById(int id);
	
	public void deleteProduct(int id);
	
	public void addProduct(product product);
	
	public void editProduct(product product);
}
