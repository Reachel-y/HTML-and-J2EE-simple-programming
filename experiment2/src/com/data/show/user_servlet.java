package com.data.show;

import java.util.*;
import java.sql.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import com.entities.*;

public class user_servlet extends HttpServlet{
	public void init() throws ServletException{
		try {
			String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		 	 Class.forName(JDBC_DRIVER);                   //º”‘ÿjdbc«˝∂Ø  
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("There are some problems");
		}
	}
	
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		Connection conn = null;
		PreparedStatement pStatement = null;
	}
}
