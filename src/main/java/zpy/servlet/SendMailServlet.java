package zpy.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendMailServlet extends HttpServlet {
	private static String host;
	private static String username = "20475787@qq.com";
	private static String password = "cs123456";
	private static String to;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		host = config.getInitParameter("host");
		to = config.getInitParameter("to");
		System.out.println(host + to);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String confirm_number = request.getParameter("confirm_number");
		String send = request.getParameter("your-email");

		String name = request.getParameter("your-name");

		String content = request.getParameter("your-message");
		System.out.println("number:"+confirm_number);
		if (confirm_number.equals("www.98ki.com")) {

			try {
				Authenticator auth = null;
				auth = new MailAuthenticator(username, password);

				Properties props = new Properties();
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", host);
				props.setProperty("mail.smtp.socketFactory.class",
						"javax.net.ssl.SSLSocketFactory");
				props.setProperty("mail.smtp.port", "465");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.auth", "true");

				Session session = Session.getDefaultInstance(props, auth);
				session.setDebug(true);
				MimeMessage msg = new MimeMessage(session);
				msg.setSentDate(new Date());
				InternetAddress fromAddress = new InternetAddress(
						"20475787@qq.com", name);
				msg.setFrom(fromAddress);
				InternetAddress[] toAddress = new InternetAddress[1];
				toAddress[0] = new InternetAddress(to);
				msg.setRecipients(Message.RecipientType.TO, toAddress);
				msg.setSubject("来自98ki_contact的邮件,email:" + send);
				msg.setText(content, "UTF-8");
				msg.saveChanges();
				Transport
						.send(msg, msg.getRecipients(Message.RecipientType.TO));

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/contact#wpcf7-f16-t1-o1");

			}
		}
			response.sendRedirect("/contact#wpcf7-f16-t1-o1");
		
	}

	public class MailAuthenticator extends Authenticator {
		private String userName;
		private String password;

		public MailAuthenticator(String userName, String password) {
			super();
			this.userName = userName;
			this.password = password;
		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(userName, password);
		}

	}
}