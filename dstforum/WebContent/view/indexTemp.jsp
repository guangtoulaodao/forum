<%@ page contentType="text/html; charset=gb2312"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  String mainPage=(String)session.getAttribute("mainPage");
  if(mainPage==null||mainPage.equals(""))
	  mainPage="default.jsp";
%>

<html>
  <head>
    <title>编程体验BBS-论坛</title>
    <base href="<%=basePath%>">
    <link style="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/bbs.js"></script>    
  </head>
  <body bgcolor="#AA8D60">
    <center>
      <table bgcolor="#F0F0F0" border="0" width="800" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
        <tr><td><jsp:include page="top.jsp"/></td></tr>
        <tr><td><jsp:include page="menu.jsp"/></td></tr>        
        <tr><td><jsp:include page="<%=mainPage%>"/></td></tr>
        <tr><td height="82"><jsp:include page="end.jsp"/></td></tr>
      </table>
    </center>
  </body>
</html>