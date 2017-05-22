package yelp.wbse.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	public LogoutServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		Boolean result = true;
		// 回傳json型態
		Gson gson = new Gson();

		//消去session
		System.out.println("消去session");
		HttpSession session = request.getSession();
		session.invalidate();
		//String doctorID = (String) session.getAttribute("doctorID");
		//System.out.println("消去session後 doctorID內容 : " + doctorID);
		/*//確認是否已消去
		String doctorID = (String) session.getAttribute("doctorID");
		if(doctorID != null){
			result = false;
			response.getWriter().println("登入不成功session doctorID內容 : " + doctorID);
		}
		else{
			result = true;
			response.getWriter().write(gson.toJson("登出成功!"));
		}*/
		response.getWriter().write(gson.toJson(true));
	}
}
