<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="header.jsp" %>
<%@ page  import="zpy.model.*"%>

<% Category category=(Category)request.getAttribute("category");%>

<h2>修改分类</h2>    
<form id="form1" name="form1" method="post" action="/blog/CategoryServlet">
<input type="hidden" name="id" value="<%=category.getId() %>" />
<input type="hidden" name="method" value="update" />
<table id="tab">
<tr>
    <td>分类名称: </td>
    <td>
	<input name="name" type="text" id="title" size="20"   value="<%=category.getName()%>"/>
	</td>
</tr>
<tr>
    <td>显示顺序: </td>
    <td>
	<input name="level" type="text" id="title" size="2" maxlength="4" value="<%=category.getLevel()%>"/>
	</td>
</tr>

<tr>
    <td colspan="2">
					<input type="submit" name="submit" value="更新"/>
		    </td>
</tr>
</table>
</form>
<%@include file="footer.jsp" %>

