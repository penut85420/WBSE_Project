package yelp.wbse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;


public class SearchHandleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Gson gson = new Gson();
		
		String key = request.getParameter("key");
		/*YelpAPI yelpapi = new yelpapi(key);
		request.getSession().setAttribute("yelp", yelpapi);*/
		if(request.getSession().getAttribute("yelp")!=null){
			response.getWriter().write(gson.toJson("success"));
			}
		else{
			response.getWriter().write(gson.toJson("error"));
		}
	}
}
