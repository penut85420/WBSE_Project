package yelp.wbse.model;

import java.sql.*;
import java.util.HashMap;

import yelp.db.model.DBConnection;

public class LoginVerification {

	//已關資料庫
	public HashMap<String, String> verification(DBConnection conn, String account, String password) {
		String result = "請重新嘗試";
		String s, p, userID = null;
		
		try {
			ResultSet rs = conn.runSql("select userID, account, password from account");
			System.out.println("Listener runSql 成功");

			while (rs.next()) {
				s = rs.getString("account");
				p = rs.getString("password");
				if (account.equals(s) == true) {// true 代表已有此使用者
					if (password.equals(p) == true) {
						result = "登入成功";// true 代表此使用者密碼正確
						userID = rs.getString("userID");
						System.out.println("帳密正確");
						break;
					} else {
						result = "請輸入密碼或密碼錯誤"; // false 代表此使用者密碼不正確
						System.out.println("密碼錯誤");
						break;
					}
				} else {
					result = "沒有此使用者";// false 代表沒有此使用者
					System.out.println("搜尋使用者...");
				}
			}
			if (rs != null){ try {rs.close(); System.out.println("關閉ResultSet");} catch (SQLException ignore) {}}//關閉resultSet
			
		} catch (SQLException e) {
			System.out.println("LogintDB Exception :" + e.toString());
		}
		HashMap<String, String> loginResult = new HashMap<String, String>();
		loginResult.put("result", result);
		loginResult.put("userID", userID);
		return loginResult;
	}
}
