package zpy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import zpy.model.Blog;
import zpy.model.Comment;
import zpy.util.DbHelper;

public class GetBlogServlet extends HttpServlet {
	private static final long serialVersionUID = -7152478870507997462L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "select id,title,content,createdtime from blog where id="
				+ id;
		QueryRunner qr = DbHelper.getQueryRunner();
		//根据博文的id值读取一篇博文
		Blog blog = null;
		try {
			List list = (List) qr.query(sql, new BeanListHandler(Blog.class));
			blog = (Blog) list.get(0);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//根据博文的id，读取这个博文下的所有评论
		sql = "select id,username,content,createdtime from comment where blog_id=" + id+" order by id desc";
		List commentList = null;
		try {
			commentList = (List) qr.query(sql, new BeanListHandler(
					Comment.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("blog", blog);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("displayBlog.jsp").forward(request,
				response);
	}
}
