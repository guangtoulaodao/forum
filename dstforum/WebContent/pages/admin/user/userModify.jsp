<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>后台-查看某个用户详细内容</title>
  </head>
  <body>
    <center>
      <br>
      <html:form action="needLogin/admin/modifyUser.do">
          <input type="hidden" name="method" value="modifyUser">
          <input type="hidden" name="validate" value="yes">
          <table border="0" width="90%" height="630" cellspacing="0" cellpadding="0">
	          <tr height="60">  <td colspan="4" style="text-indent:5">■ 修改用户信息</td></tr>
    	      <tr height="70">
	                <td align="right" width="35%">用户ID：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="1"><html:hidden property="id" write="true"/></td>
	                <td colspan="2" rowspan="2" valign="bottom" style="padding-bottom:10">
	                    <img id="head" src="images/face/user/${userForm.userFace}">
	                </td>
	          </tr>
	          <tr>
	                <td align="right">用户头像：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="2">
   	                	<html:select property="userFace" onchange="showHead(this.options[this.selectedIndex].value)">
	                        <html:options collection="headFace" property="value" labelProperty="label" filter="false"/>
	                    </html:select>
	                </td>
	          </tr>
	          <tr>
	                <td align="right">用户名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	            <td colspan="3"><html:text property="userName" size="40"/></td>
    	      </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="3"><html:errors property="userName"/></td>
    	      </tr>
	          <tr>
	                <td align="right">旧密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3" colspan="3"><html:hidden property="oldPassword" write="true"/></td>
	          </tr>
	          <tr>
	                <td align="right">新密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><html:password property="userPassword" size="40" redisplay="false"/></td>
	          </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="3"><html:errors property="userPassword"/></td>
    	      </tr>	          
	          <tr>
	                <td align="right">确认密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><html:password property="aginPassword" size="40" redisplay="false"/></td>
	          </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="3"><html:errors property="aginPassword"/></td>
    	      </tr>	          
   	          <tr>
	                <td align="right">用户性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td>
	                    <html:radio property="userSex" value="男"/>男
	                    <html:radio property="userSex" value="女"/>女
	                </td>
	                <td align="right">用户权限：&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td>
   			            <html:select property="userAble">
					        <html:options collection="backUserAble" property="value" labelProperty="label"/>
					    </html:select>
					</td>
	          </tr>
   	          <tr>
	                <td align="right">联系电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><html:text property="userPhone" size="40"/></td>
	          </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="3"><html:errors property="userPhone"/></td>
    	      </tr>	          
	          <tr>
	                <td align="right">OICQ：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><html:text property="userOICQ" size="40"/></td>
	          </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="3"><html:errors property="userOICQ"/></td>
    	      </tr>	
   	          <tr>
	                <td align="right">E-mail：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><html:text property="userEmail" size="50"/></td>
	          </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="3"><html:errors property="userEmail"/></td>
    	      </tr>	          
   	          <tr>
	                <td align="right">来自：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><html:text property="userFrom" size="60"/></td>
	          </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="3"><html:errors property="userFrom"/></td>
    	      </tr>	          
    	      <tr>
	                <td>&nbsp;</td>
	                <td colspan="3">
	                    <html:submit value="修改用户"/>
	                    <html:reset value="重新填写"/>
    	            </td>
	          </tr>	      	      
          </table>
      </html:form>
    </center>
  </body>
</html>