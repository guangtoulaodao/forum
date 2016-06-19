<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  String backMainPage=(String)session.getAttribute("backMainPage");
  if(backMainPage==null||backMainPage.equals(""))
	  backMainPage="default.jsp";
%>

<html>
  <head>
    <title>编程体验BBS-论坛 后台</title>
    <base href="<%=basePath%>">
    <link style="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/bbs.js"></script>  
  </head>
  <body bgcolor="#AA8D60">
    <center>
      <table border="0" width="800" cellspacing="0" cellpadding="0">
        <tr>
            <td rowspan="3" width="172" align="center" valign="top" background="images/admin/back.jpg"><jsp:include page="left.jsp"/></td>
            <td align="center"><jsp:include page="top.jsp"/></td>
        </tr>
        <tr height="33"><td width="center" align="center" background="images/admin/message.jpg"><html:errors property="adminOpR"/></td></tr>        
        <tr height="430"><td align="center" valign="top" background="images/admin/content.jpg"><jsp:include page="<%=backMainPage %>"/></td></tr>
        <tr><td width="center" colspan="2"><jsp:include page="end.jsp"/></td></tr>
      </table>
    </center>
  </body>
</html>