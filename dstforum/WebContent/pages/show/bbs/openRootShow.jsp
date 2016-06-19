<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*,com.yxq.actionform.UserForm" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>查看根帖</title>
  </head>
  <body>
    <center>
      <!-- ****************显示根帖信息**************** -->
      <html:link linkName="top"/>
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E0E0E0" bordercolordark="white" rules="all" style="margin-top:8;word-break:break-all">
          <tr height="30"><td colspan="3" background="images/index/classT.jpg" style="text-indent:5"><b><font color="white">■ 显示根帖</font></b></td></tr>
          <tr height="30" bgcolor="#F0F0F0">
              <td style="text-indent:5" width="27%">★ 楼主</td>
              <td colspan="2">【主题】<bean:write name="bbsRootSingle" property="bbsTitle" filter="false"/></td>
          </tr>
          <tr bgcolor="#F9F9F9">
	          <!-- 发帖者信息 -->
              <td rowspan="3" align="center" valign="top">
                  <table width="95%" height="180" border="0" cellspacing="0" cellpadding="0" style="margin-top:3">
                      <tr height="35%">
                          <td align="center" width="30%"><img src="images/face/user/${askUser.userFace}" style="border:1 solid;border-color:#E3E3E3"></td> 
                          <td style="text-indent:10">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${sessionScope.bbsRootSingle.bbsSender}">
                                  <b><bean:write name="askUser" property="userName" filter="false"/></b>
                              </a>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">性别：</td>
                          <td style="text-indent:10">
                              <bean:write name="askUser" property="userSex"/>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">OICQ：</td>
                          <td style="text-indent:10">
                              <bean:write name="askUser" property="userOICQ"/>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">来自：</td>
                          <td style="text-indent:10">
                              <bean:write name="askUser" property="subUserFrom[10]" filter="false"/>
                          </td>
                      </tr>
                      <!-- “返回”超链接 -->
                      <tr height="30"><td colspan="2" style="text-indent:70"><a href="${sessionScope.servletPath}?method=${sessionScope.method}">[返回]</a></td></tr>
                  </table>
              </td>
              <!-- 根帖信息 -->
              <td width="10%">【表情】<img src="images/face/bbs/${sessionScope.bbsRootSingle.bbsFace}"></td>
              <td height="30" align="right">发表时间：『<bean:write name="bbsRootSingle" property="bbsSendTime"/>』&nbsp;</td>
          </tr>
          <tr height="130"><td colspan="2" valign="top" style="padding-top:6;padding-left:6;padding-right:6;padding-bottom:6"><bean:write name="bbsRootSingle" property="bbsContent" scope="session" filter="false"/></td></tr>
          
          <!-- 实现对根帖进行操作的超链接 -->
          <tr height="30" bgcolor="#F9F9F9">
              <td align="right" colspan="2">
                  ◆<html:link href="view/indexTemp.jsp" anchor="answer">回复该帖&nbsp;</html:link>
                  
                  <!-- 如果该贴不是精华帖子，并且不是置顶帖子(实际上就是普通帖子) -->
                  <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsGood" scope="session">
                      <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsTop">
                          <!-- 显示“将帖子提前”超链接 -->
                          ◆<a href="needLogin/firstBbs.do?method=toFirstBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}" title="帖子所属者/楼主/管理员操作">将帖子提前</a>&nbsp;
                      </logic:notEqual>
                  </logic:notEqual>
                  
                  <!-- 如果该帖不是置顶帖子 -->
                  <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsTop">
					  <!-- 显示“置顶帖子”超链接 -->
                      ◆<a href="needLogin/admin/doTopGood.do?method=setTopBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}" title="管理员操作">置顶帖子</a>&nbsp;
                  </logic:notEqual>
                  
                  <!-- 如果该帖不是精华帖子 -->
                  <logic:notEqual value="1" name="bbsRootSingle" property="bbsIsGood">
                      <!-- 显示“设为精华帖”超链接 -->
                      ◆<a href="needLogin/admin/doTopGood.do?method=setGoodBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}" title="管理员操作">设为精华帖</a>&nbsp;                  
                  </logic:notEqual> 
                                   
                   <!-- 显示“删除帖子”超链接 -->
                  ◆<a href="needLogin/deleteRoot.do?method=deleteRootBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}" title="帖子所属者/楼主/管理员操作">删除帖子</a>&nbsp;
              </td>
          </tr>
      </table>
      
      <!-- ****************分页导航**************** -->
      <table  border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white">
          <tr height="30">
              <td align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/openShow.do?method=openShow"/>
                  </jsp:include>
              </td>
          </tr>
      </table>
      
      <!-- ****************显示回复帖子**************** -->      
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" style="margin-top:2;word-break:break-all">
          <tr height="30"><td background="images/index/classT.jpg" style="text-indent:5"><b><font color="white">■ 显示回复帖子</font></b></td></tr>
      </table>
      <!-- 不存在回复帖子列表 -->
      <logic:notPresent name="answerbbslist" scope="session">
          <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all">
              <tr height="70" bgcolor="#F9F9F9"><td align="center"><li>暂时没有回复帖！</li></td></tr>
          </table>
      </logic:notPresent>      
      <!-- 存在回复帖子列表 -->
      <logic:present name="answerbbslist" scope="session">
      	  <!-- 回复帖子列表为空 -->
          <logic:empty name="answerbbslist" scope="session">
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all">
                  <tr height="70" bgcolor="#F9F9F9"><td align="center"><li>暂时没有回复帖！</li></td></tr>
              </table>                        
          </logic:empty>
          <!-- 回复帖子列表不为空 -->
          <logic:notEmpty name="answerbbslist" scope="session">
              <!-- 遍历回复帖子列表 -->
              <logic:iterate id="answerbbsSingle" name="answerbbslist" indexId="idind">
              <bean:define id="answererName" name="answerbbsSingle" property="bbsAnswerSender"/>
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all" style="word-break:break-all">
                  <tr height="25" bgcolor="#F0F0F0">
                      <td style="text-indent:5" width="27%">▲${(page.currentP-1)*page.perR+(idind+1)} 楼</td>
                      <td colspan="2">【回复主题】<bean:write name="answerbbsSingle" property="bbsAnswerTitle" filter="false"/></td>              
                  </tr>                  
                  <tr bgcolor="#F9F9F9">
	                  <!-- 回复者信息 -->	                  
	                  
	                  <logic:iterate id="singleMap" name="answerMap">
	                      <logic:equal value="${answererName}" name="singleMap" property="key">
                              <bean:define id="answerSingle" name="singleMap" property="value"/>
	                      </logic:equal>
	                  </logic:iterate>
                      
                      <td rowspan="3" align="center" valign="top">
                          <table width="95%" height="150" border="0" cellspacing="0" cellpadding="0" style="margin-top:3">
                              <tr height="35%">
                                  <td align="center" width="30%"><img src="images/face/user/${answerSingle.userFace}" style="border:1 solid;border-color:#E0E0E0"></td>
                                  <td style="text-indent:10">
                                      <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${answererName}">
                                          <b>${answerMap[answererName].userName}</b>
                                      </a>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">性别：</td>
                                  <td style="text-indent:10">
                                      ${answerMap[answererName].userSex}
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">OICQ：</td>
                                  <td style="text-indent:10">
                                      ${answerMap[answererName].userOICQ}
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">来自：</td>
                                  <td style="text-indent:10">
                                      ${answerMap[answererName].userFrom}
                                  </td>
                              </tr>                              
                          </table>
                      </td>
                      <!-- 回复帖子信息 -->
                      <td width="10%">【表情】<img src="images/face/bbs/${answerbbsSingle.bbsFace}"></td>
                      <td align="right" height="30">回复时间：『<bean:write name="answerbbsSingle" property="bbsAnswerSendTime"/>』&nbsp;</td>
                  </tr>
                  <tr height="130"><td colspan="2" valign="top" style="padding-top:6;padding-left:6;padding-right:6;padding-bottom:6"><bean:write name="answerbbsSingle" property="bbsAnswerContent" filter="false"/></td></tr>
                  <!-- 删除回复帖子超链接 -->
                  <tr height="30" bgcolor="#F9F9F9">
                      <td align="right" colspan="2">
                          ◆<a href="needLogin/admin/deleteAnswer.do?method=deleteAnswerBbs&bbsId=${bbsRootSingle.bbsId}&delbbsAnswerId=${answerbbsSingle.bbsAnswerId}">删除回复</a>&nbsp;
                          ◆<html:link href="view/indexTemp.jsp" anchor="top">查看根帖</html:link>&nbsp;
                      </td>            
                  </tr>        
              </table>
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white">
                  <tr height="15"><td background="images/index/boardE.jpg"></td></tr>
              </table>
              </logic:iterate>          
          </logic:notEmpty>
      </logic:present>
      
      <!-- ****************分页导航**************** -->
      <table  border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white">
          <tr height="30">
              <td align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/openShow.do?method=openShow"/>
                  </jsp:include>
              </td>
          </tr>
      </table>
      
      <!-- ****************回复帖子**************** -->
      <html:link linkName="answer"/>
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="all">
      <html:form action="needLogin/answerBbs.do">
          <input type="hidden" name="method" value="answerBbs">
		  <tr bgcolor="#F0F0F0" height="30"><td colspan="2" style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">■ 回复【<bean:write name="bbsRootSingle" property="bbsTitle" filter="false"/>】帖子</font></b></td></tr>          
          <tr>
              <td width="27%" bgcolor="#F9F9F9" align="center" valign="top">
                  <table border="0" width="90%" height="100%">
                      <tr height="30%">
                          <td valign="top">
                              <table border="0" style="margin-top:10">
                                  <tr>
			                          <td><html:errors property="bbsAnswerTitle"/></td>
            			          </tr>
			                      <tr>
            			              <td><html:errors property="bbsAnswerContent"/></td>
			                      </tr>
                              </table>
                          </td>
                      </tr>
                      <tr>
                      	  <td valign="top">
                      	      <table border="0" width="90%" style="margin-top:10">
                      	          <tr><td>发帖许可</td></tr>
                      	      </table>
                      	  </td>
                      </tr>
                  </table>
              </td>
              <td>
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows">
                      <tr height="30">
                          <td width="15%" align="center">【主题】</td>
                          <td align="center"><html:text property="bbsAnswerTitle" size="77" maxlength="35"/></td>
                      </tr>
                      <tr bgcolor="#F9F9F9">
                          <td align="center">【表情】</td>
                          <td><%@ include file="/pages/add/face.jsp" %></td>
                      </tr>
                      <tr height="30">
                          <td align="center">【内容】</td>
                          <td align="center"><%@ include file="/pages/add/font.jsp"%></td>
                      </tr>
                      <tr height="30" bgcolor="#F9F9F9">
                          <td colspan="2" align="right"><%@ include file="/pages/add/count.jsp" %></td>
                      </tr>
                      <tr><td colspan="2" align="center"><html:textarea property="bbsAnswerContent" rows="15" cols="79" styleId="content" onkeydown="check(content,ContentUse,ContentRem,1000)" onkeyup="check(content,ContentUse,ContentRem,1000)" onchange="check(content,ContentUse,ContentRem,1000)"/></td></tr>
                      <tr height="30" align="center">
                          <td colspan="2">
                              <html:submit value="回复帖子"/>
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