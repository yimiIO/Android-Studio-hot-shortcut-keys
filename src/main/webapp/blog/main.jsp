<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/header.jsp" %>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="zpy.model.*"%>


	<div id="content-detail" class="content blog clearfix"
		style="opacity: 1; top: 0px;">

		<div class="row">

			<div class="col-9">

				<%
					List list = (List) request.getAttribute("blogs");
					for (int i = 0; i < list.size(); i++) {
						Blog blog = (Blog) list.get(i);

						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String date = sdf.format(blog.getCreatedTime());

						sdf = new SimpleDateFormat("HH:mm:ss");
						String time = sdf.format(blog.getCreatedTime());
				%>

				<article>

					<h1>
						<a href="/blog/HomeServlet?method=get&id=<%=blog.getId()%>"><%=blog.getTitle()%></a>
					</h1>
					<p class="left text-light">
						类别： <a href="/blog/HomeServlet?cid=<%=blog.getCategoryId()%>"><%=blog.getCategory()%>
						</a>
					</p>
					<ul class="share">



						<li><iframe id="twitter-widget-0" scrolling="no"
								frameborder="0" allowtransparency="true"
								src="files/tweet_button.1400006231.htm"
								class="twitter-share-button twitter-tweet-button twitter-share-button twitter-count-horizontal"
								title="Twitter Tweet Button" data-twttr-rendered="true"
								style="width: 110px; height: 20px;"></iframe> <script
								type="text/javascript" src="files/widgets.js"></script>
						</li>
					</ul></br></br>

					<p>
						<%
							String source = blog.getContent();
								int length = 2000;
								if (source.length() < 2000) {
									length = source.length();
								}
								String newString = source.substring(0, length);

								request.setAttribute("newString", newString);
						%>
						<input type="hidden" value="<%=newString%>" id="aaa" />
						<script language="JavaScript" type="text/javascript">
							var blog = closeHTML(document.getElementById('aaa').value);
							document.write(blog);
						</script>
					</p>
					</br> <a class="button"
						href="http://www.98ki.com/blog/HomeServlet?method=get&id=<%=blog.getId()%>">阅读全文
						more</a>

				</article>

				<%
					}
				%>

			<div id="page" class="page">
			
		</div>



	</div>

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
					onclick="DoMenu('ChildMenu<%=i%>')"><%=cate.getName()%></a></li>

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
						Blog blog = (Blog) recentBlogs.get(i);
				%>
				<li><a href="/blog/HomeServlet?method=get&id=<%=blog.getId()%>"
					target="_blank"><%=blog.getTitle()%></a>
				</li>

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
						if(comment.length()>20)
							comment = comment.substring(0, 20)+"……";
				%>
				<li><a
					href="/blog/HomeServlet?method=get&id=<%=c.getBlogId()%>"
					target="_blank"><%=comment%></a></li>
				<%
					}
				%>





			</ul>








		</ul>
	</div>
	</div>

	</div>




<%@include file="/footer.jsp" %>

<script>
var Page = ${page} ,MaxPage = ${maxPage};
locat()
if(MaxPage != "" && MaxPage > 1){
        document.getElementById("page").innerHTML = Pagehtml()
        document.getElementById("page_btn").onclick = function(){
                var _page = document.getElementById("page_text").value
                var r = /^[0-9]*[1-9][0-9]*$/;//正整数 
                if(_page != "" && r.test(_page) ){
                        if (MaxPage < _page){
                                _page = MaxPage
                        }
                        this.href = "?page=" + _page
                }
        }
        document.getElementById("page_text").onkeyup = function(event) {
                if (event == "undefined") {
                        event = window.event;
                }
                if (event.keyCode == 13) {
                        document.getElementById("page_btn").click();
                        return false;
                }
        }
}

function locat(){
        var url=window.location.search;   //接收地址中传递的参数并产生响应
         if(url.indexOf("?")!=-1){
                var str = url.substr(1)
                strs = str.split("&"); 
                for(i=0;i<strs.length;i++){ 
                        if([strs[i].split("=")[0]]=='page') Page=unescape(strs[i].split("=")[1]);
                }
        }
}
function Pagehtml(){//分页代码
        var PageStr = "",jj = "";
    Page = parseInt(Page);
        var xPage = Page - 2,dPage = Page + 2
        if(xPage < 1){
                xPage = 1
                dPage = 5
        }
        if(dPage > MaxPage){
                dPage = MaxPage
                xPage = (dPage - 4)
        }
        if(xPage < 1){
                xPage = 1
        }
        if (Page == 1){
                PageStr += "<a class='page_turn'>上一页</a>"
        }else{
                PageStr += "<a class='page_turn' href='?page="+ (Page - 1) +"'>上一页</a>"
        }
        if(xPage > 1){
                PageStr += "<a href='?page=1'>1</a>"
        }
        if(xPage > 2){
                PageStr += " ..."
        }
        for(var j = xPage;j <= dPage;j++) {
                PageStr += (Page == j) ? " <a class=\"on\">" + j + "</a>" : " <a href='?page="+ j +"'>" + j + "</a>";
    }
        if(dPage < MaxPage - 1){
                PageStr += " ..."
        }
        if(dPage < MaxPage){
                PageStr += " <a href='?page="+ MaxPage +"'>" + MaxPage + "</a>"
        }
        if (Page == MaxPage){
                PageStr += "<a class='page_turn'>下一页</a>"
        }else{
                PageStr += "<a class='page_turn' href='?page="+ (Page + 1) +"'>下一页</a>"
        }
        PageStr += ' 跳转到：<input id="page_text" type="text" name="page_text"><a id="page_btn" class="page_turn" href="javascript:;">GO</a>'
        return PageStr
}
</script>

