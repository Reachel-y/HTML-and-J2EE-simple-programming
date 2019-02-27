<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");
 //response.setContentType("text/html;charset=gb2312");pageEncoding="utf-8"
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 

<title>数据库person表中的数据</title>
<link rel="stylesheet" type="text/css" href="for_show_db.css"/>
</head>
<body>
    <%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
 	//指定连接数据库的url
 	 String DB_URL = "jdbc:mysql://localhost/java_test?useUnicode=true&characterEncoding=UTF-8";
 	//mysql用户名
 	 String sql_name = "root";
 	//mysql密码
 	 String pwd = "mysql5217";
 	 //加载jdbc驱动  
 	 Class.forName(JDBC_DRIVER);                  
     String url = "jdbc:mysql://localhost/java_test?useUnicode=true&characterEncoding=UTF-8";
     Connection conn = (Connection) DriverManager.getConnection(DB_URL,sql_name,pwd);  
     Statement stmt = (Statement) conn.createStatement();  //连接实例
    %>
    <!-- <img alt="" src=<%=request.getContextPath()%>/img/2.jpg  width="100%" height="100%" style="z-index:-100;position:absolute;left:0;top:0"> -->
    <h2>数据表user信息</h2>
    <table style="text-align:center;">
        <tr>
            <th>username</th>
            <th>password</th>
        </tr>
        <% 
        String tmp1 = "SELECT * FROM users";
        ResultSet rs1 = stmt.executeQuery(tmp1);
        while(rs1.next()) {
            String username = rs1.getString("username");
            String password = rs1.getString("pass");
        %>
        <tr>
            <td><%= username%></td>
            <td><%= password%></td>
        </tr>
        <%
        }
        rs1.close();
        %>
    </table>

    <h2>数据表person信息</h2>
    <table>
        <tr>
            <th>username</th>
            <th>name</th>
            <th>age</th>
            <th>telenum</th>
        </tr>
        <% 
        String tmp2 = "SELECT * FROM person";   
        ResultSet rs2 = stmt.executeQuery(tmp2);
        while(rs2.next()) {
            String username = rs2.getString("username");
            String name = rs2.getString("name");
            int age = rs2.getInt("age");
            String age2 = Integer.toString(age);
            int telenum = rs2.getInt("telenum");
            String telenum2 = Integer.toString(telenum);
            if(age==0){
            	age2 = null;
            }
            if(telenum==0){
            	telenum2 = null;
            }
        %>
        <tr>
            <td><%= username%></td>
            <td><%= name%></td>
            <td><%= age2%></td>
            <td><%= telenum2%></td>
        </tr>
        <%
        }
        rs2.close();
        stmt.close();
        conn.close();
        %>
        </table>
        <p><a href="opera_db.jsp">返回数据库操作</a></p>
</body>
</html>
