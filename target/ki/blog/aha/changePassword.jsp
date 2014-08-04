<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file="header.jsp" %>

<h3>修改密码</h3>
<form id="form1" name="form1" method="post" action="/blog/UserServlet">
<input type="hidden" name="method" value="change" />
  <table id="tab">
    <tr>
      <td width="97">原密码：</td>
      <td width="366"><label>
        <input name="oldPassword" type="password" id="oldPassword" size="20" />
      </label></td>
    </tr>
    <tr>
      <td>新密码：</td>
      <td><label>
        <input name="newPassword" type="password" id="newPassword" size="20" />
      </label></td>
    </tr>
    <tr>
      <td>确认新密码：</td>
      <td><label>
        <input name="reNewPassword" type="password" id="reNewPassword" size="20" />
      </label></td>
    </tr>
    <tr>
      <td><label>
        <input type="submit" name="button" id="button" value="提交" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

<%@include file="footer.jsp" %>