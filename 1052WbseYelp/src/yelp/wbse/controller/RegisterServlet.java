package yelp.wbse.controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import yelp.db.model.DBConnection;
import yelp.wbse.model.RegisterServer;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String agree = request.getParameter("agree");

		String errors = new String(); // 錯誤訊息

		// 新增註冊
		DBConnection db = (DBConnection) getServletContext().getAttribute("db");
		
		RegisterServer register = new RegisterServer();
		errors = register.registerAdd(db, account, password, passwordCheck, name, birthday, agree);
		System.out.println("RegisterServlet registerAdd: " + errors);

		// 回傳json型態
		Gson gson = new Gson();
		response.getWriter().write(gson.toJson(errors));
	}
}
