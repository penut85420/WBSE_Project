package yelp.wbse.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import yelp.db.model.DBConnection;

public class RegisterServer {
	//不用關資料庫
	public String registerAdd(DBConnection conn, String account, String password, String passwordCheck, String name,
			String birthday, String agree) {
		try {
			System.out.println("server 傳入的參數: " + account);
			// 判斷錯誤
			String errors = new String();
			if (account == "" || password == "" || passwordCheck == "" || name == "" || birthday == "") {
				errors = "失敗!請確認所有欄位已填寫!";
				return errors;
			} else if (isInvalidUsername(account, conn)) {
				errors = "失敗!使用者帳號已註冊過!";
				return errors;
			} else if (isInvalidAccount(account) == false) {
				errors = "失敗!請輸入正確的帳號!";
				return errors;
			} else if (isInvalidPassword(password, passwordCheck)) {
				errors = "失敗!請確認密碼符合格式並再度確認密碼!";
				return errors;
			} else if (isInvalidAgree(agree)) {
				errors = "失敗!請先閱讀並同意使用者條款!";
				return errors;
			}
			// 都沒有錯誤才新增註冊資料進入資料庫
			else {
				String insertdbSQL = "insert into account(userID,account,password,name,birthday) "
						+ "select ifNULL(max(userID+0),0)+1,'" + account + "','" + password + "','"
						+ name + "','" + birthday + "' FROM account";
				
				int insert = conn.updateSql(insertdbSQL);
				System.out.println("Listener insert : " + insert);

				System.out.println("新增->account : " + account + "->password : " + password + "->name : " + name
						+"->birthday : " + birthday);
			}
		} catch (SQLException e) {
			System.out.println("InsertDB Exception :" + e.toString());
		}
		return "成功";
	}

	// 失敗!使用者帳號已註冊過!//已關資料庫
	private boolean isInvalidUsername(String account, DBConnection conn) {
		try {
			ResultSet rs = conn.runSql("select account from account WHERE BINARY account = '"+account+"' ");
			System.out.println("Listener runSql 成功");

			String s;
			while (rs.next()) {			
				return true; // true 代表已有此使用者
			}
			if (rs != null){ try {rs.close(); System.out.println("關閉ResultSet");} catch (SQLException ignore) {}}//關閉resultSet
			return false;// false 代表已有此使用者
		} catch (SQLException e) {
			System.out.println("isInvalidUsername Exception :" + e.toString());
		}
		return false;
	}

	// 失敗!請確認密碼符合格式並再度確認密碼!
	private boolean isInvalidPassword(String password, String confirmedPasswd) {
		return password == null || password.length() < 6 || password.length() > 15 || !password.equals(confirmedPasswd);
	}

	// 失敗!請輸入正確的帳號!
	private boolean isInvalidAccount(String account) {
		char[] array = account.toCharArray(); // array為account的字元陣列
		
		boolean flag = false;
		
		if(account.length() < 6 || account.length() > 15)
			return false;
		
		for(int i = 0; i < array.length; i++){
			if((array[i] >= 'A' && array[i] <= 'Z')||(array[i] >= 'a' && array[i] <= 'z')||(array[i] >= '0' && array[i] <= '9')){
				flag = true;
			}
			else
				return false;

		}
		return flag;
	}

	// 輸入的字元是否為數字(true->輸入的確實為數字)
	private boolean isNumber(char a) {
		int n = Character.getNumericValue(a); // 字元轉成數字，字元只接受英文跟數字
		System.out.println("n : " + n);
		if (n >= 10 || n < 0) { // 小於10的話回傳false
			return false;
		} else {
			return true;
		}
	}

	// 失敗!請先閱讀並同意使用者條款!
	private boolean isInvalidAgree(String agree) {
		if (agree.equals("false") == true)
			return true;
		else
			return false;
	}

	public static void main(String[] args) {
		RegisterServer jdbc = new RegisterServer();
		// jdbc.registerAdd("H222222222", "123456", "123456", "黃佳惠", "女",
		// "1995/11/22", "true");
		System.out.println("身份證字號長度是否正確 : " + jdbc.isInvalidAccount("H222222222"));
	}

}
