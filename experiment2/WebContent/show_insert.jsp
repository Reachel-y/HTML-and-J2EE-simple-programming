<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import ="java.util.regex.Pattern" import ="java.util.regex.Matcher"%>
<%request.setCharacterEncoding("utf-8");
 //response.setContentType("text/html;charset=gb2312");pageEncoding="utf-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 

<title>The results of the insert data</title>
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
     String username = null;
     String name = null;
     String age = "0";
     String telenum = "0";
     
     username =new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
     name = new String( request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
     //username = request.getParameter("username");
     //name = request.getParameter("name");
     age = request.getParameter("age");
     telenum = request.getParameter("telenum");
     
     boolean flag1 = true;
     boolean flag2 = true;
     
     String tmpAge = age;
     String tmpTelenum = telenum;
     
     Statement stmt = (Statement) conn.createStatement();  //连接实例
     String sql= "SELECT * FROM person where username='"+username+"'"; 
     ResultSet result = stmt.executeQuery(sql); 
     %>
     <!-- <img alt="" src=<%=request.getContextPath()%>/img/2.jpg  width="100%" height="100%" style="z-index:-100;position:absolute;left:0;top:0"> -->
     <h1 style="text-align:center;">数据库操作结果</h1>
     <p style="text-align:center;"> 
        <%
 	   if(result.next()){
        	   if(age.isEmpty()){
        		   age = "0";
        	   }
        	   if(telenum.isEmpty()){
        		   telenum = "0";
        	   }
        	   for(int i=0;i<tmpAge.length();i++){
        		   if(!Character.isDigit(tmpAge.charAt(i))){
        			   flag1 = false;
        		   }
        	   }
        	   for(int i=0;i<tmpTelenum.length();i++){
        		   if(!Character.isDigit(tmpTelenum.charAt(i))){
        			   flag2 = false;
        		   }
        	   }
        	   if(!flag1) out.println("age error");
        	   if(!flag2) out.println("telenum error");
        	   if(flag1&&flag2){
        		   String tmp="update person set name='"+name+"',age='"+age+"',telenum = '"+telenum+"' where username= '"+username+"'";
                   stmt.executeUpdate(tmp);
                   out.println("成功更新:"+username);
        	   }
           }
           else {
        	   if(age.isEmpty()){
        		   age = "0";
        	   }
        	   if(telenum.isEmpty()){
        		   telenum = "0";
        	   }
        	   for(int i=0;i<tmpAge.length();i++){
        		   if(!Character.isDigit(tmpAge.charAt(i))){
        			   flag1 = false;
        		   }
        	   }
        	   for(int i=0;i<tmpTelenum.length();i++){
        		   if(!Character.isDigit(tmpTelenum.charAt(i))){
        			   flag2 = false;
        		   }
        	   }
        	   if(!flag1) out.println("age error");
        	   if(!flag2) out.println("telenum error");
        	   if(flag1&&flag2){
        		   String tmp="insert into person(username,name,age,telenum) values('"+username+"','"+name+"',+'"+age+"','"+telenum+"')";
                   stmt.executeUpdate(tmp);
                   out.println("成功插入:"+username);   
        	   }  
           }
        %>
       <%
          sql = "select *from users where username= '"+username+"'";
          ResultSet result1 = stmt.executeQuery(sql); 
          if(!result1.next()&&flag1&&flag2){
              String tmp = "insert into users(username,pass) values('"+username+"','12345')";
              stmt.executeUpdate(tmp);
          }
          result1.close();
          result.close();          
          stmt.close();
          conn.close();
       %>
     <br> <br>
     <a style="text-align:center;" href="show_db.jsp">查看数据库数据</a><br>
     <a style="text-align:center;" href="opera_db.jsp">返回数据库操作</a>
     </p>
</body>
</html>
