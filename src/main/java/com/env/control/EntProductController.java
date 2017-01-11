package com.env.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.env.entity.EntProduct;
import com.env.service.IEntProductManager;

/**
 * 企业主要生产产品
 * @author hbj403
 */
@Controller
public class EntProductController {

	@Resource(name="entProductManager")
	private IEntProductManager entProductManager;
	
	@RequestMapping("/addEntProduct")
	public String addEntprise(EntProduct entProduct){
		entProductManager.addEntProduct(entProduct);
		return "redirect:/getAllEntProduct";
	}
	
	@RequestMapping("/getAllEntProduct")
	public String getAllEntProduct(HttpServletRequest request){
		List<EntProduct> entProduct = entProductManager.getAllEntProduct();
		request.setAttribute("entProduct", entProduct);
		return "/entProductManager";
	}
	
	@RequestMapping("/delEntProduct")
	public void delEntProduct(String entUserId,HttpServletResponse response){
		String result = "{\"result\":\"error\"}";
		if(entProductManager.delEntProduct(entUserId)){
			result = "{\"result\":\"success\"}";
		}
		PrintWriter out = null;
		response.setContentType("application/json");
		
		try {
			out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
