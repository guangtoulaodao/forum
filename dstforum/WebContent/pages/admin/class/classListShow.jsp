<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>�б�鿴��̳���</title>
  </head>
  <body>
    <center>
      <br>
      <table border="1" width="580" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows">
          <tr height="29"><td background="images/admin/backLT.jpg" colspan="4" style="text-indent:5"><b><font color="white">�� �鿴��̳���</font></b></td></tr>
	      <tr height="30" bgcolor="#F0F0F0">
	          <td width="20%" align="center">���ID</td>
	          <td width="60%" style="text-indent:15">�������</td>
	          <td align="center" colspan="2">����</td>
	      </tr>
	      <logic:notPresent name="backClassList">
	          <tr height="80" bgcolor="#FBFBFB"><td align="center" colspan="4"><li>����б����ڣ�</li></td></tr>
	      </logic:notPresent>
	      <logic:present name="backClassList">
	          <logic:empty name="backClassList">
	              <tr height="80" bgcolor="#FBFBFB"><td align="center" colspan="4"><li>û��������ʾ��</li></td></tr>
	          </logic:empty>
	          <logic:notEmpty name="backClassList" >
              <tr>
                  <td colspan="4">
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="rows">
	              <logic:iterate id="backClassSingle" name="backClassList">
    	              <tr height="30" bgcolor="#FBFBFB">
	                      <td width="20%" align="center"><bean:write name="backClassSingle" property="classId"/></td>
	                      <td width="60%" style="text-indent:15"><a href="needLogin/admin/modifyClass.do?method=modifyClass&classId=${backClassSingle.classId}"><bean:write name="backClassSingle" property="className" filter="false"/></a></td>
	                      <td align="center"><a href="needLogin/admin/modifyClass.do?method=modifyClass&classId=${backClassSingle.classId}">���޸�</a></td>
	                      <td align="center"><a href="needLogin/admin/deleteClass.do?method=deleteClass&classId=${backClassSingle.classId}" onclick="javaScript:return confirm('ȷ��Ҫɾ������Ϣ?')">��ɾ��</a></td>
    	              </tr>	              
	              </logic:iterate>
	              </table>
	              </td>
	          </tr>
	          </logic:notEmpty>
	      </logic:present>
	      <tr height="19" style="background-image:url('images/admin/backLE.jpg')"><td colspan="4"></td></tr>	      
      </table>
    </center>
  </body>
</html>