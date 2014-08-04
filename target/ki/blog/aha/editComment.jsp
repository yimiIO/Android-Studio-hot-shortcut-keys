<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="header.jsp" %>
<%@ page  import="zpy.model.*"%>

<% Comment comment=(Comment)request.getAttribute("comment");%>

<h2>修改评论</h2>    
<form id="form1" name="form1" method="post" action="/blog/CommentServlet">
<input type="hidden" name="id" value="<%=comment.getId() %>" />
<input type="hidden" name="method" value="update" />
<table id="tab">
<tr>
    <td>评论人: </td>
    <td>
	<input name="name" type="text" id="title" size="50"   value="<%=comment.getUsername()%>"/>
	</td>
</tr>
<tr>
    <td colspan="2">内容: <br/>
         <textarea name="content" cols="60" rows="18" id="content"><%=comment.getContent()%></textarea>
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

