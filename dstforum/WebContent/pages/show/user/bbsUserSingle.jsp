<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>前台-查看某个用户详细内容</title>
  </head>
  <body>
    <center>
        <table border="1" width="70%" bgcolor="#F9F9F9" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" rules="none" style="margin-top:8">
	        <tr height="60">  <td colspan="2" style="text-indent:5">■ 查看用户信息</td></tr>
 	        <tr height="50">
 	        	<td align="right">用户头像：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
 	        	<td><img src="images/face/user/${bbsUserSingle.userFace}" style="border:1 solid;border-color:#E0E0E0"></td>
 	        </tr>
 	        <tr height="50">
	            <td align="right">用 户 名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	        <td><bean:write name="bbsUserSingle" property="userName"/></td>
   	        </tr>
   	        <tr height="50">
	            <td align="right">用户性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userSex"/></td>
	        </tr>
   	        <tr height="50">
	            <td align="right">用户权限：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td>
	                <logic:equal value="0" name="bbsUserSingle" property="userAble">普通用户</logic:equal>
	                <logic:equal value="1" name="bbsUserSingle" property="userAble">版主</logic:equal>
	                <logic:equal value="2" name="bbsUserSingle" property="userAble">管理员</logic:equal>
	            </td>
	        </tr>
   	        <tr height="50">
	            <td align="right">联系电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userPhone"/></td>
	        </tr>
	        <tr height="50">
	            <td align="right">OICQ：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userOICQ"/></td>
	        </tr>
   	        <tr height="50">
	            <td align="right">E-mail：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userEmail"/></td>
	        </tr>
   	        <tr height="50">
	            <td align="right">来自：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td><bean:write name="bbsUserSingle" property="userFrom"/></td>
	        </tr>
            <tr height="60"><td colspan="2" align="center" style="text-indent:20"><html:button property="back" value="返回" onclick="javascript:window.history.go(-1)"/></td></tr>      	      
        </table>
        <br>
    </center>
  </body>
</html>