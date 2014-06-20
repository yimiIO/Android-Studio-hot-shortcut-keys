<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page  import="zpy.model.*"%>
<%
User user=(User)session.getAttribute("user");
  if(user==null){
	  request.getRequestDispatcher("login.jsp").forward(request,response);
  }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/blog/aha/style.css" />

</head>
<body>
<div id="container">	
<div id="banner">
		<h1>BernieZPY-做很酷的事情，改变世界</h1>
</div>
<div id="menu">
	欢迎, <% if(user!=null){
			out.print(user.getUsername());
			}%>用户
	 | <a href="/blog/PreAddBlogServlet">发博文</a>
	 | <a href="/blog/AdminBlogListServlet">博文管理</a>
	 | <a href="/blog/aha/addCategory.jsp">添加分类</a>
	 | <a href="/blog/CategoryServlet?method=list">分类管理</a>
 	 | <a href="/blog/CommentServlet">评论管理</a>
	 | <a href="/blog/aha/changePassword.jsp">修改密码</a>
	 | <a href="/blog/aha/fileManager.jsp">文件</a>
	 | <a href="/blog/UserServlet?method=logout">退出</a>
</div>
<br/>
<div id="main">
