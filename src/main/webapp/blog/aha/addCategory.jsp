<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="header.jsp" %>

<%@ page import="java.util.List" %>
<%@ page  import="zpy.model.*"%>
<h2>添加分类</h2>

<form id="form1" name="form1" method="post" action="/blog/CategoryServlet">
<input type="hidden" name="method" value="add" />    

<table id="tab">
<tr>
    <td>分类的名称： </td>
    <td>
	 <input type="text" name="name" id="name" />
	</td>
</tr>
<tr>
    <td>分类的显示顺序： </td>
    <td>
	  <input name="level" type="text" id="level" size="2" maxlength="4" />
	</td>
</tr>

<tr>
    <td colspan="2">
		<input type="submit" name="submit" value="创建"/>
 </td>
</tr>
</table>
</form>

<%@include file="footer.jsp" %>