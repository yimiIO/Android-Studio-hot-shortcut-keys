<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>zpy file manager</title>
    
	

  </head>
  
  <body>
<form action='../servlet/FileUpLoad' method='post' enctype='multipart/form-data'>

<%-- 类型enctype用multipart/form-data，这样可以把文件中的数据作为流式数据上传，不管是什么文件类型，均可上传。--%>
Choice upload picture:<input type='file' name='upfile' size='50'>
<input type='submit' value='提交'>
</form>

  </body>
</html>
