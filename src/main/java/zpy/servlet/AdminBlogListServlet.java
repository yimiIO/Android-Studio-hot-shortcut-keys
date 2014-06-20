package zpy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import zpy.model.Blog;
import zpy.model.User;
import zpy.util.DbHelper;

public class AdminBlogListServlet extends HttpServlet {
	private static final long serialVersionUID = -7152478870507997462L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("aha/login.jsp");
		} else {
			QueryRunner qr=DbHelper.getQueryRunner();
			// 查询所有的博客内容，也就是所有的Blog对象
			String sql = "select b.id as id ,title,content,createdtime, c.name as category from blog b,category c where b.category_id=c.id order by b.id desc";
			List list=null;
			try {				
				list = (List) qr.query(sql,
						new BeanListHandler(Blog.class));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("aha/adminBlogList.jsp").forward(request, response);
		}

	}
}
