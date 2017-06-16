package yelp.wbse.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import com.google.gson.Gson;
import yelp.wbse.model.*;

public class SearchUIHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		String search = request.getParameter("search");
		String key = request.getParameter("key");
		String location = request.getParameter("location");
		
		if (search != null) {
			YelpParameter param = new YelpParameter();
			param.setParam("term", key);
			param.setParam("location", location);
			String bssJson = YelpSearch.getBusinesses(param);
			
			ArrayList<YelpBusiness> bssResult = null;
			ArrayList<YelpReview> reviewResult = null;
			try {
				bssResult = YelpBusiness.getBusinessList(bssJson);
				String reviewJson = YelpSearch.getReview(bssResult.get(0).getBusinessID().toString());
				reviewResult = YelpReview.getReviewList(reviewJson);
			} catch (Exception e) { e.printStackTrace(); }
			
			if (bssResult != null) {
				request.getSession().setAttribute("yelp", bssResult);
				request.getSession().setAttribute("yelpReview", reviewResult.get(0).getReview());
				response.getWriter().write(gson.toJson("success"));
			} else response.getWriter().write(gson.toJson("error"));
		}
	}
}
