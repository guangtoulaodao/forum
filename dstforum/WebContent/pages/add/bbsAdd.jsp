<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>发表帖子</title>  
  </head>
  <body>
    <center>
      <!-- 发表帖子 -->
	  <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all" style="margin-top:8">
      <html:form action="needLogin/addBbs.do" focus="bbsTitle">
          <input type="hidden" name="method" value="addBbs">
          <input type="hidden" name="validate" value="yes">
		  <tr bgcolor="#F0F0F0" height="30"><td colspan="2" style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">■ 发表帖子</font></b></td></tr>          
          <tr>
              <td width="27%" bgcolor="#F9F9F9" align="center" valign="top">
                  <table border="0" width="99%">
                      <tr><td><html:errors property="bbsTitle"/></td><tr>
            		  <tr><td><html:errors property="bbsContent"/></td></tr>
                  </table>
                  <table style="margin-top:10">
                      <tr>
                      	  <td valign="top" width="99%">
                      	          发帖许可：<br><br>         	                  
           	                      <li>请不要发表危害祖国的非法信息！</li>
           	                      <li>请不要发表侵犯个人名誉的信息！</li>
           	                      <li>请不要发表不文明内容！</li>           	                  
           	              </td>
                      </tr>
                      <tr height="40"><td align="center">违反以上规则所发生的后果自负！</td></tr>
                  </table>
              </td>
              <td>
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows">
                      <tr height="30">
                          <td width="15%" align="center">【主题】</td>
                          <td align="center"><html:text property="bbsTitle" size="77" maxlength="35" styleId="title"/></td>
                      </tr>
                      <tr bgcolor="#F9F9F9">
                          <td align="center">【表情】</td>
                          <td align="center"><%@ include file="face.jsp" %></td>
                      </tr>
                      <tr height="30">
                          <td align="center">【内容】</td>
                          <td align="center"><%@ include file="font.jsp"%></td>
                      </tr>
                      <tr height="30" bgcolor="#F9F9F9">
                          <td colspan="2" align="right" valign="bottom"><%@ include file="count.jsp" %></td>
                      </tr>
                      <tr><td colspan="2" align="center"><html:textarea property="bbsContent" rows="15" cols="79" styleId="content" onkeydown="check(content,ContentUse,ContentRem,1000)" onkeyup="check(content,ContentUse,ContentRem,1000)" onchange="check(content,ContentUse,ContentRem,1000)"/></td></tr>
                      <tr height="30" align="center">
                          <td colspan="2">
                              <html:submit value="发表帖子"/>
                              <html:reset value="重新填写"/>
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
      </html:form>
      </table>
    </center>
  </body>
</html>