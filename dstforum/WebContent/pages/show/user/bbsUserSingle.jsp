<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>ǰ̨-�鿴ĳ���û���ϸ����</title>
  </head>
  <body>
    <center>
        <table border="1" width="70%" bgcolor="#F9F9F9" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" rules="none" style="margin-top:8">
	        <tr height="60">  <td colspan="2" style="text-indent:5">�� �鿴�û���Ϣ</td></tr>
 	        <tr height="50">
 	        	<td align="right">�û�ͷ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
 	        	<td><img src="images/face/user/${bbsUserSingle.userFace}" style="border:1 solid;border-color:#E0E0E0"></td>
 	        </tr>
 	        <tr height="50">
	            <td align="right">�� �� ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	        <td><bean:write name="bbsUserSingle" property="userName"/></td>
   	        </tr>
   	        <tr height="50">
	            <td align="right">�û��Ա�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userSex"/></td>
	        </tr>
   	        <tr height="50">
	            <td align="right">�û�Ȩ�ޣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td>
	                <logic:equal value="0" name="bbsUserSingle" property="userAble">��ͨ�û�</logic:equal>
	                <logic:equal value="1" name="bbsUserSingle" property="userAble">����</logic:equal>
	                <logic:equal value="2" name="bbsUserSingle" property="userAble">����Ա</logic:equal>
	            </td>
	        </tr>
   	        <tr height="50">
	            <td align="right">��ϵ�绰��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userPhone"/></td>
	        </tr>
	        <tr height="50">
	            <td align="right">OICQ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userOICQ"/></td>
	        </tr>
   	        <tr height="50">
	            <td align="right">E-mail��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userEmail"/></td>
	        </tr>
   	        <tr height="50">
	            <td align="right">���ԣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userFrom"/></td>
	        </tr>
            <tr height="60"><td colspan="2" align="center" style="text-indent:20"><html:button property="back" value="����" onclick="javascript:window.history.go(-1)"/></td></tr>      	      
        </table>
        <br>
    </center>
  </body>
</html>