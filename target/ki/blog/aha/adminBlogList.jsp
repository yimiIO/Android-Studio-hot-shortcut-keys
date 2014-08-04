<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@include file="header.jsp" %>
<style type="text/css" media="all">
  @import url("/blog/aha/css/screen.css");
</style>
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

<h2>博文管理</h2>

<display:table name="list" pagesize="3" class="its" requestURI="/blog/AdminBlogListServlet" id="blog">
	<display:column property="id" title="编号" sortable="true"/>
	<display:column property="title" title="主题"/>
	<display:column property="category" title="分类"/>
	<display:column property="createdTime" title="日期" sortable="true"/>
	<display:column title="操作">
		<a href="/blog/PreEditBlogServlet?id=${blog.id}"><img src="/blog/aha/images/edit.gif " border="0"/></a>
        <a href="/blog/DeleteBlogServlet?id=${blog.id}" onclick="javascript:return del()"><img src="/blog/aha/images/delete.gif" border="0"/></a>   
	</display:column>
	
</display:table>	
<%@include file="footer.jsp" %>