<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="header.jsp" %>
<%@page import="java.util.List"%>
<%@ page  import="zpy.model.*"%>
<%
		List list = (List) request.getAttribute("list");
		Category category = null;
%>

<script type="text/javascript">		
			function del() {
				var msg = "您真的确定要删除吗？\n\n请确认！";
				if (confirm(msg)==true){
						return true;
					}else{
						return false;
					}
				}
</script>
	

<h2>分类管理</h2>

<table id="tab">
<tr>
 	<th>编号</th>
    <th>分类</th>
   <th>显示顺序</th>
   <th>操作</th>
</tr>
		<%for (int i = 0; i < list.size(); i++) {
			category = (Category) list.get(i);	%>			
		<tr>
		   <td><%=category.getId()%></td>
	       <td><%=category.getName()%></td>
		   <td><%=category.getLevel()%></td>		   
		  <td align="center">
		
        	<a href="/blog/CategoryServlet?method=edit&id=<%=category.getId()%>"><img src="/blog/aha/images/edit.gif " border="0"/></a>
           <a href="/blog/CategoryServlet?method=delete&id=<%=category.getId()%>" onclick="javascript:return del()"><img src="/blog/aha/images/delete.gif" border="0"/></a>	   
		   </td>    
		</tr>		
		<%}	%>
	</table>			
<%@include file="footer.jsp" %>