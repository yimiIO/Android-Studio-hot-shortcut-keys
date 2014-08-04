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

import zpy.model.User;
import zpy.util.DbHelper;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = -1767037483934953543L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method == null) {
			method = "";
		}
		if (method.equals("login")) {
			login(request, response);
		} else if (method.equals("logout")) {
			logout(request, response);
		} else if (method.equals("change")) {
			changePassword(request, response);
		}
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String sql = "select id,username,password from admin where username=? and password=?";
		String params[] = { username, password };
		QueryRunner qr = DbHelper.getQueryRunner();
		User user = null;
		List list = null;
		try {
			list = (List) qr.query(sql, params,new BeanListHandler(User.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (list.size() > 0) {
			user = (User) list.get(0);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("aha/admin.jsp").forward(request,
					response);
		} else {
			request.setAttribute("message", "用户名或者密码不正确!");
			request.getRequestDispatcher("aha/login.jsp").forward(request,
					response);
		}

	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/blog");
	}

	public void changePassword(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String reNewPassword = request.getParameter("reNewPassword");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (!user.getPassword().equals(oldPassword)) {
			request.setAttribute("message", "您输入的原密码错误！");
			request.getRequestDispatcher("/aha/result.jsp").forward(request,
					response);
		} else if (newPassword.equals(reNewPassword)) {
			String sql = "update users set password=? where id=?";
			String params[] = { newPassword, user.getId().toString() };
			QueryRunner qr = DbHelper.getQueryRunner();

			try {
				qr.update(sql, params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("aha/admin.jsp");
		} else {
			request.setAttribute("message", "您输入的两次新密码不相同！");
			request.getRequestDispatcher("/aha/result.jsp").forward(request,
					response);		
			
		}
		//sendRedirect()与forward()实现转向的异同
		//1.前面慢，后者快
		//2.前面无法读取request.setAttribute()所保存的数值，而后者可以读取
		//3.前者地址栏显示真正转向后的地址,而后者显示的是转向前的地址
		//4.前者，转向地址开始的"/",表示的是本机的根目录；而后者,"/"表示的是应用的根目录
	}
}
