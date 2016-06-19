<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>列表查看用户</title>
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
			          选择用户权限：
			          <html:select property="showAble">
			              <html:option value="-1">--请选择用户权限--</html:option>
					      <html:options collection="backListAble" property="value" labelProperty="label"/>
					  </html:select>
					  <html:submit value="显示"/>		          
			  </td>
	      </tr>
	  </table>
      </html:form>

      <table border="1" width="580" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows">
          <tr height="29"><td background="images/admin/backLT.jpg" colspan="6" style="text-indent:5"><b><font color="white">■ 查看用户</font></b></td></tr>	      	      
	      <tr height="30" bgcolor="#F0F0F0">
	          <td width="15%" align="center">用户ID</td>
	          <td width="30%" align="center">用户名</td>
	          <td width="20%" align="center">用户密码</td>
   	          <td width="15%" align="center">用户权限</td>
	          <td width="20%" align="center" colspan="2">操作</td>
	      </tr>
          <logic:notPresent name="backUserList">
              <tr height="80" align="center"><td colspan=6"><li>没有用户可显示！</li></td></tr> 
          </logic:notPresent>
          <logic:present name="backUserList">
              <logic:empty name="backUserList">
                  <tr height="80" align="center"><td colspan="6"><li>没有用户可显示！</li></td></tr> 
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
                                    普通用户
                                </logic:equal>
                                <logic:equal name="backUserSingle" property="userAble" value="1">
                                    版主
                                </logic:equal>
                                <logic:equal name="backUserSingle" property="userAble" value="2">
                                    管理员
                                </logic:equal>                                
                            </td>
                            <td align="center"><a href="needLogin/admin/modifyUser.do?method=modifyUser&userId=${backUserSingle.id}">√修改</a></td>
                            <td align="center"><a href="needLogin/admin/deleteUser.do?method=deleteUser&userId=${backUserSingle.id}" onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
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