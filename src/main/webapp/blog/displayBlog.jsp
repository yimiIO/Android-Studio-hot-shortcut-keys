<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/header.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="zpy.model.*"%>


<div id="content-detail" class="content blog clearfix"
	style="opacity: 1; top: 0px;">

	<div class="row" id="rowid">

		<div class="col-9">


<script>window._bd_share_config={"common":{"bdSnsKey":{"tsina":"1672863306"},"bdText":"很有内涵的文章","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"1","bdPos":"left","bdTop":"72.5"},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<%
				Blog blog = (Blog) request.getAttribute("blog");
				List list = (List) request.getAttribute("commentList");
			%>


			<table width=100% id="tab" border="0"
				style=' padding-left: 20px; text-align:left;table-layout:fixed; word-break:break-all; word-wrap:break-word'>
				<tr>
					<td><h1><%=blog.getTitle()%></h1>
					</td>
				</tr>
					<tr>
					<td><%=blog.getContent()%></td>

				</tr>

				<tr>
					<td><%=blog.getCreatedTime()%></td>
	
				</tr>
<tr>
<td>
<!-- JiaThis Button BEGIN -->
<div class="jiathis_style">
	<span class="jiathis_txt">分享到：</span>
	<a class="jiathis_button_qzone">QQ空间</a>
	<a class="jiathis_button_tsina">新浪微博</a>
	<a class="jiathis_button_tqq">腾讯微博</a>
	<a class="jiathis_button_weixin">微信</a>
	<a href="http://www.jiathis.com/share?uid=1955110" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript">
var jiathis_config = {data_track_clickback:'true'};
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1406184816460873" charset="utf-8"></script>
<!-- JiaThis Button END -->
<!-- UJian Button BEGIN -->
	<div class="ujian-hook"></div>
	<script type="text/javascript" src="http://v1.ujian.cc/code/ujian.js"></script>
<!-- UJian Button END -->


</td></tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
				
				</tr>
				
				<tr>
					<td height="79">
						<%
							if (list != null) {
								for (int i = 0; i < list.size(); i++) {
									Comment comment = (Comment) list.get(i);
						%>
						<table id="tab">
							<tr>
								<td><%=comment.getUsername()%>的评论</td>
							</tr>
							<tr>
								<td><xmp><%=comment.getContent()%></xmp></td>
							</tr>
							<tr>
								<td><%=comment.getCreatedTime()%></td>
								
							</tr>
						</table> <br> <br> <%
 	}
 	}
 %>
 



						<p>&nbsp;</p>
					</td>
				</tr>

				<tr>
					<td><form id="form1" action="/blog/CommentServlet"
							method="post">
							<input type="hidden" name="method" value="add" /> <input
								type="hidden" name="blog_id" value="<%=blog.getId()%>" />
							<table id="tab">
								<tr>
									<td>评论人：</td>
									<td><label> <input name="name" type="text"
											id="name" size="20" /> </label>
									</td>
								</tr>
								<tr>
									<td>内容：</td>
									<td><label> <textarea name="content" cols="60"
												rows="10" id="content1"></textarea> </label>
									</td>
								</tr>
								<tr>
									<td><label> 1+1=<input name="verify" type="text"
											id="name" size="2" /> </label><label><input type="submit"
											name="button" id="button" value="提交" /> </label>
									</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</form></td>
				</tr>
			</table>


			<br clear="all" />
			
		</div>
		<!-- end col-9 -->
		<div class="col-3">
			<ul class="sidebar">

				<iframe width="100%" height="350" class="share_self" frameborder="0"
					scrolling="no"
					src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=350&fansRow=2&ptype=1&speed=0&skin=1&isTitle=0&noborder=1&isWeibo=0&isFans=1&uid=2000645405&verifier=5097aa8e&colors=299999,ffffff,666666,0082cb,ecfbfd&dpc=1"></iframe>

				<h2>分类</h2>
				<ul>

					<a href="http://www.98ki.com/blog">全部</a>
					<%
						List p_cate = (List) request.getAttribute("p_cate");
						for (int i = 0; i < p_cate.size(); i++) {
							Category cate = (Category) p_cate.get(i);
					%>

					<li><a href="#Menu=ChildMenu<%=i%>"
						onclick="DoMenu('ChildMenu<%=i%>')"><%=cate.getName()%></a>
					</li>

					<%
						Category[][] c_cate = (Category[][]) request
									.getAttribute("c_cate");
							if (c_cate[cate.getLevel()][0] == null) {
								continue;
							}
					%>
					<ul id="ChildMenu<%=i%>" class="collapsed">
						<%
							Category cate2 = new Category();
								for (int j = 0; j < 20; j++) {
									if (c_cate[cate.getLevel()][j] == null) {
										break;
									} else {
										cate2 = c_cate[cate.getLevel()][j];
						%>

						<li class="tmenu"><a
							href="/blog/HomeServlet?cid=<%=cate2.getId()%>"><%=cate2.getName()%></a>
						</li>

						<%
							}
								}
						%>
					</ul>

					<%
						}
					%>

				</ul>





				<h2>最近的主题</h2>
				<ul>
					<%
						List recentBlogs = (List) request.getAttribute("blogs");
						for (int i = 0; i < recentBlogs.size(); i++) {
							blog = (Blog) recentBlogs.get(i);
					%>
					<li><a
						href="/blog/HomeServlet?method=get&id=<%=blog.getId()%>"
						target="_blank"><%=blog.getTitle()%></a></li>

					<%
						}
					%>
				</ul>

			
				<h2>最近的评论</h2>
				<ul>
					<%
						List comments = (List) request.getAttribute("comments");
						for (int i = 0; i < comments.size(); i++) {
							Comment c = (Comment) comments.get(i);
							String comment = c.getContent();
							if (comment.length() > 20)
								comment = comment.substring(0, 20) + "……";
					%>
					<li><a
						href="/blog/HomeServlet?method=get&id=<%=c.getBlogId()%>"
						target="_blank"><xmp><%=comment%></xmp> </a>
					</li>
					<%
						}
					%>





				</ul>








			</ul>
		</div>
	</div>

</div>






<%@include file="/footer.jsp"%>