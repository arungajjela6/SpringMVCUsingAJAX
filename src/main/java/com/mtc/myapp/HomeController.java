package com.mtc.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mtc.app.entity.InterfaceProduct;
import com.mtc.app.entity.product;

@Controller
public class HomeController {
	
	@Autowired
	private InterfaceProduct productDAO;

	@RequestMapping(value = "/")
	public ModelAndView list() {

		ModelAndView modelandview = new ModelAndView("homee");

		return modelandview;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAll(product product) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<product> list = productDAO.fetchProduct();

		if (list != null) {
			map.put("status", "200");
			map.put("message", "Data found");
			map.put("data", list);
		} else {
			map.put("status", "404");
			map.put("message", "Data not found");

		}

		return map;
	}
	 
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> delete(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
			
			productDAO.deleteProduct(id);
			map.put("status", "200");
			map.put("message", "Your record have been deleted successfully");
		
		return map;
	}
	 
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getSaved(product product) {
		Map<String, Object> map = new HashMap<String, Object>();

			productDAO.addProduct(product);
			map.put("status", "200");
			map.put("message", "Your record have been saved successfully");
		
		return map;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> UpdateProduct(product product) {
		Map<String, Object> map = new HashMap<String, Object>();
			System.out.println(product.getId());
			System.out.println(product.getName());
			System.out.println(product.getDept());
			System.out.println(product.getPrice());
			productDAO.editProduct(product);
			map.put("status", "200");
			map.put("message", "Your record have been successfully updated");
		
		return map;
	}
}
