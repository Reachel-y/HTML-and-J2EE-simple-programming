<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 

<link rel="stylesheet" type="text/css" href="forIndex.css"/>
<title>index</title>
</head>
<body >
    <form action="show_insert.jsp">
       <table>
          <tr>
          <th>数据库表person插入信息</th>
          </tr> 
          <tr>
          <td>username<span><input type="text" name="username"></span></td>
          </tr>
          <tr>
          <td>name<span><input type="text" name="name"></span> </td>
          </tr> 
          <tr>
          <td>age<span><input type="text" name="age"></span></td>
          </tr>
          <tr>
          <td>telenum<span><input type="text" name="telenum"></span></td>
          </tr>
          <tr>
          <td><span id="submit"><input type="submit" name="submit" value="插入"></span></td>
          </tr>
       </table>
    </form>
    <form action="show_delete.jsp">
       <table >
          <tr>
          <th>数据库表user删除信息</th>
          </tr> 
          <tr>
          <td>username<span><input type="text" name="username"></span></td>
          </tr>
          <tr>
          <td><span id="submit"><input type="submit" name="submit" value="删除"></span></td>
          </tr>
       </table>
    </form>
</body>
</html>