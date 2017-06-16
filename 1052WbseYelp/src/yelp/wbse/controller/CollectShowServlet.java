package yelp.wbse.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import org.json.*;
import com.google.gson.Gson;
import java.sql.*;
import yelp.wbse.model.*;

public class CollectShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONArray jarr = (JSONArray) request.getSession().getAttribute("userCollect");
		try {
			ArrayList<YelpBusiness> arr= new ArrayList<YelpBusiness>();
			for(int i=0; i<jarr.length(); i++){
				arr.add(YelpSearch.getBusinesses(jarr.getString(i).toString()));
			}
			request.getSession().setAttribute("showCollect", arr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson gson = new Gson();
		if (request.getSession().getAttribute("userCollect") != null) {
			response.getWriter().write(gson.toJson("success"));
		}
	}
}

