<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>添加论坛类别</title>
  </head>
  <body>
    <center>
      <br>
      <table border="0" height="120" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" rules="all">
      <html:form action="needLogin/admin/addClass.do">
          <input type="hidden" name="method" value="addClass">
          <input type="hidden" name="validate" value="yes">
          <tr>
                 <td>论坛名称：</td>
                 <td><html:text property="className" size="50"></html:text>
          </tr>
          <tr>
                 <td></td>
                 <td><html:errors property="className"/></td>
          </tr>
          <tr>
                 <td>论坛介绍：</td>
                 <td><html:text property="classIntro" size="50"></html:text>
          </tr>
          <tr>
                 <td></td>
                 <td><html:errors property="classIntro"/></td>
          </tr>
          <tr>
                 <td></td>
                 <td>
                     <html:submit value="添加"/>
                     <html:reset value="重置"/>
                 </td>  
          </tr>
      </html:form>
      </table>
    </center>
  </body>
</html>