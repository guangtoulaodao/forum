<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>��ʾĳ�����е���������</title>
  </head>
  <body>
    <center>
      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E0E0E0" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows" style="margin-top:8">          
          <tr height="45" bgcolor="#F9F9F9">
              <!-- ���湫�� -->
              <td colspan="4" style="text-indent:10">
                  ���湫�棺<bean:write name="boardPcard" filter="false"/>
              </td>
              <!-- ���������ӡ������� -->
              <td colspan="2" align="center"><a href="needLogin/addBbs.do?method=addBbs">[��������]</a></td>
          </tr>
          
          <!-- ������ת -->
          <tr height="30" bgcolor="#F9F9F9">
              <html:form action="user/jumpBoard.do">              
              <td colspan="6" align="right" background="images/index/boardE.jpg">
                  <input type="hidden" name="method" value="rootListShow">
                  ��ת����:
                  <html:select property="boardId">
                      <html:option value="">-������ת--</html:option>
                      <html:options collection="jumpBoard" property="value" labelProperty="label"/>
                  </html:select>
                  <html:submit value="��ת"/>
                  &nbsp;
              </td>
              </html:form>
          </tr>
          
          <!-- ****************��ʾ�ö�����**************** -->
          <tr height="30"><td colspan="6" style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">�� �ö�����</font></b></td></tr>
          <tr height="30" align="center">
              <td width="8%">״̬</td>
              <td width="35%">���ӱ���</td>
              <td width="7%">�ظ���</td>
              <td width="22%">������</td>
              <td width="28%" colspan="2">���ظ�</td>
          </tr>
          <!-- �ö������б����� -->
          <logic:notPresent name="topbbslist" scope="session">
              <tr height="70"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>�ö������б����ڣ�</li></font></td></tr>
          </logic:notPresent>
          <!-- �ö������б���� -->
          <logic:present name="topbbslist" scope="session">
	          <!-- �ö������б�Ϊ�� -->
              <logic:empty name="topbbslist" scope="session">
                  <tr height="70"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>û���ö����ӣ�</li></font></td></tr>
              </logic:empty>
              <!-- �ö������б�Ϊ�� -->
              <logic:notEmpty name="topbbslist" scope="session">
                  <tr>
                      <td colspan="6">
                          <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="all">
                              <!-- �����ö������б� -->
                              <logic:iterate id="topBbsSingle" name="topbbslist">
                                  <tr height="35" style="text-indent:5" bgcolor="#FBFBFB">
                       			      <td width="8%" align="center">�ö�</td>
			                          <td width="35%" style="text-indent:10">                             
            			                  <img src="images/face/bbs/${topBbsSingle.bbsFace}">
                        			      <a href="user/openShow.do?method=openShow&showpage=1&bbsId=${topBbsSingle.bbsId}"><bean:write name="topBbsSingle" property="subBbsTitle[18]" filter="false"/></a>
			                          </td>
            			              <td width="7%" align="center"><bean:write name="topBbsSingle" property="bbsAnswerNum"/></td>
                        			  <td width="22%" align="center">
			                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${topBbsSingle.bbsSender}">
            			                      <b><bean:write name="topBbsSingle" property="bbsSender" filter="false"/></b>
                        			          <br><bean:write name="topBbsSingle" property="bbsSendTime"/>
                			              </a>
			                          </td>
            			              <td width="28%" align="center" colspan="2">
                        			      <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${topBbsSingle.bbsLastUpdateUser}">
		                            	      <b><bean:write name="topBbsSingle" property="bbsLastUpdateUser" filter="false"/></b>
        		                        	  <br><bean:write name="topBbsSingle" property="bbsLastUpdateTime"/>
                        			      </a>
    			                      </td>                          
                			      </tr>
			                  </logic:iterate>
			              </table>
			          </td>
			      </tr>              
              </logic:notEmpty>
          </logic:present>
          <tr height="30"><td colspan="6" align="right" background="images/index/boardE.jpg"></td></tr>
          
          <!-- ****************��ʾ��ͨ����**************** -->
          <tr height="30"><td colspan="6" style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">�� ��������</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F4F4F4">
              <td width="8%">״̬</td>
              <td width="35%">���ӱ���</td>
              <td width="7%">�ظ���</td>
              <td width="22%">������</td>
              <td width="22%">���ظ�</td>
              <td width="6%">����</td>
          </tr>
          <!-- ��ͨ�����б����� -->
          <logic:notPresent name="otherbbslist" scope="session">
              <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>�Բ��������б����ڣ�</li></font></td></tr>
          </logic:notPresent>
          <!-- ��ͨ�����б���� -->
          <logic:present name="otherbbslist" scope="session">
              <!-- ��ͨ�����б�Ϊ�� -->
              <logic:empty name="otherbbslist" scope="session">
                  <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>�Բ��������б����ڣ�</li></font></td></tr>
              </logic:empty>
              <!-- ��ͨ�����б�Ϊ�� -->
              <logic:notEmpty name="otherbbslist" scope="session">
                  <tr>
                      <td colspan="6">
                          <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="all">
			 	              <!-- ������ͨ�����б� -->
                  		      <logic:iterate id="otherBbsSingle" name="otherbbslist">
			                      <tr height="35" bgcolor="#F9F9F9">
            			              <!-- �������״̬ -->
            			              <td align="center" width="8%">
                        			      <logic:equal value="1" name="otherBbsSingle" property="bbsIsGood">
                            	    		  ����
		                        	      </logic:equal>
        		                    	  <logic:equal value="0" name="otherBbsSingle" property="bbsIsGood">
                		                	  ��ͨ
	                        		      </logic:equal>                              
			                          </td>
			                          <!-- ������ӱ��� -->
            			              <td style="text-indent:10" width="35%">
                        			      <img src="images/face/bbs/${otherBbsSingle.bbsFace}">
			                              <a href="user/openShow.do?method=openShow&showpage=1&bbsId=${otherBbsSingle.bbsId}"><bean:write name="otherBbsSingle" property="subBbsTitle[18]" filter="false"/></a>
            			              </td>
            			              <!-- ������ӻظ��� -->
    			                      <td align="center" width="7%"><bean:write name="otherBbsSingle" property="bbsAnswerNum"/></td>
                			          <!-- ������ӷ����� -->
                			          <td align="center" width="22%">
                            			  <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${otherBbsSingle.bbsSender}">
			                                  <b><bean:write name="otherBbsSingle" property="bbsSender" filter="false"/></b>
        		                        	  <br><bean:write name="otherBbsSingle" property="bbsSendTime"/>
                        			      </a>
    			                      </td>
                			          <!-- ������ظ��� -->
                			          <td align="center" width="22%">
                            			  <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${otherBbsSingle.bbsLastUpdateUser}">
			                                  <b><bean:write name="otherBbsSingle" property="bbsLastUpdateUser" filter="false"/></b>
            			                      <br><bean:write name="otherBbsSingle" property="bbsLastUpdateTime"/>
                        			      </a>
			                          </td>
			                          <!-- ��ɾ���������� -->
            			              <td align="center" width="6%"><a href="needLogin/deleteRoot.do?method=deleteRootBbs&bbsId=${otherBbsSingle.bbsId}&bbsSender=${otherBbsSingle.bbsSender}" title="¥��/����Ա����" onclick="javaScript:return confirm('ȷ��Ҫɾ������Ϣ?')">��ɾ��</a></td>
			                      </tr>
            			      </logic:iterate>
		                  </table>
	                  </td>
	              </tr>                  
              </logic:notEmpty>
          </logic:present>          

          <tr height="10" bgcolor="#F4F4F4"><td colspan="6" align="right"></td></tr>                    
          <!-- ****************��ҳ������**************** -->          
          <tr height="30">
              <td colspan="6" align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/listShow.do?method=rootListShow"/>
                  </jsp:include>
              </td>
          </tr>          
          <tr height="10" bgcolor="#F4F4F4"><td colspan="6" align="right"></td></tr>          
      </table>
    </center>
  </body>
</html>