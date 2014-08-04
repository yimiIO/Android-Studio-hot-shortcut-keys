<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="container">	
<div id="banner">
		<h1>BernieZPY的博客</h1>
</div>
<div id="menu">	
</div>
<br/>
<div id="main">

<% String message=(String)request.getAttribute("message");
   if(message!=null){
	   out.print("<font color='red'>"+message+"</font>");
   }
%>
 <form id="form1" name="form1" method="post" action="/blog/UserServlet">
	<input type="hidden" name="method" value="login"/>
  <table width="331" height="84" border="0">
    <tr>
      <td>用户名：</td>
      <td><label>
        <input type="text" name="username" id="username" />
      </label></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><label>
        <input type="password" name="password" id="password" />
      </label></td>
    </tr>
    <tr>
      <td><label>
        <input type="submit" name="button" id="button" value="提交" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form> 


</div>
</body>
</html>