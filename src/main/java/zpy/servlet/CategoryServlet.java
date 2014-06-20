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

import zpy.model.Category;
import zpy.model.User;
import zpy.util.DbHelper;

public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 4954984833384257415L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("aha/login.jsp");
		} else {

			// 解决从JSP页面接受中文参数乱码
			request.setCharacterEncoding("UTF-8");
			String method = request.getParameter("method");

			if (method.equals("add")) {
				add(request, response);
			} else if (method.equals("delete")) {
				delete(request, response);
			} else if (method.equals("list")) {
				list(request, response);
			} else if (method.equals("edit")) {
				preEdit(request, response);
			} else if (method.equals("update")) {
				update(request, response);
			} else {
				list(request, response);
			}
		}

	}

	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sql = "select id,name,level from category order by level desc,id desc";
		QueryRunner qr = DbHelper.getQueryRunner();
		List list = null;
		try {
			list = (List) qr.query(sql, new BeanListHandler(Category.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("list", list);
		request.getRequestDispatcher("aha/adminCategoryList.jsp").forward(
				request, response);

	}

	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "delete from category where id=" + id;
		QueryRunner qr = DbHelper.getQueryRunner();
		try {
			qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/servlet/CategoryServlet?method=list")
				.forward(request, response);
	}

	public void preEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "select id,name,level from category where id=" + id;

		QueryRunner qr = DbHelper.getQueryRunner();
		Category category = null;
		try {
			List list = (List) qr.query(sql,
					new BeanListHandler(Category.class));
			category = (Category) list.get(0);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("category", category);
		request.getRequestDispatcher("aha/editCategory.jsp").forward(
				request, response);
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String level = request.getParameter("level");

		String sql = "update category set name=?,level=? where id=?";
		String params[] = { name, level, id };
		QueryRunner qr = DbHelper.getQueryRunner();
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/blog/CategoryServlet?method=list")
				.forward(request, response);
	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接受JSP页面传递过来的，与博文有关的3个参数：主题、内容和所属分类的编号
		String name = request.getParameter("name");
		String level = request.getParameter("level");

		String sql = "insert into category (name,level) values (?,?)";
		String params[] = { name, level };

		QueryRunner qr = DbHelper.getQueryRunner();
		int result = 0;
		String message = "";

		try {
			result = qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (result == 1) {
			message = "好消息，博客分类添加成功！";
		} else {
			message = "坏消息，博客分类添加失败！";
		}

		request.setAttribute("message", message);
		request.getRequestDispatcher("aha/result.jsp").forward(request,
				response);
	}

}
