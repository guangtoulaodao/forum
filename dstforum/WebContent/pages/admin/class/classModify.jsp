<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>�鿴ĳ����̳�����ϸ����</title>
  </head>
  <body>
    <center>
      <br>
      <html:form action="needLogin/admin/modifyClass.do">
          <input type="hidden" name="method" value="modifyClass">
          <input type="hidden" name="validate" value="yes">
          <table border="0" width="90%" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" rules="none">
	          <tr height="60">  <td colspan="2" style="text-indent:5">�� �޸���̳���</td></tr>
    	      <tr height="50">
	                <td align="right" width="30%">��̳���ID��&nbsp;&nbsp;</td>
	                <td style="text-indent:5"><html:hidden property="classId" write="true"/></td>
	          </tr>
	          <tr height="50">
	                <td align="right">��̳������ƣ�&nbsp;&nbsp;</td>
    	            <td><html:text property="className" size="50"/></td>
    	      </tr>
    	      <tr>
	                <td></td>
    	            <td><html:errors property="className"/></td>
    	      </tr>
	          <tr height="50">
	                <td align="right">��̳�����ܣ�&nbsp;&nbsp;</td>
	                <td><html:text property="classIntro" size="50"/></td>
	          </tr>
    	      <tr>
	                <td></td>
    	            <td><html:errors property="classIntro"/></td>
    	      </tr>	          
    	      <tr height="50">
	                <td>&nbsp;</td>
	                <td>
	                    <html:submit value="�޸�"/>
	                    <html:submit value="����"/>
    	            </td>
	          </tr>	      	      
          </table>
      </html:form>
    </center>
  </body>
</html>