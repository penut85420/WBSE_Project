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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONArray jarr = (JSONArray) request.getSession().getAttribute("userCollect");
		try {
			ArrayList<YelpBusiness> arr= YelpIDBusiness.yelpcollect(jarr);
			request.getSession().setAttribute("showCollect", arr);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("userCollect.jsp");
	}
}

