<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");
 //response.setContentType("text/html;charset=gb2312");pageEncoding="utf-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 

<title>The results of the insert data</title>
<link rel="stylesheet" type="text/css" href="forIndex.css"/>
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
 	
 	 Class.forName(JDBC_DRIVER);                   //加载jdbc驱动  
     String url = "jdbc:mysql://localhost/java_test?useUnicode=true&characterEncoding=UTF-8";
     Connection conn = (Connection) DriverManager.getConnection(DB_URL,sql_name,pwd);  
     String username = new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
     /*String name = request.getParameter("name");
     String age = request.getParameter("age");
     String telenum = request.getParameter("telenum");*/
     Statement stmt = (Statement) conn.createStatement();  //连接实例
     String sql= "SELECT * FROM person where username='"+username+"'"; 
     ResultSet result = stmt.executeQuery(sql); 
     %>
     <!-- <img alt="" src=<%=request.getContextPath()%>/img/2.jpg  width="100%" height="100%" style="z-index:-100;position:absolute;left:0;top:0"> -->
     <h1 style="text-align:center;">数据库操作结果</h1>
     <p style="text-align:center;"> 
        <%
           if(result.next()){
        	   String tmp="delete from person  where username= '"+username+"'";
               stmt.executeUpdate(tmp);
               out.println("成功删除:"+username);
           }
           else {
               out.println("This user is not found here.");
           }
        %>
       <%
          sql = "select *from users where username= '"+username+"'";
          ResultSet result1 = stmt.executeQuery(sql); 
          if(result1.next()){
              String tmp = "delete from users where username= '"+username+"'";
              stmt.executeUpdate(tmp);
          }
          result1.close();
          result.close();          
          stmt.close();
          conn.close();
       %>
     <br>
     <a style="text-align:center;" href="show_db.jsp">查看数据库数据</a>
     </p>
</body>
</html>
