package yelp.wbse.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.*;
import com.google.gson.Gson;
import java.sql.*;
import yelp.db.model.DBConnection;
import yelp.wbse.model.*;

public class SearchHandleServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Gson gson = new Gson();
		String search = request.getParameter("search");
		String collect = request.getParameter("collect");
		String key = request.getParameter("key");
		if(search!=null){ // create API
			YelpParameter yelpparameter = new YelpParameter();
			yelpparameter.setParam("term", key);
			yelpparameter.setParam("location", "taipei");
			String tmp = YelpSearch.getBusinesses(yelpparameter);
			ArrayList<YelpBusiness> arr = null;
			try {
				arr = YelpBusiness.getBusinessList(tmp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (arr != null) {
				request.getSession().setAttribute("yelp", arr);
			}
			if(request.getSession().getAttribute("yelp")!=null){
				response.getWriter().write(gson.toJson("success"));
				}
			else{
				response.getWriter().write(gson.toJson("error"));
			}
		}
		else if(collect!=null){
			JSONArray arra= (JSONArray)request.getSession().getAttribute("usercollect");
			String choice = request.getParameter("collect");
			arra.put(choice);
			String userID = (String)request.getSession().getAttribute("userID");
			DBConnection db = (DBConnection) getServletContext().getAttribute("db");
			try {
				db.runSql("update favorite SET keep="+arra+" where userID="+userID);
				request.getSession().setAttribute("userCollect", arra);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(request.getSession().getAttribute("userCollect")!=null){
				response.getWriter().write(gson.toJson("success"));
				}
			else{
				response.getWriter().write(gson.toJson("error"));
			}
		}
	}
}
