<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>�б�鿴�û�</title>
  </head>
  <body>
    <center>
      <br>
      <html:form action="needLogin/admin/getUserList.do">
      <input type="hidden" name="method" value="getUserList">
	  <input type="hidden" name="type" value="show">
      <table border="0" width="580" cellspacing="0" cellpadding="0">
          <tr>
              <td align="right">
			          ѡ���û�Ȩ�ޣ�
			          <html:select property="showAble">
			              <html:option value="-1">--��ѡ���û�Ȩ��--</html:option>
					      <html:options collection="backListAble" property="value" labelProperty="label"/>
					  </html:select>
					  <html:submit value="��ʾ"/>		          
			  </td>
	      </tr>
	  </table>
      </html:form>

      <table border="1" width="580" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows">
          <tr height="29"><td background="images/admin/backLT.jpg" colspan="6" style="text-indent:5"><b><font color="white">�� �鿴�û�</font></b></td></tr>	      	      
	      <tr height="30" bgcolor="#F0F0F0">
	          <td width="15%" align="center">�û�ID</td>
	          <td width="30%" align="center">�û���</td>
	          <td width="20%" align="center">�û�����</td>
   	          <td width="15%" align="center">�û�Ȩ��</td>
	          <td width="20%" align="center" colspan="2">����</td>
	      </tr>
          <logic:notPresent name="backUserList">
              <tr height="80" align="center"><td colspan=6"><li>û���û�����ʾ��</li></td></tr> 
          </logic:notPresent>
          <logic:present name="backUserList">
              <logic:empty name="backUserList">
                  <tr height="80" align="center"><td colspan="6"><li>û���û�����ʾ��</li></td></tr> 
              </logic:empty>          
              <logic:notEmpty name="backUserList">
              <tr>
                  <td colspan="6">
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="rows">                            
                  <logic:iterate id="backUserSingle" name="backUserList" indexId="ind">
                      <tr height="35" bgcolor="#FBFBFB">
                            <td width="15%" align="center">${backUserSingle.id}</td>
                            <td width="30%" style="text-indent:5"><a href="needLogin/admin/modifyUser.do?method=modifyUser&userId=${backUserSingle.id}"><bean:write name="backUserSingle" property="userName" filter="false"/></td>
                            <td width="20%" align="center">${backUserSingle.oldPassword}</td>
                            <td width="15%" align="center">
                                <logic:equal name="backUserSingle" property="userAble" value="0">
                                    ��ͨ�û�
                                </logic:equal>
                                <logic:equal name="backUserSingle" property="userAble" value="1">
                                    ����
                                </logic:equal>
                                <logic:equal name="backUserSingle" property="userAble" value="2">
                                    ����Ա
                                </logic:equal>                                
                            </td>
                            <td align="center"><a href="needLogin/admin/modifyUser.do?method=modifyUser&userId=${backUserSingle.id}">���޸�</a></td>
                            <td align="center"><a href="needLogin/admin/deleteUser.do?method=deleteUser&userId=${backUserSingle.id}" onclick="javaScript:return confirm('ȷ��Ҫɾ������Ϣ?')">��ɾ��</a></td>
                      </tr>
                  </logic:iterate>
                  </table>
                  </td>
              </tr>
              </logic:notEmpty>
          </logic:present>
	      <tr height="19" style="background-image:url('images/admin/backLE.jpg')"><td colspan="6"></td></tr>	                          
      </table>
    </center>
  </body>
</html>