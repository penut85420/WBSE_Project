package yelp.wbse.controller;

import java.io.IOException;
import com.google.gson.Gson;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.*;

import yelp.db.model.DBConnection;

public class YelpCollectServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session =request.getSession();
		Gson gson = new Gson();
		String userID = (String) session.getAttribute("userID");
		DBConnection db = (DBConnection) getServletContext().getAttribute("db");
		try {
			ResultSet rs = db.runSql("select keep from favorite where userID='"+userID+"'");
			String tmp = null;
			
			while (rs.next()) {
			 tmp = rs.getString("keep");
			}
			System.out.println(tmp);
			JSONObject jObj = new JSONObject(tmp);
			JSONArray arr = new JSONArray();
			if(jObj.getJSONArray("keep") != null){
				arr = jObj.getJSONArray("keep");
				System.out.println(arr);
				}
			session.setAttribute("userCollect", arr);
		} catch (SQLException e) {e.printStackTrace();} catch (JSONException e) {
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
