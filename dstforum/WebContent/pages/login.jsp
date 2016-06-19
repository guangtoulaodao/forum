<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <title>前台登录</title>
    <base href="<%=basePath%>">
    <link style="text/css" rel="stylesheet" href="css/style.css">
  </head>
  <body bgcolor="#AA8D60">
    <center>
      <html:form action="user/login.do" focus="userName">
          <input type="hidden" name="method" value="login">
          <table background="images/login/loginB.jpg" width="500" height="300" border="0" cellspacing="0" cellpadding="0" style="margin-top:90">
              <tr height="175">
                  <td colspan="2" style="text-indent:145">
                      <html:errors/>
                      <logic:present name="message">
                          <bean:write name="message" filter="false"/>                    
                      </logic:present>
                  </td>
              </tr>
              <tr height="45">
                  <td align="right" width="35%">用户名：</td>
                  <td>&nbsp;&nbsp;<html:text property="userName" size="30"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="user/reg.do?method=userReg">[用户注册]</a></td>
              </tr>
              <tr height="30">
                  <td align="right">密&nbsp;&nbsp;码：</td>
                  <td>&nbsp;&nbsp;<html:password property="userPassword" redisplay="false" size="30"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">[返回首页]</a></td>
              </tr>              
              <tr>
                  <td></td>
                  <td>
                      &nbsp;
                      <html:image src="images/login/bsup.gif" onmousedown="this.src='images/login/bsdown.gif'" onmouseup="this.src='images/login/bsup.gif'"/>
                      <html:image src="images/login/brup.gif" onmousedown="this.src='images/login/brdown.gif'" onmouseup="this.src='images/login/brup.gif'" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      
                  </td>                  
              </tr>
          </table>
          <table width="500" border="0" width="350" cellspacing="0" cellpadding="0">
              <tr><td colspan="2"><img src="images/login/loginE.jpg"></td></tr>                               
          </table>
      </html:form>
    </center>
  </body>
</html>