package yelp.wbse.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import yelp.wbse.model.*;

public class SearchHandleServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Gson gson = new Gson();
		
		String key = request.getParameter("key");
		YelpParameter yelpparameter = new YelpParameter();
		yelpparameter.setParam("term", key);
		yelpparameter.setParam("location", "taipei");
		String tmp = YelpSearch.getBusinesses(yelpparameter);
		ArrayList<YelpBusiness> arr = null;
		try {
			arr = YelpBusiness.getBusinessList(tmp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (arr != null) {
			YelpBusiness b = arr.get(0);
			request.getSession().setAttribute("yelp", b.getBusinessID());
		}
		if(request.getSession().getAttribute("yelp")!=null){
			response.getWriter().write(gson.toJson("success"));
			}
		else{
			response.getWriter().write(gson.toJson("error"));
		}
	}
}
