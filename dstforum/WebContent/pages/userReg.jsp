<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>�û�ע��</title>
  </head>
  <body>
    <center>
          <table border="1" width="80%" bgcolor="#F9F9F9" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" rules="none" style="margin-top:5">
          <html:form action="user/reg.do">
          <input type="hidden" name="method" value="userReg">
          <input type="hidden" name="validate" value="yes">
	          <tr height="80">  <td colspan="5" style="text-indent:20">�� �û�ע��</td></tr>
	          <tr height="45">
	                <td align="right" width="35%">�� �� ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	            <td colspan="4"><html:text property="userName" size="40"/></td>
    	      </tr>
    	      <tr>
    	      		<td></td>
    	      		<td colspan="4"><html:errors property="userName"/></td>
    	      </tr>
	          <tr height="45">
	                <td align="right">�û����룺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="4"><html:password property="userPassword" size="40" redisplay="false"/></td>
	          </tr>
	          <tr>
    	      		<td></td>
    	      		<td colspan="4"><html:errors property="userPassword"/></td>
    	      </tr>
	          <tr height="45">
	                <td align="right">ȷ�����룺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><html:password property="aginPassword" size="40" redisplay="false"/></td>
	                <td rowspan="3" width="20%" valign="bottom" style="padding-bottom:10">	                    
	                    <img id="head" src="images/face/user/user0.gif" style="border:1 solid">   
	                </td>
	          </tr>
	          <tr>
    	      		<td></td>
    	      		<td colspan="4"><html:errors property="aginPassword"/></td>
    	      </tr>
   	          <tr height="45">
	                <td align="right">�û��Ա�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td>
	                    <html:radio property="userSex" value="��"/>��
	                    <html:radio property="userSex" value="Ů"/>Ů
	                </td>
	                <td width="15%" align="center">�û�ͷ��</td>
	                <td width="20%" align="center">
	                    <html:select property="userFace" onchange="showHead(this.options[this.selectedIndex].value)">
	                        <html:options collection="headFace" property="value" labelProperty="label" filter="false"/>
	                    </html:select>
	                </td>
	          </tr>
   	          <tr height="45">
	                <td align="right">��ϵ�绰��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="4"><html:text property="userPhone" size="40"/></td>
	          </tr>
	          <tr>
    	      		<td></td>
    	      		<td colspan="4"><html:errors property="userPhone"/></td>
    	      </tr>
	          <tr height="45">
	                <td align="right">OICQ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="4"><html:text property="userOICQ" size="40"/></td>
	          </tr>
	          <tr>
    	      		<td></td>
    	      		<td colspan="4"><html:errors property="userOICQ"/></td>
    	      </tr>
   	          <tr height="45">
	                <td align="right">E-mail��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="4"><html:text property="userEmail" size="50"/></td>
	          </tr>
   	          <tr>
    	      		<td></td>
    	      		<td colspan="4"><html:errors property="userEmail"/></td>
    	      </tr>
   	          <tr height="45">
	                <td align="right">���ԣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="4"><html:text property="userFrom" size="60"/></td>
	          </tr>
	          <tr>
    	      		<td></td>
    	      		<td colspan="4"><html:errors property="userFrom"/></td>
    	      </tr>
    	      <tr height="80">
	                <td>&nbsp;</td>
	                <td colspan="4">
	                    <html:submit value="�û�ע��"/>
	                    <html:submit value="������д"/>
    	            </td>
	          </tr>	      	      
          </html:form>
          </table>
          <br>
    </center>
  </body>
</html>