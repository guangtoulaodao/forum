<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>��ʾ�ҵ���������</title>
  </head>
  <body>
    <center>
      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows" style="margin-top:8">
          <tr height="30"><td colspan="6" background="images/index/classT.jpg" style="text-indent:5"><b><font color="white">�� �ҵ�����</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F0F0F0">
              <td width="6%">״̬</td>
              <td width="32%">���ӱ���</td>
              <td width="7%">�ظ���</td>
              <td width="25%">������</td>
              <td width="25%">���ظ�</td>
              <td width="5%">����</td>
          </tr>
          <logic:notPresent name="mybbslist" scope="session">
              <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><li>�Բ��������б����ڣ�</li></td></tr>
          </logic:notPresent>
          <logic:present name="mybbslist" scope="session">
              <logic:empty name="mybbslist" scope="session">
                  <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><li>�Բ��������б����ڣ�</li></td></tr>
              </logic:empty>
              <logic:notEmpty name="mybbslist" scope="session">
			  <tr>
                  <td colspan="6">
                      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="all">                  
                      <logic:iterate id="myBbsSingle" name="mybbslist">
                      <tr height="30" bgcolor="#F9F9F9">
                          <td width="6%" align="center">
	                          <logic:equal value="1" name="myBbsSingle" property="bbsIsGood">
                  	    		  ����
	                  	      </logic:equal>
                        	  <logic:equal value="1" name="myBbsSingle" property="bbsIsTop">
      		                	  �ö�
                   		      </logic:equal> 
                   		      <logic:equal value="0" name="myBbsSingle" property="bbsIsGood">
                  	    		  <logic:equal value="0" name="myBbsSingle" property="bbsIsTop">
      		                	      ��ͨ
                    		      </logic:equal> 
	                  	      </logic:equal>                   		      
                          </td>
                          <td width="32%" style="text-indent:10">
						      <img src="images/face/bbs/${myBbsSingle.bbsFace}">
                              <a href="user/openShow.do?method=openShow&bbsId=${myBbsSingle.bbsId}"><bean:write name="myBbsSingle" property="subBbsTitle[18]" filter="false"/></a></td>
                          <td width="7%" align="center"><bean:write name="myBbsSingle" property="bbsAnswerNum"/></td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${myBbsSingle.bbsSender}">
                                  <b><bean:write name="myBbsSingle" property="bbsSender" filter="false"/></b>
                                  <br><bean:write name="myBbsSingle" property="bbsSendTime"/>
                              </a>
                          </td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${myBbsSingle.bbsLastUpdateUser}">
                                  <b><bean:write name="myBbsSingle" property="bbsLastUpdateUser" filter="false"/></b>
                                  <br><bean:write name="myBbsSingle" property="bbsLastUpdateTime"/>
                              </a>
                          </td>
                          <td width="5%" align="center"><a href="needLogin/deleteRoot.do?method=deleteRootBbs&bbsId=${myBbsSingle.bbsId}&bbsSender=${myBbsSingle.bbsSender}" title="¥��/����Ա����" onclick="javaScript:return confirm('ȷ��Ҫɾ������Ϣ?')">ɾ��</a></td>
                      </tr>
	                  </logic:iterate> 
    				  </table>
    		      </td>
    		  </tr>                               
              </logic:notEmpty>
          </logic:present>
          
          <tr height="10"><td colspan="6"></td></tr>
          <tr height="30">          
              <td colspan="6" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="needLogin/my/listShow.do?method=lookMyBbs"/>
                  </jsp:include>
              </td>
          </tr>
          <tr height="10"><td colspan="6"></td></tr>          
      </table>
    </center>
  </body>
</html>