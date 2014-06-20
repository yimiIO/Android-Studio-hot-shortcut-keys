package zpy.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;

import zpy.model.User;
import zpy.util.DbHelper;

public class DeleteBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 7339499832960257436L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("aha/login.jsp");
		} else {
			String id = request.getParameter("id");
		

			try {
				// 删除博文的SQL语句
				String sql = "delete from blog where id=" + id;
				QueryRunner qr = DbHelper.getQueryRunner();
				qr.update(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/blog/AdminBlogListServlet")
					.forward(request, response);
		}
	}
}
