package zpy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import zpy.model.Blog;
import zpy.model.Category;
import zpy.model.User;
import zpy.util.DbHelper;

public class PreEditBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 5566583919589784551L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("aha/login.jsp");
		} else {
			String id = request.getParameter("id");
			QueryRunner qr = DbHelper.getQueryRunner();
			String sql = "select id,title,content,category_id as categoryid from blog where id=" + id;
			Blog blog=null;
			List categorys=null;

			try {				
				List list = (List) qr.query(sql,
						new BeanListHandler(Blog.class));
				blog = (Blog) list.get(0);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			sql="select id,name from category order by level desc,id desc";
			
			try {
				categorys=(List)qr.query(sql, new BeanListHandler(Category.class));
			} catch (SQLException e) {				
				e.printStackTrace();
			}
			
			request.setAttribute("blog", blog);
			request.setAttribute("categorys",categorys);
			request.getRequestDispatcher("aha/editBlog.jsp").forward(request, response);			
		}
	}
}
