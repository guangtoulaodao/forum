<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>显示精华帖子</title>
  </head>
  <body>
    <center>
      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows" style="margin-top:8">
          <tr height="30"><td colspan="5" style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">■ 精华帖子</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F0F0F0">
              <td width="8%">状态</td>
              <td width="35%">帖子标题</td>
              <td width="7%">回复数</td>
              <td width="25%">发布者</td>
              <td width="25%">最后回复</td>
          </tr>
          <logic:notPresent name="goodlist" scope="session">
              <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="5"><li>对不起，帖子列表不存在！</li></td></tr>
          </logic:notPresent>
          <logic:present name="goodlist" scope="session">
              <logic:empty name="goodlist" scope="session">
                  <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="5"><li>对不起，帖子列表不存在！</li></td></tr>
              </logic:empty>
              <logic:notEmpty name="goodlist" scope="session">
			  <tr>
                  <td colspan="5">
                      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="all">
                      <logic:iterate id="goodSingle" name="goodlist">
                      <tr height="35" bgcolor="#F9F9F9">
                          <td width="8%" align="center">精华</td>
                          <td width="35%" style="text-indent:10">
                              <img src="images/face/bbs/${goodSingle.bbsFace}">
                              <a href="user/openShow.do?method=openShow&bbsId=${goodSingle.bbsId}"><bean:write name="goodSingle" property="subBbsTitle[18]" filter="false"/></a>
                          </td>
                          <td width="7%" align="center"><bean:write name="goodSingle" property="bbsAnswerNum"/></td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${goodSingle.bbsSender}">
                                  <b><bean:write name="goodSingle" property="bbsSender" filter="false"/></b>
                                  <br><bean:write name="goodSingle" property="bbsSendTime"/>
                              </a>
                          </td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${goodSingle.bbsLastUpdateUser}">
                                  <b><bean:write name="goodSingle" property="bbsLastUpdateUser" filter="false"/></b>
                                  <br><bean:write name="goodSingle" property="bbsLastUpdateTime"/>
                              </a>
                          </td>
                      </tr>
                      </logic:iterate>
                      </table>
                  </td>
              </tr>                  
              </logic:notEmpty>
          </logic:present>
          <tr height="10"><td colspan="5"></td></tr>
          <tr height="30">          
              <td colspan="6" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/goodListShow.do?method=goodListShow"/>
                  </jsp:include>
              </td>
          </tr>
          <tr height="10"><td colspan="5"></td></tr>
      </table>
    </center>
  </body>
</html>