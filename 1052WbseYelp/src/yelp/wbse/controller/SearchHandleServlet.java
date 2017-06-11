package yelp.wbse.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import org.json.*;
import com.google.gson.Gson;
import java.sql.*;
import yelp.db.model.DBConnection;
import yelp.wbse.model.*;

public class SearchHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		String search = request.getParameter("search");
		String collect = request.getParameter("collect");
		String key = request.getParameter("key");
		if (search != null) { // create API
			YelpParameter yelpparameter = new YelpParameter();
			yelpparameter.setParam("term", key);
			yelpparameter.setParam("location", "taipei");
			String tmp = YelpSearch.getBusinesses(yelpparameter);
			
			ArrayList<YelpBusiness> arr = null;
			try {
				arr = YelpBusiness.getBusinessList(tmp);
				String ttmp = YelpSearch.getReview(arr.get(0).getBusinessID().toString());
				ArrayList<YelpReview> arrReview = YelpReview.getReviewList(ttmp);
				request.getSession().setAttribute("yelpReview", arrReview.get(0).getReview());
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (arr != null) {
				request.getSession().setAttribute("yelp", arr);
			}
			if (request.getSession().getAttribute("yelp") != null) {
				response.getWriter().write(gson.toJson("success"));
			} else {
				response.getWriter().write(gson.toJson("error"));
			}
		} else if (collect != null) {
			System.out.println(collect);
			JSONArray arra = (JSONArray) request.getSession().getAttribute("userCollect");
			String choice = request.getParameter("collect");
			arra.put(choice);
			String userID = (String) request.getSession().getAttribute("userID");
			DBConnection db = (DBConnection) getServletContext().getAttribute("db");
			System.out.println(
					"update favorite SET keep='{\"keep\": " + arra.toString() + "}' where userID='" + userID + "'");
			try {
				db.updateSql("update favorite SET keep=\'{\"keep\": " + arra.toString() + "}' where userID='" + userID
						+ "'");
				request.getSession().setAttribute("userCollect", arra);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (request.getSession().getAttribute("userCollect") != null) {
				response.getWriter().write(gson.toJson("success"));
			} else {
				response.getWriter().write(gson.toJson("error"));
			}
		}
	}
}
