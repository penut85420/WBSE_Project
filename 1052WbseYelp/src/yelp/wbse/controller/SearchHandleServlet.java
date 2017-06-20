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
		String location = request.getParameter("location");
		String collectmethod = request.getParameter("collectmethod");
		if (search != null) {
			YelpParameter yelpparameter = new YelpParameter();
			yelpparameter.setParam("term", key);
			yelpparameter.setParam("location", location);
			ArrayList<YelpBusiness> arr = new ArrayList<YelpBusiness>();
			arr = YelpSearch.getBusiness(yelpparameter);
			request.getSession().setAttribute("yelp", arr);
<<<<<<< HEAD
			JSONArray jarr = (JSONArray) request.getSession().getAttribute("userCollect");
			int x [] = new int [25];
			for(int i=0; i<arr.size(); i++){
				for(int c=0; c<jarr.length();c++){
					try {
						if(arr.get(i).getBusinessID().toString().equals(jarr.get(c).toString())){
							x[i]=1;
							System.out.println(arr.get(i).getBusinessID()+"----"+jarr.get(c).toString());
						}
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(x[i]!=1)x[i]=0;
			}
			request.getSession().setAttribute("heart", x);
			
=======
			request.getSession().setAttribute("nearby",request.getParameter("location") );
>>>>>>> bf67523b684dfbccf7eeffea8b56b2ee2f9eeac0
			if (request.getSession().getAttribute("yelp") != null)
				response.getWriter().write(gson.toJson("success"));
			else
				response.getWriter().write(gson.toJson("error"));
		} else if (collect != null) {
			System.out.println(collect);
			JSONArray arra = (JSONArray) request.getSession().getAttribute("userCollect");
			String choice = request.getParameter("collect");
			if(collectmethod=="1"){
				arra.put(choice);
			}
			else
			{
				for(int cou=0;cou<arra.length();cou++){
					try {
						if(collect.equals(arra.get(cou).toString()))
							arra.remove(cou);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
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
